//com.sulake.habbo.communication.messages.incoming.help.GuideSessionPartnerIsTypingMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionPartnerIsTypingMessageParser;

    [SecureSWF(rename="true")]
    public class GuideSessionPartnerIsTypingMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuideSessionPartnerIsTypingMessageEvent(k:Function);

        public function getParser():GuideSessionPartnerIsTypingMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

