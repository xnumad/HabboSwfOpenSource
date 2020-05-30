package com.sulake.habbo.communication.messages.incoming.avatar
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.avatar._Str_6553;

    public class ChangeUserNameResultMessageEvent extends MessageEvent implements IMessageEvent
    {
        public static var NAME_OK:int = 0;
        public static var ERROR_NAME_REQUIRED:int = 1;
        public static var ERROR_NAME_TOO_SHORT:int = 2;
        public static var ERROR_NAME_TOO_LONG:int = 3;
        public static var ERROR_NAME_NOT_VALID:int = 4;
        public static var ERROR_NAME_IN_USE:int = 5;
        public static var ERROR_NAME_CHANGE_NOT_ALLOWED:int = 6;
        public static var ERROR_MERGE_HOTEL_DOWN:int = 7;

        public function ChangeUserNameResultMessageEvent(k:Function)
        {
            super(k, _Str_6553);
        }

        public function getParser():_Str_6553
        {
            return _parser as _Str_6553;
        }
    }
}
