//com.sulake.habbo.communication.messages.incoming.quest.PrizeData

package com.sulake.habbo.communication.messages.incoming.quest{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PrizeData {

        private var _communityGoalId:int;
        private var _communityGoalCode:String;
        private var _userRank:int;
        private var _rewardCode:String;
        private var _badge:Boolean;
        private var _localizedName:String;

        public function PrizeData(k:IMessageDataWrapper);

        public function get communityGoalId():int;

        public function get communityGoalCode():String;

        public function get userRank():int;

        public function get rewardCode():String;

        public function get badge():Boolean;

        public function get localizedName():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.quest

