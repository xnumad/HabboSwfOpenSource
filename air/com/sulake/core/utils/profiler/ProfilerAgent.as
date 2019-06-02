//com.sulake.core.utils.profiler.ProfilerAgent

package com.sulake.core.utils.profiler{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IUpdateReceiver;

    public class ProfilerAgent extends ProfilerAgentTask implements IDisposable {

        protected var _receiver:IUpdateReceiver;

        public function ProfilerAgent(k:IUpdateReceiver);

        public function get receiver():IUpdateReceiver;

        override public function dispose():void;

        public function update(k:int):void;


    }
}//package com.sulake.core.utils.profiler

