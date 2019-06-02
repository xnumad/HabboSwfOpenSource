//com.sulake.habbo.communication.messages.parser.help.GuideTicketCreationResultMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuideTicketCreationResultMessageParser implements IMessageParser {

        private static const CREATION_RESULT_OK:int;
        private static const CREATION_RESULT_UNABLE_TO_REPORT:int;
        private static const CREATION_RESULT_NO_CHATLOG_FOUND:int;
        private static const CREATION_RESULT_BULLY_ALREADY_REPORTED:int;

        private var _result:int;

        public function GuideTicketCreationResultMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get localizationCode():String;


    }
}//package com.sulake.habbo.communication.messages.parser.help

