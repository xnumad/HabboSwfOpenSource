package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarGuideStatusUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _guideStatus:int;

        public function RoomObjectAvatarGuideStatusUpdateMessage(k:int)
        {
            this._guideStatus = k;
        }

        public function get _Str_24181():int
        {
            return this._guideStatus;
        }
    }
}
