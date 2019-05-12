package com.sulake.habbo.communication.messages.parser.roomsettings
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomChatSettingsParser;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_2817;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4697 implements IMessageParser 
    {
        private var _roomSettingsData:RoomSettingsData;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._roomSettingsData = new RoomSettingsData();
            this._roomSettingsData.roomId = k.readInteger();
            this._roomSettingsData.name = k.readString();
            this._roomSettingsData.description = k.readString();
            this._roomSettingsData._Str_2738 = k.readInteger();
            this._roomSettingsData._Str_2712 = k.readInteger();
            this._roomSettingsData._Str_5552 = k.readInteger();
            this._roomSettingsData._Str_13128 = k.readInteger();
            this._roomSettingsData.tags = [];
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._roomSettingsData.tags.push(k.readString());
                _local_3++;
            }
            this._roomSettingsData._Str_3827 = k.readInteger();
            this._roomSettingsData._Str_5667 = (k.readInteger() == 1);
            this._roomSettingsData._Str_7595 = (k.readInteger() == 1);
            this._roomSettingsData._Str_7273 = (k.readInteger() == 1);
            this._roomSettingsData._Str_7455 = (k.readInteger() == 1);
            this._roomSettingsData._Str_5962 = k.readInteger();
            this._roomSettingsData._Str_6205 = k.readInteger();
            this._roomSettingsData._Str_4965 = new RoomChatSettingsParser(k);
            this._roomSettingsData._Str_17884 = k.readBoolean();
            this._roomSettingsData._Str_4418 = new _Str_2817(k);
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
