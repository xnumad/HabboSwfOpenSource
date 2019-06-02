//com.sulake.habbo.communication.messages.incoming.help.GuideTicketResolutionMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideTicketResolutionMessageParser;

    [SecureSWF(rename="true")]
    public class GuideTicketResolutionMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuideTicketResolutionMessageEvent(k:Function);

        public function getParser():GuideTicketResolutionMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

