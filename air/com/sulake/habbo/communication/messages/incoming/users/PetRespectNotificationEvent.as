//com.sulake.habbo.communication.messages.incoming.users.PetRespectNotificationEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.PetRespectNotificationParser;

    [SecureSWF(rename="true")]
    public class PetRespectNotificationEvent extends MessageEvent implements IMessageEvent {

        public function PetRespectNotificationEvent(k:Function);

        public function getParser():PetRespectNotificationParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

