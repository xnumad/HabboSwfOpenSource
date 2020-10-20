package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.help.data.PendingGuideTicket;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuideReportingStatusMessageParser implements IMessageParser
    {
        public static const GUIDE_REPORTING_STATUS_OK:int = 0;
        public static const GUIDE_REPORTING_STATUS_PENDING_TICKET:int = 1;
        public static const GUIDE_REPORTING_STATUS_ABUSIVE:int = 2;
        public static const _Str_17955:int = 3;

        private var _Str_14988:int;
        private var _Str_17655:PendingGuideTicket;


        public function flush():Boolean
        {
            this._Str_17655 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_14988 = k.readInteger();
            if (this._Str_14988 == GUIDE_REPORTING_STATUS_PENDING_TICKET)
            {
                this._Str_17655 = new PendingGuideTicket(k);
            }
            return true;
        }

        public function get _Str_23632():int
        {
            return this._Str_14988;
        }

        public function get _Str_25474():PendingGuideTicket
        {
            return this._Str_17655;
        }

        public function get localizationCode():String
        {
            switch (this._Str_14988)
            {
                case GUIDE_REPORTING_STATUS_ABUSIVE:
                    return "blocked";
                case _Str_17955:
                    return "tooquick";
                default:
                    return "";
            }
        }
    }
}
