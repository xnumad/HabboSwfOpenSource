//com.sulake.habbo.communication.messages.incoming.room.chat.ShoutMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.chat{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat.ChatMessageParser;

    [SecureSWF(rename="true")]
    public class ShoutMessageEvent extends MessageEvent {

        public function ShoutMessageEvent(k:Function);

        public function getParser():ChatMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.chat

