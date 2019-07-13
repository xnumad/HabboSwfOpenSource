package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateInfostandUserEvent;

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

        public function get _Str_5751():Boolean
        {
            return this._canTrade;
        }

        public function get _Str_6622():int
        {
            return this._canTradeReason;
        }

        public function get _Str_5990():Boolean
        {
            return this._canBeKicked;
        }

        public function get _Str_6701():Boolean
        {
            return this._canBeBanned;
        }

        public function get canBeAskedForAFriend():Boolean
        {
            return this._canBeAskedAsFriend;
        }

        public function get _Str_3246():Boolean
        {
            return this._amIOwner;
        }

        public function get _Str_3529():Boolean
        {
            return this._amIAnyRoomController;
        }

        public function get petRespectLeft():int
        {
            return this._respectLeft;
        }

        public function get _Str_11453():Boolean
        {
            return this._isOwnUser;
        }

        public function get _Str_4330():Boolean
        {
            return this._allowNameChange;
        }

        public function get _Str_3672():Boolean
        {
            return this._isGuildRoom;
        }

        public function get _Str_8826():int
        {
            return this._carryItemType;
        }

        public function get roomControllerLevel():int
        {
            return this._myRoomControllerLevel;
        }

        public function get _Str_5599():int
        {
            return this._targetRoomControllerLevel;
        }

        public function set isIgnored(k:Boolean):void
        {
            this._isIgnored = k;
        }

        public function set _Str_5751(k:Boolean):void
        {
            this._canTrade = k;
        }

        public function set _Str_6622(k:int):void
        {
            this._canTradeReason = k;
        }

        public function set _Str_5990(k:Boolean):void
        {
            this._canBeKicked = k;
        }

        public function set _Str_6701(k:Boolean):void
        {
            this._canBeBanned = k;
        }

        public function get _Str_6394():Boolean
        {
            return this._canBeMuted;
        }

        public function set _Str_6394(k:Boolean):void
        {
            this._canBeMuted = k;
        }

        public function set canBeAskedForAFriend(k:Boolean):void
        {
            this._canBeAskedAsFriend = k;
        }

        public function set _Str_3246(k:Boolean):void
        {
            this._amIOwner = k;
        }

        public function set _Str_3529(k:Boolean):void
        {
            this._amIAnyRoomController = k;
        }

        public function set petRespectLeft(k:int):void
        {
            this._respectLeft = k;
        }

        public function set _Str_11453(k:Boolean):void
        {
            this._isOwnUser = k;
        }

        public function set _Str_4330(k:Boolean):void
        {
            this._allowNameChange = k;
        }

        public function set _Str_3672(k:Boolean):void
        {
            this._isGuildRoom = k;
        }

        public function set _Str_8826(k:int):void
        {
            this._carryItemType = k;
        }

        public function set roomControllerLevel(k:int):void
        {
            this._myRoomControllerLevel = k;
        }

        public function set _Str_5599(k:int):void
        {
            this._targetRoomControllerLevel = k;
        }

        public function get isFriend():Boolean
        {
            return this._isFriend;
        }

        public function get _Str_4050():Boolean
        {
            return this._isAmbassador;
        }

        public function populate(k:RoomWidgetUpdateInfostandUserEvent):void
        {
            this._amIAnyRoomController = k._Str_3529;
            this._myRoomControllerLevel = k.roomControllerLevel;
            this._amIOwner = k._Str_3246;
            this._canBeAskedAsFriend = k.canBeAskedForAFriend;
            this._canBeKicked = k._Str_5990;
            this._canBeBanned = k._Str_6701;
            this._canBeMuted = k._Str_6394;
            this._canTrade = k._Str_5751;
            this._canTradeReason = k._Str_6622;
            this._isIgnored = k.isIgnored;
            this._respectLeft = k.petRespectLeft;
            this._isOwnUser = (k.type == RoomWidgetUpdateInfostandUserEvent.OWN_USER);
            this._allowNameChange = k._Str_4330;
            this._isGuildRoom = k._Str_3672;
            this._targetRoomControllerLevel = k._Str_5599;
            this._carryItemType = k._Str_3249;
            this._isFriend = k.isFriend;
            this._isAmbassador = k._Str_18096;
        }
    }
}
