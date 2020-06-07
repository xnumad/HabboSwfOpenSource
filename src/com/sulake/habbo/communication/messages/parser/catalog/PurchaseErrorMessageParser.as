package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PurchaseErrorMessageParser implements IMessageParser
    {
        private var _errorCode:int = 0;


        public function get errorCode():int
        {
            return this._errorCode;
        }

        public function flush():Boolean
        {
            this._errorCode = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._errorCode = k.readInteger();
            return true;
        }
    }
}
