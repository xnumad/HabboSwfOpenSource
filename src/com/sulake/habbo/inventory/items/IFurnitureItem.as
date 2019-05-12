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
        function get _Str_16260():Boolean;
        function get _Str_8386():Boolean;
        function get _Str_13551():Boolean;
        function get sellable():Boolean;
        function get locked():Boolean;
        function set locked(_arg_1:Boolean):void;
        function get _Str_2770():Boolean;
    }
}
