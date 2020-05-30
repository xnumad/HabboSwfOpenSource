package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.GamePlayerValueMessageParser;

    public class _Str_7743 extends MessageEvent 
    {
        public function _Str_7743(k:Function)
        {
            super(k, GamePlayerValueMessageParser);
        }

        public function getParser():GamePlayerValueMessageParser
        {
            return _parser as GamePlayerValueMessageParser;
        }
    }
}
