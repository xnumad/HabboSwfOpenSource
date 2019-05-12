package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.utils.IMargins;

    public interface IBubbleWindow extends IWindowContainer 
    {
        function get direction():String;
        function set direction(_arg_1:String):void;
        function get _Str_8006():int;
        function set _Str_8006(_arg_1:int):void;
        function get margins():IMargins;
        function get content():IWindowContainer;
    }
}
