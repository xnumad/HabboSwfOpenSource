package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_6294;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7621 implements IMessageParser 
    {
        private var _data:_Str_6294;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new _Str_6294(k);
            return true;
        }

        public function get data():_Str_6294
        {
            return this._data;
        }
    }
}
