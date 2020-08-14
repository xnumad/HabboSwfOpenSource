package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.TargetedOfferParser;

    public class TargetedOfferEvent extends MessageEvent implements IMessageEvent 
    {
        public function TargetedOfferEvent(k:Function)
        {
            super(k, TargetedOfferParser);
        }

        public function getParser():TargetedOfferParser
        {
            return this._parser as TargetedOfferParser;
        }
    }
}
