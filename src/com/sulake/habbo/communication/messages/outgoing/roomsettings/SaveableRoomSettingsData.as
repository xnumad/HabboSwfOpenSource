package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
    public class SaveableRoomSettingsData 
    {
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

        public function get password():String
        {
            return this._password;
        }

        public function set password(k:String):void
        {
            this._password = k;
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

        public function get tags():Array
        {
            return this._tags;
        }

        public function set tags(k:Array):void
        {
            this._tags = k;
        }

        public function get controllers():Array
        {
            return this._controllers;
        }

        public function set controllers(k:Array):void
        {
            this._controllers = k;
        }

        public function get whoCanMute():int
        {
            return this._whoCanMute;
        }

        public function set whoCanMute(k:int):void
        {
            this._whoCanMute = k;
        }

        public function get whoCanKick():int
        {
            return this._whoCanKick;
        }

        public function set whoCanKick(k:int):void
        {
            this._whoCanKick = k;
        }

        public function get whoCanBan():int
        {
            return this._whoCanBan;
        }

        public function set whoCanBan(k:int):void
        {
            this._whoCanBan = k;
        }

        public function get chatMode():int
        {
            return this._chatMode;
        }

        public function set chatMode(k:int):void
        {
            this._chatMode = k;
        }

        public function get chatBubbleSize():int
        {
            return this._chatBubbleSize;
        }

        public function set chatBubbleSize(k:int):void
        {
            this._chatBubbleSize = k;
        }

        public function get chatScrollUpFrequency():int
        {
            return this._chatScrollUpFrequency;
        }

        public function set chatScrollUpFrequency(k:int):void
        {
            this._chatScrollUpFrequency = k;
        }

        public function get chatFullHearRange():int
        {
            return this._chatFullHearRange;
        }

        public function set chatFullHearRange(k:int):void
        {
            this._chatFullHearRange = k;
        }

        public function get chatFloodSensitivity():int
        {
            return this._chatFloodSensitivity;
        }

        public function set chatFloodSensitivity(k:int):void
        {
            this._chatFloodSensitivity = k;
        }

        public function get allowNavigatorDynCats():Boolean
        {
            return this._allowNavigatorDynCats;
        }

        public function set allowNavigatorDynCats(k:Boolean):void
        {
            this._allowNavigatorDynCats = k;
        }
    }
}
