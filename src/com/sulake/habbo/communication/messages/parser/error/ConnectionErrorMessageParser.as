package com.sulake.habbo.communication.messages.parser.error
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ConnectionErrorMessageParser implements IMessageParser 
    {
        private var _errorCode:int;
        private var _messageId:int;
        private var _timestamp:String;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._messageId = k.readInteger();
            this._errorCode = k.readInteger();
            this._timestamp = k.readString();
            return true;
        }

        public function flush():Boolean
        {
            this._errorCode = 0;
            this._messageId = 0;
            this._timestamp = null;
            return true;
        }

        public function get errorCode():int
        {
            return this._errorCode;
        }

        public function get messageId():int
        {
            return this._messageId;
        }

        public function get timestamp():String
        {
            return this._timestamp;
        }
    }
}
