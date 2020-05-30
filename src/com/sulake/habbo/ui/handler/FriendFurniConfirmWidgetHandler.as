package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.friendfurni.FriendFurniConfirmWidget;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.friendfurni.FriendFurniStartConfirmationMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.friendfurni.FriendFurniOtherLockConfirmedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.friendfurni.FriendFurniCancelLockMessageEvent;
    import com.sulake.habbo.communication.messages.outgoing.friendfurni.FriendFurniConfirmLockMessageComposer;
    import flash.events.Event;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;

    public class FriendFurniConfirmWidgetHandler implements IRoomWidgetHandler 
    {
        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _widget:FriendFurniConfirmWidget;
        private var _connection:IConnection;
        private var _friendFurniConfirmListener:IMessageEvent = null;
        private var _friendFurniOtherLockConfirmListener:IMessageEvent = null;
        private var _friendFurniCancelLockListener:IMessageEvent = null;


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function set widget(k:FriendFurniConfirmWidget):void
        {
            this._widget = k;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (((this._connection) && (this._friendFurniConfirmListener)))
                {
                    this._connection.removeMessageEvent(this._friendFurniConfirmListener);
                    this._connection.removeMessageEvent(this._friendFurniOtherLockConfirmListener);
                    this._connection.removeMessageEvent(this._friendFurniCancelLockListener);
                    this._connection = null;
                }
                this._widget = null;
                this._container = null;
                this._disposed = true;
            }
        }

        public function set connection(k:IConnection):void
        {
            this._connection = k;
            if (!this._friendFurniConfirmListener)
            {
                this._friendFurniConfirmListener = new FriendFurniStartConfirmationMessageEvent(this.onStartConfirmation);
                this._friendFurniOtherLockConfirmListener = new FriendFurniOtherLockConfirmedMessageEvent(this.onOtherLockConfirmed);
                this._friendFurniCancelLockListener = new FriendFurniCancelLockMessageEvent(this.onCancelLock);
                this._connection.addMessageEvent(this._friendFurniConfirmListener);
                this._connection.addMessageEvent(this._friendFurniOtherLockConfirmListener);
                this._connection.addMessageEvent(this._friendFurniCancelLockListener);
            }
        }

        public function sendLockConfirm(k:int, _arg_2:Boolean):void
        {
            this._connection.send(new FriendFurniConfirmLockMessageComposer(k, _arg_2));
        }

        private function onStartConfirmation(k:FriendFurniStartConfirmationMessageEvent):void
        {
            this._widget.open(k.getParser().stuffId, k.getParser().isOwner);
        }

        private function onOtherLockConfirmed(k:FriendFurniOtherLockConfirmedMessageEvent):void
        {
            this._widget._Str_25728(k.getParser().stuffId);
        }

        private function onCancelLock(k:FriendFurniCancelLockMessageEvent):void
        {
            this._widget.close(k.getParser().stuffId);
        }

        public function get type():String
        {
            return "";
        }

        public function getProcessedEvents():Array
        {
            return null;
        }

        public function processEvent(k:Event):void
        {
        }

        public function getWidgetMessages():Array
        {
            return [];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return null;
        }

        public function update():void
        {
        }
    }
}
