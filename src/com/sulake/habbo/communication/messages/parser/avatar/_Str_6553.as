package com.sulake.habbo.communication.messages.parser.avatar
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6553 implements IMessageParser 
    {
        private var _Str_3145:int = -1;
        private var _name:String;
        private var _Str_5895:Array;


        public function get _Str_3278():int
        {
            return this._Str_3145;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get _Str_14643():Array
        {
            return this._Str_5895;
        }

        public function flush():Boolean
        {
            this._Str_3145 = -1;
            this._name = "";
            this._Str_5895 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_3145 = k.readInteger();
            this._name = k.readString();
            var _local_2:int = k.readInteger();
            this._Str_5895 = new Array();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_5895.push(k.readString());
                _local_3++;
            }
            return true;
        }
    }
}
