//com.sulake.habbo.communication.messages.incoming.users.GuildMembershipUpdatedMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class GuildMembershipUpdatedMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuildMembershipUpdatedMessageEvent(k:Function);

        public function get data():MemberData;

        public function get guildId():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

