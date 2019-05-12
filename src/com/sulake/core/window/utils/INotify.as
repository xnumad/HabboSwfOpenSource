package com.sulake.core.window.utils
{
    import com.sulake.core.runtime.IDisposable;

    public interface INotify extends IDisposable 
    {
        function set title(title:String):void;
        function get title():String;
        function set summary(summary:String):void;
        function get summary():String;
        function set callback(callback:Function):void;
        function get callback():Function;
    }
}
