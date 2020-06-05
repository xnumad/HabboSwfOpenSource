package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectDataUpdateMessageParser;

    public class ObjectDataUpdateMessageEvent extends MessageEvent
    {
        public function ObjectDataUpdateMessageEvent(k:Function)
        {
            super(k, ObjectDataUpdateMessageParser);
        }

        public function getParser():ObjectDataUpdateMessageParser
        {
            return _parser as ObjectDataUpdateMessageParser;
        }
    }
}
