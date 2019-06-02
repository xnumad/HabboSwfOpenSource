//com.sulake.habbo.communication.messages.incoming.room.chat.FloodControlMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.chat{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat.FloodControlMessageParser;

    [SecureSWF(rename="true")]
    public class FloodControlMessageEvent extends MessageEvent {

        public function FloodControlMessageEvent(k:Function);

        public function getParser():FloodControlMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.chat

