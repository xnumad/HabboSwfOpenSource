//com.sulake.habbo.utils.HabboWebTools

package com.sulake.habbo.utils{
    public class HabboWebTools {

        public static const WINDOW_NAME:String;

        public function HabboWebTools();

        public static function logEventLog(k:String):void;

        public static function openWebPage(k:String, _arg_2:String=""):void;

        public static function openWebPageAndMinimizeClient(k:String):void;

        public static function closeWebPageAndRestoreClient():void;

        public static function openWebHabblet(k:String, _arg_2:String=null):void;

        public static function closeWebHabblet(k:String, _arg_2:String=null):void;

        public static function showGame(k:String):void;

        public static function hideGame():void;

        public static function navigateToURL(k:String, _arg_2:String=null):void;

        public static function openExternalLinkWarning(k:String):void;

        public static function facebookLike(k:int):void;

        public static function roomVisited(k:int):void;


    }
}//package com.sulake.habbo.utils

