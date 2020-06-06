﻿package com.sulake.habbo.window.utils
{
    import com.sulake.core.runtime.IDisposable;

    public interface IAlertDialog extends IDisposable
    {
        function set title(_arg_1:String):void;
        function get title():String;
        function set summary(_arg_1:String):void;
        function get summary():String;
        function set callback(_arg_1:Function):void;
        function get callback():Function;
        function getButtonCaption(_arg_1:int):_Str_5394;
        function setButtonCaption(_arg_1:int, _arg_2:_Str_5394):void;
    }
}
