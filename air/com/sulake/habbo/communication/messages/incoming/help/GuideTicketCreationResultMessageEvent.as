//com.sulake.habbo.communication.messages.incoming.help.GuideTicketCreationResultMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideTicketCreationResultMessageParser;

    [SecureSWF(rename="true")]
    public class GuideTicketCreationResultMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuideTicketCreationResultMessageEvent(k:Function);

        public function getParser():GuideTicketCreationResultMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

