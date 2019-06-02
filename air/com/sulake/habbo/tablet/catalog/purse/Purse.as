//com.sulake.habbo.tablet.catalog.purse.Purse

package com.sulake.habbo.tablet.catalog.purse{
    import flash.utils.Dictionary;

    public class Purse implements IPurse {

        private var _credits:int;
        private var _activityPoints:Dictionary;
        private var _clubDays:int;
        private var _clubPeriods:int;
        private var _isVIP:Boolean;
        private var _pastClubDays:int;
        private var _pastVipDays:int;
        private var _isExpiring:Boolean;
        private var _minutesUntilExpiration:int;

        public function Purse();

        public function get credits():int;

        public function set credits(k:int):void;

        public function get clubDays():int;

        public function set clubDays(k:int):void;

        public function get clubPeriods():int;

        public function set clubPeriods(k:int):void;

        public function get hasClubLeft():Boolean;

        public function get isVIP():Boolean;

        public function get isExpiring():Boolean;

        public function set isExpiring(k:Boolean):void;

        public function set isVIP(k:Boolean):void;

        public function get pastClubDays():int;

        public function set pastClubDays(k:int):void;

        public function get pastVipDays():int;

        public function set pastVipDays(k:int):void;

        public function get activityPoints():Dictionary;

        public function set activityPoints(k:Dictionary):void;

        public function getActivityPointsForType(k:int):int;

        public function set minutesUntilExpiration(k:int):void;

        public function get minutesUntilExpiration():int;

        public function get totalClubDaysLeft():int;


    }
}//package com.sulake.habbo.tablet.catalog.purse

