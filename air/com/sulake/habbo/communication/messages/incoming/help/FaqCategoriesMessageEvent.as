//com.sulake.habbo.communication.messages.incoming.help.FaqCategoriesMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.FaqCategoriesMessageParser;

    [SecureSWF(rename="true")]
    public class FaqCategoriesMessageEvent extends MessageEvent implements IMessageEvent {

        public function FaqCategoriesMessageEvent(k:Function);

        public function getParser():FaqCategoriesMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

