//com.sulake.habbo.communication.messages.incoming.room.chat.UserTypingMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.chat{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat.UserTypingMessageParser;

    [SecureSWF(rename="true")]
    public class UserTypingMessageEvent extends MessageEvent {

        public function UserTypingMessageEvent(k:Function);

        public function getParser():UserTypingMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.chat

