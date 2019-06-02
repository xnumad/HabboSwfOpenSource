package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ExtendedProfileData 
    {
        private var _userId:int;
        private var _userName:String;
        private var _figure:String;
        private var _motto:String;
        private var _creationDate:String;
        private var _achievementScore:int;
        private var _friendCount:int;
        private var _isFriend:Boolean;
        private var _isFriendRequestSent:Boolean;
        private var _isOnline:Boolean;
        private var _guilds:Array;
        private var _lastAccessSinceInSeconds:int;
        private var _openProfileWindow:Boolean;

        public function ExtendedProfileData(k:IMessageDataWrapper)
        {
            this._guilds = new Array();
            super();
            this._userId = k.readInteger();
            this._userName = k.readString();
            this._figure = k.readString();
            this._motto = k.readString();
            this._creationDate = k.readString();
            this._achievementScore = k.readInteger();
            this._friendCount = k.readInteger();
            this._isFriend = k.readBoolean();
            this._isFriendRequestSent = k.readBoolean();
            this._isOnline = k.readBoolean();
            var guildCount:int = k.readInteger();
            var counter:int;
            while (counter < guildCount)
            {
                this._guilds.push(new _Str_3266(k));
                counter++;
            }
            this._lastAccessSinceInSeconds = k.readInteger();
            this._openProfileWindow = k.readBoolean();
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function get motto():String
        {
            return this._motto;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get creationDate():String
        {
            return this._creationDate;
        }

        public function get activityPoints():int
        {
            return this._achievementScore;
        }

        public function get friendCount():int
        {
            return this._friendCount;
        }

        public function get isFriend():Boolean
        {
            return this._isFriend;
        }

        public function get isRequestFriend():Boolean
        {
            return this._isFriendRequestSent;
        }

        public function get online():Boolean
        {
            return this._isOnline;
        }

        public function get guilds():Array
        {
            return this._guilds;
        }

        public function set isRequestFriend(k:Boolean):void
        {
            this._isFriendRequestSent = k;
        }

        public function get lastAccessSinceInSeconds():int
        {
            return this._lastAccessSinceInSeconds;
        }

        public function get openProfileWindow():Boolean
        {
            return this._openProfileWindow;
        }
    }
}
