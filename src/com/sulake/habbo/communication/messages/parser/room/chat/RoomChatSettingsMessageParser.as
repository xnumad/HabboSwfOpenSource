package com.sulake.habbo.communication.messages.parser.room.chat
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomChatSettingsParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomChatSettingsMessageParser implements IMessageParser 
    {
        private var _chatSettings:RoomChatSettingsParser;


        public function flush():Boolean
        {
            this._chatSettings = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._chatSettings = new RoomChatSettingsParser(k);
            return true;
        }

        public function get chatSettings():RoomChatSettingsParser
        {
            return this._chatSettings;
        }
    }
}
