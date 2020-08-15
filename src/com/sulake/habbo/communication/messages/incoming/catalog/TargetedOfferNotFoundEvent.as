package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.TargetedOfferNotFoundParser;

    public class TargetedOfferNotFoundEvent extends MessageEvent implements IMessageEvent
    {
        public function TargetedOfferNotFoundEvent(k:Function)
        {
            super(k, TargetedOfferNotFoundParser);
        }

        public function getParser():TargetedOfferNotFoundParser
        {
            return this._parser as TargetedOfferNotFoundParser;
        }
    }
}
