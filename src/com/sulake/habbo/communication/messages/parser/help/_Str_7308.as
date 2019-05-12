package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7308 implements IMessageParser 
    {
        private var _Str_3912:String;
        private var _Str_6079:Array;


        public function flush():Boolean
        {
            this._Str_3912 = null;
            this._Str_6079 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_3912 = k.readString();
            this._Str_6079 = [];
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_6079.push(k.readInteger());
                _local_3++;
            }
            return true;
        }

        public function get _Str_21852():String
        {
            return this._Str_3912;
        }

        public function get _Str_23947():Array
        {
            return this._Str_6079;
        }
    }
}
