package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4374;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8594 implements IMessageParser 
    {
        private var _data:_Str_4374;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new _Str_4374(k);
            return true;
        }

        public function get data():_Str_4374
        {
            return this._data;
        }
    }
}
