package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateInfostandUserEvent;

    public class InfoStandUserData 
    {
        private var _userId:int = 0;
        private var _userName:String = "";
        private var _badges:Array;
        private var _groupId:int = 0;
        private var _groupName:String = "";
        private var _groupBadgeId:String = "";
        private var _respectLeft:int = 0;
        private var _carryItem:int = 0;
        private var _userRoomId:int = 0;
        private var _type:String;
        private var _petRespectLeft:int = 0;

        public function InfoStandUserData()
        {
            this._badges = [];
            super();
        }

        public function set userId(k:int):void
        {
            this._userId = k;
        }

        public function set userName(k:String):void
        {
            this._userName = k;
        }

        public function set badges(k:Array):void
        {
            this._badges = k;
        }

        public function set groupId(k:int):void
        {
            this._groupId = k;
        }

        public function set groupName(k:String):void
        {
            this._groupName = k;
        }

        public function set _Str_5235(k:String):void
        {
            this._groupBadgeId = k;
        }

        public function set petRespectLeft(k:int):void
        {
            this._respectLeft = k;
        }

        public function set _Str_3249(k:int):void
        {
            this._carryItem = k;
        }

        public function set _Str_3313(k:int):void
        {
            this._userRoomId = k;
        }

        public function set type(k:String):void
        {
            this._type = k;
        }

        public function set _Str_2985(k:int):void
        {
            this._petRespectLeft = k;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function get badges():Array
        {
            return this._badges.slice();
        }

        public function get groupId():int
        {
            return this._groupId;
        }

        public function get groupName():String
        {
            return this._groupName;
        }

        public function get _Str_5235():String
        {
            return this._groupBadgeId;
        }

        public function get petRespectLeft():int
        {
            return this._respectLeft;
        }

        public function get _Str_3249():int
        {
            return this._carryItem;
        }

        public function get _Str_3313():int
        {
            return this._userRoomId;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get _Str_2985():int
        {
            return this._petRespectLeft;
        }

        public function _Str_18577():Boolean
        {
            return this.type == RoomWidgetUpdateInfostandUserEvent.BOT;
        }

        public function _Str_5479(k:RoomWidgetUpdateInfostandUserEvent):void
        {
            this.userId = k._Str_2394;
            this.userName = k.name;
            this.badges = k.badges;
            this.groupId = k.groupId;
            this.groupName = k.groupName;
            this._Str_5235 = k._Str_5235;
            this.petRespectLeft = k.petRespectLeft;
            this._Str_3249 = k._Str_3249;
            this._Str_3313 = k._Str_3313;
            this.type = k.type;
        }
    }
}
