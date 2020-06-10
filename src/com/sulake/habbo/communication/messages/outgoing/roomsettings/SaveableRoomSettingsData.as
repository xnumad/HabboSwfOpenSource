﻿package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
    public class SaveableRoomSettingsData 
    {
        private var _roomId:int;
        private var _name:String;
        private var _description:String;
        private var _Str_4321:int;
        private var _password:String;
        private var _Str_2629:int;
        private var _Str_10633:int;
        private var _tags:Array;
        private var _Str_8850:Array;
        private var _Str_4667:int;
        private var _Str_6656:Boolean;
        private var _Str_11128:Boolean;
        private var _Str_10197:Boolean;
        private var _Str_22248:Boolean;
        private var _Str_5413:Boolean;
        private var _Str_5084:int;
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
            return this._Str_4667;
        }

        public function set tradeMode(k:int):void
        {
            this._Str_4667 = k;
        }

        public function get allowPets():Boolean
        {
            return this._Str_6656;
        }

        public function set allowPets(k:Boolean):void
        {
            this._Str_6656 = k;
        }

        public function get _Str_7595():Boolean
        {
            return this._Str_11128;
        }

        public function set _Str_7595(k:Boolean):void
        {
            this._Str_11128 = k;
        }

        public function get _Str_7273():Boolean
        {
            return this._Str_10197;
        }

        public function set _Str_7273(k:Boolean):void
        {
            this._Str_10197 = k;
        }

        public function get _Str_7455():Boolean
        {
            return this._Str_5413;
        }

        public function set _Str_7455(k:Boolean):void
        {
            this._Str_5413 = k;
        }

        public function get _Str_5962():int
        {
            return this._Str_5084;
        }

        public function set _Str_5962(k:int):void
        {
            this._Str_5084 = k;
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
            return this._Str_4321;
        }

        public function set doorMode(k:int):void
        {
            this._Str_4321 = k;
        }

        public function get password():String
        {
            return this._password;
        }

        public function set password(k:String):void
        {
            this._password = k;
        }

        public function get _Str_2712():int
        {
            return this._Str_2629;
        }

        public function set _Str_2712(k:int):void
        {
            this._Str_2629 = k;
        }

        public function get _Str_5552():int
        {
            return this._Str_10633;
        }

        public function set _Str_5552(k:int):void
        {
            this._Str_10633 = k;
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
            return this._Str_8850;
        }

        public function set _Str_8349(k:Array):void
        {
            this._Str_8850 = k;
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
            return this._Str_22248;
        }

        public function set _Str_18547(k:Boolean):void
        {
            this._Str_22248 = k;
        }
    }
}
