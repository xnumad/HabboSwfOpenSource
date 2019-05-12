package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.habbo.ui.widget.events.RoomWidgetRentrableBotInfostandUpdateEvent;

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

        public function set _Str_3249(k:int):void
        {
            this._carryItem = k;
        }

        public function set _Str_3313(k:int):void
        {
            this._userRoomId = k;
        }

        public function set _Str_3246(k:Boolean):void
        {
            this._amIOwner = k;
        }

        public function set _Str_3529(k:Boolean):void
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

        public function get _Str_3249():int
        {
            return this._carryItem;
        }

        public function get _Str_3313():int
        {
            return this._userRoomId;
        }

        public function get _Str_3246():Boolean
        {
            return this._amIOwner;
        }

        public function get _Str_3529():Boolean
        {
            return this._amIAnyRoomController;
        }

        public function get _Str_2899():Array
        {
            return this._botSkills;
        }

        public function set _Str_2899(k:Array):void
        {
            this._botSkills = k;
        }

        public function _Str_5479(k:RoomWidgetRentrableBotInfostandUpdateEvent):void
        {
            this.userId = k._Str_2394;
            this.name = k.name;
            this.badges = k.badges;
            this._Str_3249 = k._Str_3249;
            this._Str_3313 = k._Str_3313;
            this._Str_3246 = k._Str_3246;
            this._Str_3529 = k._Str_3529;
            this._Str_2899 = k._Str_2899;
        }
    }
}
