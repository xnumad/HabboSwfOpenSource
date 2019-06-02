//com.sulake.habbo.communication.messages.incoming.users.RespectNotificationMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class RespectNotificationMessageEvent extends MessageEvent implements IMessageEvent {

        public function RespectNotificationMessageEvent(k:Function);

        public function get userId():int;

        public function get respectTotal():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

