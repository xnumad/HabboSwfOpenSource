package com.sulake.habbo.navigator.inroom
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.navigator.IHabboTransitionalNavigator;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.navigator.TextFieldManager;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_3579;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_9806;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_11893;
    import com.sulake.habbo.communication.messages.parser.advertisement.RoomAdErrorMessageParser;
    import com.sulake.habbo.communication.messages.incoming._Str_483.RoomAdErrorMessage;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;

    public class RoomInfoViewCtrl implements IDisposable 
    {
        private var _Str_2272:IHabboTransitionalNavigator;
        private var _window:IFrameWindow;
        private var _Str_5340:TextFieldManager;
        private var _Str_5951:TextFieldManager;

        public function RoomInfoViewCtrl(k:IHabboTransitionalNavigator)
        {
            this._Str_2272 = k;
        }

        public function dispose():void
        {
            this._Str_2272 = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            this._Str_5340 = null;
            this._Str_5951 = null;
        }

        public function get disposed():Boolean
        {
            return this._Str_2272 == null;
        }

        public function show():void
        {
            if (((!(this._window == null)) && (this._window.visible)))
            {
                this._window.visible = false;
                return;
            }
            this._Str_2755();
            this._Str_3732();
            var k:_Str_3579 = this._Str_2272.data._Str_4112;
            if (k == null)
            {
                this._Str_25306();
            }
            else
            {
                this._Str_26474(k);
            }
            this._window.visible = true;
            this._window.activate();
        }

        private function _Str_26474(k:_Str_3579):void
        {
            this._window.caption = this._Str_2272.getText("navigator.eventsettings.editcaption");
            this._Str_5340._Str_2497(k.eventName);
            this._Str_5951._Str_2497(k.eventDescription);
        }

        private function _Str_25306():void
        {
            this._window.caption = this._Str_2272.getText("navigator.createevent");
            this._Str_5951._Str_8407();
            this._Str_5340._Str_8407();
        }

        private function _Str_2453(k:String):ITextFieldWindow
        {
            return ITextFieldWindow(this._window.findChildByName(k));
        }

        private function _Str_2392(k:WindowEvent):void
        {
            this.close();
        }

        private function save():void
        {
            var k:int = this._Str_2272.data._Str_4112.adId;
            var _local_2:String = this._Str_5340.getText();
            var _local_3:String = this._Str_5951.getText();
            if (!this._Str_17505())
            {
                return;
            }
            this._Str_2272.send(new _Str_9806(k, _local_2, _local_3));
        }

        private function _Str_26060(k:WindowEvent):void
        {
            this._Str_2272.send(new _Str_11893(this._Str_2272.data._Str_4112.adId));
            this.close();
        }

        private function _Str_4604(k:WindowEvent):void
        {
            this.close();
        }

        private function _Str_5137(k:WindowEvent):void
        {
            if (this._Str_2272.data._Str_4112 != null)
            {
                this.save();
            }
        }

        private function _Str_24049(k:RoomAdErrorMessage):void
        {
            this._Str_3732();
            var _local_2:RoomAdErrorMessageParser = k.getParser();
            var _local_3:int = _local_2.errorCode;
            if (_local_3 == 0)
            {
                this._Str_5340._Str_5374(this._Str_2272.getText("roomad.error.0.description"));
                this._Str_5340._Str_2497(_local_2.filteredText);
            }
            else
            {
                if (_local_3 == 1)
                {
                    this._Str_5951._Str_5374(this._Str_2272.getText("roomad.error.0.description"));
                    this._Str_5951._Str_2497(_local_2.filteredText);
                }
            }
        }

        private function _Str_17505():Boolean
        {
            this._Str_3732();
            if (!this._Str_5340._Str_22184(this._Str_2272.getText("navigator.eventsettings.nameerr")))
            {
                return false;
            }
            return true;
        }

        private function _Str_3732():void
        {
            this._Str_5340._Str_3732();
            this._Str_5951._Str_3732();
        }

        private function _Str_2755():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._Str_2272.getXmlWindow("iro_event_settings"));
            this._Str_2786(this._window.findChildByTag("close"), this._Str_2392);
            this._Str_5340 = new TextFieldManager(this._Str_2272, this._Str_2453("event_name"), 25);
            this._Str_5951 = new TextFieldManager(this._Str_2272, this._Str_2453("event_desc"), 100);
            this._Str_5340.input.addEventListener(WindowEvent.WINDOW_EVENT_UNFOCUSED, this._Str_5137);
            this._Str_5951.input.addEventListener(WindowEvent.WINDOW_EVENT_UNFOCUSED, this._Str_5137);
            this._Str_2272.communication.addHabboConnectionMessageEvent(new RoomAdErrorMessage(this._Str_24049));
            this._window.center();
        }

        private function _Str_2786(k:IWindow, _arg_2:Function):void
        {
            if (k != null)
            {
                k.addEventListener(WindowMouseEvent.CLICK, _arg_2);
            }
        }

        private function find(k:String):IWindow
        {
            var _local_2:IWindow = this._window.findChildByName(k);
            if (_local_2 == null)
            {
                throw (new Error((("Window element with name: " + k) + " cannot be found!")));
            }
            return _local_2;
        }

        private function _Str_26299():void
        {
            var _local_4:String;
            var _local_5:String;
            var k:Array = new Array();
            var _local_2:int = 100;
            var _local_3:int = 1;
            while (_local_3 < _local_2)
            {
                _local_4 = ("roomevent_type_" + _local_3);
                _local_5 = this._Str_2272.getText(_local_4);
                if (((_local_5 == null) || (_local_5 == _local_4)))
                {
                    return;
                }
                k.push(_local_5);
                _local_3++;
            }
        }

        public function close():void
        {
            if (this._window != null)
            {
                this._window.visible = false;
            }
        }
    }
}
