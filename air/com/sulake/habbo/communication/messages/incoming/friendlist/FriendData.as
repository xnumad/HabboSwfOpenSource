//com.sulake.habbo.communication.messages.incoming.friendlist.FriendData

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FriendData {

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

        public function FriendData(k:IMessageDataWrapper);

        public function get id():int;

        public function get name():String;

        public function get gender():int;

        public function get online():Boolean;

        public function get followingAllowed():Boolean;

        public function get figure():String;

        public function get categoryId():int;

        public function get motto():String;

        public function get lastAccess():String;

        public function get realName():String;

        public function get facebookId():String;

        public function get persistedMessageUser():Boolean;

        public function get vipMember():Boolean;

        public function get pocketHabboUser():Boolean;

        public function get relationshipStatus():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

