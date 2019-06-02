//com.sulake.habbo.communication.messages.parser.talent.TalentLevelUpMessageParser

package com.sulake.habbo.communication.messages.parser.talent{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class TalentLevelUpMessageParser implements IMessageParser {

        private var _talentTrackName:String;
        private var _level:int;
        private var _rewardPerks:Vector.<TalentTrackRewardPerk>;
        private var _rewardProducts:Vector.<TalentTrackRewardProduct>;

        public function TalentLevelUpMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get talentTrackName():String;

        public function get level():int;

        public function get rewardPerks():Vector.<TalentTrackRewardPerk>;

        public function get rewardProducts():Vector.<TalentTrackRewardProduct>;


    }
}//package com.sulake.habbo.communication.messages.parser.talent

