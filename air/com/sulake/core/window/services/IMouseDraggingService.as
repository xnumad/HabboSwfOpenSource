//com.sulake.core.window.services.IMouseDraggingService

package com.sulake.core.window.services{
    import com.sulake.core.window.IWindow;

    public /*dynamic*/ interface IMouseDraggingService {

        function dispose():void;
        function begin(k:IWindow, _arg_2:uint=0):IWindow;
        function end(k:IWindow):IWindow;

    }
}//package com.sulake.core.window.services

