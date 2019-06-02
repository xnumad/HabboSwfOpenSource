//com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalData

package com.sulake.habbo.communication.messages.incoming.quest{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CommunityGoalData implements IDisposable {

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

        public function CommunityGoalData(k:IMessageDataWrapper):void;

        public function dispose():void;

        public function get disposed():Boolean;

        public function get hasGoalExpired():Boolean;

        public function get personalContributionScore():int;

        public function get personalContributionRank():int;

        public function get communityTotalScore():int;

        public function get communityHighestAchievedLevel():int;

        public function get scoreRemainingUntilNextLevel():int;

        public function get percentCompletionTowardsNextLevel():int;

        public function get timeRemainingInSeconds():int;

        public function get rewardUserLimits():Array;

        public function get goalCode():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.quest

