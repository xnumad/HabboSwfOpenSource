//com.sulake.habbo.communication.messages.parser.competition.CompetitionVotingInfoMessageParser

package com.sulake.habbo.communication.messages.parser.competition{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CompetitionVotingInfoMessageParser implements IMessageParser {

        private var _goalId:int;
        private var _goalCode:String;
        private var _resultCode:int;
        private var _votesRemaining:int;

        public function CompetitionVotingInfoMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get goalId():int;

        public function get goalCode():String;

        public function get isVotingAllowedForUser():Boolean;

        public function get votesRemaining():int;

        public function get resultCode():int;


    }
}//package com.sulake.habbo.communication.messages.parser.competition

