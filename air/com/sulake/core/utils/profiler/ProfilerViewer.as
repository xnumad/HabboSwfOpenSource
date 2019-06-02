//com.sulake.core.utils.profiler.ProfilerViewer

package com.sulake.core.utils.profiler{
    import flash.text.TextField;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IProfiler;

    public class ProfilerViewer extends TextField implements IDisposable {

        protected var _disposed:Boolean;
        private var _profiler:IProfiler;

        public function ProfilerViewer(k:IProfiler);

        private static function padAlign(k:String, _arg_2:int, _arg_3:String=" ", _arg_4:Boolean=false):String;


        public function get disposed():Boolean;

        public function set profiler(k:IProfiler):void;

        public function get profiler():IProfiler;

        public function dispose():void;

        public function refresh():void;

        private function recursiveUpdate(k:ProfilerAgentTask, _arg_2:uint):void;


    }
}//package com.sulake.core.utils.profiler

