//com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent

package com.sulake.habbo.communication.messages.incoming.avatar{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;

    [SecureSWF(rename="true")]
    public class CheckUserNameResultMessageEvent extends MessageEvent implements IMessageEvent {

        public static var NAME_OK:int;
        public static var ERROR_NAME_REQUIRED:int;
        public static var ERROR_NAME_TOO_SHORT:int;
        public static var ERROR_NAME_TOO_LONG:int;
        public static var ERROR_NAME_NOT_VALID:int;
        public static var ERROR_NAME_IN_USE:int;

        public function CheckUserNameResultMessageEvent(k:Function);

        public function getParser():CheckUserNameResultMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.avatar

