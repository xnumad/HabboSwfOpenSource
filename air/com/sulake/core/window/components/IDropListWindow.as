//com.sulake.core.window.components.IDropListWindow

package com.sulake.core.window.components{
    import com.sulake.core.window.utils.IIterable;
    import com.sulake.core.window.IWindow;

    public /*dynamic*/ interface IDropListWindow extends IInteractiveWindow, IIterable {

        function get selection():int;
        function set selection(k:int):void;
        function get numMenuItems():int;
        function addMenuItem(k:IWindow):IWindow;
        function addMenuItemAt(k:IWindow, _arg_2:int):IWindow;
        function getMenuItemIndex(k:IWindow):int;
        function getMenuItemAt(k:int):IWindow;
        function removeMenuItem(k:IWindow):IWindow;
        function removeMenuItemAt(k:int):IWindow;

    }
}//package com.sulake.core.window.components

