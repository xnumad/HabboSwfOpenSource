//com.sulake.habbo.communication.messages.incoming.notifications.PetLevelNotificationEvent

package com.sulake.habbo.communication.messages.incoming.notifications{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.PetLevelNotificationParser;

    [SecureSWF(rename="true")]
    public class PetLevelNotificationEvent extends MessageEvent implements IMessageEvent {

        public function PetLevelNotificationEvent(k:Function);

        public function getParser():PetLevelNotificationParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.notifications

