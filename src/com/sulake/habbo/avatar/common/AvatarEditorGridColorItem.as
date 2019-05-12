package com.sulake.habbo.avatar.common
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import com.sulake.core.window.IWindow;

    public class AvatarEditorGridColorItem 
    {
        private static const _Str_9541:String = "avatar_editor_editor_clr_13x21_3";
        private static const _Str_14698:String = "avatar_editor_editor_clr_13x21_1";
        private static const _Str_17221:String = "avatar_editor_editor_clr_13x21_2";

        private var _model:IAvatarEditorCategoryModel;
        private var _window:IWindowContainer;
        private var _partColor:IPartColor;
        private var _isSelected:Boolean = false;
        private var _border:IStaticBitmapWrapperWindow;
        private var _isDisabledForWearing:Boolean;

        public function AvatarEditorGridColorItem(k:IWindowContainer, _arg_2:IAvatarEditorCategoryModel, _arg_3:IPartColor, _arg_4:Boolean=false)
        {
            this._model = _arg_2;
            this._window = k;
            this._partColor = _arg_3;
            this._isDisabledForWearing = _arg_4;
            this._border = (this._window.findChildByTag("BORDER") as IStaticBitmapWrapperWindow);
            this._Str_25547();
            this._Str_22595();
            this._window.addEventListener(WindowMouseEvent.OVER, this.onMouseOver);
            this._window.addEventListener(WindowMouseEvent.OUT, this.onMouseOut);
        }

        private function onMouseOut(k:WindowMouseEvent):void
        {
            this._border.assetUri = ((this._isSelected) ? _Str_9541 : _Str_14698);
        }

        private function onMouseOver(k:WindowMouseEvent):void
        {
            this._border.assetUri = _Str_9541;
        }

        private function _Str_25547():void
        {
            var k:BitmapDataAsset = (this._model.controller.manager.windowManager.assets.getAssetByName(_Str_17221) as BitmapDataAsset);
            var _local_2:BitmapData = (k.content as BitmapData);
            var _local_3:BitmapData = _local_2.clone();
            var _local_4:IBitmapWrapperWindow = (this._window.findChildByTag("COLOR_IMAGE") as IBitmapWrapperWindow);
            _local_4.bitmap = new BitmapData(_local_3.width, _local_3.height, true, 0);
            _local_3.colorTransform(_local_3.rect, this._partColor.colorTransform);
            _local_4.bitmap.copyPixels(_local_3, _local_3.rect, new Point(0, 0));
            _local_3.dispose();
        }

        public function dispose():void
        {
            this._model = null;
            if (this._window != null)
            {
                if (!this._window.disposed)
                {
                    this._window.dispose();
                }
            }
            this._window = null;
            this._partColor = null;
        }

        public function get view():IWindowContainer
        {
            return this._window;
        }

        public function get _Str_2365():Boolean
        {
            return this._isSelected;
        }

        public function set _Str_2365(k:Boolean):void
        {
            this._isSelected = k;
            this._border.assetUri = ((this._isSelected) ? _Str_9541 : _Str_14698);
        }

        private function _Str_22595():void
        {
            if (this._window == null)
            {
                return;
            }
            if (this._window.disposed)
            {
                return;
            }
            this._border.assetUri = _Str_9541;
            var k:IWindow = this._window.findChildByTag("CLUB_ICON");
            if (this._partColor)
            {
                k.visible = (this._partColor.clubLevel > 0);
            }
            else
            {
                k.visible = false;
            }
        }

        public function get _Str_3420():IPartColor
        {
            return this._partColor;
        }

        public function get _Str_14863():Boolean
        {
            return this._isDisabledForWearing;
        }
    }
}


