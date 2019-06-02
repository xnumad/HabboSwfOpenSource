//com.sulake.core.runtime.events.LockEvent

package com.sulake.core.runtime.events{
    import flash.events.Event;
    import com.sulake.core.runtime.IUnknown;

    public class LockEvent extends Event {

        public var unknown:IUnknown;

        public function LockEvent(k:String, _arg_2:IUnknown);

    }
}//package com.sulake.core.runtime.events

