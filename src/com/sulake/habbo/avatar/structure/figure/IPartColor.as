package com.sulake.habbo.avatar.structure.figure
{
    import flash.geom.ColorTransform;

    public interface IPartColor 
    {
        function get colorTransform():ColorTransform;
        function get redMultiplier():Number;
        function get greenMultiplier():Number;
        function get blueMultiplier():Number;
        function get _Str_915():uint;
        function get r():uint;
        function get g():uint;
        function get b():uint;
        function get id():int;
        function get index():int;
        function get clubLevel():int;
        function get isSelectable():Boolean;
    }
}
