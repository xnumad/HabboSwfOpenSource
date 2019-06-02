package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _figure:String;
        private var _race:String;
        private var _gender:String;
        private var _isRiding:Boolean;

        public function RoomObjectAvatarFigureUpdateMessage(k:String, _arg_2:String=null, _arg_3:String=null, _arg_4:Boolean=false)
        {
            this._figure = k;
            this._gender = _arg_2;
            this._race = _arg_3;
            this._isRiding = _arg_4;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get race():String
        {
            return this._race;
        }

        public function get gender():String
        {
            return this._gender;
        }

        public function get isRiding():Boolean
        {
            return this._isRiding;
        }
    }
}
