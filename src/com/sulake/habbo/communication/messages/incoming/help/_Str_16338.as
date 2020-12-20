package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.FaqSearchResultsMessageParser;

    public class _Str_16338 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_16338(k:Function)
        {
            super(k, FaqSearchResultsMessageParser);
        }

        public function getParser():FaqSearchResultsMessageParser
        {
            return _parser as FaqSearchResultsMessageParser;
        }
    }
}
