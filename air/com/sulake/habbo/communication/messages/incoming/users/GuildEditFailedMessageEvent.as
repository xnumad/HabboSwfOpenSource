//com.sulake.habbo.communication.messages.incoming.users.GuildEditFailedMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class GuildEditFailedMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuildEditFailedMessageEvent(k:Function);

        public function get reason():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

