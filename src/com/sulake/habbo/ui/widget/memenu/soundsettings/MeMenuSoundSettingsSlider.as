package com.sulake.habbo.ui.widget.memenu.soundsettings
{
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;

    public class MeMenuSoundSettingsSlider 
    {
        private var _settingsItem:MeMenuSoundSettingsItem;
        private var _sliderContainer:IWindowContainer;
        private var _sliderBase:BitmapData;
        private var _sliderButton:BitmapData;
        private var _referenceWidth:int;
        private var _minValue:Number = 0;
        private var _maxValue:Number = 1;

        public function MeMenuSoundSettingsSlider(k:MeMenuSoundSettingsItem, _arg_2:IWindowContainer, _arg_3:IAssetLibrary, _arg_4:Number=0, _arg_5:Number=1)
        {
            this._settingsItem = k;
            this._sliderContainer = _arg_2;
            this._minValue = _arg_4;
            this._maxValue = _arg_5;
            this._Str_6048(_arg_3);
            this._Str_4995();
        }

        public function dispose():void
        {
            this._settingsItem = null;
            this._sliderContainer = null;
            this._sliderBase = null;
            this._sliderButton = null;
        }

        public function _Str_2526(k:Number):void
        {
            if (this._sliderContainer == null)
            {
                return;
            }
            var _local_2:IWindow = this._sliderContainer.findChildByName("slider_button");
            if (_local_2 != null)
            {
                _local_2.x = this._Str_5687(k);
            }
        }

        private function _Str_5687(k:Number):int
        {
            return int((this._referenceWidth * (Number((k - this._minValue)) / (this._maxValue - this._minValue))));
        }

        private function getValue(k:Number):Number
        {
            return ((k / this._referenceWidth) * (this._maxValue - this._minValue)) + this._minValue;
        }

        private function _Str_5862(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowEvent.WINDOW_EVENT_RELOCATED)
            {
                return;
            }
            this._settingsItem.saveVolume(this.getValue(_arg_2.x), false);
        }

        private function _Str_4995():void
        {
            var k:IWindowContainer;
            var _local_2:IWindowContainer;
            var _local_3:IBitmapWrapperWindow;
            if (this._sliderContainer == null)
            {
                return;
            }
            _local_3 = (this._sliderContainer.findChildByName("slider_base") as IBitmapWrapperWindow);
            if (((!(_local_3 == null)) && (!(this._sliderBase == null))))
            {
                _local_3.bitmap = new BitmapData(this._sliderBase.width, this._sliderBase.height, true, 0xFFFFFF);
                _local_3.bitmap.copyPixels(this._sliderBase, this._sliderBase.rect, new Point(0, 0), null, null, true);
            }
            k = (this._sliderContainer.findChildByName("slider_movement_area") as IWindowContainer);
            if (k != null)
            {
                _local_2 = (k.findChildByName("slider_button") as IWindowContainer);
                if (_local_2 != null)
                {
                    _local_3 = (_local_2.findChildByName("slider_bitmap") as IBitmapWrapperWindow);
                    if (((!(_local_3 == null)) && (!(this._sliderButton == null))))
                    {
                        _local_3.bitmap = new BitmapData(this._sliderButton.width, this._sliderButton.height, true, 0xFFFFFF);
                        _local_3.bitmap.copyPixels(this._sliderButton, this._sliderButton.rect, new Point(0, 0), null, null, true);
                        _local_2.procedure = this._Str_5862;
                        this._referenceWidth = (k.width - _local_3.width);
                    }
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
            _local_2 = BitmapDataAsset(k.getAssetByName("memenu_settings_slider_base"));
            this._sliderBase = BitmapData(_local_2.content);
            _local_2 = BitmapDataAsset(k.getAssetByName("memenu_settings_slider_button"));
            this._sliderButton = BitmapData(_local_2.content);
        }
    }
}

