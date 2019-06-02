package com.sulake.habbo.communication.messages.incoming.room.pets
{
    public class PetInfoMessageParser 
    {
        private var _stuffId:int;
        private var _Str_2825:int;
        private var _Str_2570:String;
        private var _userId:int;
        private var _userName:String;
        private var _rarityLevel:int;
        private var _Str_19401:Boolean;

        public function PetInfoMessageParser(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:String, _arg_6:int, _arg_7:Boolean)
        {
            this._stuffId = k;
            this._Str_2825 = _arg_2;
            this._Str_2570 = _arg_3;
            this._userId = _arg_4;
            this._userName = _arg_5;
            this._rarityLevel = _arg_6;
            this._Str_19401 = _arg_7;
        }

        public function get stuffId():int
        {
            return this._stuffId;
        }

        public function get classId():int
        {
            return this._Str_2825;
        }

        public function get productCode():String
        {
            return this._Str_2570;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function get rarityLevel():int
        {
            return this._rarityLevel;
        }

        public function get _Str_4788():Boolean
        {
            return this._Str_19401;
        }
    }
}
