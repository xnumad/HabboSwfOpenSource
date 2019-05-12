package com.sulake.habbo.ui.widget.furniture.dimmer
{
    import com.sulake.core.window.IWindowContainer;
	import com.sulake.habbo.ui.widget.furniture.dimmer.DimmerView;
    import flash.display.BitmapData;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;

    public class DimmerViewAlphaSlider 
    {
        private var _view:DimmerView;
        private var _sliderContainer:IWindowContainer;
        private var _sliderBase:BitmapData;
        private var _sliderButton:BitmapData;
        private var _referenceWidth:int;
        private var _referenceX:int;
        private var _minValue:int = 0;
        private var _maxValue:int = 0xFF;

        public function DimmerViewAlphaSlider(k:DimmerView, _arg_2:IWindowContainer, _arg_3:IAssetLibrary, _arg_4:int=0, _arg_5:int=0xFF)
        {
            this._view = k;
            this._sliderContainer = _arg_2;
            this._minValue = _arg_4;
            this._maxValue = _arg_5;
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

        public function _Str_2526(k:int):void
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

        public function set min(k:Number):void
        {
            this._minValue = k;
            this._Str_2526(this._view._Str_7404);
        }

        public function set max(k:Number):void
        {
            this._maxValue = k;
            this._Str_2526(this._view._Str_7404);
        }

        private function _Str_5687(k:int):int
        {
            return int((this._referenceWidth * (Number((k - this._minValue)) / (this._maxValue - this._minValue))));
        }

        private function getValue(k:Number):int
        {
            return int(((k / this._referenceWidth) * (this._maxValue - this._minValue))) + this._minValue;
        }

        private function _Str_5862(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((!(k.type == WindowMouseEvent.UP)) && (!(k.type == WindowMouseEvent.UP_OUTSIDE))))
            {
                return;
            }
            this._view._Str_7404 = this.getValue(_arg_2.x);
        }

        private function _Str_4995():void
        {
            var k:IWindowContainer;
            var _local_2:IBitmapWrapperWindow;
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
                    _local_2.procedure = this._Str_5862;
                    this._referenceWidth = (k.width - _local_2.width);
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
            _local_2 = BitmapDataAsset(k.getAssetByName("dimmer_slider_base"));
            this._sliderBase = BitmapData(_local_2.content);
            _local_2 = BitmapDataAsset(k.getAssetByName("dimmer_slider_button"));
            this._sliderButton = BitmapData(_local_2.content);
        }
    }
}

