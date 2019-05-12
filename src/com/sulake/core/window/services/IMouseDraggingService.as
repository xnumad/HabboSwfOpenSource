package com.sulake.core.window.services
{
    import com.sulake.core.window.IWindow;

    public interface IMouseDraggingService 
    {
        function dispose():void;
        function begin(_arg_1:IWindow, _arg_2:uint=0):IWindow;
        function end(_arg_1:IWindow):IWindow;
    }
}
