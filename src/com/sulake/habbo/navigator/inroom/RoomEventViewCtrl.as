package com.sulake.habbo.navigator.inroom
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.navigator.IHabboTransitionalNavigator;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.navigator.TextFieldManager;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_3579;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.navigator._Str_9806;
    import com.sulake.habbo.communication.messages.outgoing.navigator._Str_11893;
    import com.sulake.habbo.communication.messages.parser.advertisement.RoomAdErrorMessageParser;
    import com.sulake.habbo.communication.messages.incoming.advertisement.RoomAdErrorEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;

    public class RoomEventViewCtrl implements IDisposable
    {
        private var _navigator:IHabboTransitionalNavigator;
        private var _window:IFrameWindow;
        private var _Str_5340:TextFieldManager;
        private var _Str_5951:TextFieldManager;

        public function RoomEventViewCtrl(k:IHabboTransitionalNavigator)
        {
            this._navigator = k;
        }

        public function dispose():void
        {
            this._navigator = null;
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
            return this._navigator == null;
        }

        public function show():void
        {
            if (((!(this._window == null)) && (this._window.visible)))
            {
                this._window.visible = false;
                return;
            }
            this.prepareWindow();
            this.clearErrors();
            var k:_Str_3579 = this._navigator.data._Str_4112;
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
            this._window.caption = this._navigator.getText("navigator.eventsettings.editcaption");
            this._Str_5340.setText(k.eventName);
            this._Str_5951.setText(k.eventDescription);
        }

        private function _Str_25306():void
        {
            this._window.caption = this._navigator.getText("navigator.createevent");
            this._Str_5951._Str_8407();
            this._Str_5340._Str_8407();
        }

        private function _Str_2453(k:String):ITextFieldWindow
        {
            return ITextFieldWindow(this._window.findChildByName(k));
        }

        private function onClose(k:WindowEvent):void
        {
            this.close();
        }

        private function save():void
        {
            var k:int = this._navigator.data._Str_4112.adId;
            var _local_2:String = this._Str_5340.getText();
            var _local_3:String = this._Str_5951.getText();
            if (!this._Str_17505())
            {
                return;
            }
            this._navigator.send(new _Str_9806(k, _local_2, _local_3));
        }

        private function _Str_26060(k:WindowEvent):void
        {
            this._navigator.send(new _Str_11893(this._navigator.data._Str_4112.adId));
            this.close();
        }

        private function _Str_4604(k:WindowEvent):void
        {
            this.close();
        }

        private function _Str_5137(k:WindowEvent):void
        {
            if (this._navigator.data._Str_4112 != null)
            {
                this.save();
            }
        }

        private function _Str_24049(k:RoomAdErrorEvent):void
        {
            this.clearErrors();
            var _local_2:RoomAdErrorMessageParser = k.getParser();
            var _local_3:int = _local_2.errorCode;
            if (_local_3 == 0)
            {
                this._Str_5340._Str_5374(this._navigator.getText("roomad.error.0.description"));
                this._Str_5340.setText(_local_2.filteredText);
            }
            else
            {
                if (_local_3 == 1)
                {
                    this._Str_5951._Str_5374(this._navigator.getText("roomad.error.0.description"));
                    this._Str_5951.setText(_local_2.filteredText);
                }
            }
        }

        private function _Str_17505():Boolean
        {
            this.clearErrors();
            if (!this._Str_5340._Str_22184(this._navigator.getText("navigator.eventsettings.nameerr")))
            {
                return false;
            }
            return true;
        }

        private function clearErrors():void
        {
            this._Str_5340.clearErrors();
            this._Str_5951.clearErrors();
        }

        private function prepareWindow():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._navigator.getXmlWindow("iro_event_settings"));
            this.addMouseClickListener(this._window.findChildByTag("close"), this.onClose);
            this._Str_5340 = new TextFieldManager(this._navigator, this._Str_2453("event_name"), 25);
            this._Str_5951 = new TextFieldManager(this._navigator, this._Str_2453("event_desc"), 100);
            this._Str_5340.input.addEventListener(WindowEvent.WINDOW_EVENT_UNFOCUSED, this._Str_5137);
            this._Str_5951.input.addEventListener(WindowEvent.WINDOW_EVENT_UNFOCUSED, this._Str_5137);
            this._navigator.communication.addHabboConnectionMessageEvent(new RoomAdErrorEvent(this._Str_24049));
            this._window.center();
        }

        private function addMouseClickListener(k:IWindow, _arg_2:Function):void
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
                _local_5 = this._navigator.getText(_local_4);
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
