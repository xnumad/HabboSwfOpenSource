//com.sulake.habbo.communication.messages.incoming.room.chat.WhisperMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.chat{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat.ChatMessageParser;

    [SecureSWF(rename="true")]
    public class WhisperMessageEvent extends MessageEvent {

        public function WhisperMessageEvent(k:Function);

        public function getParser():ChatMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.chat

