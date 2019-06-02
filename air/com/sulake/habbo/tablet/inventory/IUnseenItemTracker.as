//com.sulake.habbo.tablet.inventory.IUnseenItemTracker

package com.sulake.habbo.tablet.inventory{
    public /*dynamic*/ interface IUnseenItemTracker {

        function resetCategory(k:int):Boolean;
        function resetItems(k:int, _arg_2:Array):Boolean;
        function resetCategoryIfEmpty(k:int):Boolean;
        function isUnseen(k:int, _arg_2:int):Boolean;
        function removeUnseen(k:int, _arg_2:int):Boolean;
        function getIds(k:int):Array;
        function getCount(k:int):int;

    }
}//package com.sulake.habbo.tablet.inventory

