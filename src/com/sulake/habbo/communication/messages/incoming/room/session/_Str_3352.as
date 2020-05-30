package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.CloseConnectionMessageParser;

    public class _Str_3352 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_3352(k:Function)
        {
            super(k, CloseConnectionMessageParser);
        }

        public function getParser():CloseConnectionMessageParser
        {
            return _parser as CloseConnectionMessageParser;
        }
    }
}
