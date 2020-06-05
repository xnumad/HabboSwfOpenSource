package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.utils.IIterable;
    import com.sulake.core.window.IWidget;

    public interface IWidgetWindow extends IWindow, IIterable 
    {
        function get widget():IWidget;
        function get rootWindow():IWindow;
        function set rootWindow(_arg_1:IWindow):void;
    }
}
