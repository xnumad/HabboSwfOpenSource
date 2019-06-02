//com.sulake.habbo.communication.messages.incoming.perk.CitizenshipVipOfferPromoEnabledEvent

package com.sulake.habbo.communication.messages.incoming.perk{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.perk.CitizenshipVipOfferPromoEnabledMessageParser;

    [SecureSWF(rename="true")]
    public class CitizenshipVipOfferPromoEnabledEvent extends MessageEvent implements IMessageEvent {

        public function CitizenshipVipOfferPromoEnabledEvent(k:Function);

        public function getParser():CitizenshipVipOfferPromoEnabledMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.perk

