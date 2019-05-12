package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import flash.geom.Point;

    public interface IDesktopWindow extends IWindowContainer, IDisplayObjectWrapper 
    {
        function get mouseX():int;
        function get mouseY():int;
        function getActiveWindow():IWindow;
        function setActiveWindow(_arg_1:IWindow):IWindow;
        function groupParameterFilteredChildrenUnderPoint(_arg_1:Point, _arg_2:Array, _arg_3:uint=0):void;
    }
}
