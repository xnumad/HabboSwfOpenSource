//com.sulake.core.runtime.events.EventDispatcherWrapper

package com.sulake.core.runtime.events{
    import flash.events.IEventDispatcher;
    import com.sulake.core.runtime.IDisposable;
    import flash.events.EventDispatcher;
    import flash.utils.Dictionary;
    import flash.events.Event;

    [SecureSWF(rename="false")]
    public class EventDispatcherWrapper implements IEventDispatcher, IDisposable {

        private static const EVENT_RESULT_TRUE:uint;
        private static const EVENT_RESULT_FALSE:uint;
        private static const EVENT_RESULT_ERROR:uint;

        protected var _disposed:Boolean;
        private var _eventDispatcher:EventDispatcher;
        private var _eventListenerTable:Dictionary;
        private var _result:uint;
        private var _error:Error;

        public function EventDispatcherWrapper(k:IEventDispatcher=null);

        public function get disposed():Boolean;

        public function get error():Error;

        public function addEventListener(k:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void;

        public function removeEventListener(k:String, _arg_2:Function, _arg_3:Boolean=false):void;

        public function dispatchEvent(k:Event):Boolean;

        public function hasEventListener(k:String):Boolean;

        public function callEventListeners(k:String):void;

        public function willTrigger(k:String):Boolean;

        private function eventProcessor(k:Event):void;

        public function dispose():void;


    }
}//package com.sulake.core.runtime.events

