package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectsDataUpdateMessageParser;

    public class _Str_8080 extends MessageEvent 
    {
        public function _Str_8080(k:Function)
        {
            super(k, ObjectsDataUpdateMessageParser);
        }

        public function getParser():ObjectsDataUpdateMessageParser
        {
            return _parser as ObjectsDataUpdateMessageParser;
        }
    }
}
