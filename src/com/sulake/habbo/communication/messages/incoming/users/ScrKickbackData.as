package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ScrKickbackData 
    {
        private var _currentHcStreak:int;
        private var _firstSubscriptionDate:String;
        private var _kickbackPercentage:Number;
        private var _totalCreditsMissed:int;
        private var _totalCreditsRewarded:int;
        private var _totalCreditsSpent:int;
        private var _creditRewardForStreakBonus:int;
        private var _creditRewardForMonthlySpent:int;
        private var _timeUntilPayday:int;

        public function ScrKickbackData(k:IMessageDataWrapper=null)
        {
            this._currentHcStreak = k.readInteger();
            this._firstSubscriptionDate = k.readString();
            this._kickbackPercentage = k.readDouble();
            this._totalCreditsMissed = k.readInteger();
            this._totalCreditsRewarded = k.readInteger();
            this._totalCreditsSpent = k.readInteger();
            this._creditRewardForStreakBonus = k.readInteger();
            this._creditRewardForMonthlySpent = k.readInteger();
            this._timeUntilPayday = k.readInteger();
        }

        public function get _Str_25314():int
        {
            return this._currentHcStreak;
        }

        public function get _Str_25452():String
        {
            return this._firstSubscriptionDate;
        }

        public function get _Str_8404():Number
        {
            return this._kickbackPercentage;
        }

        public function get _Str_26025():int
        {
            return this._totalCreditsMissed;
        }

        public function get _Str_26262():int
        {
            return this._totalCreditsRewarded;
        }

        public function get _Str_21847():int
        {
            return this._totalCreditsSpent;
        }

        public function get _Str_14016():int
        {
            return this._creditRewardForStreakBonus;
        }

        public function get _Str_19650():int
        {
            return this._creditRewardForMonthlySpent;
        }

        public function get _Str_20889():int
        {
            return this._timeUntilPayday;
        }
    }
}
