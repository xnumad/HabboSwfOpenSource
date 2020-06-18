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
        private var _persistedMessageUser:Boolean;
        private var _vipMember:Boolean;
        private var _pocketHabboUser:Boolean;
        private var _relationshipStatus:int;

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
            this._persistedMessageUser = k.readBoolean();
            this._vipMember = k.readBoolean();
            this._pocketHabboUser = k.readBoolean();
            this._relationshipStatus = k.readShort();
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

        public function get followingAllowed():Boolean
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

        public function get lastAccess():String
        {
            return this._lastAccess;
        }

        public function get realName():String
        {
            return this._realName;
        }

        public function get facebookId():String
        {
            return this._facebookId;
        }

        public function get persistedMessageUser():Boolean
        {
            return this._persistedMessageUser;
        }

        public function get vipMember():Boolean
        {
            return this._vipMember;
        }

        public function get pocketHabboUser():Boolean
        {
            return this._pocketHabboUser;
        }

        public function get relationshipStatus():int
        {
            return this._relationshipStatus;
        }
    }
}
