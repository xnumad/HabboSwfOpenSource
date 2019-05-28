package com.sulake.habbo.ui.widget.furniture.backgroundcolor
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.window.components.IFrameWindow;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.handler.FurnitureBackgroundColorWidgetHandler;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.room.utils.ColorConverter;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_11317;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_3382;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import __AS3__.vec.*;

    public class BackgroundColorFurniWidget extends ConversionTrackingWidget 
    {
        private static const HUE:String = "hue";
        private static const SATURATION:String = "saturation";
        private static const LIGHTNESS:String = "lightness";

        private var _window:IFrameWindow;
        private var _furniId:int;
        private var _sliders:Vector.<BackgroundColorWidgetSlider>;
        private var _hue:int;
        private var _saturation:int;
        private var _lightness:int;

        public function BackgroundColorFurniWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary=null, _arg_4:IHabboLocalizationManager=null)
        {
            this._sliders = new Vector.<BackgroundColorWidgetSlider>();
            super(k, _arg_2, _arg_3, _arg_4);
            this.handler.widget = this;
        }

        public function get handler():FurnitureBackgroundColorWidgetHandler
        {
            return _Str_2470 as FurnitureBackgroundColorWidgetHandler;
        }

        override public function dispose():void
        {
            this._Str_2669();
            super.dispose();
        }

        public function open(k:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            this._furniId = k;
            this._hue = Math.max(_arg_2, 0);
            this._saturation = Math.max(_arg_3, 0);
            this._lightness = Math.max(_arg_4, 0);
            this.createWindow();
        }

        public function _Str_25701(k:String, _arg_2:int):void
        {
            switch (k)
            {
                case HUE:
                    this._hue = _arg_2;
                    break;
                case SATURATION:
                    this._saturation = _arg_2;
                    break;
                case LIGHTNESS:
                    this._lightness = _arg_2;
                    break;
            }
            this._Str_23042();
        }

        private function createWindow():void
        {
            if (!this._window)
            {
                this._window = IFrameWindow(windowManager.buildFromXML((assets.getAssetByName("background_color_ui_xml").content as XML)));
                this._window.procedure = this._Str_2533;
                this._window.center();
                this._sliders.push(new BackgroundColorWidgetSlider(this, HUE, IWindowContainer(this._window.findChildByName("hue_container")), this._hue));
                this._sliders.push(new BackgroundColorWidgetSlider(this, SATURATION, IWindowContainer(this._window.findChildByName("saturation_container")), this._saturation));
                this._sliders.push(new BackgroundColorWidgetSlider(this, LIGHTNESS, IWindowContainer(this._window.findChildByName("lightness_container")), this._lightness));
            }
        }

        private function _Str_2669():void
        {
            var k:BackgroundColorWidgetSlider;
            for each (k in this._sliders)
            {
                k.dispose();
            }
            this._sliders = new Vector.<BackgroundColorWidgetSlider>();
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function _Str_23042():void
        {
            if (this._window == null)
            {
                return;
            }
            var k:IBitmapWrapperWindow = IBitmapWrapperWindow(this._window.findChildByName("color_preview_bitmap"));
            var _local_2:BitmapData = new BitmapData(k.width, k.height, false);
            var _local_3:uint = ColorConverter.hslToRGB(((((this._hue & 0xFF) << 16) + ((this._saturation & 0xFF) << 8)) + (this._lightness & 0xFF)));
            _local_2.fillRect(_local_2.rect, _local_3);
            k.bitmap = _local_2;
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((!(_arg_2 == null)) && (k.type == WindowMouseEvent.CLICK)))
            {
                switch (_arg_2.name)
                {
                    case "apply_button":
                        this.handler.container.connection.send(new _Str_11317(this._furniId, this._hue, this._saturation, this._lightness));
                        return;
                    case "on_off_button":
                        this.handler.container.connection.send(new _Str_3382(this._furniId));
                        return;
                    case "header_button_close":
                        this._Str_2669();
                        return;
                }
            }
        }
    }
}
