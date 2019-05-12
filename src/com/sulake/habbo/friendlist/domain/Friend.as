package com.sulake.habbo.friendlist.domain
{
    import com.sulake.habbo.friendlist.IFriend;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendParser;

    public class Friend implements IFriend, IDisposable 
    {
        public static const _Str_1997:int = "F".charCodeAt(0);
        public static const _Str_1139:int = "M".charCodeAt(0);

        private var _id:int;
        private var _name:String;
        private var _gender:int;
        private var _online:Boolean;
        private var _followingAllowed:Boolean;
        private var _figure:String;
        private var _motto:String;
        private var _lastAccess:String;
        private var _categoryId:int;
        private var _selected:Boolean;
        private var _disposed:Boolean;
        private var _view:IWindowContainer;
        private var _face:BitmapData;
        private var _realName:String;
        private var _persistedMessageUser:Boolean;
        private var _pocketHabboUser:Boolean;
        private var _vipMember:Boolean;
        private var _relationshipStatus:int;

        public function Friend(k:FriendParser)
        {
            if (k == null)
            {
                return;
            }
            this._id = k.id;
            this._name = k.name;
            this._gender = k.gender;
            this._online = k.online;
            this._followingAllowed = ((k._Str_4501) && (k.online));
            this._figure = k.figure;
            this._motto = k.motto;
            this._lastAccess = k._Str_5261;
            this._categoryId = k._Str_2712;
            this._realName = k.realName;
            this._persistedMessageUser = k._Str_9624;
            this._vipMember = k._Str_17677;
            this._pocketHabboUser = k.pocketHabboUser;
            this._relationshipStatus = k._Str_10060;
            Logger.log(((((((((((((("Creating friend: " + this.id) + ", ") + this.name) + ", ") + this.gender) + ", ") + this.online) + ", ") + this._Str_4501) + ", ") + this.figure) + ", ") + this._Str_2712));
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            if (this._face != null)
            {
                this._face.dispose();
                this._face = null;
            }
            this._disposed = true;
            this._view = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
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

        public function get motto():String
        {
            return this._motto;
        }

        public function get _Str_5261():String
        {
            return this._lastAccess;
        }

        public function get _Str_2712():int
        {
            return this._categoryId;
        }

        public function get selected():Boolean
        {
            return this._selected;
        }

        public function get view():IWindowContainer
        {
            return this._view;
        }

        public function get face():BitmapData
        {
            return this._face;
        }

        public function get realName():String
        {
            return this._realName;
        }

        public function get _Str_9624():Boolean
        {
            return this._persistedMessageUser;
        }

        public function get pocketHabboUser():Boolean
        {
            return this._pocketHabboUser;
        }

        public function get _Str_10060():int
        {
            return this._relationshipStatus;
        }

        public function get _Str_17677():Boolean
        {
            return this._vipMember;
        }

        public function set id(k:int):void
        {
            this._id = k;
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

        public function set _Str_4501(k:Boolean):void
        {
            this._followingAllowed = k;
        }

        public function set figure(k:String):void
        {
            this._figure = k;
        }

        public function set motto(k:String):void
        {
            this._motto = k;
        }

        public function set _Str_5261(k:String):void
        {
            this._lastAccess = k;
        }

        public function set _Str_2712(k:int):void
        {
            this._categoryId = k;
        }

        public function set selected(k:Boolean):void
        {
            this._selected = k;
        }

        public function set view(k:IWindowContainer):void
        {
            this._view = k;
        }

        public function set face(k:BitmapData):void
        {
            this._face = k;
        }

        public function set realName(k:String):void
        {
            this._realName = k;
        }

        public function set _Str_9624(k:Boolean):void
        {
            this._persistedMessageUser = k;
        }

        public function set pocketHabboUser(k:Boolean):void
        {
            this._pocketHabboUser = k;
        }

        public function set _Str_17677(k:Boolean):void
        {
            this._vipMember = k;
        }

        public function _Str_19416():Boolean
        {
            return this._id < 0;
        }
    }
}
