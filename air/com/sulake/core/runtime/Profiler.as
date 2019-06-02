//com.sulake.core.runtime.Profiler

package com.sulake.core.runtime{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.IProfiler;
    import flash.utils.Dictionary;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.utils.profiler.ProfilerAgent;

    class Profiler extends Component implements IProfiler {

        public static const PROFILER_START:String;
        public static const PROFILER_STOP:String;

        private var _profilersByReceiver:Dictionary;
        private var _startTime:int;
        private var _roundTime:int;

        public function Profiler(k:IContext);

        public function get numAssetLibraryInstances():uint;

        public function get numBitmapAssetInstances():uint;

        public function get numAllocatedBitmapDataBytes():uint;

        public function get numTrackedBitmapDataInstances():uint;

        public function get numTrackedBitmapDataBytes():uint;

        override public function dispose():void;

        public function gc():void;

        public function start():void;

        public function stop():void;

        public function update(k:IUpdateReceiver, _arg_2:uint):void;

        public function get numProfilerAgents():uint;

        public function getProfilerAgentsInArray():Array;

        public function getProfilerAgentForReceiver(k:IUpdateReceiver):ProfilerAgent;

        public function addProfilerAgentForReceiver(k:IUpdateReceiver):ProfilerAgent;

        public function addStartEventListener(k:Function):void;

        public function addStopEventListener(k:Function):void;

        public function removeStartEventListener(k:Function):void;

        public function removeStopEventListener(k:Function):void;


    }
}//package com.sulake.core.runtime

