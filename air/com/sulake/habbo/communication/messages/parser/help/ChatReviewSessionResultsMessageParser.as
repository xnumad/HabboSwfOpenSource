//com.sulake.habbo.communication.messages.parser.help.ChatReviewSessionResultsMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ChatReviewSessionResultsMessageParser implements IMessageParser {

        private var _winningVoteCode:int;
        private var _ownVoteCode:int;
        private var _finalStatus:Array;

        public function ChatReviewSessionResultsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get winningVoteCode():int;

        public function get ownVoteCode():int;

        public function get finalStatus():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.help

