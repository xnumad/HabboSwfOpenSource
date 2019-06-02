//com.sulake.habbo.communication.messages.incoming.availability.MaintenanceStatusMessageEvent

package com.sulake.habbo.communication.messages.incoming.availability{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.availability.MaintenanceStatusMessageParser;

    [SecureSWF(rename="true")]
    public class MaintenanceStatusMessageEvent extends MessageEvent implements IMessageEvent {

        public function MaintenanceStatusMessageEvent(k:Function);

        public function getParser():MaintenanceStatusMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.availability

