//com.sulake.habbo.communication.messages.incoming.users.GuildMembershipRejectedMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GuildMembershipRejectedMessageParser;

    [SecureSWF(rename="true")]
    public class GuildMembershipRejectedMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuildMembershipRejectedMessageEvent(k:Function);

        public function getParser():GuildMembershipRejectedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

