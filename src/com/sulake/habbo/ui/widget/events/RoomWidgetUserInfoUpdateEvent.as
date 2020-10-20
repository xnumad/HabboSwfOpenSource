package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
    {
        public static const OWN_USER:String = "RWUIUE_OWN_USER";
        public static const BOT:String = "RWUIUE_BOT";
        public static const PEER:String = "RWUIUE_PEER";
        public static const TRADE_REASON_OK:int = 0;
        public static const TRADE_REASON_SHUTDOWN:int = 2;
        public static const TRADE_REASON_NO_TRADINGROOM:int = 3;
        public static const DEFAULT_BOT_BADGE_ID:String = "BOT";

        private var _name:String = "";
        private var _motto:String = "";
        private var _activityPoints:int;
        private var _id:int = 0;
        private var _xp:int = 0;
        private var _userType:int;
        private var _figure:String = "";
        private var _badges:Array;
        private var _groupId:int = 0;
        private var _groupName:String = "";
        private var _Str_11289:String = "";
        private var _carryItem:int = 0;
        private var _userRoomId:int = 0;
        private var _Str_8522:Boolean = false;
        private var _realName:String = "";
        private var _Str_3947:Boolean = false;
        private var _amIOwner:Boolean = false;
        private var _amIAnyRoomController:Boolean = false;
        private var _myRoomControllerLevel:int = 0;
        private var _canBeAskedAsFriend:Boolean = false;
        private var _Str_9070:Boolean = false;
        private var _Str_8457:Boolean = false;
        private var _Str_8831:Boolean = false;
        private var _respectLeft:int = 0;
        private var _Str_6028:Boolean = false;
        private var _Str_6139:Boolean = false;
        private var _Str_8973:Boolean = false;
        private var _Str_8910:int = 0;
        private var _Str_8858:int = 0;
        private var _isFriend:Boolean = false;
        private var isAmbassador:Boolean = false;

        public function RoomWidgetUserInfoUpdateEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            this._badges = [];
            super(k, _arg_2, _arg_3);
        }

        public function set name(k:String):void
        {
            this._name = k;
        }

        public function get name():String
        {
            return this._name;
        }

        public function set motto(k:String):void
        {
            this._motto = k;
        }

        public function get motto():String
        {
            return this._motto;
        }

        public function set activityPoints(k:int):void
        {
            this._activityPoints = k;
        }

        public function get activityPoints():int
        {
            return this._activityPoints;
        }

        public function set id(k:int):void
        {
            this._id = k;
        }

        public function get id():int
        {
            return this._id;
        }

        public function set xp(k:int):void
        {
            this._xp = k;
        }

        public function get xp():int
        {
            return this._xp;
        }

        public function set userType(k:int):void
        {
            this._userType = k;
        }

        public function get userType():int
        {
            return this._userType;
        }

        public function set figure(k:String):void
        {
            this._figure = k;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function set badges(k:Array):void
        {
            this._badges = k;
        }

        public function get badges():Array
        {
            return this._badges;
        }

        public function set groupId(k:int):void
        {
            this._groupId = k;
        }

        public function get groupId():int
        {
            return this._groupId;
        }

        public function set groupName(k:String):void
        {
            this._groupName = k;
        }

        public function get groupName():String
        {
            return this._groupName;
        }

        public function set _Str_5235(k:String):void
        {
            this._Str_11289 = k;
        }

        public function get _Str_5235():String
        {
            return this._Str_11289;
        }

        public function set canBeAskedForAFriend(k:Boolean):void
        {
            this._canBeAskedAsFriend = k;
        }

        public function get canBeAskedForAFriend():Boolean
        {
            return this._canBeAskedAsFriend;
        }

        public function set respectLeft(k:int):void
        {
            this._respectLeft = k;
        }

        public function get respectLeft():int
        {
            return this._respectLeft;
        }

        public function set isIgnored(k:Boolean):void
        {
            this._Str_6028 = k;
        }

        public function get isIgnored():Boolean
        {
            return this._Str_6028;
        }

        public function set amIOwner(k:Boolean):void
        {
            this._amIOwner = k;
        }

        public function get amIOwner():Boolean
        {
            return this._amIOwner;
        }

        public function set isGuildRoom(k:Boolean):void
        {
            this._Str_6139 = k;
        }

        public function get isGuildRoom():Boolean
        {
            return this._Str_6139;
        }

        public function set myRoomControllerLevel(k:int):void
        {
            this._myRoomControllerLevel = k;
        }

        public function get myRoomControllerLevel():int
        {
            return this._myRoomControllerLevel;
        }

        public function set amIAnyRoomController(k:Boolean):void
        {
            this._amIAnyRoomController = k;
        }

        public function get amIAnyRoomController():Boolean
        {
            return this._amIAnyRoomController;
        }

        public function set canTrade(k:Boolean):void
        {
            this._Str_8973 = k;
        }

        public function get canTrade():Boolean
        {
            return this._Str_8973;
        }

        public function set canTradeReason(k:int):void
        {
            this._Str_8910 = k;
        }

        public function get canTradeReason():int
        {
            return this._Str_8910;
        }

        public function set canBeKicked(k:Boolean):void
        {
            this._Str_9070 = k;
        }

        public function get canBeKicked():Boolean
        {
            return this._Str_9070;
        }

        public function set canBeBanned(k:Boolean):void
        {
            this._Str_8457 = k;
        }

        public function get canBeBanned():Boolean
        {
            return this._Str_8457;
        }

        public function get canBeMuted():Boolean
        {
            return this._Str_8831;
        }

        public function set canBeMuted(k:Boolean):void
        {
            this._Str_8831 = k;
        }

        public function set targetRoomControllerLevel(k:int):void
        {
            this._Str_8858 = k;
        }

        public function get targetRoomControllerLevel():int
        {
            return this._Str_8858;
        }

        public function set carryItem(k:int):void
        {
            this._carryItem = k;
        }

        public function get carryItem():int
        {
            return this._carryItem;
        }

        public function set _Str_3313(k:int):void
        {
            this._userRoomId = k;
        }

        public function get _Str_3313():int
        {
            return this._userRoomId;
        }

        public function set _Str_4780(k:Boolean):void
        {
            this._Str_8522 = k;
        }

        public function get _Str_4780():Boolean
        {
            return this._Str_8522;
        }

        public function set realName(k:String):void
        {
            this._realName = k;
        }

        public function get realName():String
        {
            return this._realName;
        }

        public function set allowNameChange(k:Boolean):void
        {
            this._Str_3947 = k;
        }

        public function get allowNameChange():Boolean
        {
            return this._Str_3947;
        }

        public function get isFriend():Boolean
        {
            return this._isFriend;
        }

        public function set isFriend(k:Boolean):void
        {
            this._isFriend = k;
        }

        public function get _Str_18096():Boolean
        {
            return this.isAmbassador;
        }

        public function set _Str_18096(k:Boolean):void
        {
            this.isAmbassador = k;
        }
    }
}
