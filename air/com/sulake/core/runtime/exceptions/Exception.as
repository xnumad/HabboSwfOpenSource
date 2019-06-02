//com.sulake.core.runtime.exceptions.Exception

package com.sulake.core.runtime.exceptions{
    public class Exception extends Error {

        private var _cause:Error;

        public function Exception(k:String, _arg_2:int=0, _arg_3:Error=null);

        public static function getChainedStackTrace(k:Error):String;


        public function get cause():Error;

        public function toString():String;


    }
}//package com.sulake.core.runtime.exceptions

