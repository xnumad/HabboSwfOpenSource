package com.sulake.habbo.catalog.purse
{
    import flash.utils.Dictionary;
    import flash.utils.getTimer;

    public class Purse implements IPurse 
    {
        private var _credits:int = 0;
        private var _activityPoints:Dictionary;
        private var _clubDays:int = 0;
        private var _clubPeriods:int = 0;
        private var _isVIP:Boolean = false;
        private var _pastClubDays:int = 0;
        private var _pastVipDays:int = 0;
        private var _isExpiring:Boolean = false;
        private var _minutesUntilExpiration:int = 0;
        private var _minutesSinceLastModified:int;
        private var _lastUpdated:int;

        public function Purse()
        {
            this._activityPoints = new Dictionary();
            super();
        }

        public function get credits():int
        {
            return this._credits;
        }

        public function set credits(k:int):void
        {
            this._lastUpdated = getTimer();
            this._credits = k;
        }

        public function get clubDays():int
        {
            return this._clubDays;
        }

        public function set clubDays(k:int):void
        {
            this._lastUpdated = getTimer();
            this._clubDays = k;
        }

        public function get clubPeriods():int
        {
            return this._clubPeriods;
        }

        public function set clubPeriods(k:int):void
        {
            this._lastUpdated = getTimer();
            this._clubPeriods = k;
        }

        public function get hasClubLeft():Boolean
        {
            return (this._clubDays > 0) || (this._clubPeriods > 0);
        }

        public function get isVIP():Boolean
        {
            return this._isVIP;
        }

        public function get _Str_14389():Boolean
        {
            return this._isExpiring;
        }

        public function set _Str_14389(k:Boolean):void
        {
            this._isExpiring = k;
        }

        public function set isVIP(k:Boolean):void
        {
            this._isVIP = k;
        }

        public function get pastClubDays():int
        {
            return this._pastClubDays;
        }

        public function set pastClubDays(k:int):void
        {
            this._lastUpdated = getTimer();
            this._pastClubDays = k;
        }

        public function get pastVipDays():int
        {
            return this._pastVipDays;
        }

        public function set pastVipDays(k:int):void
        {
            this._lastUpdated = getTimer();
            this._pastVipDays = k;
        }

        public function get _Str_18527():Dictionary
        {
            return this._activityPoints;
        }

        public function set _Str_18527(k:Dictionary):void
        {
            this._lastUpdated = getTimer();
            this._activityPoints = k;
        }

        public function getActivityPointsForType(k:int):int
        {
            return this._activityPoints[k];
        }

        public function set minutesUntilExpiration(k:int):void
        {
            this._lastUpdated = getTimer();
            this._minutesUntilExpiration = k;
        }

        public function get minutesUntilExpiration():int
        {
            var k:int = ((getTimer() - this._lastUpdated) / (1000 * 60));
            var _local_2:int = (this._minutesUntilExpiration - k);
            return (_local_2 > 0) ? _local_2 : 0;
        }

        public function set _Str_6312(k:int):void
        {
            this._lastUpdated = getTimer();
            this._minutesSinceLastModified = k;
        }

        public function get _Str_6312():int
        {
            return this._minutesSinceLastModified;
        }

        public function get _Str_26225():int
        {
            return this._lastUpdated;
        }
    }
}
