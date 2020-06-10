package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HabboGroupDetailsData
    {
        public static const TYPE_REGULAR:int = 0;
        public static const TYPE_EXCLUSIVE:int = 1;
        public static const TYPE_CLOSED:int = 2;
        public static const TYPE_LARGE:int = 3;
        public static const TYPE_LARGE_CLOSED:int = 4;
        public static const STATUS_NOT_MEMBER:int = 0;
        public static const STATUS_MEMBER:int = 1;
        public static const STATUS_PENDING:int = 2;

        private var _groupId:int;
        private var _isGuild:Boolean;
        private var _type:int;
        private var _groupName:String;
        private var _description:String;
        private var _badgeCode:String;
        private var _roomId:int = -1;
        private var _roomName:String = "";
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

        public function HabboGroupDetailsData(k:IMessageDataWrapper)
        {
            this._groupId = k.readInteger();
            this._isGuild = k.readBoolean();
            this._type = k.readInteger();
            this._groupName = k.readString();
            this._description = k.readString();
            this._badgeCode = k.readString();
            this._roomId = k.readInteger();
            this._roomName = k.readString();
            this._status = k.readInteger();
            this._totalMembers = k.readInteger();
            this._favourite = k.readBoolean();
            this._creationDate = k.readString();
            this._isOwner = k.readBoolean();
            this._isAdmin = k.readBoolean();
            this._ownerName = k.readString();
            this._openDetails = k.readBoolean();
            this._membersCanDecorate = k.readBoolean();
            this._pendingMemberCount = k.readInteger();
            this._hasBoard = k.readBoolean();
        }

        public function get groupId():int
        {
            return this._groupId;
        }

        public function get _Str_6444():Boolean
        {
            return this._isGuild;
        }

        public function get type():int
        {
            return this._type;
        }

        public function get groupName():String
        {
            return this._groupName;
        }

        public function get description():String
        {
            return this._description;
        }

        public function get badgeCode():String
        {
            return this._badgeCode;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get roomName():String
        {
            return this._roomName;
        }

        public function get status():int
        {
            return this._status;
        }

        public function get totalMembers():int
        {
            return this._totalMembers;
        }

        public function get favourite():Boolean
        {
            return this._favourite;
        }

        public function get creationDate():String
        {
            return this._creationDate;
        }

        public function get isOwner():Boolean
        {
            return this._isOwner;
        }

        public function get isAdmin():Boolean
        {
            return this._isAdmin;
        }

        public function get ownerName():String
        {
            return this._ownerName;
        }

        public function get _Str_8199():Boolean
        {
            return this._openDetails;
        }

        public function get _Str_17307():Boolean
        {
            return this._membersCanDecorate;
        }

        public function get _Str_18324():int
        {
            return this._pendingMemberCount;
        }

        public function get _Str_25156():Boolean
        {
            return this._hasBoard;
        }

        public function get _Str_19430():Boolean
        {
            return (this._status == HabboGroupDetailsData.STATUS_NOT_MEMBER) && ((this._type == TYPE_REGULAR) || (this._type == TYPE_LARGE_CLOSED));
        }

        public function get _Str_21531():Boolean
        {
            return (this._status == HabboGroupDetailsData.STATUS_NOT_MEMBER) && (this._type == HabboGroupDetailsData.TYPE_EXCLUSIVE);
        }

        public function get _Str_24358():Boolean
        {
            return ((this._isGuild) && (!(this._isOwner))) && (this._status == HabboGroupDetailsData.STATUS_MEMBER);
        }
    }
}
