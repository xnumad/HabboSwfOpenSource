package com.sulake.habbo.inventory
{
    public interface IAvatarEffect 
    {
        function get type():int;
        function get subType():int;
        function get _Str_3709():int;
        function get duration():int;
        function get isActive():Boolean;
        function get Selected():Boolean;
    }
}
