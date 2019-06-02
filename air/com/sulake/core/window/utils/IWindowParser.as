//com.sulake.core.window.utils.IWindowParser

package com.sulake.core.window.utils{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.utils.Map;

    public /*dynamic*/ interface IWindowParser extends IDisposable {

        function parseAndConstruct(k:XML, _arg_2:IWindow, _arg_3:Map):IWindow;
        function windowToXMLString(k:IWindow):String;

    }
}//package com.sulake.core.window.utils

