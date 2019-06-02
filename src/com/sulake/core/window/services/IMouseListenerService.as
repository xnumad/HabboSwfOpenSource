package com.sulake.core.window.services
{
    import com.sulake.core.window.IWindow;

    public interface IMouseListenerService 
    {
        function get eventTypes():Array;
        function get _Str_14321():uint;
        function set _Str_14321(_arg_1:uint):void;
        function dispose():void;
        function begin(_arg_1:IWindow, _arg_2:uint=0):IWindow;
        function end(_arg_1:IWindow):IWindow;
    }
}
