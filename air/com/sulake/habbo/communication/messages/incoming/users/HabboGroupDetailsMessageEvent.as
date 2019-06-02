//com.sulake.habbo.communication.messages.incoming.users.HabboGroupDetailsMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class HabboGroupDetailsMessageEvent extends MessageEvent implements IMessageEvent {

        public function HabboGroupDetailsMessageEvent(k:Function);

        public function get data():HabboGroupDetailsData;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

