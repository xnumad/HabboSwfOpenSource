package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8164 implements IMessageParser 
    {
        private var _data:_Str_5018;


        public function flush():Boolean
        {
            if (this._data != null)
            {
                this._data.dispose();
                this._data = null;
            }
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new _Str_5018(k);
            return true;
        }

        public function get data():_Str_5018
        {
            return this._data;
        }
    }
}
