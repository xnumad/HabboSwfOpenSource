package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildCreationData implements IGuildData
    {
        private var _costInCredits:int;
        private var _ownedRooms:Array;
        private var _badgeSettings:Array;

        public function GuildCreationData(k:IMessageDataWrapper)
        {
            var _local_2:int;
            var _local_3:int;
            super();
            this._costInCredits = k.readInteger();
            this._ownedRooms = new Array();
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._ownedRooms.push(new RoomEntryData(k.readInteger(), k.readString(), k.readBoolean()));
                _local_2++;
            }
            _local_3 = k.readInteger();
            this._badgeSettings = new Array();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._badgeSettings.push(new GuildBadgeSettings(k));
                _local_2++;
            }
        }

        public function get costInCredits():int
        {
            return this._costInCredits;
        }

        public function get ownedRooms():Array
        {
            return this._ownedRooms;
        }

        public function get exists():Boolean
        {
            return false;
        }

        public function get isOwner():Boolean
        {
            return true;
        }

        public function get groupId():int
        {
            return 0;
        }

        public function get groupName():String
        {
            return "";
        }

        public function get groupDesc():String
        {
            return "";
        }

        public function get baseRoomId():int
        {
            return 0;
        }

        public function get primaryColorId():int
        {
            return 0;
        }

        public function get secondaryColorId():int
        {
            return 0;
        }

        public function get badgeSettings():Array
        {
            return this._badgeSettings;
        }

        public function get locked():Boolean
        {
            return false;
        }

        public function get url():String
        {
            return "";
        }

        public function get guildType():int
        {
            return 0;
        }

        public function get guildRightsLevel():int
        {
            return 0;
        }

        public function get badgeCode():String
        {
            return "";
        }

        public function get membershipCount():int
        {
            return 0;
        }
    }
}
