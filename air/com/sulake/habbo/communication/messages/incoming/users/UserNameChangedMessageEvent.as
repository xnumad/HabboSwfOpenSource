//com.sulake.habbo.communication.messages.incoming.users.UserNameChangedMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.UserNameChangedMessageParser;

    [SecureSWF(rename="true")]
    public class UserNameChangedMessageEvent extends MessageEvent implements IMessageEvent {

        public function UserNameChangedMessageEvent(k:Function);

        public function getParser():UserNameChangedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

