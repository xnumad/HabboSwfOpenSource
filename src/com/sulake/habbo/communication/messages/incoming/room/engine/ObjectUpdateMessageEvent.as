package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectUpdateMessageParser;

    public class ObjectUpdateMessageEvent extends MessageEvent
    {
        public function ObjectUpdateMessageEvent(k:Function)
        {
            super(k, ObjectUpdateMessageParser);
        }

        public function getParser():ObjectUpdateMessageParser
        {
            return _parser as ObjectUpdateMessageParser;
        }
    }
}
