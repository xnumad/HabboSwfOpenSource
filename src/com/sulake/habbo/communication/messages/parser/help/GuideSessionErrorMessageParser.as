package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuideSessionErrorMessageParser implements IMessageParser 
    {
        public static const ERROR_GENERIC:int = 0;
        public static const ERROR_GUIDES_REJECT:int = 1;
        public static const ERROR_NOT_ENOUGH_GUIDES:int = 2;
        public static const ERROR_NOT_ENOUGH_VOTES:int = 3;
        public static const ERROR_NO_CHATLOG_FOUND:int = 4;

        private var _errorCode:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._errorCode = k.readInteger();
            return true;
        }

        public function get errorCode():int
        {
            return this._errorCode;
        }
    }
}
