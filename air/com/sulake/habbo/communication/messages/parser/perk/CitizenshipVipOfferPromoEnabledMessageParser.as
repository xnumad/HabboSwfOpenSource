//com.sulake.habbo.communication.messages.parser.perk.CitizenshipVipOfferPromoEnabledMessageParser

package com.sulake.habbo.communication.messages.parser.perk{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CitizenshipVipOfferPromoEnabledMessageParser implements IMessageParser {

        public function CitizenshipVipOfferPromoEnabledMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.perk

