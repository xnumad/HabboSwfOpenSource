//com.sulake.habbo.communication.messages.incoming.help.ChatReviewSessionResultsMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.ChatReviewSessionResultsMessageParser;

    [SecureSWF(rename="true")]
    public class ChatReviewSessionResultsMessageEvent extends MessageEvent implements IMessageEvent {

        public function ChatReviewSessionResultsMessageEvent(k:Function);

        public function getParser():ChatReviewSessionResultsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

