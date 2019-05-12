package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3079;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7298 implements IMessageParser 
    {
        private var _Str_2776:_Str_3079 = null;


        public function flush():Boolean
        {
            this._Str_2776 = null;
            return true;
        }

        public function get data():_Str_3079
        {
            var k:_Str_3079 = this._Str_2776;
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
            this._Str_2776 = ItemDataParser._Str_9484(k);
            this._Str_2776.ownerName = k.readString();
            return true;
        }
    }
}
