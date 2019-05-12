package com.sulake.habbo.ui.widget.furniture.backgroundcolor
{
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;

    public class BackgroundColorWidgetSlider 
    {
        private static const _Str_2809:int = 0;
        private static const _Str_2856:int = 0xFF;

        private var _Str_2268:BackgroundColorFurniWidget;
        private var _Str_2571:IWindowContainer;
        private var _Str_4513:String;
        private var _Str_2764:BitmapData;
        private var _Str_2751:BitmapData;
        private var _Str_3236:int;
        private var _Str_12640:int;

        public function BackgroundColorWidgetSlider(k:BackgroundColorFurniWidget, _arg_2:String, _arg_3:IWindowContainer, _arg_4:int=0)
        {
            var _local_5:BitmapDataAsset;
            super();
            this._Str_2268 = k;
            this._Str_4513 = _arg_2;
            this._Str_2571 = _arg_3;
            _local_5 = BitmapDataAsset(k.assets.getAssetByName("dimmer_slider_base"));
            this._Str_2764 = BitmapData(_local_5.content);
            _local_5 = BitmapDataAsset(k.assets.getAssetByName("dimmer_slider_button"));
            this._Str_2751 = BitmapData(_local_5.content);
            this._Str_4995();
            this._Str_2526(_arg_4);
        }

        public function dispose():void
        {
            this._Str_2268 = null;
            this._Str_2571 = null;
            this._Str_2764 = null;
            this._Str_2751 = null;
        }

        public function _Str_2526(k:int):void
        {
            if (this._Str_2571 == null)
            {
                return;
            }
            var _local_2:IWindow = this._Str_2571.findChildByName("slider_button");
            if (_local_2 != null)
            {
                _local_2.x = this._Str_5687(k);
            }
        }

        private function _Str_5687(k:int):int
        {
            return int((this._Str_3236 * (Number((k - _Str_2809)) / (_Str_2856 - _Str_2809))));
        }

        private function getValue(k:Number):int
        {
            return int(((k / this._Str_3236) * (_Str_2856 - _Str_2809))) + _Str_2809;
        }

        private function _Str_5862(k:WindowEvent, _arg_2:IWindow):void
        {
            this._Str_2268._Str_25701(this._Str_4513, this.getValue(_arg_2.x));
        }

        private function _Str_4995():void
        {
            var k:IWindowContainer;
            var _local_2:IBitmapWrapperWindow;
            if (this._Str_2571 == null)
            {
                return;
            }
            _local_2 = (this._Str_2571.findChildByName("slider_base") as IBitmapWrapperWindow);
            if (((!(_local_2 == null)) && (!(this._Str_2764 == null))))
            {
                _local_2.bitmap = new BitmapData(this._Str_2764.width, this._Str_2764.height, true, 0xFFFFFF);
                _local_2.bitmap.copyPixels(this._Str_2764, this._Str_2764.rect, new Point(0, 0), null, null, true);
            }
            k = (this._Str_2571.findChildByName("slider_movement_area") as IWindowContainer);
            if (k != null)
            {
                _local_2 = (k.findChildByName("slider_button") as IBitmapWrapperWindow);
                if (((!(_local_2 == null)) && (!(this._Str_2751 == null))))
                {
                    _local_2.bitmap = new BitmapData(this._Str_2751.width, this._Str_2751.height, true, 0xFFFFFF);
                    _local_2.bitmap.copyPixels(this._Str_2751, this._Str_2751.rect, new Point(0, 0), null, null, true);
                    _local_2.procedure = this._Str_5862;
                    this._Str_3236 = (k.width - _local_2.width);
                }
            }
        }
    }
}

