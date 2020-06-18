package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FriendParser 
    {
        private var _id:int;
        private var _name:String;
        private var _gender:int;
        private var _online:Boolean;
        private var _followingAllowed:Boolean;
        private var _figure:String;
        private var _categoryId:int;
        private var _motto:String;
        private var _lastAccess:String;
        private var _realName:String;
        private var _facebookId:String;
        private var _Str_9637:Boolean;
        private var _Str_9279:Boolean;
        private var _pocketHabboUser:Boolean;
        private var _Str_11104:int;

        public function FriendParser(k:IMessageDataWrapper)
        {
            this._id = k.readInteger();
            this._name = k.readString();
            this._gender = k.readInteger();
            this._online = k.readBoolean();
            this._followingAllowed = k.readBoolean();
            this._figure = k.readString();
            this._categoryId = k.readInteger();
            this._motto = k.readString();
            this._realName = k.readString();
            this._facebookId = k.readString();
            this._Str_9637 = k.readBoolean();
            this._Str_9279 = k.readBoolean();
            this._pocketHabboUser = k.readBoolean();
            this._Str_11104 = k.readShort();
        }

        public function get id():int
        {
            return this._id;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get gender():int
        {
            return this._gender;
        }

        public function get online():Boolean
        {
            return this._online;
        }

        public function get _Str_4501():Boolean
        {
            return this._followingAllowed;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get categoryId():int
        {
            return this._categoryId;
        }

        public function get motto():String
        {
            return this._motto;
        }

        public function get _Str_5261():String
        {
            return this._lastAccess;
        }

        public function get realName():String
        {
            return this._realName;
        }

        public function get _Str_25876():String
        {
            return this._facebookId;
        }

        public function get _Str_9624():Boolean
        {
            return this._Str_9637;
        }

        public function get _Str_17677():Boolean
        {
            return this._Str_9279;
        }

        public function get pocketHabboUser():Boolean
        {
            return this._pocketHabboUser;
        }

        public function get _Str_10060():int
        {
            return this._Str_11104;
        }
    }
}
