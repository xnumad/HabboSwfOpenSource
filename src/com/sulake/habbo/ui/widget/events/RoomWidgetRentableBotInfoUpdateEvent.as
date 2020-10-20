package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetRentableBotInfoUpdateEvent extends RoomWidgetUpdateEvent
    {
        public static const RENTABLE_BOT:String = "RWRBIUE_RENTABLE_BOT";
        public static const _Str_7492:String = "RENTABLE_BOT";

        private var _name:String = "";
        private var _motto:String = "";
        private var _id:int = 0;
        private var _figure:String = "";
        private var _badges:Array;
        private var _carryItem:int = 0;
        private var _Str_5131:int = 0;
        private var _ownerId:int;
        private var _ownerName:String;
        private var _amIOwner:Boolean = false;
        private var _amIAnyRoomController:Boolean = false;
        private var _roomControllerLevel:int = 0;
        private var _botSkills:Array;

        public function RoomWidgetRentableBotInfoUpdateEvent(k:Boolean=false, _arg_2:Boolean=false)
        {
            this._badges = [];
            super(RENTABLE_BOT, k, _arg_2);
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

        public function set id(k:int):void
        {
            this._id = k;
        }

        public function get id():int
        {
            return this._id;
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

        public function get ownerId():int
        {
            return this._ownerId;
        }

        public function set ownerId(k:int):void
        {
            this._ownerId = k;
        }

        public function get ownerName():String
        {
            return this._ownerName;
        }

        public function set ownerName(k:String):void
        {
            this._ownerName = k;
        }

        public function set amIOwner(k:Boolean):void
        {
            this._amIOwner = k;
        }

        public function get amIOwner():Boolean
        {
            return this._amIOwner;
        }

        public function set roomControllerLevel(k:int):void
        {
            this._roomControllerLevel = k;
        }

        public function get roomControllerLevel():int
        {
            return this._roomControllerLevel;
        }

        public function set amIAnyRoomController(k:Boolean):void
        {
            this._amIAnyRoomController = k;
        }

        public function get amIAnyRoomController():Boolean
        {
            return this._amIAnyRoomController;
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
            this._Str_5131 = k;
        }

        public function get _Str_3313():int
        {
            return this._Str_5131;
        }

        public function get botSkills():Array
        {
            return this._botSkills;
        }

        public function set botSkills(k:Array):void
        {
            this._botSkills = k;
        }
    }
}
