package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;

    public class AvatarInfoData 
    {
        private var _isIgnored:Boolean = false;
        private var _canTrade:Boolean = false;
        private var _canTradeReason:int = 0;
        private var _canBeKicked:Boolean = false;
        private var _canBeBanned:Boolean = false;
        private var _canBeMuted:Boolean = false;
        private var _canBeAskedAsFriend:Boolean = false;
        private var _amIOwner:Boolean = false;
        private var _amIAnyRoomController:Boolean = false;
        private var _respectLeft:int = 0;
        private var _isOwnUser:Boolean = false;
        private var _allowNameChange:Boolean = false;
        private var _isGuildRoom:Boolean = false;
        private var _carryItemType:int = 0;
        private var _myRoomControllerLevel:int = 0;
        private var _targetRoomControllerLevel:int = 0;
        private var _isFriend:Boolean = false;
        private var _isAmbassador:Boolean = false;


        public function get isIgnored():Boolean
        {
            return this._isIgnored;
        }

        public function get canTrade():Boolean
        {
            return this._canTrade;
        }

        public function get canTradeReason():int
        {
            return this._canTradeReason;
        }

        public function get canBeKicked():Boolean
        {
            return this._canBeKicked;
        }

        public function get canBeBanned():Boolean
        {
            return this._canBeBanned;
        }

        public function get canBeAskedForAFriend():Boolean
        {
            return this._canBeAskedAsFriend;
        }

        public function get amIOwner():Boolean
        {
            return this._amIOwner;
        }

        public function get amIAnyRoomController():Boolean
        {
            return this._amIAnyRoomController;
        }

        public function get petRespectLeft():int
        {
            return this._respectLeft;
        }

        public function get isOwnUser():Boolean
        {
            return this._isOwnUser;
        }

        public function get allowNameChange():Boolean
        {
            return this._allowNameChange;
        }

        public function get isGuildRoom():Boolean
        {
            return this._isGuildRoom;
        }

        public function get carryItemType():int
        {
            return this._carryItemType;
        }

        public function get myRoomControllerLevel():int
        {
            return this._myRoomControllerLevel;
        }

        public function get targetRoomControllerLevel():int
        {
            return this._targetRoomControllerLevel;
        }

        public function set isIgnored(k:Boolean):void
        {
            this._isIgnored = k;
        }

        public function set canTrade(k:Boolean):void
        {
            this._canTrade = k;
        }

        public function set canTradeReason(k:int):void
        {
            this._canTradeReason = k;
        }

        public function set canBeKicked(k:Boolean):void
        {
            this._canBeKicked = k;
        }

        public function set canBeBanned(k:Boolean):void
        {
            this._canBeBanned = k;
        }

        public function get canBeMuted():Boolean
        {
            return this._canBeMuted;
        }

        public function set canBeMuted(k:Boolean):void
        {
            this._canBeMuted = k;
        }

        public function set canBeAskedForAFriend(k:Boolean):void
        {
            this._canBeAskedAsFriend = k;
        }

        public function set amIOwner(k:Boolean):void
        {
            this._amIOwner = k;
        }

        public function set amIAnyRoomController(k:Boolean):void
        {
            this._amIAnyRoomController = k;
        }

        public function set petRespectLeft(k:int):void
        {
            this._respectLeft = k;
        }

        public function set isOwnUser(k:Boolean):void
        {
            this._isOwnUser = k;
        }

        public function set allowNameChange(k:Boolean):void
        {
            this._allowNameChange = k;
        }

        public function set isGuildRoom(k:Boolean):void
        {
            this._isGuildRoom = k;
        }

        public function set carryItemType(k:int):void
        {
            this._carryItemType = k;
        }

        public function set myRoomControllerLevel(k:int):void
        {
            this._myRoomControllerLevel = k;
        }

        public function set targetRoomControllerLevel(k:int):void
        {
            this._targetRoomControllerLevel = k;
        }

        public function get isFriend():Boolean
        {
            return this._isFriend;
        }

        public function get isAmbassador():Boolean
        {
            return this._isAmbassador;
        }

        public function populate(k:RoomWidgetUserInfoUpdateEvent):void
        {
            this._amIAnyRoomController = k.amIAnyRoomController;
            this._myRoomControllerLevel = k.myRoomControllerLevel;
            this._amIOwner = k.amIOwner;
            this._canBeAskedAsFriend = k.canBeAskedAsFriend;
            this._canBeKicked = k.canBeKicked;
            this._canBeBanned = k.canBeBanned;
            this._canBeMuted = k.canBeMuted;
            this._canTrade = k.canTrade;
            this._canTradeReason = k.canTradeReason;
            this._isIgnored = k.isIgnored;
            this._respectLeft = k.respectLeft;
            this._isOwnUser = (k.type == RoomWidgetUserInfoUpdateEvent.OWN_USER);
            this._allowNameChange = k.allowNameChange;
            this._isGuildRoom = k.isGuildRoom;
            this._targetRoomControllerLevel = k.targetRoomControllerLevel;
            this._carryItemType = k.carryItem;
            this._isFriend = k.isFriend;
            this._isAmbassador = k.amIAnAmbassador;
        }
    }
}
