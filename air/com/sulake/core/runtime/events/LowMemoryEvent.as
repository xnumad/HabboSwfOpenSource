//com.sulake.core.runtime.events.LowMemoryEvent

package com.sulake.core.runtime.events{
    import flash.events.Event;

    public class LowMemoryEvent extends Event {

        public static const TYPE:String;

        private var _warningCounter:int;

        public function LowMemoryEvent(k:int);

        public function get warningCounter():int;


    }
}//package com.sulake.core.runtime.events

