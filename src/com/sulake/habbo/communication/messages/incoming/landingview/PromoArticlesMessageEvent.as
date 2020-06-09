package com.sulake.habbo.communication.messages.incoming.landingview
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.landingview.PromoArticlesMessageParser;

    public class PromoArticlesMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function PromoArticlesMessageEvent(k:Function)
        {
            super(k, PromoArticlesMessageParser);
        }

        public function getParser():PromoArticlesMessageParser
        {
            return _parser as PromoArticlesMessageParser;
        }
    }
}
