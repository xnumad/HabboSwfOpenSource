package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.FaqClientFaqsMessageParser;

    public class _Str_18853 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_18853(k:Function)
        {
            super(k, FaqClientFaqsMessageParser);
        }

        public function getParser():FaqClientFaqsMessageParser
        {
            return _parser as FaqClientFaqsMessageParser;
        }
    }
}
