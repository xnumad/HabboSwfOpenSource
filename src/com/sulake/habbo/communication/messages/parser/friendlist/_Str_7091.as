package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7091 implements IMessageParser 
    {
        private var _errorCode:int;
        private var _userId:int;
        private var _message:String;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._errorCode = k.readInteger();
            this._userId = k.readInteger();
            this._message = k.readString();
            return true;
        }

        public function get errorCode():int
        {
            return this._errorCode;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get message():String
        {
            return this._message;
        }
    }
}
