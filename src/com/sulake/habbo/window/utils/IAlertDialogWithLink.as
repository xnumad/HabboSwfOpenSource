package com.sulake.habbo.window.utils
{
    public interface IAlertDialogWithLink extends IAlertDialog
    {
        function set linkTitle(_arg_1:String):void;
        function get linkTitle():String;
        function set linkUrl(_arg_1:String):void;
        function get linkUrl():String;
    }
}
