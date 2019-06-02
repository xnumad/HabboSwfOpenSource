//com.sulake.habbo.communication.messages.incoming.notifications.InfoFeedEnableMessageEvent

package com.sulake.habbo.communication.messages.incoming.notifications{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class InfoFeedEnableMessageEvent extends MessageEvent implements IMessageEvent {

        public function InfoFeedEnableMessageEvent(k:Function);

        public function get enabled():Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.notifications

