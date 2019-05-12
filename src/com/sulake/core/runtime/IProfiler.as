package com.sulake.core.runtime
{
    import com.sulake.core.utils.profiler.ProfilerAgent;

    public interface IProfiler 
    {
        function getProfilerAgentForReceiver(_arg_1:IUpdateReceiver):ProfilerAgent;
        function getProfilerAgentsInArray():Array;
        function addStartEventListener(_arg_1:Function):void;
        function addStopEventListener(_arg_1:Function):void;
        function removeStartEventListener(_arg_1:Function):void;
        function removeStopEventListener(_arg_1:Function):void;
        function gc():void;
        function get numAssetLibraryInstances():uint;
        function get numBitmapAssetInstances():uint;
        function get numAllocatedBitmapDataBytes():uint;
        function get numTrackedBitmapDataInstances():uint;
        function get numTrackedBitmapDataBytes():uint;
    }
}
