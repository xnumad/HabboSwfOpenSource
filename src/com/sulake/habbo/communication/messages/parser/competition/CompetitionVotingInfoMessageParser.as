package com.sulake.habbo.communication.messages.parser.competition
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.communication.enum.CompetitionVotingInfoResult;

    public class CompetitionVotingInfoMessageParser implements IMessageParser
    {
        private var _goalId:int;
        private var _goalCode:String;
        private var _resultCode:int;
        private var _votesRemaining:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._goalId = k.readInteger();
            this._goalCode = k.readString();
            this._resultCode = k.readInteger();
            this._votesRemaining = k.readInteger();
            return true;
        }

        public function get goalId():int
        {
            return this._goalId;
        }

        public function get goalCode():String
        {
            return this._goalCode;
        }

        public function get isVotingAllowedForUser():Boolean
        {
            return this._resultCode == CompetitionVotingInfoResult.ALLOWED;
        }

        public function get votesRemaining():int
        {
            return this._votesRemaining;
        }

        public function get resultCode():int
        {
            return this._resultCode;
        }
    }
}
