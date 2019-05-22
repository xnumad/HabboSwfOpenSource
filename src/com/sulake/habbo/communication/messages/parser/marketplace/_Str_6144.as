package com.sulake.habbo.communication.messages.parser.marketplace
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6144 implements IMessageParser 
    {
        private var _result:int;
        private var _Str_21768:int = -1;
        private var _Str_20780:int = -1;
        private var _Str_8508:int = -1;


        public function get result():int
        {
            return this._result;
        }

        public function get offerId():int
        {
            return this._Str_21768;
        }

        public function get _Str_24839():int
        {
            return this._Str_20780;
        }

        public function get _Str_7501():int
        {
            return this._Str_8508;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._result = k.readInteger();
            this._Str_21768 = k.readInteger();
            this._Str_20780 = k.readInteger();
            this._Str_8508 = k.readInteger();
            return true;
        }
    }
}
