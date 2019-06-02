package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarFlatControlUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _isAdmin:Boolean = false;
        private var _rawData:String;

        public function RoomObjectAvatarFlatControlUpdateMessage(rawData:String)
        {
            this._rawData = rawData;
        }

        public function get isAdmin():Boolean
        {
            return this._isAdmin;
        }

        public function get rawData():String
        {
            return this._rawData;
        }
    }
}
