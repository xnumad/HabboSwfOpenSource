package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5178 
    {
        private var _Str_2507:int;
        private var _Str_6052:Boolean;
        private var _Str_693:Boolean;
        private var _Str_19803:int;

        public function _Str_5178(k:IMessageDataWrapper)
        {
            this._Str_2507 = k.readInteger();
            this._Str_6052 = k.readBoolean();
            this._Str_19803 = k.readInteger();
            this._Str_693 = k.readBoolean();
        }

        public function get offerId():int
        {
            return this._Str_2507;
        }

        public function get _Str_12313():Boolean
        {
            return this._Str_6052;
        }

        public function get isSelectable():Boolean
        {
            return this._Str_693;
        }

        public function get _Str_21146():int
        {
            return this._Str_19803;
        }
    }
}
