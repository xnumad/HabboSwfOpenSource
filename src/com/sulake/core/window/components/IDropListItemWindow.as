package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindow;

    public interface IDropListItemWindow extends IButtonWindow 
    {
        function get menu():IDropMenuWindow;
        function get value():IWindow;
        function set value(_arg_1:IWindow):void;
    }
}
