//com.sulake.habbo.communication.messages.incoming.availability.InfoHotelClosedMessageEvent

package com.sulake.habbo.communication.messages.incoming.availability{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.availability.InfoHotelClosedMessageParser;

    [SecureSWF(rename="true")]
    public class InfoHotelClosedMessageEvent extends MessageEvent implements IMessageEvent {

        public function InfoHotelClosedMessageEvent(k:Function);

        public function getParser():InfoHotelClosedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.availability

