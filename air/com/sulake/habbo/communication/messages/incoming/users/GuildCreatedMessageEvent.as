//com.sulake.habbo.communication.messages.incoming.users.GuildCreatedMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class GuildCreatedMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuildCreatedMessageEvent(k:Function);

        public function get baseRoomId():int;

        public function get groupId():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

