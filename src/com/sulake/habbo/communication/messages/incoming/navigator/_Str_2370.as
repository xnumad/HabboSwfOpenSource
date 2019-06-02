package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_2370 implements IDisposable 
    {
        private const THUMBNAIL_BITMASK:int = 1;
        private const GROUPDATA_BITMASK:int = 2;
        private const ROOMAD_BITMASK:int = 4;
        private const SHOWOWNER_BITMASK:int = 8;
        private const ALLOWPETS_BITMASK:int = 16;
        private const DISPLAYROOMENTRYAD_BITMASK:int = 32;

        private var _flatId:int;
        private var _roomName:String;
        private var _showOwner:Boolean;
        private var _ownerId:int;
        private var _ownerName:String;
        private var _doorMode:int;
        private var _userCount:int;
        private var _maxUserCount:int;
        private var _description:String;
        private var _tradeMode:int;
        private var _score:int;
        private var _ranking:int;
        private var _categoryId:int;
        private var _nStars:int;
        private var _habboGroupId:int = 0;
        private var _groupName:String = "";
        private var _groupBadgeCode:String = "";
        private var _tags:Array;
        private var _thumbnail:_Str_5224;
        private var _allowPets:Boolean;
        private var _displayRoomEntryAd:Boolean;
        private var _roomAdName:String = "";
        private var _roomAdDescription:String = "";
        private var _roomAdExpiresInMin:int = 0;
        private var _allInRoomMuted:Boolean;
        private var _canMute:Boolean;
        private var _disposed:Boolean;
        private var _officialRoomPicRef:String = null;

        public function _Str_2370(k:IMessageDataWrapper)
        {
            var _local_5:String;
            this._tags = new Array();
            super();
            this._flatId = k.readInteger();
            this._roomName = k.readString();
            this._ownerId = k.readInteger();
            this._ownerName = k.readString();
            this._doorMode = k.readInteger();
            this._userCount = k.readInteger();
            this._maxUserCount = k.readInteger();
            this._description = k.readString();
            this._tradeMode = k.readInteger();
            this._score = k.readInteger();
            this._ranking = k.readInteger();
            this._categoryId = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_5 = k.readString();
                this._tags.push(_local_5);
                _local_3++;
            }
            var _local_4:int = k.readInteger();
            if ((_local_4 & this.THUMBNAIL_BITMASK) > 0)
            {
                this._officialRoomPicRef = k.readString();
            }
            if ((_local_4 & this.GROUPDATA_BITMASK) > 0)
            {
                this._habboGroupId = k.readInteger();
                this._groupName = k.readString();
                this._groupBadgeCode = k.readString();
            }
            if ((_local_4 & this.ROOMAD_BITMASK) > 0)
            {
                this._roomAdName = k.readString();
                this._roomAdDescription = k.readString();
                this._roomAdExpiresInMin = k.readInteger();
            }
            this._showOwner = ((_local_4 & this.SHOWOWNER_BITMASK) > 0);
            this._allowPets = ((_local_4 & this.ALLOWPETS_BITMASK) > 0);
            this._displayRoomEntryAd = ((_local_4 & this.DISPLAYROOMENTRYAD_BITMASK) > 0);
            this._thumbnail = new _Str_5224(null);
            this._thumbnail.setDefaults();
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            this._tags = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get flatId():int
        {
            return this._flatId;
        }

        public function get roomName():String
        {
            return this._roomName;
        }

        public function get _Str_6938():Boolean
        {
            return this._showOwner;
        }

        public function get ownerId():int
        {
            return this._ownerId;
        }

        public function get ownerName():String
        {
            return this._ownerName;
        }

        public function get _Str_2738():int
        {
            return this._doorMode;
        }

        public function get userCount():int
        {
            return this._userCount;
        }

        public function get _Str_9029():int
        {
            return this._maxUserCount;
        }

        public function get description():String
        {
            return this._description;
        }

        public function get _Str_3827():int
        {
            return this._tradeMode;
        }

        public function get score():int
        {
            return this._score;
        }

        public function get ranking():int
        {
            return this._ranking;
        }

        public function get _Str_2712():int
        {
            return this._categoryId;
        }

        public function get habboGroupId():int
        {
            return this._habboGroupId;
        }

        public function get groupName():String
        {
            return this._groupName;
        }

        public function get _Str_7146():String
        {
            return this._groupBadgeCode;
        }

        public function get tags():Array
        {
            return this._tags;
        }

        public function get thumbnail():_Str_5224
        {
            return this._thumbnail;
        }

        public function get _Str_5667():Boolean
        {
            return this._allowPets;
        }

        public function get _Str_24051():Boolean
        {
            return this._displayRoomEntryAd;
        }

        public function get _Str_8163():String
        {
            return this._roomAdName;
        }

        public function get _Str_22089():String
        {
            return this._roomAdDescription;
        }

        public function get _Str_15104():int
        {
            return this._roomAdExpiresInMin;
        }

        public function get _Str_12127():Boolean
        {
            return this._allInRoomMuted;
        }

        public function get officialRoomPicRef():String
        {
            return this._officialRoomPicRef;
        }

        public function set _Str_12127(k:Boolean):void
        {
            this._allInRoomMuted = k;
        }

        public function set roomName(k:String):void
        {
            this._roomName = k;
        }

        public function get _Str_16504():Boolean
        {
            return this._canMute;
        }

        public function set _Str_16504(k:Boolean):void
        {
            this._canMute = k;
        }
    }
}
