package com.sulake.habbo.communication.messages.incoming.avatar
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;

    public class CheckUserNameResultMessageEvent extends MessageEvent implements IMessageEvent
    {
        public static var NAME_OK:int = 0;
        public static var ERROR_NAME_REQUIRED:int = 1;
        public static var ERROR_NAME_TOO_SHORT:int = 2;
        public static var ERROR_NAME_TOO_LONG:int = 3;
        public static var ERROR_NAME_NOT_VALID:int = 4;
        public static var ERROR_NAME_IN_USE:int = 5;

        public function CheckUserNameResultMessageEvent(k:Function)
        {
            super(k, CheckUserNameResultMessageParser);
        }

        public function getParser():CheckUserNameResultMessageParser
        {
            return _parser as CheckUserNameResultMessageParser;
        }
    }
}
