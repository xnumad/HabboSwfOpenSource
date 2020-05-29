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

        public function get currentHcStreak():int
        {
            return this._currentHcStreak;
        }

        public function get firstSubscriptionDate():String
        {
            return this._firstSubscriptionDate;
        }

        public function get kickbackPercentage():Number
        {
            return this._kickbackPercentage;
        }

        public function get totalCreditsMissed():int
        {
            return this._totalCreditsMissed;
        }

        public function get totalCreditsRewarded():int
        {
            return this._totalCreditsRewarded;
        }

        public function get totalCreditsSpent():int
        {
            return this._totalCreditsSpent;
        }

        public function get creditRewardForStreakBonus():int
        {
            return this._creditRewardForStreakBonus;
        }

        public function get creditRewardForMonthlySpent():int
        {
            return this._creditRewardForMonthlySpent;
        }

        public function get timeUntilPayday():int
        {
            return this._timeUntilPayday;
        }
    }
}
