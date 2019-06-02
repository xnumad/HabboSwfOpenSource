//com.sulake.core.window.services.IGestureAgentService

package com.sulake.core.window.services{
    import com.sulake.core.window.IWindow;

    public /*dynamic*/ interface IGestureAgentService {

        function dispose():void;
        function begin(k:IWindow, _arg_2:Function, _arg_3:uint, _arg_4:int, _arg_5:int):IWindow;
        function end(k:IWindow):IWindow;

    }
}//package com.sulake.core.window.services

