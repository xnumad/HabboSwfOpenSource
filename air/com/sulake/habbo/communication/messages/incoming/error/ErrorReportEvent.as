//com.sulake.habbo.communication.messages.incoming.error.ErrorReportEvent

package com.sulake.habbo.communication.messages.incoming.error{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.error.ErrorReportMessageParser;

    [SecureSWF(rename="true")]
    public class ErrorReportEvent extends MessageEvent implements IMessageEvent {

        public function ErrorReportEvent(k:Function);

        public function getParser():ErrorReportMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.error

