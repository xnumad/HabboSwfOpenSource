package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomModerationSettings;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomChatSettings;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GetGuestRoomResultMessageParser implements IMessageParser, IDisposable
    {
        private var _enterRoom:Boolean;
        private var _roomForward:Boolean;
        private var _staffPick:Boolean;
        private var _data:GuestRoomData;
        private var _isGroupMember:Boolean;
        private var _roomModerationSettings:RoomModerationSettings;
        private var _chatSettings:RoomChatSettings;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._enterRoom = k.readBoolean();
            this._data = new GuestRoomData(k);
            this._roomForward = k.readBoolean();
            this._staffPick = k.readBoolean();
            this._isGroupMember = k.readBoolean();
            var _local_2:Boolean = k.readBoolean();
            this._roomModerationSettings = new RoomModerationSettings(k);
            this._data.allInRoomMuted = _local_2;
            this._data.canMute = k.readBoolean();
            this._chatSettings = new RoomChatSettings(k);
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

        public function get data():GuestRoomData
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

        public function get roomModerationSettings():RoomModerationSettings
        {
            return this._roomModerationSettings;
        }

        public function get chatSettings():RoomChatSettings
        {
            return this._chatSettings;
        }
    }
}
