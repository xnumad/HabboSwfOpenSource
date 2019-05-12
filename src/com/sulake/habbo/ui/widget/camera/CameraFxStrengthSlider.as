package com.sulake.habbo.ui.widget.camera
{
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IRegionWindow;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;

    public class CameraFxStrengthSlider 
    {
        private var _view:CameraPhotoLab;
        private var _sliderContainer:IWindowContainer;
        private var _sliderBase:BitmapData;
        private var _sliderButton:BitmapData;
        private var _activeBaseArea:IBitmapWrapperWindow;
        private var _sliderBaseWidth:int;
        private var _referenceWidth:int;
        private var _referenceX:int = 0;

        public function CameraFxStrengthSlider(k:CameraPhotoLab, _arg_2:IWindowContainer, _arg_3:IAssetLibrary)
        {
            this._view = k;
            this._sliderContainer = _arg_2;
            this._Str_6048(_arg_3);
            this._Str_4995();
        }

        public function dispose():void
        {
            this._view = null;
            this._sliderContainer = null;
            this._sliderBase = null;
            this._sliderButton = null;
        }

        public function disable():void
        {
            this._sliderContainer.visible = false;
        }

        public function enable():void
        {
            this._sliderContainer.visible = true;
        }

        public function _Str_797():int
        {
            return this._referenceWidth;
        }

        public function _Str_2526(k:int):void
        {
            var _local_2:IWindow;
            if (this._sliderContainer != null)
            {
                _local_2 = this._sliderContainer.findChildByName("slider_button");
                if (_local_2 != null)
                {
                    _local_2.x = k;
                }
            }
        }

        private function _Str_5862(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_RELOCATED)
            {
                if (this._activeBaseArea)
                {
                    this._activeBaseArea.width = ((_arg_2.x / this._referenceWidth) * this._sliderBaseWidth);
                }
            }
            else
            {
                if (((k.type == WindowMouseEvent.UP) || (k.type == WindowMouseEvent.UP_OUTSIDE)))
                {
                    this._view._Str_21214(_arg_2.x);
                }
            }
        }

        private function _Str_22757(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            if (((k.type == WindowMouseEvent.DOWN) && (_arg_2.name == "shaft_click_area")))
            {
                _local_3 = (WindowMouseEvent(k).localX - this._referenceX);
                this._Str_2526(_local_3);
                this._view._Str_21214(_local_3);
            }
        }

        private function _Str_4995():void
        {
            var k:IWindowContainer;
            var _local_2:IBitmapWrapperWindow;
            if (this._sliderContainer == null)
            {
                return;
            }
            var _local_3:IRegionWindow = (this._sliderContainer.findChildByName("shaft_click_area") as IRegionWindow);
            if (_local_3)
            {
                _local_3.procedure = this._Str_22757;
            }
            _local_2 = (this._sliderContainer.findChildByName("slider_base") as IBitmapWrapperWindow);
            if (((!(_local_2 == null)) && (!(this._sliderBase == null))))
            {
                this._sliderBaseWidth = _local_2.width;
                _local_2.bitmap = new BitmapData(this._sliderBase.width, this._sliderBase.height, true, 0xFFFFFF);
                _local_2.bitmap.copyPixels(this._sliderBase, this._sliderBase.rect, new Point(0, 0), null, null, true);
                this._activeBaseArea = _local_2;
            }
            k = (this._sliderContainer.findChildByName("slider_movement_area") as IWindowContainer);
            if (k != null)
            {
                _local_2 = (k.findChildByName("slider_button") as IBitmapWrapperWindow);
                if (((!(_local_2 == null)) && (!(this._sliderButton == null))))
                {
                    _local_2.bitmap = new BitmapData(this._sliderButton.width, this._sliderButton.height, true, 0xFFFFFF);
                    _local_2.bitmap.copyPixels(this._sliderButton, this._sliderButton.rect, new Point(0, 0), null, null, true);
                    _local_2.procedure = this._Str_5862;
                    this._referenceWidth = (k.width - _local_2.width);
                    this._referenceX = ((this._sliderBaseWidth - this._referenceWidth) / 2);
                }
            }
        }

        private function _Str_6048(k:IAssetLibrary):void
        {
            var _local_2:BitmapDataAsset;
            if (k == null)
            {
                return;
            }
            _local_2 = BitmapDataAsset(k.getAssetByName("camera_fx_slider_bottom_active"));
            this._sliderBase = BitmapData(_local_2.content);
            _local_2 = BitmapDataAsset(k.getAssetByName("camera_fx_slider_button"));
            this._sliderButton = BitmapData(_local_2.content);
        }
    }
}

