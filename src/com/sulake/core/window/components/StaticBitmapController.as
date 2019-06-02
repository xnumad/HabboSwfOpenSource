package com.sulake.core.window.components
{
    import com.sulake.core.window.utils.IBitmapDataContainer;
    import com.sulake.core.assets.IAssetReceiver;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.graphics.WindowRedrawFlag;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.utils.PropertyStruct;

    public class StaticBitmapController extends BitmapDataController implements IStaticBitmapWrapperWindow, IBitmapDataContainer, IAssetReceiver 
    {
        protected var _Str_6902:String;
        protected var _Str_5983:Boolean = false;

        public function StaticBitmapController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        override public function dispose():void
        {
            if (!_disposed)
            {
                if (this._Str_5983)
                {
                    _bitmapData.dispose();
                }
                super.dispose();
            }
        }

        public function get assetUri():String
        {
            return this._Str_6902;
        }

        public function set assetUri(k:String):void
        {
            if (this._Str_6902 == k)
            {
                return;
            }
            this._Str_6902 = k;
            if (((k == null) || (k.length <= 0)))
            {
                if (this._Str_5983)
                {
                    _bitmapData.dispose();
                }
                _bitmapData = null;
                this._Str_5983 = false;
                _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
            }
            else
            {
                _context.getResourceManager().retrieveAsset(this._Str_6902, this);
            }
        }

        public function receiveAsset(k:IAsset, _arg_2:String):void
        {
            var _local_5:Rectangle;
            if (((_disposed) || (!(_context.getResourceManager().isSameAsset(this._Str_6902, _arg_2)))))
            {
                return;
            }
            var _local_3:BitmapDataAsset = (k as BitmapDataAsset);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:BitmapData = (_local_3.content as BitmapData);
            if (_local_4 == null)
            {
                return;
            }
            if (_bitmapData != _local_4)
            {
                if (this._Str_5983)
                {
                    _bitmapData.dispose();
                }
                this._Str_5983 = false;
                _local_5 = _local_3.rectangle;
                if (((_local_4.width == _local_5.width) && (_local_4.height == _local_5.height)))
                {
                    _bitmapData = _local_4;
                }
                else
                {
                    _bitmapData = new BitmapData(_local_5.width, _local_5.height);
                    _bitmapData.copyPixels(_local_4, _local_5, new Point(0, 0));
                    this._Str_5983 = true;
                }
                _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
            }
            _Str_8020();
        }

        override public function clone():IWindow
        {
            var k:StaticBitmapController = (super.clone() as StaticBitmapController);
            if (this._Str_5983)
            {
                k._bitmapData = _bitmapData.clone();
            }
            else
            {
                k._bitmapData = _bitmapData;
            }
            k._Str_6902 = this._Str_6902;
            k._Str_5983 = this._Str_5983;
            return k;
        }

        override public function get properties():Array
        {
            var k:Array = super.properties;
            k.unshift(createProperty(PropertyKeys.ASSET_URI, this._Str_6902));
            return k;
        }

        override public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case PropertyKeys.ASSET_URI:
                        this.assetUri = (_local_2.value as String);
                        break;
                }
            }
            super.properties = k;
        }
    }
}
