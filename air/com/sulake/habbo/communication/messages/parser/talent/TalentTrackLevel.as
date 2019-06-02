//com.sulake.habbo.communication.messages.parser.talent.TalentTrackLevel

package com.sulake.habbo.communication.messages.parser.talent{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TalentTrackLevel {

        private var _level:int;
        private var _state:int;
        private var _tasks:Vector.<TalentTrackTask>;
        private var _rewardPerks:Vector.<TalentTrackRewardPerk>;
        private var _rewardProducts:Vector.<TalentTrackRewardProduct>;

        public function TalentTrackLevel();

        public function parse(k:IMessageDataWrapper):void;

        public function get level():int;

        public function set level(k:int):void;

        public function get state():int;

        public function set state(k:int):void;

        public function get tasks():Vector.<TalentTrackTask>;

        public function get rewardPerks():Vector.<TalentTrackRewardPerk>;

        public function get rewardProducts():Vector.<TalentTrackRewardProduct>;

        public function get rewardCount():int;

        public function get levelProgress():Number;

        public function findTaskByAchievementId(k:int):TalentTrackTask;


    }
}//package com.sulake.habbo.communication.messages.parser.talent

