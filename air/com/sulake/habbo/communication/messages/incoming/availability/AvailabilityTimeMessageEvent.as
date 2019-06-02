//com.sulake.habbo.communication.messages.incoming.availability.AvailabilityTimeMessageEvent

package com.sulake.habbo.communication.messages.incoming.availability{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.availability.AvailabilityTimeMessageParser;

    [SecureSWF(rename="true")]
    public class AvailabilityTimeMessageEvent extends MessageEvent implements IMessageEvent {

        public function AvailabilityTimeMessageEvent(k:Function);

        public function getParser():AvailabilityTimeMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.availability

