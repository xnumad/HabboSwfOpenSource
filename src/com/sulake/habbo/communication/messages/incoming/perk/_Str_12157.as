package com.sulake.habbo.communication.messages.incoming.perk
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.perk.CitizenshipVipOfferPromoEnabledMessageParser;

    public class _Str_12157 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_12157(k:Function)
        {
            super(k, CitizenshipVipOfferPromoEnabledMessageParser);
        }

        public function getParser():CitizenshipVipOfferPromoEnabledMessageParser
        {
            return _parser as CitizenshipVipOfferPromoEnabledMessageParser;
        }
    }
}
