package com.sulake.core.window.services
{
    import com.sulake.core.window.IWindow;

    public interface IGestureAgentService 
    {
        function dispose():void;
        function begin(_arg_1:IWindow, _arg_2:Function, _arg_3:uint, _arg_4:int, _arg_5:int):IWindow;
        function end(_arg_1:IWindow):IWindow;
    }
}
