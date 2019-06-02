//com.sulake.core.window.utils.INotify

package com.sulake.core.window.utils{
    import com.sulake.core.runtime.IDisposable;

    public /*dynamic*/ interface INotify extends IDisposable {

        function set title(k:String):void;
        function get title():String;
        function set summary(k:String):void;
        function get summary():String;
        function set callback(k:Function):void;
        function get callback():Function;

    }
}//package com.sulake.core.window.utils

