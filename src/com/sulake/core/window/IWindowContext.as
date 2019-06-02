package com.sulake.core.window
{
    import com.sulake.core.window.services.IInternalWindowServices;
    import com.sulake.core.window.utils.IWindowParser;
    import com.sulake.core.window.components.IDesktopWindow;
    import flash.geom.Rectangle;

    public interface IWindowContext 
    {
        function getWindowServices():IInternalWindowServices;
        function getWindowParser():IWindowParser;
        function getDesktopWindow():IDesktopWindow;
        function registerLocalizationListener(_arg_1:String, _arg_2:IWindow):void;
        function removeLocalizationListener(_arg_1:String, _arg_2:IWindow):void;
        function _Str_14038(_arg_1:String):IWindow;
        function _Str_15444(_arg_1:String):IWindow;
        function groupChildrenWithTag(_arg_1:String, _arg_2:Array, _arg_3:int=0):uint;
        function create(_arg_1:String, _arg_2:String, _arg_3:uint, _arg_4:uint, _arg_5:uint, _arg_6:Rectangle, _arg_7:Function, _arg_8:IWindow, _arg_9:uint, _arg_10:Array=null, _arg_11:String="", _arg_12:Array=null):IWindow;
        function destroy(_arg_1:IWindow):Boolean;
        function invalidate(_arg_1:IWindow, _arg_2:Rectangle, _arg_3:uint):void;
        function getLastError():Error;
        function getLastErrorCode():int;
        function flushError():void;
        function _Str_11270(_arg_1:IInputEventTracker):void;
        function _Str_14802(_arg_1:IInputEventTracker):void;
    }
}
