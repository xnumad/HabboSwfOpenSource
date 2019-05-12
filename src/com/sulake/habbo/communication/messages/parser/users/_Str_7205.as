package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7205 implements IMessageParser 
    {
        private var _result:int;
        private var _nameValidationInfo:String;


        public function get result():int
        {
            return this._result;
        }

        public function get nameValidationInfo():String
        {
            return this._nameValidationInfo;
        }

        public function flush():Boolean
        {
            this._result = -1;
            this._nameValidationInfo = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._result = k.readInteger();
            this._nameValidationInfo = k.readString();
            return true;
        }
    }
}
