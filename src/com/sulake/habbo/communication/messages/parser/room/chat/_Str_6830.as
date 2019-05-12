package com.sulake.habbo.communication.messages.parser.room.chat
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6830 implements IMessageParser 
    {
        private var _Str_3930:Array;


        public function get _Str_13264():Array
        {
            return this._Str_3930;
        }

        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_3930 = new Array();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_3930.push(k.readString());
                _local_3++;
            }
            return false;
        }
    }
}
