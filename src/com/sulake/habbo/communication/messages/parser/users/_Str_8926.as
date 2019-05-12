package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users._Str_2974;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8926 implements IMessageParser 
    {
        private var _data:_Str_2974;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new _Str_2974(k);
            return true;
        }

        public function get data():_Str_2974
        {
            return this._data;
        }
    }
}
