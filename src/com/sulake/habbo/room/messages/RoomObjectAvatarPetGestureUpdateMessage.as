package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarPetGestureUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _gesture:String;

        public function RoomObjectAvatarPetGestureUpdateMessage(k:String)
        {
            this._gesture = k;
        }

        public function get gesture():String
        {
            return this._gesture;
        }
    }
}
