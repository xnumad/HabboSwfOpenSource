package com.sulake.habbo.communication.messages.incoming.room.chat
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat.RoomChatSettingsMessageParser;

    public class RoomChatSettingsMessageEvent extends MessageEvent 
    {
        public function RoomChatSettingsMessageEvent(k:Function)
        {
            super(k, RoomChatSettingsMessageParser);
        }

        public function getParser():RoomChatSettingsMessageParser
        {
            return _parser as RoomChatSettingsMessageParser;
        }
    }
}
