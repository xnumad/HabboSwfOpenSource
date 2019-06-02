//com.sulake.habbo.communication.messages.incoming.notifications.ClubGiftNotificationEvent

package com.sulake.habbo.communication.messages.incoming.notifications{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.ClubGiftNotificationParser;

    [SecureSWF(rename="true")]
    public class ClubGiftNotificationEvent extends MessageEvent implements IMessageEvent {

        public function ClubGiftNotificationEvent(k:Function);

        public function getParser():ClubGiftNotificationParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.notifications

