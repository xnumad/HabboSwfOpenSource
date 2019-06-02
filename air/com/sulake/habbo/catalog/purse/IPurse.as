//com.sulake.habbo.catalog.purse.IPurse

package com.sulake.habbo.catalog.purse{
    public /*dynamic*/ interface IPurse {

        function set credits(k:int):void;
        function set clubDays(k:int):void;
        function set clubPeriods(k:int):void;
        function get isExpiring():Boolean;
        function get minutesUntilExpiration():int;
        function set isExpiring(k:Boolean):void;
        function get credits():int;
        function get clubDays():int;
        function get clubPeriods():int;
        function get hasClubLeft():Boolean;
        function get isVIP():Boolean;
        function get pastClubDays():int;
        function get pastVipDays():int;
        function getActivityPointsForType(k:int):int;

    }
}//package com.sulake.habbo.catalog.purse

