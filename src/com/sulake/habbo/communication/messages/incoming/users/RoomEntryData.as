package com.sulake.habbo.communication.messages.incoming.users
{
    public class RoomEntryData
    {
        private var _roomId:int;
        private var _roomName:String;
        private var _hasControllers:Boolean = false;

        public function RoomEntryData(k:int, _arg_2:String, _arg_3:Boolean)
        {
            this._roomId = k;
            this._roomName = _arg_2;
            this._hasControllers = _arg_3;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get roomName():String
        {
            return this._roomName;
        }

        public function get _Str_22776():Boolean
        {
            return this._hasControllers;
        }
    }
}
