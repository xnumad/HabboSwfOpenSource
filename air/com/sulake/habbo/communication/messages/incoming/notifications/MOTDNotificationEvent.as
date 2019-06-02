//com.sulake.habbo.communication.messages.incoming.notifications.MOTDNotificationEvent

package com.sulake.habbo.communication.messages.incoming.notifications{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.MOTDNotificationParser;

    [SecureSWF(rename="true")]
    public class MOTDNotificationEvent extends MessageEvent implements IMessageEvent {

        public function MOTDNotificationEvent(k:Function);

        public function getParser():MOTDNotificationParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.notifications

