package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3079;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7749 implements IMessageParser 
    {
        private var _item:_Str_3079 = null;


        public function flush():Boolean
        {
            this._item = null;
            return true;
        }

        public function get data():_Str_3079
        {
            var k:_Str_3079 = this._item;
            if (k != null)
            {
                k.setReadOnly();
            }
            return k;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._item = ItemDataParser.parseItemData(k);
            return true;
        }
    }
}
