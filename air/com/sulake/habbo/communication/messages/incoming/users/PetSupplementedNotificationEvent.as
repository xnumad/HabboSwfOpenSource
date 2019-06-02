//com.sulake.habbo.communication.messages.incoming.users.PetSupplementedNotificationEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.PetSupplementedNotificationParser;

    public class PetSupplementedNotificationEvent extends MessageEvent implements IMessageEvent {

        public function PetSupplementedNotificationEvent(k:Function);

        public function getParser():PetSupplementedNotificationParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

