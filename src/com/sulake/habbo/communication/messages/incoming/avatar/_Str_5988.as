package com.sulake.habbo.communication.messages.incoming.avatar
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5988 
    {
        private var _slotId:int;
        private var _Str_3704:String;
        private var _gender:String;

        public function _Str_5988(k:IMessageDataWrapper)
        {
            this._slotId = k.readInteger();
            this._Str_3704 = k.readString();
            this._gender = k.readString();
        }

        public function get slotId():int
        {
            return this._slotId;
        }

        public function get figureString():String
        {
            return this._Str_3704;
        }

        public function get gender():String
        {
            return this._gender;
        }
    }
}
