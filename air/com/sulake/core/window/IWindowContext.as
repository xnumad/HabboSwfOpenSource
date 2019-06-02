//com.sulake.core.window.IWindowContext

package com.sulake.core.window{
    import com.sulake.core.window.services.IInternalWindowServices;
    import com.sulake.core.window.utils.IWindowParser;
    import com.sulake.core.window.components.IDesktopWindow;
    import flash.geom.Rectangle;

    public /*dynamic*/ interface IWindowContext {

        function getWindowServices():IInternalWindowServices;
        function getWindowParser():IWindowParser;
        function getDesktopWindow():IDesktopWindow;
        function registerLocalizationListener(k:String, _arg_2:IWindow):void;
        function removeLocalizationListener(k:String, _arg_2:IWindow):void;
        function findWindowByName(k:String):IWindow;
        function findWindowByTag(k:String):IWindow;
        function groupChildrenWithTag(k:String, _arg_2:Array, _arg_3:int=0):uint;
        function create(k:String, _arg_2:String, _arg_3:uint, _arg_4:uint, _arg_5:uint, _arg_6:Rectangle, _arg_7:Function, _arg_8:IWindow, _arg_9:uint, k0:Array=null, k1:String="", k2:Array=null):IWindow;
        function destroy(k:IWindow):Boolean;
        function invalidate(k:IWindow, _arg_2:Rectangle, _arg_3:uint):void;
        function getLastError():Error;
        function getLastErrorCode():int;
        function flushError():void;
        function addMouseEventTracker(k:IInputEventTracker):void;
        function removeMouseEventTracker(k:IInputEventTracker):void;

    }
}//package com.sulake.core.window

