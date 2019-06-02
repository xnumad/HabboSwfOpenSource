//com.sulake.habbo.communication.messages.incoming.users.HabboGroupJoinFailedMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class HabboGroupJoinFailedMessageEvent extends MessageEvent implements IMessageEvent {

        public function HabboGroupJoinFailedMessageEvent(k:Function);

        public function get reason():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

