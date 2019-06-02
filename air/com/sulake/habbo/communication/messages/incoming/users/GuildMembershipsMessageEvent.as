//com.sulake.habbo.communication.messages.incoming.users.GuildMembershipsMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class GuildMembershipsMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuildMembershipsMessageEvent(k:Function);

        public function get guilds():Array;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

