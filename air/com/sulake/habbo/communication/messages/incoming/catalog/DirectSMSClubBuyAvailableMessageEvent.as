//com.sulake.habbo.communication.messages.incoming.catalog.DirectSMSClubBuyAvailableMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.DirectSMSClubBuyAvailableMessageParser;

    [SecureSWF(rename="true")]
    public class DirectSMSClubBuyAvailableMessageEvent extends MessageEvent implements IMessageEvent {

        public function DirectSMSClubBuyAvailableMessageEvent(k:Function);

        public function getParser():DirectSMSClubBuyAvailableMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

