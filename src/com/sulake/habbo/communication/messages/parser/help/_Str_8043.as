package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8043 implements IMessageParser 
    {
        private var _Str_3912:String;
        private var _Str_5004:Array;


        public function flush():Boolean
        {
            this._Str_3912 = null;
            this._Str_5004 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_3912 = k.readString();
            this._Str_5004 = [];
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_5004.push(k.readInteger());
                _local_3++;
            }
            return true;
        }

        public function get _Str_21852():String
        {
            return this._Str_3912;
        }

        public function get _Str_25814():Array
        {
            return this._Str_5004;
        }
    }
}
