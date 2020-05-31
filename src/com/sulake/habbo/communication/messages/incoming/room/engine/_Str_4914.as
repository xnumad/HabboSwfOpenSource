package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.UserRemoveMessageParser;

    public class _Str_4914 extends MessageEvent 
    {
        public function _Str_4914(k:Function)
        {
            super(k, UserRemoveMessageParser);
        }

        public function getParser():UserRemoveMessageParser
        {
            return _parser as UserRemoveMessageParser;
        }
    }
}
