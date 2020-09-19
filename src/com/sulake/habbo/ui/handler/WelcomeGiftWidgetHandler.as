package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.furniture.WelcomeGiftStatusEvent;
    import com.sulake.habbo.communication.messages.incoming.users.WelcomeGiftChangeEmailResultEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_7719;
    import com.sulake.habbo.ui.widget.events._Str_5438;
    import com.sulake.habbo.communication.messages.parser.users._Str_7457;
    import com.sulake.habbo.ui.widget.events._Str_6843;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniActionMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChangeEmailMessage;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture.OpenWelcomeGiftComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.WelcomeGiftChangeEmailComposer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public class WelcomeGiftWidgetHandler implements IRoomWidgetHandler 
    {
        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _messageEvents:Array;


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._Str_15944();
                this._container = null;
                this._disposed = true;
            }
        }

        public function get type():String
        {
            return RoomWidgetEnum.WELCOME_GIFT;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
            this._Str_17717();
        }

        private function _Str_17717():void
        {
            var k:IMessageEvent;
            if (((!(this._container)) || (!(this._container.connection))))
            {
                return;
            }
            this._messageEvents = [];
            this._messageEvents.push(new WelcomeGiftStatusEvent(this._Str_23237));
            this._messageEvents.push(new WelcomeGiftChangeEmailResultEvent(this.onChangeEmailResult));
            for each (k in this._messageEvents)
            {
                this._container.connection.addMessageEvent(k);
            }
        }

        private function _Str_15944():void
        {
            var k:IMessageEvent;
            if ((((!(this._container)) || (!(this._container.connection))) || (!(this._messageEvents))))
            {
                return;
            }
            for each (k in this._messageEvents)
            {
                this._container.connection.removeMessageEvent(k);
                k.dispose();
            }
            this._messageEvents = null;
        }

        private function _Str_23237(k:WelcomeGiftStatusEvent):void
        {
            var _local_2:_Str_7719 = k.getParser();
            var _local_3:_Str_5438 = new _Str_5438();
            _local_3.email = _local_2.email;
            _local_3.isVerified = _local_2.isVerified;
            _local_3._Str_17916 = _local_2.allowChange;
            _local_3.furniId = _local_2.furniId;
            _local_3._Str_10512 = _local_2._Str_10512;
            this._container.events.dispatchEvent(_local_3);
        }

        private function onChangeEmailResult(k:WelcomeGiftChangeEmailResultEvent):void
        {
            var _local_2:_Str_7457 = k.getParser();
            this._container.events.dispatchEvent(new _Str_6843(_local_2.result));
        }

        public function getWidgetMessages():Array
        {
            var k:Array = [];
            k.push(RoomWidgetFurniActionMessage.RWFAM_OPEN_WELCOME_GIFT);
            k.push(RoomWidgetChangeEmailMessage.RWCEM_CHANGE_EMAIL);
            return k;
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:RoomWidgetFurniActionMessage;
            var _local_3:RoomWidgetChangeEmailMessage;
            if (!k)
            {
                return null;
            }
            switch (k.type)
            {
                case RoomWidgetFurniActionMessage.RWFAM_OPEN_WELCOME_GIFT:
                    _local_2 = (k as RoomWidgetFurniActionMessage);
                    this._container.connection.send(new OpenWelcomeGiftComposer(_local_2.furniId));
                    break;
                case RoomWidgetChangeEmailMessage.RWCEM_CHANGE_EMAIL:
                    _local_3 = (k as RoomWidgetChangeEmailMessage);
                    this._container.connection.send(new WelcomeGiftChangeEmailComposer(_local_3._Str_22654));
                    break;
            }
            return null;
        }

        public function getProcessedEvents():Array
        {
            return [];
        }

        public function processEvent(k:Event):void
        {
        }

        public function update():void
        {
        }
    }
}
