//com.sulake.habbo.communication.messages.incoming.users.HabboGroupDetailsData

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HabboGroupDetailsData {

        public static const TYPE_REGULAR:int;
        public static const TYPE_EXCLUSIVE:int;
        public static const TYPE_CLOSED:int;
        public static const TYPE_LARGE:int;
        public static const TYPE_LARGE_CLOSED:int;
        public static const STATUS_NOT_MEMBER:int;
        public static const STATUS_MEMBER:int;
        public static const STATUS_PENDING:int;

        private var _groupId:int;
        private var _isGuild:Boolean;
        private var _type:int;
        private var _groupName:String;
        private var _description:String;
        private var _badgeCode:String;
        private var _roomId:int;
        private var _roomName:String;
        private var _status:int;
        private var _totalMembers:int;
        private var _favourite:Boolean;
        private var _creationDate:String;
        private var _isOwner:Boolean;
        private var _isAdmin:Boolean;
        private var _ownerName:String;
        private var _openDetails:Boolean;
        private var _hasBoard:Boolean;
        private var _membersCanDecorate:Boolean;
        private var _pendingMemberCount:int;

        public function HabboGroupDetailsData(k:IMessageDataWrapper);

        public function get groupId():int;

        public function get isGuild():Boolean;

        public function get type():int;

        public function get groupName():String;

        public function get description():String;

        public function get badgeCode():String;

        public function get roomId():int;

        public function get roomName():String;

        public function get status():int;

        public function get totalMembers():int;

        public function get favourite():Boolean;

        public function get creationDate():String;

        public function get isOwner():Boolean;

        public function get isAdmin():Boolean;

        public function get ownerName():String;

        public function get openDetails():Boolean;

        public function get membersCanDecorate():Boolean;

        public function get pendingMemberCount():int;

        public function get hasBoard():Boolean;

        public function get joiningAllowed():Boolean;

        public function get requestMembershipAllowed():Boolean;

        public function get leaveAllowed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

