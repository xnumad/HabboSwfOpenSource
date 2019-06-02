//com.sulake.habbo.communication.messages.parser.help.GuideReportingStatusMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.help.data.PendingGuideTicket;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuideReportingStatusMessageParser implements IMessageParser {

        public static const GUIDE_REPORTING_STATUS_OK:int;
        public static const GUIDE_REPORTING_STATUS_PENDING_TICKET:int;
        public static const GUIDE_REPORTING_STATUS_ABUSIVE:int;
        public static const GUIDE_REPORTING_STATUS_REPORTING_TOO_QUICKLY:int;

        private var _statusCode:int;
        private var _pendingTicket:PendingGuideTicket;

        public function GuideReportingStatusMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get statusCode():int;

        public function get pendingTicket():PendingGuideTicket;

        public function get localizationCode():String;


    }
}//package com.sulake.habbo.communication.messages.parser.help

