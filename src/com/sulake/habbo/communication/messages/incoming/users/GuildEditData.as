package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildEditData implements IGuildData
    {
        private var _ownedRooms:Array;
        private var _isOwner:Boolean;
        private var _groupId:int;
        private var _groupName:String;
        private var _groupDesc:String;
        private var _baseRoomId:int;
        private var _primaryColorId:int;
        private var _secondaryColorId:int;
        private var _locked:Boolean;
        private var _url:String;
        private var _guildType:int;
        private var _guildRightsLevel:int;
        private var _badgeSettings:Array;
        private var _badgeCode:String;
        private var _membershipCount:int;

        public function GuildEditData(k:IMessageDataWrapper)
        {
            var _local_2:int;
            var _local_3:int;
            super();
            this._ownedRooms = new Array();
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._ownedRooms.push(new RoomEntryData(k.readInteger(), k.readString(), k.readBoolean()));
                _local_2++;
            }
            this._isOwner = k.readBoolean();
            this._groupId = k.readInteger();
            this._groupName = k.readString();
            this._groupDesc = k.readString();
            this._baseRoomId = k.readInteger();
            this._primaryColorId = k.readInteger();
            this._secondaryColorId = k.readInteger();
            this._guildType = k.readInteger();
            this._guildRightsLevel = k.readInteger();
            this._locked = k.readBoolean();
            this._url = k.readString();
            this._badgeSettings = new Array();
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._badgeSettings.push(new GuildBadgeSettings(k));
                _local_2++;
            }
            this._badgeCode = k.readString();
            this._membershipCount = k.readInteger();
        }

        public function get ownedRooms():Array
        {
            return this._ownedRooms;
        }

        public function get exists():Boolean
        {
            return true;
        }

        public function get isOwner():Boolean
        {
            return this._isOwner;
        }

        public function get groupId():int
        {
            return this._groupId;
        }

        public function get groupName():String
        {
            return this._groupName;
        }

        public function get groupDesc():String
        {
            return this._groupDesc;
        }

        public function get baseRoomId():int
        {
            return this._baseRoomId;
        }

        public function get primaryColorId():int
        {
            return this._primaryColorId;
        }

        public function get secondaryColorId():int
        {
            return this._secondaryColorId;
        }

        public function get badgeSettings():Array
        {
            return this._badgeSettings;
        }

        public function get locked():Boolean
        {
            return this._locked;
        }

        public function get url():String
        {
            return this._url;
        }

        public function get guildType():int
        {
            return this._guildType;
        }

        public function get guildRightsLevel():int
        {
            return this._guildRightsLevel;
        }

        public function get badgeCode():String
        {
            return this._badgeCode;
        }

        public function get membershipCount():int
        {
            return this._membershipCount;
        }
    }
}
