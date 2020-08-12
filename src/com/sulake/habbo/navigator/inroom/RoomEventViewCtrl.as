package com.sulake.habbo.navigator.inroom
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.navigator.IHabboTransitionalNavigator;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.navigator.TextFieldManager;
    import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.navigator.EditEventMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.navigator.CancelEventMessageComposer;
    import com.sulake.habbo.communication.messages.parser.advertisement.RoomAdErrorMessageParser;
    import com.sulake.habbo.communication.messages.incoming.advertisement.RoomAdErrorEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;

    public class RoomEventViewCtrl implements IDisposable
    {
        private var _navigator:IHabboTransitionalNavigator;
        private var _window:IFrameWindow;
        private var _eventNameInput:TextFieldManager;
        private var _eventDescInput:TextFieldManager;

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
            this._eventNameInput = null;
            this._eventDescInput = null;
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
            var k:RoomEventData = this._navigator.data.roomEventData;
            if (k == null)
            {
                this.createEvent();
            }
            else
            {
                this.editEvent(k);
            }
            this._window.visible = true;
            this._window.activate();
        }

        private function editEvent(k:RoomEventData):void
        {
            this._window.caption = this._navigator.getText("navigator.eventsettings.editcaption");
            this._eventNameInput.setText(k.eventName);
            this._eventDescInput.setText(k.eventDescription);
        }

        private function createEvent():void
        {
            this._window.caption = this._navigator.getText("navigator.createevent");
            this._eventDescInput.goBackToInitialState();
            this._eventNameInput.goBackToInitialState();
        }

        private function getInput(k:String):ITextFieldWindow
        {
            return ITextFieldWindow(this._window.findChildByName(k));
        }

        private function onClose(k:WindowEvent):void
        {
            this.close();
        }

        private function save():void
        {
            var k:int = this._navigator.data.roomEventData.adId;
            var _local_2:String = this._eventNameInput.getText();
            var _local_3:String = this._eventDescInput.getText();
            if (!this.isMandatoryFieldsFilled())
            {
                return;
            }
            this._navigator.send(new EditEventMessageComposer(k, _local_2, _local_3));
        }

        private function onEndButtonClick(k:WindowEvent):void
        {
            this._navigator.send(new CancelEventMessageComposer(this._navigator.data.roomEventData.adId));
            this.close();
        }

        private function _Str_4604(k:WindowEvent):void
        {
            this.close();
        }

        private function _Str_5137(k:WindowEvent):void
        {
            if (this._navigator.data.roomEventData != null)
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
                this._eventNameInput.displayError(this._navigator.getText("roomad.error.0.description"));
                this._eventNameInput.setText(_local_2.filteredText);
            }
            else
            {
                if (_local_3 == 1)
                {
                    this._eventDescInput.displayError(this._navigator.getText("roomad.error.0.description"));
                    this._eventDescInput.setText(_local_2.filteredText);
                }
            }
        }

        private function isMandatoryFieldsFilled():Boolean
        {
            this.clearErrors();
            if (!this._eventNameInput.checkMandatory(this._navigator.getText("navigator.eventsettings.nameerr")))
            {
                return false;
            }
            return true;
        }

        private function clearErrors():void
        {
            this._eventNameInput.clearErrors();
            this._eventDescInput.clearErrors();
        }

        private function prepareWindow():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._navigator.getXmlWindow("iro_event_settings"));
            this.addMouseClickListener(this._window.findChildByTag("close"), this.onClose);
            this._eventNameInput = new TextFieldManager(this._navigator, this.getInput("event_name"), 25);
            this._eventDescInput = new TextFieldManager(this._navigator, this.getInput("event_desc"), 100);
            this._eventNameInput.input.addEventListener(WindowEvent.WINDOW_EVENT_UNFOCUSED, this._Str_5137);
            this._eventDescInput.input.addEventListener(WindowEvent.WINDOW_EVENT_UNFOCUSED, this._Str_5137);
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
