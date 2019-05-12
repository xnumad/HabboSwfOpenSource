package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users._Str_2891;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6619 implements IMessageParser 
    {
        private var _Str_2994:int;
        private var _data:_Str_2891;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_2994 = k.readInteger();
            this._data = new _Str_2891(k);
            return true;
        }

        public function get _Str_3916():int
        {
            return this._Str_2994;
        }

        public function get data():_Str_2891
        {
            return this._data;
        }
    }
}
