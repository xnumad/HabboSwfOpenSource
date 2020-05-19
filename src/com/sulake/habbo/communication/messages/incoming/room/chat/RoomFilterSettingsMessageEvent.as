package com.sulake.habbo.communication.messages.incoming.room.chat
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat.RoomFilterSettingsMessageParser;

    public class RoomFilterSettingsMessageEvent extends MessageEvent 
    {
        public function RoomFilterSettingsMessageEvent(k:Function)
        {
            super(k, RoomFilterSettingsMessageParser);
        }

        public function getParser():RoomFilterSettingsMessageParser
        {
            return _parser as RoomFilterSettingsMessageParser;
        }
    }
}
