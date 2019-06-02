//com.sulake.habbo.communication.messages.incoming.notifications.NotificationDialogMessageEvent

package com.sulake.habbo.communication.messages.incoming.notifications{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.NotificationDialogMessageParser;

    [SecureSWF(rename="true")]
    public class NotificationDialogMessageEvent extends MessageEvent implements IMessageEvent {

        public function NotificationDialogMessageEvent(k:Function);

        public function getParser():NotificationDialogMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.notifications

