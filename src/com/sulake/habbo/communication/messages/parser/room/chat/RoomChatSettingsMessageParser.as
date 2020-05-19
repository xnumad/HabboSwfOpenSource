package com.sulake.habbo.communication.messages.parser.room.chat
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomChatSettings;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomChatSettingsMessageParser implements IMessageParser 
    {
        private var _chatSettings:RoomChatSettings;


        public function flush():Boolean
        {
            this._chatSettings = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._chatSettings = new RoomChatSettings(k);
            return true;
        }

        public function get chatSettings():RoomChatSettings
        {
            return this._chatSettings;
        }
    }
}
