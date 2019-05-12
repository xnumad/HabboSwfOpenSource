package com.sulake.habbo.friendbar.data
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class FriendEntity implements IFriendEntity 
    {
        private static var _Str_12131:int = 0;

        private var _id:int;
        private var _name:String;
        private var _gender:int;
        private var _online:Boolean;
        private var _allowFollow:Boolean;
        private var _figure:String;
        private var _categoryId:int;
        private var _motto:String;
        private var _lastAccess:String;
        private var _realName:String;
        private var _notifications:Vector.<IFriendNotification>;
        private var _logEventId:int = -1;

        public function FriendEntity(k:int, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:int, _arg_6:Boolean, _arg_7:Boolean, _arg_8:String, _arg_9:int, _arg_10:String)
        {
            this._id = k;
            this._name = _arg_2;
            this._realName = _arg_3;
            this._motto = _arg_4;
            this._gender = _arg_5;
            this._online = _arg_6;
            this._allowFollow = _arg_7;
            this._figure = _arg_8;
            this._categoryId = _arg_9;
            this._lastAccess = _arg_10;
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

        public function get allowFollow():Boolean
        {
            return this._allowFollow;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get _Str_2712():int
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

        public function get logEventId():int
        {
            return this._logEventId;
        }

        public function get notifications():Vector.<IFriendNotification>
        {
            if (!this._notifications)
            {
                this._notifications = new Vector.<IFriendNotification>();
            }
            return this._notifications;
        }

        public function set name(k:String):void
        {
            this._name = k;
        }

        public function set gender(k:int):void
        {
            this._gender = k;
        }

        public function set online(k:Boolean):void
        {
            this._online = k;
        }

        public function set allowFollow(k:Boolean):void
        {
            this._allowFollow = k;
        }

        public function set figure(k:String):void
        {
            this._figure = k;
        }

        public function set _Str_2712(k:int):void
        {
            this._categoryId = k;
        }

        public function set motto(k:String):void
        {
            this._motto = k;
        }

        public function set _Str_5261(k:String):void
        {
            this._lastAccess = k;
        }

        public function set realName(k:String):void
        {
            this._realName = k;
        }

        public function set logEventId(k:int):void
        {
            this._logEventId = k;
        }

        public function _Str_20577():int
        {
            return ++_Str_12131;
        }
    }
}
