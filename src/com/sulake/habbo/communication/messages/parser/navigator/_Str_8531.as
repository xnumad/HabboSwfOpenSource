package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4587;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8531 implements IMessageParser 
    {
        private var _data:_Str_4587;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new _Str_4587(k);
            return true;
        }

        public function get data():_Str_4587
        {
            return this._data;
        }
    }
}
