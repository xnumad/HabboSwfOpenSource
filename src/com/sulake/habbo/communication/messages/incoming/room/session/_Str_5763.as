package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.CantConnectMessageParser;

    public class _Str_5763 extends MessageEvent 
    {
        public function _Str_5763(k:Function)
        {
            super(k, CantConnectMessageParser);
        }

        public function getParser():CantConnectMessageParser
        {
            return _parser as CantConnectMessageParser;
        }
    }
}
