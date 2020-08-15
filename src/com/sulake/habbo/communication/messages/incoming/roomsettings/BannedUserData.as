package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BannedUserData implements _Str_4633
    {
        private var _userId:int;
        private var _userName:String;

        public function BannedUserData(k:IMessageDataWrapper)
        {
            this._userId = k.readInteger();
            this._userName = k.readString();
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
