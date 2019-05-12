package com.sulake.habbo.communication.messages.parser.poll
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7466 implements IMessageParser 
    {
        private var _userId:int;
        private var _value:String;
        private var _Str_4154:Map;


        public function get userId():int
        {
            return this._userId;
        }

        public function get value():String
        {
            return this._value;
        }

        public function get _Str_4036():Map
        {
            return this._Str_4154;
        }

        public function flush():Boolean
        {
            this._userId = -1;
            this._value = "";
            this._Str_4154 = null;
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var key:String;
            var value:int;
            this._userId = k.readInteger();
            this._value = k.readString();
            this._Str_4154 = new Map();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                key = k.readString();
                value = k.readInteger();
                this._Str_4154.add(key, value);
                _local_3++;
            }
            return true;
        }
    }
}
