//com.sulake.habbo.window.utils.IAlertDialog

package com.sulake.habbo.window.utils{
    import com.sulake.core.runtime.IDisposable;

    public /*dynamic*/ interface IAlertDialog extends IDisposable {

        function set title(k:String):void;
        function get title():String;
        function set summary(k:String):void;
        function get summary():String;
        function set callback(k:Function):void;
        function get callback():Function;
        function getButtonCaption(k:int):ICaption;
        function setButtonCaption(k:int, _arg_2:ICaption):void;

    }
}//package com.sulake.habbo.window.utils

