package com.sulake.core.window.components
{
    import com.sulake.core.window.utils.IIterable;
    import com.sulake.core.window.IWindow;

    public interface IDropListWindow extends IInteractiveWindow, IIterable 
    {
        function get selection():int;
        function set selection(_arg_1:int):void;
        function get numMenuItems():int;
        function _Str_15679(_arg_1:IWindow):IWindow;
        function _Str_17284(_arg_1:IWindow, _arg_2:int):IWindow;
        function _Str_15940(_arg_1:IWindow):int;
        function _Str_16005(_arg_1:int):IWindow;
        function _Str_18001(_arg_1:IWindow):IWindow;
        function _Str_16478(_arg_1:int):IWindow;
    }
}
