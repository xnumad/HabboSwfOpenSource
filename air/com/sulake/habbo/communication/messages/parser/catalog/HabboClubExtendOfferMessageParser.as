//com.sulake.habbo.communication.messages.parser.catalog.HabboClubExtendOfferMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.ClubOfferExtendData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class HabboClubExtendOfferMessageParser implements IMessageParser {

        private var _offer:ClubOfferExtendData;

        public function HabboClubExtendOfferMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function offer():ClubOfferExtendData;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

