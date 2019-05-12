package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4081;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9296 implements IMessageParser 
    {
        private var _data:_Str_4081;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new _Str_4081(k);
            return true;
        }

        public function get data():_Str_4081
        {
            return this._data;
        }
    }
}
