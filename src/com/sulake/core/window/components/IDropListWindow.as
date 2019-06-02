package com.sulake.core.window.components
{
    import com.sulake.core.window.utils.IIterable;
    import com.sulake.core.window.IWindow;

    public interface IDropListWindow extends IInteractiveWindow, IIterable 
    {
        function get selection():int;
        function set selection(_arg_1:int):void;
        function get numMenuItems():int;
        function addMenuItem(_arg_1:IWindow):IWindow;
        function addMenuItemAt(_arg_1:IWindow, _arg_2:int):IWindow;
        function getMenuItemIndex(_arg_1:IWindow):int;
        function getMenuItemAt(_arg_1:int):IWindow;
        function removeMenuItem(_arg_1:IWindow):IWindow;
        function removeMenuItemAt(_arg_1:int):IWindow;
    }
}
