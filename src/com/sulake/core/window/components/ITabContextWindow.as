package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.utils.IIterable;
    import com.sulake.core.window.IWindowContainer;

    public interface ITabContextWindow extends IWindow, IIterable 
    {
        function get selector():ISelectorListWindow;
        function get container():IWindowContainer;
        function get _Str_4277():uint;
        function _Str_5377(_arg_1:ITabButtonWindow):ITabButtonWindow;
        function _Str_25454(_arg_1:ITabButtonWindow, _arg_2:uint):ITabButtonWindow;
        function _Str_5897(_arg_1:ITabButtonWindow):void;
        function _Str_3363(_arg_1:uint):ITabButtonWindow;
        function _Str_19493(_arg_1:String):ITabButtonWindow;
        function _Str_20824(_arg_1:uint):ITabButtonWindow;
        function _Str_23344(_arg_1:ITabButtonWindow):uint;
    }
}
