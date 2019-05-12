package com.sulake.habbo.communication.messages.parser.notifications
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_6768;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5519 implements IMessageParser 
    {
        private var _data:_Str_6768;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new _Str_6768(k);
            return true;
        }

        public function get data():_Str_6768
        {
            return this._data;
        }
    }
}
