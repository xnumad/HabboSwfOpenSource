//com.sulake.habbo.communication.messages.incoming.users.HabboGroupBadgesMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.utils.Map;

    [SecureSWF(rename="true")]
    public class HabboGroupBadgesMessageEvent extends MessageEvent implements IMessageEvent {

        public function HabboGroupBadgesMessageEvent(k:Function);

        public function get badges():Map;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

