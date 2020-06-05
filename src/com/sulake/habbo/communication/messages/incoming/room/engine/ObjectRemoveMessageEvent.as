package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectRemoveMessageParser;

    public class ObjectRemoveMessageEvent extends MessageEvent
    {
        public function ObjectRemoveMessageEvent(k:Function)
        {
            super(k, ObjectRemoveMessageParser);
        }

        public function getParser():ObjectRemoveMessageParser
        {
            return _parser as ObjectRemoveMessageParser;
        }
    }
}
