//com.sulake.habbo.communication.messages.incoming.users.GuildCreationInfoMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class GuildCreationInfoMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuildCreationInfoMessageEvent(k:Function);

        public function get data():GuildCreationData;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

