package com.sulake.core.window
{
    import flash.geom.Rectangle;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.components.IDesktopWindow;
    import com.sulake.core.window.utils.INotify;

    public interface ICoreWindowManager 
    {
        function create(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:Rectangle, _arg_6:Function=null, _arg_7:String="", _arg_8:uint=0, _arg_9:Array=null, _arg_10:IWindow=null, _arg_11:Array=null, _arg_12:String=""):IWindow;
        function destroy(_arg_1:IWindow):void;
        function buildFromXML(_arg_1:XML, _arg_2:uint=1, _arg_3:Map=null):IWindow;
        function windowToXMLString(_arg_1:IWindow):String;
        function getDesktop(_arg_1:uint):IDesktopWindow;
        function notify(_arg_1:String, _arg_2:String, _arg_3:Function, _arg_4:uint=0):INotify;
        function _Str_14038(_arg_1:String):IWindow;
        function _Str_15444(_arg_1:String):IWindow;
        function groupWindowsWithTag(_arg_1:String, _arg_2:Array, _arg_3:int=0):uint;
    }
}
