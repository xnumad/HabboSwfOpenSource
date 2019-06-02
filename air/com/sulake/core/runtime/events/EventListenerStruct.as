//com.sulake.core.runtime.events.EventListenerStruct

package com.sulake.core.runtime.events{
    import flash.utils.Dictionary;

    public class EventListenerStruct {

        private var _dictionary:Dictionary;
        public var useCapture:Boolean;
        public var priority:int;
        public var useWeakReference:Boolean;

        public function EventListenerStruct(k:Function, _arg_2:Boolean=false, _arg_3:int=0, _arg_4:Boolean=false);

        public function set callback(k:Function):void;

        public function get callback():Function;


    }
}//package com.sulake.core.runtime.events

