package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectsMessageParser;

    public class _Str_7849 extends MessageEvent 
    {
        public function _Str_7849(k:Function)
        {
            super(k, ObjectsMessageParser);
        }

        public function getParser():ObjectsMessageParser
        {
            return _parser as ObjectsMessageParser;
        }
    }
}
