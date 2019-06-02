//com.sulake.core.utils.debug.GarbageMonitor

package com.sulake.core.utils.debug{
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.Dictionary;

    public class GarbageMonitor implements IDisposable {

        private var _disposed:Boolean;
        private var _dict:Dictionary;

        public function GarbageMonitor();

        public function dispose():void;

        public function insert(k:Object, _arg_2:String=null):void;

        public function get disposed():Boolean;

        public function get list():Array;


    }
}//package com.sulake.core.utils.debug

