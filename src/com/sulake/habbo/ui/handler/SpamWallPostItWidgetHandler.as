package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_9687;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_7128;
    import com.sulake.habbo.inventory.items.IFurnitureItem;
    import com.sulake.habbo.ui.widget.events._Str_5436;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetSpamWallPostItFinishEditingMessage;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_8167;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public class SpamWallPostItWidgetHandler implements IRoomWidgetHandler 
    {
        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer;
        private var _connection:IConnection = null;
        private var _spamWallPostItEditRequestListener:IMessageEvent;


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.SPAMWALL_POSTIT_WIDGET;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function set connection(k:IConnection):void
        {
            this._spamWallPostItEditRequestListener = new _Str_9687(this._Str_23816);
            this._connection = k;
            this._connection.addMessageEvent(this._spamWallPostItEditRequestListener);
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._disposed = true;
                this._connection.removeMessageEvent(this._spamWallPostItEditRequestListener);
                this._connection = null;
            }
        }

        private function _Str_23816(k:_Str_9687):void
        {
            var _local_7:String;
            if (k == null)
            {
                return;
            }
            var _local_2:_Str_7128 = k.getParser();
            var _local_3:int = _local_2.itemId;
            var _local_4:String = _local_2.location;
            var _local_5:String = "post_it";
            var _local_6:IFurnitureItem;
            if (this._container.inventory != null)
            {
                _local_6 = this._container.inventory._Str_14082(_local_3);
            }
            if (((!(_local_6 == null)) && (!(this._container.roomEngine == null))))
            {
                _local_7 = this._container.roomEngine.getWallItemType(_local_6.type);
                if (_local_7.match("post_it_"))
                {
                    _local_5 = _local_7;
                }
            }
            if (this._container != null)
            {
                if (this._container.events != null)
                {
                    this._container.events.dispatchEvent(new _Str_5436(_Str_5436.RWSWPUE_OPEN_EDITOR, _local_3, _local_4, _local_5));
                }
            }
        }

        public function _Str_2607():Array
        {
            return [_Str_5436.RWSWPUE_OPEN_EDITOR, RoomWidgetSpamWallPostItFinishEditingMessage.RWSWPFEE_SEND_POSTIT_DATA];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:RoomWidgetSpamWallPostItFinishEditingMessage;
            var _local_3:_Str_8167;
            switch (k.type)
            {
                case RoomWidgetSpamWallPostItFinishEditingMessage.RWSWPFEE_SEND_POSTIT_DATA:
                    _local_2 = (k as RoomWidgetSpamWallPostItFinishEditingMessage);
                    if (_local_2 != null)
                    {
                        if (this._connection != null)
                        {
                            _local_3 = new _Str_8167(_local_2._Str_1577, _local_2.location, _local_2._Str_10471, _local_2.text);
                            this._connection.send(_local_3);
                        }
                    }
                    break;
            }
            return null;
        }

        public function _Str_2609():Array
        {
            return [];
        }

        public function _Str_2485(k:Event):void
        {
        }

        public function update():void
        {
        }
    }
}
