//com.sulake.core.window.components.IDesktopWindow

package com.sulake.core.window.components{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import flash.geom.Point;

    public /*dynamic*/ interface IDesktopWindow extends IWindowContainer, IDisplayObjectWrapper {

        function get mouseX():int;
        function get mouseY():int;
        function getActiveWindow():IWindow;
        function setActiveWindow(k:IWindow):IWindow;
        function groupParameterFilteredChildrenUnderPoint(k:Point, _arg_2:Array, _arg_3:uint=0):void;

    }
}//package com.sulake.core.window.components

