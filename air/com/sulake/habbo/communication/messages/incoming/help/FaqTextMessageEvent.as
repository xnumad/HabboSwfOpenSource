//com.sulake.habbo.communication.messages.incoming.help.FaqTextMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.FaqTextMessageParser;

    [SecureSWF(rename="true")]
    public class FaqTextMessageEvent extends MessageEvent implements IMessageEvent {

        public function FaqTextMessageEvent(k:Function);

        public function getParser():FaqTextMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

