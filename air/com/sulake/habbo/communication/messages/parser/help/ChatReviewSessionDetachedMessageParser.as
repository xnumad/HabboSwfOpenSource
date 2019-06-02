//com.sulake.habbo.communication.messages.parser.help.ChatReviewSessionDetachedMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ChatReviewSessionDetachedMessageParser implements IMessageParser {

        public function ChatReviewSessionDetachedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.help

