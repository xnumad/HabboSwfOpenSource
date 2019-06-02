//com.sulake.core.runtime.events.WarningEvent

package com.sulake.core.runtime.events{
    import flash.events.Event;

    public class WarningEvent extends Event {

        protected var _message:String;

        public function WarningEvent(k:String, _arg_2:String);

        public function get message():String;


    }
}//package com.sulake.core.runtime.events

