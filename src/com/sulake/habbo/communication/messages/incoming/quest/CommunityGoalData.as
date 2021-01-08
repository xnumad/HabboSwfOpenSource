package com.sulake.habbo.communication.messages.incoming.quest
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CommunityGoalData implements IDisposable
    {
        private var _hasGoalExpired:Boolean;
        private var _personalContributionScore:int;
        private var _personalContributionRank:int;
        private var _communityTotalScore:int;
        private var _communityHighestAchievedLevel:int;
        private var _scoreRemainingUntilNextLevel:int;
        private var _percentCompletionTowardsNextLevel:int;
        private var _goalCode:String;
        private var _timeRemainingInSeconds:int;
        private var _rewardUserLimits:Array;

        public function CommunityGoalData(k:IMessageDataWrapper):void
        {
            this._rewardUserLimits = [];
            super();
            this._hasGoalExpired = k.readBoolean();
            this._personalContributionScore = k.readInteger();
            this._personalContributionRank = k.readInteger();
            this._communityTotalScore = k.readInteger();
            this._communityHighestAchievedLevel = k.readInteger();
            this._scoreRemainingUntilNextLevel = k.readInteger();
            this._percentCompletionTowardsNextLevel = k.readInteger();
            this._goalCode = k.readString();
            this._timeRemainingInSeconds = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._rewardUserLimits.push(k.readInteger());
                _local_3++;
            }
        }

        public function dispose():void
        {
            this._rewardUserLimits = null;
        }

        public function get disposed():Boolean
        {
            return this._rewardUserLimits == null;
        }

        public function get _Str_13028():Boolean
        {
            return this._hasGoalExpired;
        }

        public function get personalContributionScore():int
        {
            return this._personalContributionScore;
        }

        public function get _Str_10549():int
        {
            return this._personalContributionRank;
        }

        public function get _Str_12030():int
        {
            return this._communityTotalScore;
        }

        public function get communityHighestAchievedLevel():int
        {
            return this._communityHighestAchievedLevel;
        }

        public function get scoreRemainingUntilNextLevel():int
        {
            return this._scoreRemainingUntilNextLevel;
        }

        public function get percentCompletionTowardsNextLevel():int
        {
            return this._percentCompletionTowardsNextLevel;
        }

        public function get _Str_24637():int
        {
            return this._timeRemainingInSeconds;
        }

        public function get _Str_20155():Array
        {
            return this._rewardUserLimits;
        }

        public function get goalCode():String
        {
            return this._goalCode;
        }
    }
}
