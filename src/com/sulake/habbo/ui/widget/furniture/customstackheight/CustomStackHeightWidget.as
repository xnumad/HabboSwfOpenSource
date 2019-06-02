package com.sulake.habbo.ui.widget.furniture.customstackheight
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.handler.FurnitureCustomStackHeightWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_7290;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;

    public class CustomStackHeightWidget extends ConversionTrackingWidget 
    {
        private static const _Str_14570:int = 10;
        private static const MAX_HEIGHT:int = 40;
        private static const _Str_15538:int = 20;

        private var _window:IWindowContainer;
        private var _Str_2502:int;

        public function CustomStackHeightWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary=null, _arg_4:IHabboLocalizationManager=null)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            FurnitureCustomStackHeightWidgetHandler(k).widget = this;
        }

        override public function dispose():void
        {
            this._Str_2669();
            super.dispose();
        }

        override public function get mainWindow():IWindow
        {
            return this._window;
        }

        private function createWindow():void
        {
            if (!this._window)
            {
                this._window = IWindowContainer(windowManager.buildFromXML(XML(assets.getAssetByName("custom_stack_height_xml").content)));
                this._window.procedure = this._Str_2533;
                this._window.center();
            }
        }

        public function open(k:int, _arg_2:Number):void
        {
            this._Str_2502 = k;
            _arg_2 = Math.min(_arg_2, MAX_HEIGHT);
            if (this._window == null)
            {
                this.createWindow();
            }
            this._window.findChildByName("input_height").caption = _arg_2.toString();
            this._Str_18328();
            this._window.visible = true;
        }

        public function hide():void
        {
            if (this._window == null)
            {
                return;
            }
            this._window.visible = false;
        }

        private function _Str_2669():void
        {
            if (this._window)
            {
                this._window.procedure = null;
                this._window.dispose();
                this._window = null;
            }
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            if (_arg_2 == null)
            {
                return;
            }
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "button_floor_level":
                        this._Str_19462 = 0;
                        this._Str_12076();
                        break;
                    case "button_above_stack":
                        this.handler.container.connection.send(new _Str_7290(this._Str_2502));
                        break;
                    case "header_button_close":
                        this._Str_2669();
                        break;
                    case "slider":
                        this._window.findChildByName("slider_button").x = WindowMouseEvent(k).localX;
                        this._Str_12076();
                        break;
                }
            }
            else
            {
                if (((k.type == WindowMouseEvent.UP) || (k.type == WindowMouseEvent.UP_OUTSIDE)))
                {
                    switch (_arg_2.name)
                    {
                        case "slider_button":
                            this._Str_12076();
                            break;
                    }
                }
                else
                {
                    if (k.type == WindowMouseEvent.DOUBLE_CLICK)
                    {
                        switch (_arg_2.name)
                        {
                            case "slider_button":
                                this._Str_21486(true);
                                this._Str_12076();
                                break;
                        }
                    }
                    else
                    {
                        if (k.type == WindowEvent.WINDOW_EVENT_RELOCATED)
                        {
                            switch (_arg_2.name)
                            {
                                case "slider_button":
                                    this._Str_21486();
                                    break;
                            }
                        }
                        else
                        {
                            if (k.type == WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN)
                            {
                                if (_arg_2.name == "input_height")
                                {
                                    if (WindowKeyboardEvent(k).keyCode == 13)
                                    {
                                        this._Str_18328();
                                        this._Str_12076();
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        private function _Str_12076():void
        {
            var k:int = (parseFloat(this._window.findChildByName("input_height").caption) * 100);
            this.handler.container.connection.send(new _Str_7290(this._Str_2502, k));
        }

        private function _Str_18328():void
        {
            var k:Number = parseFloat(this._window.findChildByName("input_height").caption);
            var _local_2:Number = (k / _Str_14570);
            _local_2 = Math.min(_local_2, 1);
            var _local_3:Number = (this._window.findChildByName("slider").width - _Str_15538);
            this._window.procedure = null;
            this._window.findChildByName("slider_button").x = (_local_3 * _local_2);
            this._window.procedure = this._Str_2533;
        }

        private function _Str_21486(k:Boolean=false):void
        {
            var _local_2:int = ((k) ? 1 : 100);
            var _local_3:Number = (this._window.findChildByName("slider").width - _Str_15538);
            var _local_4:Number = (this._window.findChildByName("slider_button").x / _local_3);
            var _local_5:Number = ((_local_4 * _Str_14570) * _local_2);
            this._window.findChildByName("input_height").caption = (int(_local_5) / (_local_2 * 1)).toString();
        }

        private function get handler():FurnitureCustomStackHeightWidgetHandler
        {
            return _Str_2470 as FurnitureCustomStackHeightWidgetHandler;
        }

        private function set _Str_19462(k:Number):void
        {
            if (this._window != null)
            {
                this._window.findChildByName("input_height").caption = k.toString();
                this._Str_18328();
            }
        }

        public function _Str_24760(k:int, _arg_2:Number):void
        {
            if (this._Str_2502 == k)
            {
                this._Str_19462 = _arg_2;
            }
        }
    }
}
