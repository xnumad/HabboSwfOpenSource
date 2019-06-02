//com.sulake.habbo.communication.messages.incoming.users.ExtendedProfileData

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ExtendedProfileData {

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

        public function ExtendedProfileData(k:IMessageDataWrapper);

        public function get userId():int;

        public function get userName():String;

        public function get motto():String;

        public function get figure():String;

        public function get creationDate():String;

        public function get achievementScore():int;

        public function get friendCount():int;

        public function get isFriend():Boolean;

        public function get isFriendRequestSent():Boolean;

        public function get isOnline():Boolean;

        public function get guilds():Array;

        public function set isFriendRequestSent(k:Boolean):void;

        public function get lastAccessSinceInSeconds():int;

        public function get openProfileWindow():Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

