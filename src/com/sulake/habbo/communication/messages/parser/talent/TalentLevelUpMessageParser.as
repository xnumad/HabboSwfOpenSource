package com.sulake.habbo.communication.messages.parser.talent
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class TalentLevelUpMessageParser implements IMessageParser 
    {
        private var _talentTrackName:String;
        private var _level:int;
        private var _rewardPerks:Vector.<TalentTrackRewardPerk>;
        private var _rewardProducts:Vector.<TalentTrackRewardProduct>;


        public function flush():Boolean
        {
            this._talentTrackName = null;
            this._rewardPerks = null;
            this._rewardProducts = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            this._talentTrackName = k.readString();
            this._level = k.readInteger();
            this._rewardPerks = new Vector.<TalentTrackRewardPerk>();
            var _local_3:int = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._rewardPerks.push(new TalentTrackRewardPerk(k));
                _local_2++;
            }
            this._rewardProducts = new Vector.<TalentTrackRewardProduct>();
            var _local_4:int = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_4)
            {
                this._rewardProducts.push(new TalentTrackRewardProduct(k));
                _local_2++;
            }
            return true;
        }

        public function get talentTrackName():String
        {
            return this._talentTrackName;
        }

        public function get level():int
        {
            return this._level;
        }

        public function get _Str_8893():Vector.<TalentTrackRewardPerk>
        {
            return this._rewardPerks;
        }

        public function get _Str_7068():Vector.<TalentTrackRewardProduct>
        {
            return this._rewardProducts;
        }
    }
}
