//com.sulake.core.utils.ErrorReportStorage

package com.sulake.core.utils{
    public class ErrorReportStorage {

        private static var _errorData:Map;
        private static var _debugData:Map;

        public function ErrorReportStorage();

        public static function getDebugData():String;

        public static function addDebugData(k:String, _arg_2:String):void;

        public static function setParameter(k:String, _arg_2:String):void;

        public static function getParameter(k:String):String;

        public static function getParameterNames():Array;


    }
}//package com.sulake.core.utils

