package com.sulake.habbo.session.handler
{
    import com.sulake.habbo.communication.messages.incoming.room.session.OpenConnectionMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.FlatAccessibleMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.RoomReadyMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.FlatAccessDeniedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.RoomQueueStatusMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.YouAreSpectatorMessageEvent;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.communication.messages.parser.room.session.FlatAccessibleMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.room.session.GoToFlatMessageComposer;
    import com.sulake.habbo.session.events.RoomSessionDoorbellEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.RoomReadyMessageParser;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.communication.messages.parser.navigator.FlatAccessDeniedMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.session.RoomQueueSet;
    import com.sulake.habbo.session.events.RoomSessionQueueEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.RoomQueueStatusMessageParser;

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
            k.addMessageEvent(new OpenConnectionMessageEvent(this.onRoomConnected));
            k.addMessageEvent(new FlatAccessibleMessageEvent(this.onFlatAccessible));
            k.addMessageEvent(new RoomReadyMessageEvent(this.onRoomReady));
            k.addMessageEvent(new CloseConnectionMessageEvent(this.onRoomDisconnected));
            k.addMessageEvent(new FlatAccessDeniedMessageEvent(this.onFlatAccessDenied));
            k.addMessageEvent(new RoomQueueStatusMessageEvent(this.onRoomQueueStatus));
            k.addMessageEvent(new YouAreSpectatorMessageEvent(this.onYouAreSpectator));
        }

        private function onRoomConnected(k:IMessageEvent):void
        {
            var _local_2:int = _xxxRoomId;
            if (listener)
            {
                listener.sessionUpdate(_local_2, RoomSessionHandler.RS_CONNECTED);
            }
        }

        private function onFlatAccessible(k:FlatAccessibleMessageEvent):void
        {
            var session:IRoomSession;
            var roomId:int = _xxxRoomId;
            var parser:FlatAccessibleMessageParser = k.getParser();
            if (parser == null)
            {
                return;
            }
            var userName:String = parser.userName;
            if (((userName == null) || (userName.length == 0)))
            {
                connection.send(new GoToFlatMessageComposer(roomId));
            }
            else
            {
                if (((listener) && (listener.events)))
                {
                    session = listener.getSession(roomId);
                    if (session != null)
                    {
                        listener.events.dispatchEvent(new RoomSessionDoorbellEvent(RoomSessionDoorbellEvent.RSDE_ACCEPTED, session, userName));
                    }
                }
            }
        }

        private function onRoomReady(k:IMessageEvent):void
        {
            var _local_5:RoomReadyMessageParser;
            var _local_2:int = _xxxRoomId;
            var _local_3:int = _local_2;
            var _local_4:RoomReadyMessageEvent = (k as RoomReadyMessageEvent);
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

        private function onFlatAccessDenied(k:FlatAccessDeniedMessageEvent):void
        {
            var _local_5:IRoomSession;
            var _local_2:int = _xxxRoomId;
            var _local_3:FlatAccessDeniedMessageParser = k.getParser();
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

        private function onRoomQueueStatus(k:RoomQueueStatusMessageEvent):void
        {
            var _local_4:RoomQueueSet;
            var _local_5:RoomSessionQueueEvent;
            var _local_7:Array;
            var _local_9:int;
            var _local_10:String;
            if (((listener == null) || (listener.events == null)))
            {
                return;
            }
            var _local_2:RoomQueueStatusMessageParser = k.getParser();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_3 == null)
            {
                return;
            }
            var _local_6:Array = _local_2.getQueueSetTargets();
            var _local_8:int = _local_2.activeTarget;
            for each (_local_9 in _local_6)
            {
                _local_4 = _local_2.getQueueSet(_local_9);
                _local_5 = new RoomSessionQueueEvent(_local_3, _local_4.name, _local_4.target, (_local_4.target == _local_8));
                _local_7 = _local_4.queueTypes;
                for each (_local_10 in _local_7)
                {
                    _local_5.addQueue(_local_10, _local_4.getQueueSize(_local_10));
                }
                listener.events.dispatchEvent(_local_5);
            }
        }

        private function onYouAreSpectator(k:YouAreSpectatorMessageEvent):void
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
            _local_2.isSpectatorMode = true;
        }
    }
}
