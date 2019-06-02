//com.sulake.habbo.communication.messages.incoming.help.ChatReviewSessionOfferedToGuideMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.ChatReviewSessionOfferedToGuideMessageParser;

    [SecureSWF(rename="true")]
    public class ChatReviewSessionOfferedToGuideMessageEvent extends MessageEvent implements IMessageEvent {

        public function ChatReviewSessionOfferedToGuideMessageEvent(k:Function);

        public function getParser():ChatReviewSessionOfferedToGuideMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

