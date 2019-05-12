package com.sulake.core.window
{
    import flash.geom.Rectangle;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.utils.DefaultAttStruct;
    import com.sulake.core.window.theme.IThemeManager;

    public interface IWindowFactory 
    {
        function create(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:Rectangle, _arg_6:Function=null, _arg_7:String="", _arg_8:uint=0, _arg_9:Array=null, _arg_10:IWindow=null, _arg_11:Array=null, _arg_12:String=""):IWindow;
        function destroy(_arg_1:IWindow):void;
        function buildFromXML(_arg_1:XML, _arg_2:uint=1, _arg_3:Map=null):IWindow;
        function windowToXMLString(_arg_1:IWindow):String;
        function _Str_19128(_arg_1:uint, _arg_2:uint):XML;
        function _Str_20294(_arg_1:uint, _arg_2:uint):DefaultAttStruct;
        function getThemeManager():IThemeManager;
    }
}
