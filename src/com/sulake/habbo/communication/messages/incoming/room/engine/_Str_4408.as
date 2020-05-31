package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectRemoveMessageParser;

    public class _Str_4408 extends MessageEvent 
    {
        public function _Str_4408(k:Function)
        {
            super(k, ObjectRemoveMessageParser);
        }

        public function getParser():ObjectRemoveMessageParser
        {
            return _parser as ObjectRemoveMessageParser;
        }
    }
}
