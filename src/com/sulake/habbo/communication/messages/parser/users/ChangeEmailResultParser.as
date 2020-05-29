package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ChangeEmailResultParser implements IMessageParser
    {
        public static const EMAIL_STATUS_OK:int = 0;

        private var _result:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._result = k.readInteger();
            return true;
        }

        public function get result():int
        {
            return this._result;
        }
    }
}
