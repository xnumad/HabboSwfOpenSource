package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectDataUpdateMessageParser;

    public class _Str_8234 extends MessageEvent 
    {
        public function _Str_8234(k:Function)
        {
            super(k, ObjectDataUpdateMessageParser);
        }

        public function getParser():ObjectDataUpdateMessageParser
        {
            return _parser as ObjectDataUpdateMessageParser;
        }
    }
}
