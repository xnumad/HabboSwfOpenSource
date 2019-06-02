//com.sulake.habbo.communication.messages.incoming.help.FaqSearchResultsMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.FaqSearchResultsMessageParser;

    [SecureSWF(rename="true")]
    public class FaqSearchResultsMessageEvent extends MessageEvent implements IMessageEvent {

        public function FaqSearchResultsMessageEvent(k:Function);

        public function getParser():FaqSearchResultsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

