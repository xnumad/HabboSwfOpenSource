package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5335 extends _Str_5442 
    {
        private var _Str_16193:int;
        private var _Str_22071:int;
        private var _Str_21178:int;
        private var _Str_21024:int;

        public function _Str_5335(k:IMessageDataWrapper)
        {
            super(k);
            this._Str_16193 = k.readInteger();
            this._Str_22071 = k.readInteger();
            this._Str_21178 = k.readInteger();
            this._Str_21024 = k.readInteger();
        }

        public function get _Str_23477():int
        {
            return this._Str_16193 * months;
        }

        public function get _Str_21585():int
        {
            return this._Str_22071 * months;
        }

        public function get _Str_22469():int
        {
            return this._Str_21178;
        }

        public function get _Str_24050():int
        {
            return (this._Str_16193 * months) - this.priceCredits;
        }

        public function get _Str_22280():int
        {
            return (this._Str_21585 * months) - this.priceActivityPoints;
        }

        public function get _Str_21229():int
        {
            return this._Str_21024;
        }
    }
}
