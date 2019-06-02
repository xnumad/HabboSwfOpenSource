//com.sulake.core.utils.profiler.ProfilerAgentTask

package com.sulake.core.utils.profiler{
    import com.sulake.core.runtime.IDisposable;

    public class ProfilerAgentTask implements IDisposable {

        private var _name:String;
        private var _rounds:uint;
        private var _total:int;
        private var _latest:int;
        private var _average:Number;
        private var _caption:String;
        private var _running:Boolean;
        private var _disposed:Boolean;
        private var _children:Array;
        private var _startTime:uint;
        private var _paused:Boolean;

        public function ProfilerAgentTask(k:String, _arg_2:String="");

        public function dispose():void;

        public function start():void;

        public function stop():void;

        public function get name():String;

        public function get rounds():uint;

        public function get total():int;

        public function get latest():int;

        public function get average():Number;

        public function get caption():String;

        public function set caption(k:String):void;

        public function get running():Boolean;

        public function get disposed():Boolean;

        public function get paused():Boolean;

        public function set paused(k:Boolean):void;

        public function get numSubTasks():uint;

        public function addSubTask(k:ProfilerAgentTask):void;

        public function removeSubTask(k:ProfilerAgentTask):ProfilerAgentTask;

        public function getSubTaskAt(k:uint):ProfilerAgentTask;

        public function getSubTaskByName(k:String):ProfilerAgentTask;


    }
}//package com.sulake.core.utils.profiler

