package com.sulake.habbo.communication.messages.parser.recycler
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming._Str_329._Str_8691;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RecyclerPrizesMessageParser implements IMessageParser 
    {
        private var _prizeLevels:Array;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            this._prizeLevels = new Array();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._prizeLevels.push(new _Str_8691(k));
                _local_3++;
            }
            return true;
        }

        public function get prizeLevels():Array
        {
            return this._prizeLevels;
        }
    }
}
