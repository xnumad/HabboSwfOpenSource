package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarDanceUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _danceStyle:int;

        public function RoomObjectAvatarDanceUpdateMessage(k:int=0)
        {
            this._danceStyle = k;
        }

        public function get _Str_8263():int
        {
            return this._danceStyle;
        }
    }
}
