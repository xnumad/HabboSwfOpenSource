package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.friendfurni.FriendFurniConfirmWidget;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming._Str_451._Str_8413;
    import com.sulake.habbo.communication.messages.incoming._Str_451._Str_8746;
    import com.sulake.habbo.communication.messages.incoming._Str_451._Str_8296;
    import com.sulake.habbo.communication.messages.outgoing._Str_547._Str_11713;
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
                this._friendFurniConfirmListener = new _Str_8413(this._Str_22615);
                this._friendFurniOtherLockConfirmListener = new _Str_8746(this._Str_23555);
                this._friendFurniCancelLockListener = new _Str_8296(this._Str_23369);
                this._connection.addMessageEvent(this._friendFurniConfirmListener);
                this._connection.addMessageEvent(this._friendFurniOtherLockConfirmListener);
                this._connection.addMessageEvent(this._friendFurniCancelLockListener);
            }
        }

        public function _Str_17138(k:int, _arg_2:Boolean):void
        {
            this._connection.send(new _Str_11713(k, _arg_2));
        }

        private function _Str_22615(k:_Str_8413):void
        {
            this._widget.open(k.getParser().stuffId, k.getParser()._Str_3233);
        }

        private function _Str_23555(k:_Str_8746):void
        {
            this._widget._Str_25728(k.getParser().stuffId);
        }

        private function _Str_23369(k:_Str_8296):void
        {
            this._widget.close(k.getParser().stuffId);
        }

        public function get type():String
        {
            return "";
        }

        public function _Str_2609():Array
        {
            return null;
        }

        public function _Str_2485(k:Event):void
        {
        }

        public function _Str_2607():Array
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
