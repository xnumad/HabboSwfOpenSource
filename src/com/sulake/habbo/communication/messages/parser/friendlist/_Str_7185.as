package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_5148;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7185 implements IMessageParser 
    {
        private var _Str_19675:int;
        private var _Str_20837:int;
        private var _Str_21180:int;
        private var _categories:Array;


        public function flush():Boolean
        {
            this._categories = new Array();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_19675 = k.readInteger();
            this._Str_20837 = k.readInteger();
            this._Str_21180 = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._categories.push(new _Str_5148(k));
                _local_3++;
            }
            return true;
        }

        public function get _Str_22808():int
        {
            return this._Str_19675;
        }

        public function get _Str_26195():int
        {
            return this._Str_20837;
        }

        public function get _Str_23653():int
        {
            return this._Str_21180;
        }

        public function get categories():Array
        {
            return this._categories;
        }
    }
}
