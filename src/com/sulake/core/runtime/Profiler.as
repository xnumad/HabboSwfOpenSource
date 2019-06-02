package com.sulake.core.runtime
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.IProfiler;
    import flash.utils.Dictionary;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.AssetLibrary;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.utils.profiler.tracking.TrackedBitmapData;
    import com.sulake.core.runtime.IDisposable;
    import flash.system.System;
    import flash.events.Event;
    import flash.utils.getTimer;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.utils.profiler.ProfilerAgent;
    import com.sulake.core.runtime.*;

    internal class Profiler extends Component implements IProfiler 
    {
        public static const PROFILER_START:String = "PROFILER_START";
        public static const PROFILER_STOP:String = "PROFILER_STOP";

        private var _profilersByReceiver:Dictionary;
        private var _startTime:int;
        private var _roundTime:int;

        public function Profiler(k:IContext)
        {
            this._profilersByReceiver = new Dictionary(true);
            super(k, 0, null);
        }

        public function get numAssetLibraryInstances():uint
        {
            return AssetLibrary.numAssetLibraryInstances;
        }

        public function get numBitmapAssetInstances():uint
        {
            return BitmapDataAsset.instances;
        }

        public function get numAllocatedBitmapDataBytes():uint
        {
            return BitmapDataAsset.allocatedByteCount;
        }

        public function get numTrackedBitmapDataInstances():uint
        {
            return TrackedBitmapData.numInstances;
        }

        public function get numTrackedBitmapDataBytes():uint
        {
            return TrackedBitmapData.allocatedByteCount;
        }

        override public function dispose():void
        {
            var k:Object;
            if (!disposed)
            {
                for (k in this._profilersByReceiver)
                {
                    IDisposable(this._profilersByReceiver[k]).dispose();
                    delete this._profilersByReceiver[k];
                }
                super.dispose();
            }
        }

        public function gc():void
        {
            System.pauseForGCIfCollectionImminent(0.25);
        }

        public function start():void
        {
            events.dispatchEvent(new Event(PROFILER_START, false, false));
            this._startTime = getTimer();
        }

        public function stop():void
        {
            this._roundTime = (getTimer() - this._startTime);
            events.dispatchEvent(new Event(PROFILER_STOP, false, false));
        }

        public function update(k:IUpdateReceiver, _arg_2:uint):void
        {
            this.getProfilerAgentForReceiver(k).update(_arg_2);
        }

        public function get numProfilerAgents():uint
        {
            var _local_2:Object;
            var k:uint;
            for (_local_2 in this._profilersByReceiver)
            {
                if (!IDisposable(_local_2).disposed)
                {
                    k++;
                }
            }
            return k;
        }

        public function getProfilerAgentsInArray():Array
        {
            var _local_2:IUpdateReceiver;
            var _local_3:Object;
            var k:Array = new Array();
            for (_local_3 in this._profilersByReceiver)
            {
                _local_2 = (_local_3 as IUpdateReceiver);
                if (IDisposable(_local_3).disposed)
                {
                    IDisposable(this._profilersByReceiver[_local_3]).dispose();
                    delete this._profilersByReceiver[_local_3];
                }
                else
                {
                    k.push(this._profilersByReceiver[_local_3]);
                }
            }
            return k;
        }

        public function getProfilerAgentForReceiver(k:IUpdateReceiver):ProfilerAgent
        {
            var _local_2:ProfilerAgent = this._profilersByReceiver[k];
            return (_local_2 != null) ? _local_2 : this._Str_1324(k);
        }

        public function _Str_1324(updateReceiver:IUpdateReceiver):ProfilerAgent
        {
            if (this._profilersByReceiver[updateReceiver] != null)
            {
                throw (new Error("Profiler for receiver already exists!"));
            }
            var _local_2:ProfilerAgent = new ProfilerAgent(updateReceiver);
            this._profilersByReceiver[updateReceiver] = _local_2;
            return _local_2;
        }

        public function addStartEventListener(listener:Function):void
        {
            events.addEventListener(PROFILER_START, listener);
        }

        public function addStopEventListener(listener:Function):void
        {
            events.addEventListener(PROFILER_STOP, listener);
        }

        public function removeStartEventListener(listener:Function):void
        {
            events.removeEventListener(PROFILER_START, listener);
        }

        public function removeStopEventListener(listener:Function):void
        {
            events.removeEventListener(PROFILER_STOP, listener);
        }
    }
}
