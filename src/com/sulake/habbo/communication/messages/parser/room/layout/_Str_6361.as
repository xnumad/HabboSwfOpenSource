package com.sulake.habbo.communication.messages.parser.room.layout
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6361 implements IMessageParser 
    {
        private var _Str_17579:Array;


        public function get _Str_24835():Array
        {
            return this._Str_17579;
        }

        public function flush():Boolean
        {
            this._Str_17579 = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readInteger();
                _local_5 = k.readInteger();
                this._Str_17579.push({
                    "x":_local_4,
                    "y":_local_5
                });
                _local_3++;
            }
            return true;
        }
    }
}
