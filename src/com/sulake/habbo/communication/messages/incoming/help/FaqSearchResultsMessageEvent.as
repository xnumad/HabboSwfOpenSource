package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.FaqSearchResultsMessageParser;

    public class FaqSearchResultsMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function FaqSearchResultsMessageEvent(k:Function)
        {
            super(k, FaqSearchResultsMessageParser);
        }

        public function getParser():FaqSearchResultsMessageParser
        {
            return _parser as FaqSearchResultsMessageParser;
        }
    }
}
