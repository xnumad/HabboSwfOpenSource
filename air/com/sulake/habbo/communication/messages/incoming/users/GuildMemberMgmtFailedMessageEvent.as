//com.sulake.habbo.communication.messages.incoming.users.GuildMemberMgmtFailedMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class GuildMemberMgmtFailedMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuildMemberMgmtFailedMessageEvent(k:Function);

        public function get reason():int;

        public function get guildId():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

