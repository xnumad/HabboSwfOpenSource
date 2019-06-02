package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _postureType:String;
        private var _parameter:String;

        public function RoomObjectAvatarPostureUpdateMessage(k:String, _arg_2:String="")
        {
            this._postureType = k;
            this._parameter = _arg_2;
        }

        public function get postureType():String
        {
            return this._postureType;
        }

        public function get parameter():String
        {
            return this._parameter;
        }
    }
}
