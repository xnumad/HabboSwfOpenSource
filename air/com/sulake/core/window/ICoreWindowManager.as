//com.sulake.core.window.ICoreWindowManager

package com.sulake.core.window{
    import flash.geom.Rectangle;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.components.IDesktopWindow;
    import com.sulake.core.window.utils.INotify;

    public /*dynamic*/ interface ICoreWindowManager {

        function create(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:Rectangle, _arg_6:Function=null, _arg_7:String="", _arg_8:uint=0, _arg_9:Array=null, k0:IWindow=null, k1:Array=null, k2:String=""):IWindow;
        function destroy(k:IWindow):void;
        function buildFromXML(k:XML, _arg_2:uint=1, _arg_3:Map=null):IWindow;
        function windowToXMLString(k:IWindow):String;
        function getDesktop(k:uint):IDesktopWindow;
        function notify(k:String, _arg_2:String, _arg_3:Function, _arg_4:uint=0):INotify;
        function findWindowByName(k:String):IWindow;
        function findWindowByTag(k:String):IWindow;
        function groupWindowsWithTag(k:String, _arg_2:Array, _arg_3:int=0):uint;

    }
}//package com.sulake.core.window

