//com.sulake.habbo.tablet.inventory.IHabboTabletInventory

package com.sulake.habbo.tablet.inventory{
    import com.sulake.core.runtime.IUnknown;
    import starling.display.DisplayObject;
    import com.sulake.habbo.tablet.inventory.items.IFurnitureItem;

    public /*dynamic*/ interface IHabboTabletInventory extends IUnknown {

        function get view():DisplayObject;
        function isViewLoaded():Boolean;
        function getFurnitureItem(k:int):IFurnitureItem;
        function amountOfFurnitureItems(k:int):int;
        function setupTrading(k:int, _arg_2:int):void;
        function closeTrading():void;
        function updateView():void;
        function acceptTradingRequest(k:int):void;

    }
}//package com.sulake.habbo.tablet.inventory

