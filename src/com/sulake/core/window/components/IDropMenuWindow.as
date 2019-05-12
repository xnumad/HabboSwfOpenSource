package com.sulake.core.window.components
{
    import __AS3__.vec.Vector;

    public interface IDropMenuWindow extends IInteractiveWindow 
    {
        function get selection():int;
        function set selection(_arg_1:int):void;
        function get numMenuItems():int;
        function populate(_arg_1:Array):void;
        function _Str_24893(_arg_1:Vector.<String>):void;
        function _Str_4487():Array;
    }
}
