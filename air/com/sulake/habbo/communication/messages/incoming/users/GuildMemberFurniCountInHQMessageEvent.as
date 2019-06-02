//com.sulake.habbo.communication.messages.incoming.users.GuildMemberFurniCountInHQMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class GuildMemberFurniCountInHQMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuildMemberFurniCountInHQMessageEvent(k:Function);

        public function userId():int;

        public function furniCount():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

