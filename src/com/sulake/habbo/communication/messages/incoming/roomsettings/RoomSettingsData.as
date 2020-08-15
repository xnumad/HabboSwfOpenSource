package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import flash.utils.Dictionary;

    public class RoomSettingsData 
    {
        public static const DOORMODE_OPEN:int = 0;
        public static const DOORMODE_CLOSED:int = 1;
        public static const DOORMODE_PASSWORD:int = 2;
        public static const DOORMODE_INVISIBLE:int = 3;
        public static const DOORMODE_NOOBS_ONLY:int = 4;
        public static const TRADEMODE_NOT_ALLOWED:int = 0;
        public static const TRADEMODE_WITH_CONTROLLER:int = 1;
        public static const TRADEMODE_ALLOWED:int = 2;

        private var _roomId:int;
        private var _name:String;
        private var _description:String;
        private var _doorMode:int;
        private var _categoryId:int;
        private var _maximumVisitors:int;
        private var _maximumVisitorsLimit:int;
        private var _tags:Array;
        private var _tradeMode:int;
        private var _allowPets:Boolean;
        private var _allowFoodConsume:Boolean;
        private var _allowWalkThrough:Boolean;
        private var _hideWalls:Boolean;
        private var _wallThickness:int;
        private var _floorThickness:int;
        private var _controllersById:Dictionary;
        private var _controllerList:Array;
        private var _highlightedUserId:int;
        private var _bannedUsersById:Dictionary;
        private var _bannedUsersList:Array;
        private var _roomModerationSettings:RoomModerationSettings;
        private var _chatSettings:RoomChatSettings;
        private var _allowNavigatorDynamicCats:Boolean;


        public static function _Str_26097(k:int):String
        {
            switch (k)
            {
                case DOORMODE_OPEN:
                    return "${navigator.door.mode.open}";
                case DOORMODE_CLOSED:
                    return "${navigator.door.mode.closed}";
                case DOORMODE_PASSWORD:
                    return "${navigator.door.mode.password}";
                case DOORMODE_INVISIBLE:
                    return "${navigator.door.mode.invisible}";
                case DOORMODE_NOOBS_ONLY:
                    return "${navigator.door.mode.noobs_only}";
            }
            return "";
        }


        public function get tradeMode():int
        {
            return this._tradeMode;
        }

        public function set tradeMode(k:int):void
        {
            this._tradeMode = k;
        }

        public function get allowPets():Boolean
        {
            return this._allowPets;
        }

        public function set allowPets(k:Boolean):void
        {
            this._allowPets = k;
        }

        public function get allowFoodConsume():Boolean
        {
            return this._allowFoodConsume;
        }

        public function set allowFoodConsume(k:Boolean):void
        {
            this._allowFoodConsume = k;
        }

        public function get allowWalkThrough():Boolean
        {
            return this._allowWalkThrough;
        }

        public function set allowWalkThrough(k:Boolean):void
        {
            this._allowWalkThrough = k;
        }

        public function get hideWalls():Boolean
        {
            return this._hideWalls;
        }

        public function set hideWalls(k:Boolean):void
        {
            this._hideWalls = k;
        }

        public function get wallThickness():int
        {
            return this._wallThickness;
        }

        public function set wallThickness(k:int):void
        {
            this._wallThickness = k;
        }

        public function get floorThickness():int
        {
            return this._floorThickness;
        }

        public function set floorThickness(k:int):void
        {
            this._floorThickness = k;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function set roomId(k:int):void
        {
            this._roomId = k;
        }

        public function get name():String
        {
            return this._name;
        }

        public function set name(k:String):void
        {
            this._name = k;
        }

        public function get description():String
        {
            return this._description;
        }

        public function set description(k:String):void
        {
            this._description = k;
        }

        public function get doorMode():int
        {
            return this._doorMode;
        }

        public function set doorMode(k:int):void
        {
            this._doorMode = k;
        }

        public function get categoryId():int
        {
            return this._categoryId;
        }

        public function set categoryId(k:int):void
        {
            this._categoryId = k;
        }

        public function get maximumVisitors():int
        {
            return this._maximumVisitors;
        }

        public function set maximumVisitors(k:int):void
        {
            this._maximumVisitors = k;
        }

        public function get _Str_13128():int
        {
            return this._maximumVisitorsLimit;
        }

        public function set _Str_13128(k:int):void
        {
            this._maximumVisitorsLimit = k;
        }

        public function get tags():Array
        {
            return this._tags;
        }

        public function set tags(k:Array):void
        {
            this._tags = k;
        }

        public function _Str_17474(k:int, _arg_2:FlatControllerData):void
        {
            if (this._controllersById != null)
            {
                this._controllersById[k] = _arg_2;
                this._controllerList = null;
                this._highlightedUserId = k;
            }
        }

        public function get roomModerationSettings():RoomModerationSettings
        {
            return this._roomModerationSettings;
        }

        public function set roomModerationSettings(k:RoomModerationSettings):void
        {
            this._roomModerationSettings = k;
        }

        public function get _Str_13003():Dictionary
        {
            return this._controllersById;
        }

        public function set _Str_13003(k:Dictionary):void
        {
            this._controllersById = k;
        }

        public function get controllerList():Array
        {
            var k:String;
            var _local_2:int;
            var _local_3:FlatControllerData;
            if (this._controllerList == null)
            {
                this._controllerList = new Array();
                for (k in this._controllersById)
                {
                    _local_2 = int(k);
                    _local_3 = this._controllersById[_local_2];
                    if (_local_3 != null)
                    {
                        this._controllerList.push(_local_3);
                    }
                }
                this._controllerList.sortOn("userName", Array.CASEINSENSITIVE);
            }
            return this._controllerList;
        }

        public function get highlightedUserId():int
        {
            return this._highlightedUserId;
        }

        public function _Str_22019(k:int, _arg_2:BannedUserData):void
        {
            if (this._bannedUsersById == null)
            {
                this._bannedUsersById = new Dictionary();
            }
            else
            {
                this._bannedUsersList = null;
            }
            this._bannedUsersById[k] = _arg_2;
        }

        public function get bannedUsersById():Dictionary
        {
            return this._bannedUsersById;
        }

        public function get bannedUsersList():Array
        {
            var k:BannedUserData;
            if (this._bannedUsersList == null)
            {
                this._bannedUsersList = new Array();
                for each (k in this._bannedUsersById)
                {
                    this._bannedUsersList.push(k);
                }
                this._bannedUsersList.sortOn("userName", Array.CASEINSENSITIVE);
            }
            return this._bannedUsersList;
        }

        public function get chatSettings():RoomChatSettings
        {
            return this._chatSettings;
        }

        public function set chatSettings(k:RoomChatSettings):void
        {
            this._chatSettings = k;
        }

        public function get _Str_17884():Boolean
        {
            return this._allowNavigatorDynamicCats;
        }

        public function set _Str_17884(k:Boolean):void
        {
            this._allowNavigatorDynamicCats = k;
        }
    }
}
