//com.sulake.core.window.services.IMouseScalingService

package com.sulake.core.window.services{
    import com.sulake.core.window.IWindow;

    public /*dynamic*/ interface IMouseScalingService {

        function dispose():void;
        function begin(k:IWindow, _arg_2:uint=0):IWindow;
        function end(k:IWindow):IWindow;

    }
}//package com.sulake.core.window.services

