//com.sulake.habbo.communication.messages.parser.help.ChatReviewSessionOfferedToGuideMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ChatReviewSessionOfferedToGuideMessageParser implements IMessageParser {

        private var _acceptanceTimeout:int;

        public function ChatReviewSessionOfferedToGuideMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get acceptanceTimeout():int;


    }
}//package com.sulake.habbo.communication.messages.parser.help

