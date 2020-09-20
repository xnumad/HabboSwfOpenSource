package com.sulake.habbo.avatar.structure.figure
{
    import flash.utils.Dictionary;

    public interface IPalette 
    {
        function get id():int;
        function getColor(_arg_1:int):IPartColor;
        function get colors():Dictionary;
    }
}
