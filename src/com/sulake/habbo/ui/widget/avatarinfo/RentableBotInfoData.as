package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.habbo.ui.widget.events.RoomWidgetRentrableBotInfostandUpdateEvent;
    import com.sulake.habbo.communication.messages.parser.room.bots._Str_6169;

    public class RentableBotInfoData 
    {
        private var _id:int = -1;
        private var _roomIndex:int;
        private var _isIgnored:Boolean = false;
        private var _amIOwner:Boolean = false;
        private var _amIAnyRoomController:Boolean = false;
        private var _carryItemType:int = 0;
        private var _botSkills:Array;
        private var _botSkillsWithCommands:Array;
        private var _name:String;

        public function RentableBotInfoData()
        {
            this._botSkillsWithCommands = new Array(0);
            super();
        }

        public function set id(k:int):void
        {
            this._id = k;
        }

        public function set roomIndex(k:int):void
        {
            this._roomIndex = k;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get roomIndex():int
        {
            return this._roomIndex;
        }

        public function get isIgnored():Boolean
        {
            return this._isIgnored;
        }

        public function get _Str_3246():Boolean
        {
            return this._amIOwner;
        }

        public function get _Str_3529():Boolean
        {
            return this._amIAnyRoomController;
        }

        public function get _Str_8826():int
        {
            return this._carryItemType;
        }

        public function set isIgnored(k:Boolean):void
        {
            this._isIgnored = k;
        }

        public function set _Str_3246(k:Boolean):void
        {
            this._amIOwner = k;
        }

        public function set _Str_3529(k:Boolean):void
        {
            this._amIAnyRoomController = k;
        }

        public function set _Str_8826(k:int):void
        {
            this._carryItemType = k;
        }

        public function get _Str_2899():Array
        {
            return this._botSkills;
        }

        public function set _Str_2899(k:Array):void
        {
            this._botSkills = k;
        }

        public function get _Str_10833():Array
        {
            return this._botSkillsWithCommands;
        }

        public function set _Str_10833(k:Array):void
        {
            this._botSkillsWithCommands = k;
        }

        public function get name():String
        {
            return this._name;
        }

        public function populate(k:RoomWidgetRentrableBotInfostandUpdateEvent):void
        {
            if (k._Str_2394 != this.id)
            {
                this._botSkillsWithCommands = new Array(0);
            }
            this.id = k._Str_2394;
            this.roomIndex = k._Str_3313;
            this._Str_3246 = k._Str_3246;
            this._Str_3529 = k._Str_3529;
            this._Str_8826 = k._Str_3249;
            this._Str_2899 = k._Str_2899;
            this._name = k.name;
        }

        public function _Str_19891(k:Array):void
        {
            var _local_2:_Str_6169;
            this._botSkills = new Array();
            for each (_local_2 in k)
            {
                this._Str_2899.push(_local_2.id);
            }
            this._botSkillsWithCommands = k.concat();
        }
    }
}
