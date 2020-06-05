package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectsDataUpdateMessageParser;

    public class ObjectsDataUpdateMessageEvent extends MessageEvent
    {
        public function ObjectsDataUpdateMessageEvent(k:Function)
        {
            super(k, ObjectsDataUpdateMessageParser);
        }

        public function getParser():ObjectsDataUpdateMessageParser
        {
            return _parser as ObjectsDataUpdateMessageParser;
        }
    }
}
