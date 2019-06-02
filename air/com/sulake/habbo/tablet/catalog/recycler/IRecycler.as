//com.sulake.habbo.tablet.catalog.recycler.IRecycler

package com.sulake.habbo.tablet.catalog.recycler{
    public /*dynamic*/ interface IRecycler {

        function init(k:IRecyclerVisualization=null):void;
        function cancel():void;
        function empty():void;
        function getSlotContent(k:int):FurniSlotItem;
        function placeObjectAtSlot(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String):void;
        function releaseSlot(k:int):void;
        function executeRecycler():void;
        function isReadyToRecycle():Boolean;
        function getPrizeTable():Array;
        function get numberOfSlots():int;

    }
}//package com.sulake.habbo.tablet.catalog.recycler

