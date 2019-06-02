//com.sulake.habbo.communication.messages.incoming.catalog.HabboClubExtendOfferMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.HabboClubExtendOfferMessageParser;

    [SecureSWF(rename="true")]
    public class HabboClubExtendOfferMessageEvent extends MessageEvent implements IMessageEvent {

        public function HabboClubExtendOfferMessageEvent(k:Function);

        public function getParser():HabboClubExtendOfferMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

