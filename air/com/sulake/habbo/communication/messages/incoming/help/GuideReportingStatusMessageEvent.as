//com.sulake.habbo.communication.messages.incoming.help.GuideReportingStatusMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideReportingStatusMessageParser;

    [SecureSWF(rename="true")]
    public class GuideReportingStatusMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuideReportingStatusMessageEvent(k:Function);

        public function getParser():GuideReportingStatusMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

