package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomVisitData
    {
        private var _roomId:int;
        private var _roomName:String;
        private var _enterHour:int;
        private var _enterMinute:int;

        public function RoomVisitData(k:IMessageDataWrapper)
        {
            this._roomId = k.readInteger();
            this._roomName = k.readString();
            this._enterHour = k.readInteger();
            this._enterMinute = k.readInteger();
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get roomName():String
        {
            return this._roomName;
        }

        public function get enterHour():int
        {
            return this._enterHour;
        }

        public function get enterMinute():int
        {
            return this._enterMinute;
        }
    }
}
