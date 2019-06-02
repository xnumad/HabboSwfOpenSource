//com.sulake.habbo.communication.messages.incoming.moderation.UserChatlogEvent

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.UserChatlogMessageParser;

    [SecureSWF(rename="true")]
    public class UserChatlogEvent extends MessageEvent implements IMessageEvent {

        public function UserChatlogEvent(k:Function);

        public function getParser():UserChatlogMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

