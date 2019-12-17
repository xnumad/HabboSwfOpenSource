package com.sulake.habbo.session.handler
{
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_5714;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_4265;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_3407;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_3352;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4187;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_8829;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_8292;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_5762;
    import com.sulake.habbo.communication.messages.outgoing._Str_84._Str_10646;
    import com.sulake.habbo.session.events.RoomSessionDoorbellEvent;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_5199;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_5700;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_5002;
    import com.sulake.habbo.session.events.RoomSessionQueueEvent;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_7701;

    public class RoomSessionHandler extends BaseHandler 
    {
        public static const RS_CONNECTED:String = "RS_CONNECTED";
        public static const RS_READY:String = "RS_READY";
        public static const RS_DISCONNECTED:String = "RS_DISCONNECTED";

        public function RoomSessionHandler(k:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(k, _arg_2);
            if (k == null)
            {
                return;
            }
            k.addMessageEvent(new _Str_5714(this.onRoomConnected));
            k.addMessageEvent(new _Str_4265(this._Str_24463));
            k.addMessageEvent(new _Str_3407(this._Str_5963));
            k.addMessageEvent(new _Str_3352(this.onRoomDisconnected));
            k.addMessageEvent(new _Str_4187(this._Str_12114));
            k.addMessageEvent(new _Str_8829(this._Str_23914));
            k.addMessageEvent(new _Str_8292(this._Str_22437));
        }

        private function onRoomConnected(k:IMessageEvent):void
        {
            var _local_2:int = _xxxRoomId;
            if (listener)
            {
                listener.sessionUpdate(_local_2, RoomSessionHandler.RS_CONNECTED);
            }
        }

        private function _Str_24463(k:_Str_4265):void
        {
            var _local_5:IRoomSession;
            var _local_2:int = _xxxRoomId;
            var _local_3:_Str_5762 = k.getParser();
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:String = _local_3.userName;
            if (((_local_4 == null) || (_local_4.length == 0)))
            {
                connection.send(new _Str_10646(_local_2));
            }
            else
            {
                if (((listener) && (listener.events)))
                {
                    _local_5 = listener.getSession(_local_2);
                    if (_local_5 != null)
                    {
                        listener.events.dispatchEvent(new RoomSessionDoorbellEvent(RoomSessionDoorbellEvent.RSDE_ACCEPTED, _local_5, _local_4));
                    }
                }
            }
        }

        private function _Str_5963(k:IMessageEvent):void
        {
            var _local_5:_Str_5199;
            var _local_2:int = _xxxRoomId;
            var _local_3:int = _local_2;
            var _local_4:_Str_3407 = (k as _Str_3407);
            if (_local_4 != null)
            {
                _local_5 = _local_4.getParser();
                if (_local_5 != null)
                {
                    _local_3 = _local_5.roomId;
                }
                ErrorReportStorage.addDebugData("RoomID", ("Room id: " + _local_5.roomId));
            }
            if (listener)
            {
                listener.sessionReinitialize(_local_2, _local_3);
                listener.sessionUpdate(_local_2, RoomSessionHandler.RS_READY);
            }
        }

        private function _Str_12114(k:_Str_4187):void
        {
            var _local_5:IRoomSession;
            var _local_2:int = _xxxRoomId;
            var _local_3:_Str_5700 = k.getParser();
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:String = _local_3.userName;
            if (((_local_4 == null) || (_local_4.length == 0)))
            {
                if (listener)
                {
                    listener.sessionUpdate(_local_2, RoomSessionHandler.RS_DISCONNECTED);
                }
            }
            else
            {
                if (((listener) && (listener.events)))
                {
                    _local_5 = listener.getSession(_local_2);
                    if (_local_5 != null)
                    {
                        listener.events.dispatchEvent(new RoomSessionDoorbellEvent(RoomSessionDoorbellEvent.REJECTED, _local_5, _local_4));
                    }
                }
            }
        }

        private function onRoomDisconnected(k:IMessageEvent):void
        {
            var _local_2:int = _xxxRoomId;
            ErrorReportStorage.addDebugData("RoomID", "");
            if (listener)
            {
                listener.sessionUpdate(_local_2, RoomSessionHandler.RS_DISCONNECTED);
            }
        }

        private function _Str_23914(k:_Str_8829):void
        {
            var _local_4:_Str_5002;
            var _local_5:RoomSessionQueueEvent;
            var _local_7:Array;
            var _local_9:int;
            var _local_10:String;
            if (((listener == null) || (listener.events == null)))
            {
                return;
            }
            var _local_2:_Str_7701 = k.getParser();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_3 == null)
            {
                return;
            }
            var _local_6:Array = _local_2._Str_23931();
            var _local_8:int = _local_2._Str_22264;
            for each (_local_9 in _local_6)
            {
                _local_4 = _local_2._Str_25714(_local_9);
                _local_5 = new RoomSessionQueueEvent(_local_3, _local_4.name, _local_4.target, (_local_4.target == _local_8));
                _local_7 = _local_4.queueTypes;
                for each (_local_10 in _local_7)
                {
                    _local_5.addQueue(_local_10, _local_4.getQueueSize(_local_10));
                }
                listener.events.dispatchEvent(_local_5);
            }
        }

        private function _Str_22437(k:_Str_8292):void
        {
            if (listener == null)
            {
                return;
            }
            var _local_2:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_2 == null)
            {
                return;
            }
            _local_2._Str_4780 = true;
        }
    }
}
