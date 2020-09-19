package com.sulake.habbo.navigator.roomsettings
{
    import com.sulake.habbo.communication.messages.incoming.roomsettings.IFlatUser;

    public class FriendEntryData implements IFlatUser
    {
        private var _userId:int;
        private var _userName:String;

        public function FriendEntryData(k:int, _arg_2:String)
        {
            this._userId = k;
            this._userName = _arg_2;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._userName;
        }
    }
}
