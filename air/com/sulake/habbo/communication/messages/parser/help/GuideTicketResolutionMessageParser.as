//com.sulake.habbo.communication.messages.parser.help.GuideTicketResolutionMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuideTicketResolutionMessageParser implements IMessageParser {

        private static const RESOLUTION_GUARDIANS_TOOK_ACTION:int;
        private static const RESOLUTION_FORWARDED_TO_MODERATORS:int;
        private static const RESOLUTION_REPORTER_IS_ABUSIVE:int;

        private var _resolution:int;

        public function GuideTicketResolutionMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get localizationCode():String;


    }
}//package com.sulake.habbo.communication.messages.parser.help

