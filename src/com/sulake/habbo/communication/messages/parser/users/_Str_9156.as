package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9156 implements IMessageParser 
    {
        private var _result:int;
        private var _name:String;

        public function _Str_9156()
        {
            this._result = -1;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._result = k.readInteger();
            this._name = k.readString();
            return true;
        }

        public function get result():int
        {
            return this._result;
        }

        public function get name():String
        {
            return this._name;
        }
    }
}
