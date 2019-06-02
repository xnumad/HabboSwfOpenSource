//com.sulake.habbo.communication.messages.incoming.availability.InfoHotelClosingMessageEvent

package com.sulake.habbo.communication.messages.incoming.availability{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.availability.InfoHotelClosingMessageParser;

    [SecureSWF(rename="true")]
    public class InfoHotelClosingMessageEvent extends MessageEvent implements IMessageEvent {

        public function InfoHotelClosingMessageEvent(k:Function);

        public function getParser():InfoHotelClosingMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.availability

