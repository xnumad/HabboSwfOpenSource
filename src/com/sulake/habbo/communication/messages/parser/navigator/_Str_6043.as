package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6043 implements IMessageParser 
    {
        private var _limit:int;
        private var _Str_18010:Array;


        public function flush():Boolean
        {
            this._Str_18010 = new Array();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._limit = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_18010.push(k.readInteger());
                _local_3++;
            }
            return true;
        }

        public function get limit():int
        {
            return this._limit;
        }

        public function get _Str_13809():Array
        {
            return this._Str_18010;
        }
    }
}
