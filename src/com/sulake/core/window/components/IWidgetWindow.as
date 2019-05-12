package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.utils.IIterable;
    import com.sulake.core.window.IWidget;

    public interface IWidgetWindow extends IWindow, IIterable 
    {
        function get widget():IWidget;
        function get _Str_2429():IWindow;
        function set _Str_2429(_arg_1:IWindow):void;
    }
}
