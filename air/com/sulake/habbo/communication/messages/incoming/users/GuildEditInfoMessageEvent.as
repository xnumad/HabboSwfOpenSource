//com.sulake.habbo.communication.messages.incoming.users.GuildEditInfoMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class GuildEditInfoMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuildEditInfoMessageEvent(k:Function);

        public function get data():GuildEditData;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

