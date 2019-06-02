//com.sulake.habbo.communication.messages.incoming.availability.AvailabilityStatusMessageEvent

package com.sulake.habbo.communication.messages.incoming.availability{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.availability.AvailabilityStatusMessageParser;

    [SecureSWF(rename="true")]
    public class AvailabilityStatusMessageEvent extends MessageEvent implements IMessageEvent {

        public function AvailabilityStatusMessageEvent(k:Function);

        public function getParser():AvailabilityStatusMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.availability

