//com.sulake.habbo.communication.messages.incoming.users.HabboUserBadgesMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class HabboUserBadgesMessageEvent extends MessageEvent implements IMessageEvent {

        public function HabboUserBadgesMessageEvent(k:Function);

        public function get badges():Array;

        public function get userId():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

