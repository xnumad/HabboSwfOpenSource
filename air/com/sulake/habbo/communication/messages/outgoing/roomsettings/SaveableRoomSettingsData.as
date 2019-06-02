//com.sulake.habbo.communication.messages.outgoing.roomsettings.SaveableRoomSettingsData

package com.sulake.habbo.communication.messages.outgoing.roomsettings{
    public class SaveableRoomSettingsData {

        private var _roomId:int;
        private var _name:String;
        private var _description:String;
        private var _doorMode:int;
        private var _password:String;
        private var _categoryId:int;
        private var _maximumVisitors:int;
        private var _tags:Array;
        private var _controllers:Array;
        private var _tradeMode:int;
        private var _allowPets:Boolean;
        private var _allowFoodConsume:Boolean;
        private var _allowWalkThrough:Boolean;
        private var _allowNavigatorDynCats:Boolean;
        private var _hideWalls:Boolean;
        private var _wallThickness:int;
        private var _floorThickness:int;
        private var _whoCanMute:int;
        private var _whoCanKick:int;
        private var _whoCanBan:int;
        private var _chatMode:int;
        private var _chatBubbleSize:int;
        private var _chatScrollUpFrequency:int;
        private var _chatFullHearRange:int;
        private var _chatFloodSensitivity:int;

        public function SaveableRoomSettingsData();

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

        public function get password():String;

        public function set password(k:String):void;

        public function get categoryId():int;

        public function set categoryId(k:int):void;

        public function get maximumVisitors():int;

        public function set maximumVisitors(k:int):void;

        public function get tags():Array;

        public function set tags(k:Array):void;

        public function get controllers():Array;

        public function set controllers(k:Array):void;

        public function get whoCanMute():int;

        public function set whoCanMute(k:int):void;

        public function get whoCanKick():int;

        public function set whoCanKick(k:int):void;

        public function get whoCanBan():int;

        public function set whoCanBan(k:int):void;

        public function get chatMode():int;

        public function set chatMode(k:int):void;

        public function get chatBubbleSize():int;

        public function set chatBubbleSize(k:int):void;

        public function get chatScrollUpFrequency():int;

        public function set chatScrollUpFrequency(k:int):void;

        public function get chatFullHearRange():int;

        public function set chatFullHearRange(k:int):void;

        public function get chatFloodSensitivity():int;

        public function set chatFloodSensitivity(k:int):void;

        public function get allowNavigatorDynCats():Boolean;

        public function set allowNavigatorDynCats(k:Boolean):void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.roomsettings

