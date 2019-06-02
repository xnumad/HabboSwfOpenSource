package com.sulake.habbo.catalog.purse
{
    public interface IPurse 
    {
        function set credits(_arg_1:int):void;
        function set clubDays(_arg_1:int):void;
        function set clubPeriods(_arg_1:int):void;
        function get _Str_14389():Boolean;
        function get minutesUntilExpiration():int;
        function set _Str_14389(_arg_1:Boolean):void;
        function get credits():int;
        function get clubDays():int;
        function get clubPeriods():int;
        function get hasClubLeft():Boolean;
        function get isVIP():Boolean;
        function get pastClubDays():int;
        function get pastVipDays():int;
        function getActivityPointsForType(_arg_1:int):int;
    }
}
