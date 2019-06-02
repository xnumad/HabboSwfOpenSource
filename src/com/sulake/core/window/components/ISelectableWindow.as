package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindow;

    public interface ISelectableWindow extends IWindow 
    {
        function get selector():ISelectorWindow;
        function get _Str_2365():Boolean;
        function set _Str_2365(_arg_1:Boolean):void;
        function select():Boolean;
        function unselect():Boolean;
    }
}
