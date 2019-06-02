//com.sulake.habbo.communication.messages.incoming.notifications.ActivityPointsMessageEvent

package com.sulake.habbo.communication.messages.incoming.notifications{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import flash.utils.Dictionary;

    [SecureSWF(rename="true")]
    public class ActivityPointsMessageEvent extends MessageEvent implements IMessageEvent {

        public function ActivityPointsMessageEvent(k:Function);

        public function get points():Dictionary;


    }
}//package com.sulake.habbo.communication.messages.incoming.notifications

