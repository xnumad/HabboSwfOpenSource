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
        private var _Str_5119:int;
        private var _whoCanMute:int;
        private var _whoCanKick:int;
        private var _whoCanBan:int;
        private var _Str_20703:int;
        private var _Str_21851:int;
        private var _Str_20461:int;
        private var _Str_22118:int;
        private var _Str_19561:int;


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

        public function get _Str_7595():Boolean
        {
            return this._allowFoodConsume;
        }

        public function set _Str_7595(k:Boolean):void
        {
            this._allowFoodConsume = k;
        }

        public function get _Str_7273():Boolean
        {
            return this._allowWalkThrough;
        }

        public function set _Str_7273(k:Boolean):void
        {
            this._allowWalkThrough = k;
        }

        public function get _Str_7455():Boolean
        {
            return this._hideWalls;
        }

        public function set _Str_7455(k:Boolean):void
        {
            this._hideWalls = k;
        }

        public function get _Str_5962():int
        {
            return this._wallThickness;
        }

        public function set _Str_5962(k:int):void
        {
            this._wallThickness = k;
        }

        public function get _Str_6205():int
        {
            return this._Str_5119;
        }

        public function set _Str_6205(k:int):void
        {
            this._Str_5119 = k;
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

        public function get _Str_8349():Array
        {
            return this._controllers;
        }

        public function set _Str_8349(k:Array):void
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

        public function get _Str_18654():int
        {
            return this._Str_20703;
        }

        public function set _Str_18654(k:int):void
        {
            this._Str_20703 = k;
        }

        public function get _Str_16726():int
        {
            return this._Str_21851;
        }

        public function set _Str_16726(k:int):void
        {
            this._Str_21851 = k;
        }

        public function get _Str_17830():int
        {
            return this._Str_20461;
        }

        public function set _Str_17830(k:int):void
        {
            this._Str_20461 = k;
        }

        public function get _Str_18410():int
        {
            return this._Str_22118;
        }

        public function set _Str_18410(k:int):void
        {
            this._Str_22118 = k;
        }

        public function get _Str_16006():int
        {
            return this._Str_19561;
        }

        public function set _Str_16006(k:int):void
        {
            this._Str_19561 = k;
        }

        public function get _Str_18547():Boolean
        {
            return this._allowNavigatorDynCats;
        }

        public function set _Str_18547(k:Boolean):void
        {
            this._allowNavigatorDynCats = k;
        }
    }
}
