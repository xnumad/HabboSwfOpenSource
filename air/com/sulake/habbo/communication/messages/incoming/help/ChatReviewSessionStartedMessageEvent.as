//com.sulake.habbo.communication.messages.incoming.help.ChatReviewSessionStartedMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.ChatReviewSessionStartedMessageParser;

    [SecureSWF(rename="true")]
    public class ChatReviewSessionStartedMessageEvent extends MessageEvent implements IMessageEvent {

        public function ChatReviewSessionStartedMessageEvent(k:Function);

        public function getParser():ChatReviewSessionStartedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

