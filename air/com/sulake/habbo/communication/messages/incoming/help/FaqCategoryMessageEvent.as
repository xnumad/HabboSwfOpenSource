//com.sulake.habbo.communication.messages.incoming.help.FaqCategoryMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.FaqCategoryMessageParser;

    [SecureSWF(rename="true")]
    public class FaqCategoryMessageEvent extends MessageEvent implements IMessageEvent {

        public function FaqCategoryMessageEvent(k:Function);

        public function getParser():FaqCategoryMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

