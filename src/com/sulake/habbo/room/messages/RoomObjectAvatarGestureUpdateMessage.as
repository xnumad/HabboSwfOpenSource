package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarGestureUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _gesture:int = 0;

        public function RoomObjectAvatarGestureUpdateMessage(k:int)
        {
            this._gesture = k;
        }

        public function get gesture():int
        {
            return this._gesture;
        }
    }
}
