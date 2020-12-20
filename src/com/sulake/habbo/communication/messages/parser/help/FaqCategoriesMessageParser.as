package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FaqCategoriesMessageParser implements IMessageParser
    {
        private var _data:Map;


        public function get data():Map
        {
            return this._data;
        }

        public function flush():Boolean
        {
            if (this._data != null)
            {
                this._data.dispose();
            }
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var category:Map;
            var category_id:int;
            var name:String;
            var count:int;
            this._data = new Map();
            var category_amount:int = k.readInteger();
            var iterator:int;
            while (iterator < category_amount)
            {
                category = new Map();
                category_id = k.readInteger();
                name = k.readString();
                count = k.readInteger();
                category.add("name", name);
                category.add("count", count);
                this._data.add(category_id, category);
                iterator++;
            }
            return true;
        }
    }
}
