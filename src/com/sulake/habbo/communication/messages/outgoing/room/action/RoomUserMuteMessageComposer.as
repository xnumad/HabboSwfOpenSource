package com.sulake.habbo.communication.messages.outgoing.room.action
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RoomUserMuteMessageComposer implements IMessageComposer 
    {
        private var _Str_2306:int;
        private var _roomId:int = 0;
        private var _Str_22053:int;

        public function RoomUserMuteMessageComposer(userId:int, minutes:int, roomId:int=0)
        {
            this._Str_2306 = userId;
            this._roomId = roomId;
            this._Str_22053 = minutes;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_2306, this._roomId, this._Str_22053];
        }
    }
}
