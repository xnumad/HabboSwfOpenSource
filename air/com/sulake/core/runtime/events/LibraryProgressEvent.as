//com.sulake.core.runtime.events.LibraryProgressEvent

package com.sulake.core.runtime.events{
    import flash.events.ProgressEvent;

    public class LibraryProgressEvent extends ProgressEvent {

        private var _elapsedTime:int;
        private var _fileName:String;

        public function LibraryProgressEvent(k:String, _arg_2:uint=0, _arg_3:uint=0, _arg_4:int=0);

        public function get elapsedTime():int;

        public function get fileName():String;


    }
}//package com.sulake.core.runtime.events

