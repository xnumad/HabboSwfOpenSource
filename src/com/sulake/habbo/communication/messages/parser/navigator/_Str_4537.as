package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_2817;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomChatSettingsParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4537 implements IMessageParser, IDisposable 
    {
        private var _enterRoom:Boolean;
        private var _roomForward:Boolean;
        private var _staffPick:Boolean;
        private var _data:_Str_2370;
        private var _isGroupMember:Boolean;
        private var _roomModerationSettings:_Str_2817;
        private var _chatSettings:RoomChatSettingsParser;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._enterRoom = k.readBoolean();
            this._data = new _Str_2370(k);
            this._roomForward = k.readBoolean();
            this._staffPick = k.readBoolean();
            this._isGroupMember = k.readBoolean();
            var _local_2:Boolean = k.readBoolean();
            this._roomModerationSettings = new _Str_2817(k);
            this._data._Str_12127 = _local_2;
            this._data._Str_16504 = k.readBoolean();
            this._chatSettings = new RoomChatSettingsParser(k);
            return true;
        }

        public function dispose():void
        {
            this._roomModerationSettings = null;
        }

        public function get disposed():Boolean
        {
            return this._roomModerationSettings == null;
        }

        public function get _Str_15487():Boolean
        {
            return this._enterRoom;
        }

        public function get data():_Str_2370
        {
            return this._data;
        }

        public function get _Str_18882():Boolean
        {
            return this._roomForward;
        }

        public function get _Str_21489():Boolean
        {
            return this._staffPick;
        }

        public function get _Str_22141():Boolean
        {
            return this._isGroupMember;
        }

        public function get _Str_4418():_Str_2817
        {
            return this._roomModerationSettings;
        }

        public function get _Str_4965():RoomChatSettingsParser
        {
            return this._chatSettings;
        }
    }
}
