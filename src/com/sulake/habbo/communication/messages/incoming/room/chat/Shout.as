package com.sulake.habbo.communication.messages.incoming.room.chat
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat.RoomUserShoutMessageParser;

    public class Shout extends MessageEvent 
    {
        public function Shout(k:Function)
        {
            super(k, RoomUserShoutMessageParser);
        }

        public function getParser():RoomUserShoutMessageParser
        {
            return _parser as RoomUserShoutMessageParser;
        }
    }
}
