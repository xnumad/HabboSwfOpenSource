package com.sulake.habbo.communication.messages.parser.newnavigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class CollapsedCategoriesMessageParser implements IMessageParser 
    {
        private var _collapsedCategories:Vector.<String>;


        public function flush():Boolean
        {
            this._collapsedCategories = new Vector.<String>(0);
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._collapsedCategories.push(k.readString());
                _local_3++;
            }
            return true;
        }

        public function get _Str_8273():Vector.<String>
        {
            return this._collapsedCategories;
        }
    }
}
