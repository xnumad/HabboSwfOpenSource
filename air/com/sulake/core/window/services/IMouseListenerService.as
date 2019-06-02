//com.sulake.core.window.services.IMouseListenerService

package com.sulake.core.window.services{
    import com.sulake.core.window.IWindow;

    public /*dynamic*/ interface IMouseListenerService {

        function get eventTypes():Array;
        function get areaLimit():uint;
        function set areaLimit(k:uint):void;
        function dispose():void;
        function begin(k:IWindow, _arg_2:uint=0):IWindow;
        function end(k:IWindow):IWindow;

    }
}//package com.sulake.core.window.services

