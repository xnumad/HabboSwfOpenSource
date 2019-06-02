//com.sulake.habbo.communication.messages.incoming.room.chat.ChatMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.chat{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat.ChatMessageParser;

    [SecureSWF(rename="true")]
    public class ChatMessageEvent extends MessageEvent {

        public function ChatMessageEvent(k:Function);

        public function getParser():ChatMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.chat

