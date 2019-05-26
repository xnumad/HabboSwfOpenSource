package com.sulake.habbo.toolbar.memenu.soundsettings
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;

    public class MeMenuSoundSettingsSlider 
    {
        private var _settingsItem:*;
        private var _sliderContainer:IWindowContainer;
        private var _referenceWidth:int;
        private var _minValue:Number = 0;
        private var _maxValue:Number = 1;

        public function MeMenuSoundSettingsSlider(settingsItem:*, _arg_2:IWindowContainer, _arg_3:IAssetLibrary, minValue:Number=0, maxValue:Number=1)
        {
            this._settingsItem = settingsItem;
            this._sliderContainer = _arg_2;
            this._minValue = minValue;
            this._maxValue = maxValue;
            this.displaySlider();
        }

        public function dispose():void
        {
            this._settingsItem = null;
            this._sliderContainer = null;
        }

        public function setValue(value:Number):void
        {
            if (this._sliderContainer == null)
            {
                return;
            }
            var sliderWindow:IWindow = this._sliderContainer.findChildByName("slider_button");
            if (sliderWindow != null)
            {
                sliderWindow.x = this.getSliderPosition(value);
            }
        }

        private function getSliderPosition(k:Number):int
        {
            return int((this._referenceWidth * (Number((k - this._minValue)) / (this._maxValue - this._minValue))));
        }

        private function getValue(index:Number):Number
        {
            return ((index / this._referenceWidth) * (this._maxValue - this._minValue)) + this._minValue;
        }

        private function buttonProcedure(event:WindowEvent, window:IWindow):void
        {
            if (event.type != WindowEvent.WINDOW_EVENT_RELOCATED)
            {
                return;
            }
            this._settingsItem.saveVolume(this.getValue(window.x), false);
        }

        private function displaySlider():void
        {
            if (this._sliderContainer == null)
            {
                return;
            }
            var window:IWindowContainer = (this._sliderContainer.findChildByName("slider_movement_area") as IWindowContainer);
            if (window != null)
            {
                var sliderWindow:IWindowContainer = (window.findChildByName("slider_button") as IWindowContainer);
                if (sliderWindow != null)
                {
                    sliderWindow.procedure = this.buttonProcedure;
                    this._referenceWidth = (window.width - sliderWindow.width);
                }
            }
        }
    }
}
