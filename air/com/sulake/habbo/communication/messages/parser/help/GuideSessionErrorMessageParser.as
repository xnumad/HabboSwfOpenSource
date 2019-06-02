//com.sulake.habbo.communication.messages.parser.help.GuideSessionErrorMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuideSessionErrorMessageParser implements IMessageParser {

        public static const ERROR_GENERIC:int;
        public static const ERROR_GUIDES_REJECT:int;
        public static const ERROR_NOT_ENOUGH_GUIDES:int;
        public static const ERROR_NOT_ENOUGH_VOTES:int;
        public static const ERROR_NO_CHATLOG_FOUND:int;

        private var _errorCode:int;

        public function GuideSessionErrorMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get errorCode():int;


    }
}//package com.sulake.habbo.communication.messages.parser.help

