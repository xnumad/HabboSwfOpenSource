package com.sulake.habbo.communication.messages.parser.groupforums
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5953 implements IMessageParser 
    {
        private var _Str_9742:int;
        private var _totalAmount:int;
        private var _startIndex:int;
        private var _amount:int;
        private var _forums:Array;


        public function get _Str_5154():int
        {
            return this._Str_9742;
        }

        public function get totalAmount():int
        {
            return this._totalAmount;
        }

        public function get startIndex():int
        {
            return this._startIndex;
        }

        public function get amount():int
        {
            return this._amount;
        }

        public function get forums():Array
        {
            return this._forums;
        }

        public function flush():Boolean
        {
            this._forums = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_9742 = k.readInteger();
            this._totalAmount = k.readInteger();
            this._startIndex = k.readInteger();
            this._amount = k.readInteger();
            this._forums = new Array();
            var _local_2:int;
            while (_local_2 < this.amount)
            {
                this._forums.push(_Str_2807._Str_4933(k));
                _local_2++;
            }
            return true;
        }
    }
}
