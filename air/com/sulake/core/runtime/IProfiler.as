//com.sulake.core.runtime.IProfiler

package com.sulake.core.runtime{
    import com.sulake.core.utils.profiler.ProfilerAgent;

    public /*dynamic*/ interface IProfiler {

        function getProfilerAgentForReceiver(k:IUpdateReceiver):ProfilerAgent;
        function getProfilerAgentsInArray():Array;
        function addStartEventListener(k:Function):void;
        function addStopEventListener(k:Function):void;
        function removeStartEventListener(k:Function):void;
        function removeStopEventListener(k:Function):void;
        function gc():void;
        function get numAssetLibraryInstances():uint;
        function get numBitmapAssetInstances():uint;
        function get numAllocatedBitmapDataBytes():uint;
        function get numTrackedBitmapDataInstances():uint;
        function get numTrackedBitmapDataBytes():uint;

    }
}//package com.sulake.core.runtime

