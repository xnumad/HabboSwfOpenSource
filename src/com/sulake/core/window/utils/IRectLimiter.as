package com.sulake.core.window.utils
{
    public interface IRectLimiter 
    {
        function get minWidth():int;
        function get maxWidth():int;
        function get minHeight():int;
        function get maxHeight():int;
        function set minWidth(_arg_1:int):void;
        function set maxWidth(_arg_1:int):void;
        function set minHeight(_arg_1:int):void;
        function set maxHeight(_arg_1:int):void;
        function get isEmpty():Boolean;
        function setEmpty():void;
        function limit():void;
    }
}
