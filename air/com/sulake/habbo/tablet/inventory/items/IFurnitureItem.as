//com.sulake.habbo.tablet.inventory.items.IFurnitureItem

package com.sulake.habbo.tablet.inventory.items{
    import com.sulake.habbo.room.IStuffData;

    public /*dynamic*/ interface IFurnitureItem {

        function get id():int;
        function get ref():int;
        function get type():int;
        function get stuffData():IStuffData;
        function get extra():Number;
        function get furniCategory():int;
        function get recyclable():Boolean;
        function get tradeable():Boolean;
        function get groupable():Boolean;
        function get sellable():Boolean;
        function get locked():Boolean;
        function set locked(k:Boolean):void;
        function get isWallItem():Boolean;

    }
}//package com.sulake.habbo.tablet.inventory.items

