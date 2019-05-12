package com.sulake.habbo.help.cfh.registry.user
{
    public class UserRegistryItem 
    {
        private var _userId:int;
        private var _userName:String = "";
        private var _roomName:String = "";
        private var _figure:String = "";
        private var _roomId:int;

        public function UserRegistryItem(k:int, _arg_2:String, _arg_3:String, _arg_4:int, _arg_5:String="")
        {
            this._userId = k;
            this._userName = _arg_2;
            this._roomId = _arg_4;
            this._roomName = _arg_5;
            this._figure = _arg_3;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function get roomName():String
        {
            return this._roomName;
        }

        public function set roomName(k:String):void
        {
            this._roomName = k;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get roomId():int
        {
            return this._roomId;
        }
    }
}
