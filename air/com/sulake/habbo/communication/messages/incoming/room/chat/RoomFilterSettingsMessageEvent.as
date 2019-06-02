//com.sulake.habbo.communication.messages.incoming.room.chat.RoomFilterSettingsMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.chat{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat.RoomFilterSettingsMessageParser;

    [SecureSWF(rename="true")]
    public class RoomFilterSettingsMessageEvent extends MessageEvent {

        public function RoomFilterSettingsMessageEvent(k:Function);

        public function getParser():RoomFilterSettingsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.chat

