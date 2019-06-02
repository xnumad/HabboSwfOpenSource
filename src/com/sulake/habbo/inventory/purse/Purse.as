package com.sulake.habbo.inventory.purse
{
    import flash.utils.getTimer;

    public class Purse 
    {
        private var _isExpiring:Boolean = false;
        private var _isCitizenshipVipExpiring:Boolean = false;
        private var _clubDays:int = 0;
        private var _clubPeriods:int = 0;
        private var _clubPastPeriods:int = 0;
        private var _clubHasEverBeenMember:Boolean = false;
        private var _isVIP:Boolean = false;
        private var _minutesUntilExpiration:int = 0;
        private var _minutesSinceLastModified:int = -1;
        private var _lastUpdated:int;


        public function get clubDays():int
        {
            return this._clubDays;
        }

        public function set clubDays(k:int):void
        {
            this._lastUpdated = getTimer();
            this._clubDays = Math.max(0, k);
        }

        public function get clubPeriods():int
        {
            return this._clubPeriods;
        }

        public function set clubPeriods(k:int):void
        {
            this._lastUpdated = getTimer();
            this._clubPeriods = Math.max(0, k);
        }

        public function get _Str_9487():int
        {
            return this._clubPastPeriods;
        }

        public function set _Str_9487(k:int):void
        {
            this._lastUpdated = getTimer();
            this._clubPastPeriods = Math.max(0, k);
        }

        public function get _Str_11984():Boolean
        {
            return this._clubHasEverBeenMember;
        }

        public function set _Str_11984(k:Boolean):void
        {
            this._lastUpdated = getTimer();
            this._clubHasEverBeenMember = k;
        }

        public function get isVIP():Boolean
        {
            return this._isVIP;
        }

        public function set isVIP(k:Boolean):void
        {
            this._lastUpdated = getTimer();
            this._isVIP = k;
        }

        public function get minutesUntilExpiration():int
        {
            var k:int = ((getTimer() - this._lastUpdated) / (1000 * 60));
            var _local_2:int = (this._minutesUntilExpiration - k);
            return (_local_2 > 0) ? _local_2 : 0;
        }

        public function set minutesUntilExpiration(k:int):void
        {
            this._lastUpdated = getTimer();
            this._minutesUntilExpiration = k;
        }

        public function get _Str_6682():Boolean
        {
            return this._isExpiring;
        }

        public function set _Str_6682(k:Boolean):void
        {
            this._isExpiring = k;
        }

        public function get _Str_8836():Boolean
        {
            return this._isCitizenshipVipExpiring;
        }

        public function set _Str_8836(k:Boolean):void
        {
            this._isCitizenshipVipExpiring = k;
        }

        public function get _Str_6312():int
        {
            return this._minutesSinceLastModified;
        }

        public function set _Str_6312(k:int):void
        {
            this._lastUpdated = getTimer();
            this._minutesSinceLastModified = k;
        }
    }
}
