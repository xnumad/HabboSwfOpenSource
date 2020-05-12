package com.sulake.habbo.communication.messages.incoming.room.chat
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat.RoomUserMessageParser;

    public class Chat extends MessageEvent 
    {
        public function Chat(k:Function)
        {
            super(k, RoomUserMessageParser);
        }

        public function getParser():RoomUserMessageParser
        {
            return _parser as RoomUserMessageParser;
        }
    }
}
