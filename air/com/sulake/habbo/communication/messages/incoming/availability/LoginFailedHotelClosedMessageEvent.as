//com.sulake.habbo.communication.messages.incoming.availability.LoginFailedHotelClosedMessageEvent

package com.sulake.habbo.communication.messages.incoming.availability{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.availability.LoginFailedHotelClosedMessageParser;

    [SecureSWF(rename="true")]
    public class LoginFailedHotelClosedMessageEvent extends MessageEvent implements IMessageEvent {

        public function LoginFailedHotelClosedMessageEvent(k:Function);

        public function getParser():LoginFailedHotelClosedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.availability

