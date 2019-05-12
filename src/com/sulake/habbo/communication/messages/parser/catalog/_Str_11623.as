package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_11623 implements IMessageParser 
    {
        private var _errorCode:String = "";


        public function flush():Boolean
        {
            this._errorCode = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._errorCode = k.readString();
            return true;
        }

        public function get errorCode():String
        {
            return this._errorCode;
        }
    }
}
