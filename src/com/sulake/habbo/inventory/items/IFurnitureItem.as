package com.sulake.habbo.inventory.items
{
    import com.sulake.habbo.room.IStuffData;

    public interface IFurnitureItem 
    {
        function get id():int;
        function get ref():int;
        function get type():int;
        function get stuffData():IStuffData;
        function get _Str_2794():Number;
        function get category():int;
        function get recyclable():Boolean;
        function get tradeable():Boolean;
        function get groupable():Boolean;
        function get sellable():Boolean;
        function get locked():Boolean;
        function set locked(_arg_1:Boolean):void;
        function get isWallItem():Boolean;
    }
}
