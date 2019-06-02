package com.sulake.habbo.catalog.recycler
{
    public interface IRecycler 
    {
        function init(_arg_1:_Str_7232=null):void;
        function cancel():void;
        function empty():void;
        function _Str_18924(_arg_1:int):_Str_3718;
        function placeObjectAtSlot(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String):void;
        function releaseSlot(_arg_1:int):void;
        function executeRecycler():void;
        function isReadyToRecycle():Boolean;
        function getPrizeTable():Array;
        function get numberOfSlots():int;
    }
}
