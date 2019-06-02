//com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent

package com.sulake.habbo.communication.messages.incoming.avatar{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;

    [SecureSWF(rename="true")]
    public class ChangeUserNameResultMessageEvent extends MessageEvent implements IMessageEvent {

        public static var NAME_OK:int;
        public static var ERROR_NAME_REQUIRED:int;
        public static var ERROR_NAME_TOO_SHORT:int;
        public static var ERROR_NAME_TOO_LONG:int;
        public static var ERROR_NAME_NOT_VALID:int;
        public static var ERROR_NAME_IN_USE:int;
        public static var ERROR_NAME_CHANGE_NOT_ALLOWED:int;
        public static var ERROR_MERGE_HOTEL_DOWN:int;

        public function ChangeUserNameResultMessageEvent(k:Function);

        public function getParser():ChangeUserNameResultMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.avatar

