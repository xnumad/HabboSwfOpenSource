package com.sulake.habbo.communication.messages.incoming.room.chat
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat.RoomUserShoutMessageParser;

    public class _Str_4826 extends MessageEvent 
    {
        public function _Str_4826(k:Function)
        {
            super(k, RoomUserShoutMessageParser);
        }

        public function getParser():RoomUserShoutMessageParser
        {
            return _parser as RoomUserShoutMessageParser;
        }
    }
}
