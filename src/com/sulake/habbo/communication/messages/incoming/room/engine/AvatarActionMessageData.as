package com.sulake.habbo.communication.messages.incoming.room.engine
{
    public class AvatarActionMessageData
    {
        private var _actionType:String;
        private var _Str_1638:String;

        public function AvatarActionMessageData(k:String, _arg_2:String)
        {
            this._actionType = k;
            this._Str_1638 = _arg_2;
        }

        public function get actionType():String
        {
            return this._actionType;
        }

        public function get actionParameter():String
        {
            return this._Str_1638;
        }

        public function toString():String
        {
            return (this._actionType + ":") + this._Str_1638;
        }
    }
}
