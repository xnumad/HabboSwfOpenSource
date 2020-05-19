package com.sulake.habbo.communication.messages.incoming.room.chat
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat.FloodControlMessageParser;

    public class FloodControlMessageEvent extends MessageEvent 
    {
        public function FloodControlMessageEvent(k:Function)
        {
            super(k, FloodControlMessageParser);
        }

        public function getParser():FloodControlMessageParser
        {
            return _parser as FloodControlMessageParser;
        }
    }
}
