package com.sulake.habbo.communication.messages.incoming.error
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.error.ErrorReportMessageParser;

    public class ErrorReportEvent extends MessageEvent implements IMessageEvent 
    {
        public function ErrorReportEvent(k:Function)
        {
            super(k, ErrorReportMessageParser);
        }

        public function getParser():ErrorReportMessageParser
        {
            return this._parser as ErrorReportMessageParser;
        }
    }
}
