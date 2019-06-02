//com.sulake.core.window.services.IToolTipAgentService

package com.sulake.core.window.services{
    import com.sulake.core.window.IWindow;

    public /*dynamic*/ interface IToolTipAgentService {

        function dispose():void;
        function begin(k:IWindow, _arg_2:uint=0):IWindow;
        function end(k:IWindow):IWindow;
        function updateCaption(k:IWindow):void;

    }
}//package com.sulake.core.window.services

