//com.sulake.habbo.communication.messages.incoming.users.GuildEditorDataMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class GuildEditorDataMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuildEditorDataMessageEvent(k:Function);

        public function get data():GuildEditorData;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

