package com.sulake.habbo.groups.badge
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.assets.IAssetReceiver;
    import com.sulake.habbo.groups.HabboGroupsManager;
    import flash.display.BitmapData;
    import flash.geom.ColorTransform;
    import com.sulake.habbo.communication.messages.incoming.users._Str_3740;
    import com.sulake.core.assets.IResourceManager;
    import com.sulake.core.assets.IAsset;
    import com.sulake.habbo.communication.messages.incoming.users._Str_2792;
    import flash.geom.Point;

    public class BadgeEditorPartItem implements IDisposable, IAssetReceiver 
    {
        public static var _Str_13754:int = 0;
        public static var _Str_13419:int = 1;
        public static var _Str_6696:Number = 39;
        public static var _Str_6533:Number = 39;
        public static var _Str_12924:Number = 13;
        public static var _Str_15025:Number = 13;

        private var _manager:HabboGroupsManager;
        private var _parentCtrl:BadgeSelectPartCtrl;
        private var _partIndex:int;
        private var _type:int;
        private var _sourceUrl:String;
        private var _disposed:Boolean;
        private var _fileName:String;
        private var _maskFileName:String;
        private var _image:BitmapData;
        private var _mask:BitmapData;
        private var _composite:BitmapData;
        private var _colorTransform:ColorTransform;
        private var _hasMask:Boolean = false;
        private var _isLoaded:Boolean = false;
        private var _isStatic:Boolean = false;

        public function BadgeEditorPartItem(k:HabboGroupsManager, _arg_2:BadgeSelectPartCtrl, _arg_3:int, _arg_4:int, _arg_5:_Str_3740=null)
        {
            this._colorTransform = new ColorTransform(1, 1, 1);
            super();
            this._partIndex = _arg_3;
            this._manager = k;
            this._parentCtrl = _arg_2;
            this._type = _arg_4;
            this._sourceUrl = this._manager.getProperty("image.library.badgepart.url");
            this._composite = new BitmapData(_Str_6696, _Str_6533);
            if (_arg_5 == null)
            {
                this._isLoaded = true;
                this._isStatic = true;
                this._image = this._manager._Str_3122("badge_part_empty");
            }
            else
            {
                this._fileName = _arg_5.fileName.replace(".gif", "").replace(".png", "");
                this._maskFileName = _arg_5._Str_22901.replace(".gif", "").replace(".png", "");
                this._hasMask = (this._maskFileName.length > 0);
                this._composite = new BitmapData(_Str_6696, _Str_6533);
                this._fileName = (((this._sourceUrl + "badgepart_") + this._fileName) + ".png");
                this._maskFileName = (((this._sourceUrl + "badgepart_") + this._maskFileName) + ".png");
                this._manager.windowManager.resourceManager.retrieveAsset(this._fileName, this);
                this._manager.windowManager.resourceManager.retrieveAsset(this._maskFileName, this);
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get _Str_3324():int
        {
            return this._partIndex;
        }

        public function receiveAsset(k:IAsset, _arg_2:String):void
        {
            var _local_3:IResourceManager = this._manager.windowManager.resourceManager;
            if (_local_3.isSameAsset(this._fileName, _arg_2))
            {
                this._image = (k.content as BitmapData);
            }
            if (_local_3.isSameAsset(this._maskFileName, _arg_2))
            {
                this._mask = (k.content as BitmapData);
            }
            this._Str_22804();
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                if (this._image)
                {
                    this._image.dispose();
                    this._image = null;
                }
                if (this._mask)
                {
                    this._mask.dispose();
                    this._mask = null;
                }
                if (this._composite)
                {
                    this._composite.dispose();
                    this._composite = null;
                }
                this._fileName = null;
                this._maskFileName = null;
                this._colorTransform = null;
                this._parentCtrl = null;
                this._manager = null;
                this._disposed = true;
            }
        }

        private function _Str_22804():void
        {
            if (this._image == null)
            {
                return;
            }
            if (((this._hasMask) && (this._mask == null)))
            {
                return;
            }
            this._isLoaded = true;
            if (this._type == _Str_13754)
            {
                this._parentCtrl._Str_25511(this);
            }
            else
            {
                this._parentCtrl._Str_22980(this);
            }
        }

        public function getComposite(k:BadgeLayerOptions):BitmapData
        {
            if (!this._isLoaded)
            {
                return null;
            }
            if (this._isStatic)
            {
                return this._image;
            }
            var _local_2:_Str_2792 = (this._manager._Str_3058._Str_9008[k.colorIndex] as _Str_2792);
            this._colorTransform.redMultiplier = (_local_2.red / 0xFF);
            this._colorTransform.greenMultiplier = (_local_2.green / 0xFF);
            this._colorTransform.blueMultiplier = (_local_2.blue / 0xFF);
            var _local_3:Point = this.getPosition(k);
            this._composite.dispose();
            this._composite = new BitmapData(_Str_6696, _Str_6533, true, 0);
            this._composite.copyPixels(this._image, this._image.rect, _local_3);
            this._composite.colorTransform(this._composite.rect, this._colorTransform);
            if (this._hasMask)
            {
                this._composite.copyPixels(this._mask, this._mask.rect, _local_3, null, null, true);
            }
            return this._composite;
        }

        private function getPosition(k:BadgeLayerOptions):Point
        {
            var _local_2:Number = (((_Str_12924 * k._Str_7460) + (_Str_12924 / 2)) - (this._image.width / 2));
            var _local_3:Number = (((_Str_15025 * k._Str_8051) + (_Str_15025 / 2)) - (this._image.height / 2));
            if (_local_2 < 0)
            {
                _local_2 = 0;
            }
            if ((_local_2 + this._image.width) > _Str_6696)
            {
                _local_2 = (_Str_6696 - this._image.width);
            }
            if (_local_3 < 0)
            {
                _local_3 = 0;
            }
            if ((_local_3 + this._image.height) > _Str_6533)
            {
                _local_3 = (_Str_6533 - this._image.height);
            }
            return new Point(Math.floor(_local_2), Math.floor(_local_3));
        }
    }
}
