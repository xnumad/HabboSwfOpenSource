//com.sulake.habbo.communication.messages.incoming.notifications.HabboActivityPointNotificationMessageEvent

package com.sulake.habbo.communication.messages.incoming.notifications{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class HabboActivityPointNotificationMessageEvent extends MessageEvent implements IMessageEvent {

        public function HabboActivityPointNotificationMessageEvent(k:Function);

        public function get amount():int;

        public function get change():int;

        public function get type():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.notifications

