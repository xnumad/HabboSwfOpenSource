package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotInfoUpdateEvent;

    public class InfoStandRentableBotData 
    {
        private var _userId:int = 0;
        private var _name:String = "";
        private var _badges:Array;
        private var _carryItem:int = 0;
        private var _userRoomId:int = 0;
        private var _amIOwner:Boolean;
        private var _amIAnyRoomController:Boolean;
        private var _botSkills:Array;

        public function InfoStandRentableBotData()
        {
            this._badges = [];
            super();
        }

        public function set userId(k:int):void
        {
            this._userId = k;
        }

        public function set name(k:String):void
        {
            this._name = k;
        }

        public function set badges(k:Array):void
        {
            this._badges = k;
        }

        public function set carryItem(k:int):void
        {
            this._carryItem = k;
        }

        public function set userRoomId(k:int):void
        {
            this._userRoomId = k;
        }

        public function set amIOwner(k:Boolean):void
        {
            this._amIOwner = k;
        }

        public function set amIAnyRoomController(k:Boolean):void
        {
            this._amIAnyRoomController = k;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get badges():Array
        {
            return this._badges.slice();
        }

        public function get carryItem():int
        {
            return this._carryItem;
        }

        public function get userRoomId():int
        {
            return this._userRoomId;
        }

        public function get amIOwner():Boolean
        {
            return this._amIOwner;
        }

        public function get amIAnyRoomController():Boolean
        {
            return this._amIAnyRoomController;
        }

        public function get botSkills():Array
        {
            return this._botSkills;
        }

        public function set botSkills(k:Array):void
        {
            this._botSkills = k;
        }

        public function _Str_5479(k:RoomWidgetRentableBotInfoUpdateEvent):void
        {
            this.userId = k.id;
            this.name = k.name;
            this.badges = k.badges;
            this.carryItem = k.carryItem;
            this.userRoomId = k.userRoomId;
            this.amIOwner = k.amIOwner;
            this.amIAnyRoomController = k.amIAnyRoomController;
            this.botSkills = k.botSkills;
        }
    }
}
