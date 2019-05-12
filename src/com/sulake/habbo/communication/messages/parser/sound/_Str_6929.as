package com.sulake.habbo.communication.messages.parser.sound
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.sound._Str_5724;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6929 implements IMessageParser 
    {
        private var _Str_16563:Array;


        public function get _Str_25090():Array
        {
            return this._Str_16563;
        }

        public function flush():Boolean
        {
            this._Str_16563 = new Array();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_3:String;
            var _local_4:String;
            var _local_5:String;
            var _local_6:int;
            var _local_7:String;
            var _local_10:_Str_5724;
            var _local_8:int = k.readInteger();
            var _local_9:int;
            while (_local_9 < _local_8)
            {
                _local_2 = k.readInteger();
                _local_3 = k.readString();
                _local_4 = k.readString();
                _local_5 = k.readString();
                _local_6 = k.readInteger();
                _local_7 = k.readString();
                _local_10 = new _Str_5724(_local_2, _local_6, _local_4, _local_7, _local_5);
                this._Str_16563.push(_local_10);
                _local_9++;
            }
            return true;
        }
    }
}
