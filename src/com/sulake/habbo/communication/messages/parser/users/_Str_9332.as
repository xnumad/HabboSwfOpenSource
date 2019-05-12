package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5600;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9332 implements IMessageParser 
    {
        private var _data:_Str_5600;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new _Str_5600(k);
            return true;
        }

        public function get data():_Str_5600
        {
            return this._data;
        }
    }
}
