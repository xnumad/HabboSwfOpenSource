package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.FlatAccessDeniedMessageParser;

    public class FlatAccessDeniedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function FlatAccessDeniedMessageEvent(k:Function)
        {
            super(k, FlatAccessDeniedMessageParser);
        }

        public function getParser():FlatAccessDeniedMessageParser
        {
            return _parser as FlatAccessDeniedMessageParser;
        }
    }
}
