//com.sulake.habbo.communication.messages.incoming.users.GuildMembersMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class GuildMembersMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuildMembersMessageEvent(k:Function);

        public function get data():GuildMemberData;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

