//com.sulake.habbo.communication.messages.incoming.help.FaqClientFaqsMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.FaqClientFaqsMessageParser;

    [SecureSWF(rename="true")]
    public class FaqClientFaqsMessageEvent extends MessageEvent implements IMessageEvent {

        public function FaqClientFaqsMessageEvent(k:Function);

        public function getParser():FaqClientFaqsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

