package com.sulake.habbo.session.handler
{
    import com.sulake.habbo.communication.messages.incoming.room.chat._Str_4642;
    import com.sulake.habbo.communication.messages.incoming.room.chat._Str_4826;
    import com.sulake.habbo.communication.messages.incoming.room.chat.RoomUserShoutEvent;
    import com.sulake.habbo.communication.messages.incoming.users._Str_4953;
    import com.sulake.habbo.communication.messages.incoming.users._Str_8482;
    import com.sulake.habbo.communication.messages.incoming.users._Str_9507;
    import com.sulake.habbo.communication.messages.incoming.room.chat._Str_8743;
    import com.sulake.habbo.communication.messages.incoming.users._Str_8702;
    import com.sulake.habbo.communication.messages.incoming.room.chat._Str_8596;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.communication.messages.parser.room.chat.RoomUserShoutMessageParser;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.ui.widget.enums.SystemChatStyleEnum;
    import com.sulake.habbo.communication.messages.parser.users._Str_7994;
    import com.sulake.habbo.communication.messages.parser.users._Str_7513;
    import com.sulake.habbo.communication.messages.incoming.users._Str_8921;
    import com.sulake.habbo.communication.messages.parser.room.chat._Str_6399;

    public class RoomChatHandler extends BaseHandler 
    {
        public function RoomChatHandler(k:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(k, _arg_2);
            if (k == null)
            {
                return;
            }
            k.addMessageEvent(new _Str_4642(this.onRoomChat));
            k.addMessageEvent(new _Str_4826(this.onRoomWhisper));
            k.addMessageEvent(new RoomUserShoutEvent(this.onRoomShout));
            k.addMessageEvent(new _Str_4953(this.onRespectNotification));
            k.addMessageEvent(new _Str_8482(this._Str_23513));
            k.addMessageEvent(new _Str_9507(this._Str_23073));
            k.addMessageEvent(new _Str_8743(this.onFloodControl));
            k.addMessageEvent(new _Str_8702(this._Str_23267));
            k.addMessageEvent(new _Str_8596(this._Str_22326));
        }

        private function onRoomChat(k:IMessageEvent):void
        {
            var _local_2:_Str_4642;
            var _local_3:IRoomSession;
            var _local_4:String;
            var _local_5:int;
            var _local_6:RoomUserShoutMessageParser;
            if (((listener) && (listener.events)))
            {
                _local_2 = (k as _Str_4642);
                if (((_local_2) && (_local_2.getParser())))
                {
                    _local_3 = listener.getSession(_xxxRoomId);
                    if (_local_3 == null)
                    {
                        return;
                    }
                    _local_4 = RoomSessionChatEvent.RSCE_CHAT_EVENT;
                    _local_5 = RoomSessionChatEvent.CHAT_TYPE_SPEAK;
                    _local_6 = _local_2.getParser();
                    if (_local_6._Str_20074 != -1)
                    {
                        _local_3._Str_20236(_local_6._Str_20074);
                    }
                    listener.events.dispatchEvent(new RoomSessionChatEvent(_local_4, _local_3, _local_6.userId, _local_6.text, _local_5, _local_6.styleId, _local_6.links));
                }
            }
        }

        private function onRespectNotification(k:IMessageEvent):void
        {
            var _local_3:IRoomSession;
            var _local_4:String;
            var _local_5:int;
            var _local_6:RoomUserData;
            var _local_7:String;
            var _local_2:_Str_4953 = (k as _Str_4953);
            if (((listener) && (listener.events)))
            {
                _local_3 = listener.getSession(_xxxRoomId);
                if (_local_3 == null)
                {
                    return;
                }
                _local_4 = RoomSessionChatEvent.RSCE_CHAT_EVENT;
                _local_5 = RoomSessionChatEvent.CHAT_TYPE_RESPECT;
                _local_6 = _local_3.userDataManager.getUserData(_local_2.userId);
                if (_local_6 == null)
                {
                    return;
                }
                _local_7 = "";
                listener.events.dispatchEvent(new RoomSessionChatEvent(_local_4, _local_3, _local_6._Str_2713, _local_7, _local_5, SystemChatStyleEnum.GENERIC));
            }
        }

        private function _Str_23513(k:_Str_8482):void
        {
            if ((((k == null) || (listener == null)) || (listener.events == null)))
            {
                return;
            }
            var _local_2:_Str_7994 = k.getParser();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:String = RoomSessionChatEvent.RSCE_CHAT_EVENT;
            var _local_5:int = RoomSessionChatEvent.CHAT_TYPE_PETRESPECT;
            if (_local_2._Str_24197())
            {
                _local_5 = RoomSessionChatEvent.CHAT_TYPE_PETTREAT;
            }
            var _local_6:RoomUserData = _local_3.userDataManager._Str_8631(_local_2._Str_6175.id);
            if (_local_6 == null)
            {
                return;
            }
            listener.events.dispatchEvent(new RoomSessionChatEvent(_local_4, _local_3, _local_6._Str_2713, "", _local_5, SystemChatStyleEnum.GENERIC));
        }

        private function _Str_23073(k:_Str_9507):void
        {
            if ((((k == null) || (listener == null)) || (listener.events == null)))
            {
                return;
            }
            var _local_2:_Str_7513 = k.getParser();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:String = RoomSessionChatEvent.RSCE_CHAT_EVENT;
            var _local_5:int = RoomSessionChatEvent.CHAT_TYPE_PETREVIVE;
            switch (_local_2._Str_25578)
            {
                case _Str_8921._Str_16984:
                    _local_5 = RoomSessionChatEvent.CHAT_TYPE_PETREVIVE;
                    break;
                case _Str_8921._Str_18768:
                    _local_5 = RoomSessionChatEvent.CHAT_TYPE_PET_REBREED_FERTILIZE;
                    break;
                case _Str_8921._Str_16171:
                    _local_5 = RoomSessionChatEvent.CHAT_TYPE_PET_SPEED_FERTILIZE;
                    break;
            }
            var _local_6:RoomUserData = _local_3.userDataManager._Str_8631(_local_2._Str_2508);
            if (_local_6 == null)
            {
                return;
            }
            var _local_7:int = -1;
            var _local_8:RoomUserData = _local_3.userDataManager.getUserData(_local_2.userId);
            if (_local_8 != null)
            {
                _local_7 = _local_8._Str_2713;
            }
            listener.events.dispatchEvent(new RoomSessionChatEvent(_local_4, _local_3, _local_6._Str_2713, "", _local_5, SystemChatStyleEnum.GENERIC, null, _local_7));
        }

        private function _Str_23267(k:_Str_8702):void
        {
            var _local_2:IRoomSession;
            if (((listener) && (listener.events)))
            {
                _local_2 = listener.getSession(_xxxRoomId);
                if (_local_2)
                {
                    listener.events.dispatchEvent(new RoomSessionChatEvent(RoomSessionChatEvent.RSCE_CHAT_EVENT, _local_2, k._Str_16798, "", RoomSessionChatEvent.CHAT_TYPE_HAND_ITEM_RECEIVED, SystemChatStyleEnum.GENERIC, null, k._Str_17975));
                }
            }
        }

        private function _Str_22326(k:_Str_8596):void
        {
            var _local_2:IRoomSession;
            if (((listener) && (listener.events)))
            {
                _local_2 = listener.getSession(_xxxRoomId);
                if (_local_2)
                {
                    listener.events.dispatchEvent(new RoomSessionChatEvent(RoomSessionChatEvent.RSCE_CHAT_EVENT, _local_2, _local_2._Str_3871, "", RoomSessionChatEvent._Str_8909, SystemChatStyleEnum.GENERIC, null, k._Str_18555));
                }
            }
        }

        private function onRoomWhisper(k:IMessageEvent):void
        {
            var _local_2:_Str_4826;
            var _local_3:IRoomSession;
            var _local_4:String;
            var _local_5:int;
            var _local_6:RoomUserShoutMessageParser;
            if (((listener) && (listener.events)))
            {
                _local_2 = (k as _Str_4826);
                if (((_local_2) && (_local_2.getParser())))
                {
                    _local_3 = listener.getSession(_xxxRoomId);
                    if (_local_3 == null)
                    {
                        return;
                    }
                    _local_4 = RoomSessionChatEvent.RSCE_CHAT_EVENT;
                    _local_5 = RoomSessionChatEvent.CHAT_TYPE_WHISPER;
                    _local_6 = _local_2.getParser();
                    listener.events.dispatchEvent(new RoomSessionChatEvent(_local_4, _local_3, _local_6.userId, _local_6.text, _local_5, _local_6.styleId, _local_6.links));
                }
            }
        }

        private function onRoomShout(k:IMessageEvent):void
        {
            var _local_2:RoomUserShoutEvent;
            var _local_3:IRoomSession;
            var _local_4:String;
            var _local_5:int;
            var _local_6:RoomUserShoutMessageParser;
            if (((listener) && (listener.events)))
            {
                _local_2 = (k as RoomUserShoutEvent);
                if (((_local_2) && (_local_2.getParser())))
                {
                    _local_3 = listener.getSession(_xxxRoomId);
                    if (_local_3 == null)
                    {
                        return;
                    }
                    _local_4 = RoomSessionChatEvent.RSCE_CHAT_EVENT;
                    _local_5 = RoomSessionChatEvent.CHAT_TYPE_SHOUT;
                    _local_6 = _local_2.getParser();
                    listener.events.dispatchEvent(new RoomSessionChatEvent(_local_4, _local_3, _local_6.userId, _local_6.text, _local_5, _local_6.styleId, _local_6.links));
                }
            }
        }

        private function onFloodControl(k:IMessageEvent):void
        {
            var _local_2:_Str_6399;
            var _local_3:IRoomSession;
            var _local_4:int;
            if (((listener) && (listener.events)))
            {
                _local_2 = (k as _Str_8743).getParser();
                _local_3 = listener.getSession(_xxxRoomId);
                if (_local_3 == null)
                {
                    return;
                }
                _local_4 = _local_2.seconds;
                Logger.log((("received flood control event for " + _local_4) + " seconds"));
                listener.events.dispatchEvent(new RoomSessionChatEvent(RoomSessionChatEvent.RSCE_FLOOD_EVENT, _local_3, -1, ("" + _local_4), 0, 0, null));
            }
        }
    }
}
