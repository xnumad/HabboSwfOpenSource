package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildEditData implements _Str_5716
    {
        private var _ownedRooms:Array;
        private var _isOwner:Boolean;
        private var _groupId:int;
        private var _groupName:String;
        private var _Str_21722:String;
        private var _baseRoomId:int;
        private var _Str_21311:int;
        private var _Str_19050:int;
        private var _locked:Boolean;
        private var _url:String;
        private var _Str_8166:int;
        private var _Str_21056:int;
        private var _badgeSettings:Array;
        private var _Str_2722:String;
        private var _Str_19172:int;

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
                this._ownedRooms.push(new _Str_2866(k.readInteger(), k.readString(), k.readBoolean()));
                _local_2++;
            }
            this._isOwner = k.readBoolean();
            this._groupId = k.readInteger();
            this._groupName = k.readString();
            this._Str_21722 = k.readString();
            this._baseRoomId = k.readInteger();
            this._Str_21311 = k.readInteger();
            this._Str_19050 = k.readInteger();
            this._Str_8166 = k.readInteger();
            this._Str_21056 = k.readInteger();
            this._locked = k.readBoolean();
            this._url = k.readString();
            this._badgeSettings = new Array();
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._badgeSettings.push(new _Str_5965(k));
                _local_2++;
            }
            this._Str_2722 = k.readString();
            this._Str_19172 = k.readInteger();
        }

        public function get _Str_6848():Array
        {
            return this._ownedRooms;
        }

        public function get _Str_2811():Boolean
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

        public function get _Str_17501():String
        {
            return this._Str_21722;
        }

        public function get baseRoomId():int
        {
            return this._baseRoomId;
        }

        public function get _Str_7342():int
        {
            return this._Str_21311;
        }

        public function get _Str_7590():int
        {
            return this._Str_19050;
        }

        public function get _Str_6089():Array
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

        public function get _Str_4830():int
        {
            return this._Str_8166;
        }

        public function get _Str_17566():int
        {
            return this._Str_21056;
        }

        public function get badgeCode():String
        {
            return this._Str_2722;
        }

        public function get _Str_16539():int
        {
            return this._Str_19172;
        }
    }
}
