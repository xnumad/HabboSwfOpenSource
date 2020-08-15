package com.sulake.habbo.communication.messages.incoming.perk
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.perk.CitizenshipVipOfferPromoEnabledMessageParser;

    public class CitizenshipVipOfferPromoEnabledEvent extends MessageEvent implements IMessageEvent
    {
        public function CitizenshipVipOfferPromoEnabledEvent(k:Function)
        {
            super(k, CitizenshipVipOfferPromoEnabledMessageParser);
        }

        public function getParser():CitizenshipVipOfferPromoEnabledMessageParser
        {
            return _parser as CitizenshipVipOfferPromoEnabledMessageParser;
        }
    }
}
