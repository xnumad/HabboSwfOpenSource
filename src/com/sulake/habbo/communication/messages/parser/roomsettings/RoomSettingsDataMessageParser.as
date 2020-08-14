package com.sulake.habbo.communication.messages.parser.roomsettings
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomChatSettings;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomModerationSettings;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomSettingsDataMessageParser implements IMessageParser
    {
        private var _roomSettingsData:RoomSettingsData;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._roomSettingsData = new RoomSettingsData();
            this._roomSettingsData.roomId = k.readInteger();
            this._roomSettingsData.name = k.readString();
            this._roomSettingsData.description = k.readString();
            this._roomSettingsData.doorMode = k.readInteger();
            this._roomSettingsData.categoryId = k.readInteger();
            this._roomSettingsData.maximumVisitors = k.readInteger();
            this._roomSettingsData._Str_13128 = k.readInteger();
            this._roomSettingsData.tags = [];
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._roomSettingsData.tags.push(k.readString());
                _local_3++;
            }
            this._roomSettingsData.tradeMode = k.readInteger();
            this._roomSettingsData.allowPets = (k.readInteger() == 1);
            this._roomSettingsData.allowFoodConsume = (k.readInteger() == 1);
            this._roomSettingsData.allowWalkThrough = (k.readInteger() == 1);
            this._roomSettingsData.hideWalls = (k.readInteger() == 1);
            this._roomSettingsData.wallThickness = k.readInteger();
            this._roomSettingsData.floorThickness = k.readInteger();
            this._roomSettingsData.chatSettings = new RoomChatSettings(k);
            this._roomSettingsData._Str_17884 = k.readBoolean();
            this._roomSettingsData.roomModerationSettings = new RoomModerationSettings(k);
            return true;
        }

        public function flush():Boolean
        {
            this._roomSettingsData = null;
            return true;
        }

        public function get data():RoomSettingsData
        {
            return this._roomSettingsData;
        }
    }
}
