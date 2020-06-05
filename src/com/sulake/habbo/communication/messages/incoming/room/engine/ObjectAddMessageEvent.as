package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectAddMessageParser;

    public class ObjectAddMessageEvent extends MessageEvent
    {
        public function ObjectAddMessageEvent(k:Function)
        {
            super(k, ObjectAddMessageParser);
        }

        public function getParser():ObjectAddMessageParser
        {
            return _parser as ObjectAddMessageParser;
        }
    }
}
