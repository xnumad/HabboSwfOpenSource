package com.sulake.habbo.communication.messages.parser.inventory.badges
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7446 
    {
        private var _badgeId:String;
        private var _limit:int;

        public function _Str_7446(k:String, _arg_2:IMessageDataWrapper)
        {
            this._badgeId = (("ACH_" + k) + _arg_2.readInteger());
            this._limit = _arg_2.readInteger();
        }

        public function get badgeId():String
        {
            return this._badgeId;
        }

        public function get limit():int
        {
            return this._limit;
        }
    }
}
