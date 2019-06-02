//com.sulake.habbo.window.utils.IAlertDialogWithLink

package com.sulake.habbo.window.utils{
    public /*dynamic*/ interface IAlertDialogWithLink extends IAlertDialog {

        function set linkTitle(k:String):void;
        function get linkTitle():String;
        function set linkUrl(k:String):void;
        function get linkUrl():String;

    }
}//package com.sulake.habbo.window.utils

