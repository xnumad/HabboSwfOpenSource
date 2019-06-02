//com.sulake.habbo.communication.messages.parser.help.ChatReviewSessionStartedMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ChatReviewSessionStartedMessageParser implements IMessageParser {

        private var _votingTimeout:int;
        private var _chatRecord:String;

        public function ChatReviewSessionStartedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get votingTimeout():int;

        public function get chatRecord():String;


    }
}//package com.sulake.habbo.communication.messages.parser.help

