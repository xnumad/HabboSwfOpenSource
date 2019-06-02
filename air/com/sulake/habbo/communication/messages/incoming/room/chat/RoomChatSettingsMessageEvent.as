//com.sulake.habbo.communication.messages.incoming.room.chat.RoomChatSettingsMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.chat{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat.RoomChatSettingsMessageParser;

    [SecureSWF(rename="true")]
    public class RoomChatSettingsMessageEvent extends MessageEvent {

        public function RoomChatSettingsMessageEvent(k:Function);

        public function getParser():RoomChatSettingsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.chat

