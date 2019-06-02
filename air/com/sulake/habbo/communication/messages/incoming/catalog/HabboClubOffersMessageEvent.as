//com.sulake.habbo.communication.messages.incoming.catalog.HabboClubOffersMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.HabboClubOffersMessageParser;

    [SecureSWF(rename="true")]
    public class HabboClubOffersMessageEvent extends MessageEvent implements IMessageEvent {

        public function HabboClubOffersMessageEvent(k:Function);

        public function getParser():HabboClubOffersMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

