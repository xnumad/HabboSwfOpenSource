//com.sulake.habbo.communication.messages.parser.help.ChatReviewSessionVotingStatusMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ChatReviewSessionVotingStatusMessageParser implements IMessageParser {

        public static const AWAITING_VOTE:int;
        public static const VOTED_OK:int;
        public static const VOTED_BAD:int;
        public static const VOTED_VERY_BAD:int;
        public static const NO_VOTE:int;
        public static const FINDING_NEW_VOTER:int;

        private var _status:Array;

        public function ChatReviewSessionVotingStatusMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get status():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.help

