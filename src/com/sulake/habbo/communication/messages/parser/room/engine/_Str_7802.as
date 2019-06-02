package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3292;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7802 implements IMessageParser 
    {
        private var _data:_Str_3292 = null;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function get data():_Str_3292
        {
            var k:_Str_3292 = this._data;
            if (k != null)
            {
                k._Str_4710();
            }
            return k;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._data = _Str_4638._Str_16439(k);
            return true;
        }
    }
}
