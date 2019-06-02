//com.sulake.habbo.communication.messages.parser.room.chat.RoomChatSettingsMessageParser

package com.sulake.habbo.communication.messages.parser.room.chat{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomChatSettings;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomChatSettingsMessageParser implements IMessageParser {

        private var _chatSettings:RoomChatSettings;

        public function RoomChatSettingsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get chatSettings():RoomChatSettings;


    }
}//package com.sulake.habbo.communication.messages.parser.room.chat

