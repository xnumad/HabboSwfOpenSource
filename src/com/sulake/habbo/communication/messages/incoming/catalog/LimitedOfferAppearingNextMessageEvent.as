package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.LimitedOfferAppearingNextMessageParser;

    public class LimitedOfferAppearingNextMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function LimitedOfferAppearingNextMessageEvent(k:Function)
        {
            super(k, LimitedOfferAppearingNextMessageParser);
        }

        public function getParser():LimitedOfferAppearingNextMessageParser
        {
            return this._parser as LimitedOfferAppearingNextMessageParser;
        }
    }
}
