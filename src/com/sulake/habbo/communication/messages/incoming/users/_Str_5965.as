package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5965 
    {
        private var _Str_2046:int;
        private var _Str_21054:int;
        private var _position:int;

        public function _Str_5965(k:IMessageDataWrapper)
        {
            this._Str_2046 = k.readInteger();
            this._Str_21054 = k.readInteger();
            this._position = k.readInteger();
        }

        public function get _Str_1502():int
        {
            return this._Str_2046;
        }

        public function get _Str_25271():int
        {
            return this._Str_21054;
        }

        public function get position():int
        {
            return this._position;
        }
    }
}
