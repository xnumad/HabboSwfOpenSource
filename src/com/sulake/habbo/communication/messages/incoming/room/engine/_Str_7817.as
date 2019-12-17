package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.UserUpdateMessageParser;

    public class _Str_7817 extends MessageEvent 
    {
        public function _Str_7817(k:Function)
        {
            super(k, UserUpdateMessageParser);
        }

        public function getParser():UserUpdateMessageParser
        {
            return _parser as UserUpdateMessageParser;
        }
    }
}
