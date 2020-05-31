package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectUpdateMessageParser;

    public class _Str_7527 extends MessageEvent 
    {
        public function _Str_7527(k:Function)
        {
            super(k, ObjectUpdateMessageParser);
        }

        public function getParser():ObjectUpdateMessageParser
        {
            return _parser as ObjectUpdateMessageParser;
        }
    }
}
