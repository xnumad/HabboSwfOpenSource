package com.sulake.habbo.roomevents.userdefinedroomevents.common
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.events.Event;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.IContainerButtonWindow;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;

    public class SliderWindowController extends EventDispatcherWrapper 
    {
        private var _currentValue:Number = 0;
        private var _sliderContainer:IWindowContainer;
        private var _sliderActive:Boolean = false;
        private var _sliderBase:BitmapData;
        private var _sliderButton:BitmapData;
        private var _referenceWidth:int;
        private var _minValue:Number = 0;
        private var _maxValue:Number = 1;
        private var _snapInterval:Number = 0;

        public function SliderWindowController(k:HabboUserDefinedRoomEvents, _arg_2:IWindowContainer, _arg_3:IAssetLibrary, _arg_4:Number=0, _arg_5:Number=1, _arg_6:Number=0)
        {
            this._sliderContainer = IWindowContainer(k.getXmlWindow("ude_slider"));
            _arg_2.addChild(this._sliderContainer);
            this._minValue = _arg_4;
            this._maxValue = _arg_5;
            this._snapInterval = _arg_6;
            this._currentValue = 0;
            this._Str_6048(_arg_3);
            this._Str_4995();
        }

        override public function dispose():void
        {
            super.dispose();
            this._sliderContainer = null;
            this._sliderBase = null;
            this._sliderButton = null;
        }

        public function _Str_2526(k:Number, _arg_2:Boolean=true):void
        {
            k = Math.max(this._minValue, k);
            k = Math.min(this._maxValue, k);
            this._currentValue = k;
            if (_arg_2)
            {
                this._Str_23202();
            }
            dispatchEvent(new Event(Event.CHANGE));
        }

        public function getValue():Number
        {
            return this._currentValue;
        }

        public function set min(k:Number):void
        {
            this._minValue = k;
        }

        public function set max(k:Number):void
        {
            this._maxValue = k;
        }

        private function _Str_23202():void
        {
            if (this._sliderContainer == null)
            {
                return;
            }
            var k:IWindow = this._sliderContainer.findChildByName("slider_button");
            if (k != null)
            {
                k.x = this._Str_5687(this._currentValue);
            }
            k.parent.invalidate();
        }

        private function _Str_5687(k:Number):int
        {
            return int((this._referenceWidth * (Number((k - this._minValue)) / (this._maxValue - this._minValue))));
        }

        private function _Str_23515(k:Number):Number
        {
            return ((k / this._referenceWidth) * (this._maxValue - this._minValue)) + this._minValue;
        }

        private function _Str_22507(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:Number;
            var _local_4:Number;
            if (k.type == WindowMouseEvent.DOWN)
            {
                this._sliderActive = true;
            }
            if (this._sliderActive)
            {
                if (((k.type == WindowMouseEvent.UP) || (k.type == WindowMouseEvent.UP_OUTSIDE)))
                {
                    this._sliderActive = false;
                }
            }
            if (((!(this._sliderActive)) || (!(k.type == WindowEvent.WINDOW_EVENT_RELOCATED))))
            {
                return;
            }
            if (this._snapInterval != 0)
            {
                _local_3 = this._Str_23515(_arg_2.x);
                _local_4 = (Math.round((_local_3 / this._snapInterval)) * this._snapInterval);
                this._Str_2526(_local_4, false);
            }
        }

        private function _Str_23487(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:Number;
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._sliderActive = false;
                if (this._snapInterval != 0)
                {
                    _local_3 = (this._currentValue + this._snapInterval);
                    this._Str_2526(_local_3);
                }
            }
        }

        private function _Str_24057(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:Number;
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._sliderActive = false;
                if (this._snapInterval != 0)
                {
                    _local_3 = (this._currentValue - this._snapInterval);
                    this._Str_2526(_local_3);
                }
            }
        }

        private function _Str_4995():void
        {
            var k:IWindowContainer;
            var _local_2:IBitmapWrapperWindow;
            var _local_3:IContainerButtonWindow;
            var _local_4:IContainerButtonWindow;
            if (this._sliderContainer == null)
            {
                return;
            }
            _local_2 = (this._sliderContainer.findChildByName("slider_base") as IBitmapWrapperWindow);
            if (((!(_local_2 == null)) && (!(this._sliderBase == null))))
            {
                _local_2.bitmap = new BitmapData(this._sliderBase.width, this._sliderBase.height, true, 0xFFFFFF);
                _local_2.bitmap.copyPixels(this._sliderBase, this._sliderBase.rect, new Point(0, 0), null, null, true);
            }
            k = (this._sliderContainer.findChildByName("slider_movement_area") as IWindowContainer);
            if (k != null)
            {
                _local_2 = (k.findChildByName("slider_button") as IBitmapWrapperWindow);
                if (((!(_local_2 == null)) && (!(this._sliderButton == null))))
                {
                    _local_2.bitmap = new BitmapData(this._sliderButton.width, this._sliderButton.height, true, 0xFFFFFF);
                    _local_2.bitmap.copyPixels(this._sliderButton, this._sliderButton.rect, new Point(0, 0), null, null, true);
                    _local_2.procedure = this._Str_22507;
                    this._referenceWidth = (k.width - _local_2.width);
                }
            }
            _local_4 = (this._sliderContainer.findChildByName("slider_button_left") as IContainerButtonWindow);
            if (_local_4)
            {
                _local_4.procedure = this._Str_24057;
            }
            _local_3 = (this._sliderContainer.findChildByName("slider_button_right") as IContainerButtonWindow);
            if (_local_3)
            {
                _local_3.procedure = this._Str_23487;
            }
        }

        private function _Str_6048(k:IAssetLibrary):void
        {
            var _local_2:BitmapDataAsset;
            if (k == null)
            {
                return;
            }
            _local_2 = BitmapDataAsset(k.getAssetByName("slider_bg_png"));
            this._sliderBase = BitmapData(_local_2.content);
            _local_2 = BitmapDataAsset(k.getAssetByName("slider_obj_png"));
            this._sliderButton = BitmapData(_local_2.content);
        }
    }
}

