//com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData

package com.sulake.habbo.communication.messages.incoming.roomsettings{
    import flash.utils.Dictionary;

    public class RoomSettingsData {

        public static const DOORMODE_OPEN:int;
        public static const DOORMODE_CLOSED:int;
        public static const DOORMODE_PASSWORD:int;
        public static const DOORMODE_INVISIBLE:int;
        public static const DOORMODE_NOOBS_ONLY:int;
        public static const TRADEMODE_NOT_ALLOWED:int;
        public static const TRADEMODE_WITH_CONTROLLER:int;
        public static const TRADEMODE_ALLOWED:int;

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

        public function RoomSettingsData();

        public function get tradeMode():int;

        public function set tradeMode(k:int):void;

        public function get allowPets():Boolean;

        public function set allowPets(k:Boolean):void;

        public function get allowFoodConsume():Boolean;

        public function set allowFoodConsume(k:Boolean):void;

        public function get allowWalkThrough():Boolean;

        public function set allowWalkThrough(k:Boolean):void;

        public function get hideWalls():Boolean;

        public function set hideWalls(k:Boolean):void;

        public function get wallThickness():int;

        public function set wallThickness(k:int):void;

        public function get floorThickness():int;

        public function set floorThickness(k:int):void;

        public function get roomId():int;

        public function set roomId(k:int):void;

        public function get name():String;

        public function set name(k:String):void;

        public function get description():String;

        public function set description(k:String):void;

        public function get doorMode():int;

        public function set doorMode(k:int):void;

        public function get categoryId():int;

        public function set categoryId(k:int):void;

        public function get maximumVisitors():int;

        public function set maximumVisitors(k:int):void;

        public function get maximumVisitorsLimit():int;

        public function set maximumVisitorsLimit(k:int):void;

        public function get tags():Array;

        public function set tags(k:Array):void;

        public function setFlatController(k:int, _arg_2:FlatControllerData):void;

        public function get roomModerationSettings():RoomModerationSettings;

        public function set roomModerationSettings(k:RoomModerationSettings):void;

        public function get controllersById():Dictionary;

        public function set controllersById(k:Dictionary):void;

        public function get controllerList():Array;

        public function get highlightedUserId():int;

        public function setBannedUser(k:int, _arg_2:BannedUserData):void;

        public function get bannedUsersById():Dictionary;

        public function get bannedUsersList():Array;

        public function get chatSettings():RoomChatSettings;

        public function set chatSettings(k:RoomChatSettings):void;

        public function get allowNavigatorDynamicCats():Boolean;

        public function set allowNavigatorDynamicCats(k:Boolean):void;


    }
}//package com.sulake.habbo.communication.messages.incoming.roomsettings

