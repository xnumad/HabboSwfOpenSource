package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.OpenConnectionMessageParser;

    public class _Str_5714 extends MessageEvent 
    {
        public function _Str_5714(k:Function)
        {
            super(k, OpenConnectionMessageParser);
        }

        public function getParser():OpenConnectionMessageParser
        {
            return _parser as OpenConnectionMessageParser;
        }
    }
}
