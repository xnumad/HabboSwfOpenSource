//com.sulake.core.runtime.events.ErrorEvent

package com.sulake.core.runtime.events{
    public class ErrorEvent extends WarningEvent {

        protected var _category:int;
        protected var _critical:Boolean;
        protected var _error:Error;

        public function ErrorEvent(k:String, _arg_2:String, _arg_3:Boolean, _arg_4:int, _arg_5:Error=null);

        public function get category():int;

        public function get critical():Boolean;

        public function get error():Error;


    }
}//package com.sulake.core.runtime.events

