package com.sulake.core.utils.profiler
{
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.getTimer;

    public class ProfilerAgentTask implements IDisposable 
    {
        private var _name:String;
        private var _rounds:uint;
        private var _total:int;
        private var _latest:int;
        private var _average:Number;
        private var _caption:String;
        private var _running:Boolean;
        private var _disposed:Boolean = false;
        private var _children:Array;
        private var _startTime:uint;
        private var _paused:Boolean = false;

        public function ProfilerAgentTask(name:String, caption:String="")
        {
            this._name = name;
            this._rounds = 0;
            this._average = 0;
            this._running = false;
            this._children = new Array();
            this._caption = caption;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._disposed = true;
            }
        }

        public function start():void
        {
            if (!this._running)
            {
                this._startTime = getTimer();
                this._running = true;
            }
        }

        public function stop():void
        {
            if (this._running)
            {
                this._latest = (getTimer() - this._startTime);
                this._rounds++;
                this._total = (this._total + this._latest);
                this._average = (this._total / this._rounds);
                this._running = false;
            }
        }

        public function get name():String
        {
            return this._name;
        }

        public function get rounds():uint
        {
            return this._rounds;
        }

        public function get total():int
        {
            return this._total;
        }

        public function get latest():int
        {
            return this._latest;
        }

        public function get average():Number
        {
            return this._average;
        }

        public function get caption():String
        {
            return this._caption;
        }

        public function set caption(caption:String):void
        {
            this._caption = caption;
        }

        public function get running():Boolean
        {
            return this._running;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get paused():Boolean
        {
            return this._paused;
        }

        public function set paused(paused:Boolean):void
        {
            this._paused = paused;
        }

        public function get numSubTasks():uint
        {
            return this._children.length;
        }

        public function addSubTask(subTask:ProfilerAgentTask):void
        {
            if (this.getSubTaskByName(subTask.name) != null)
            {
                throw (new Error((('Component profiler task with name "' + subTask.name) + '" already exists!')));
            }
            this._children.push(subTask);
        }

        public function removeSubTask(k:ProfilerAgentTask):ProfilerAgentTask
        {
            var index:int = this._children.indexOf(k);
            if (index > -1)
            {
                this._children.splice(index, 1);
            }
            return k;
        }

        public function getSubTaskAt(k:uint):ProfilerAgentTask
        {
            return this._children[k] as ProfilerAgentTask;
        }

        public function getSubTaskByName(name:String):ProfilerAgentTask
        {
            var index:uint;
            while (index < this._children.length)
            {
                var subTask:ProfilerAgentTask = (this._children[index++] as ProfilerAgentTask);
                if (subTask.name == name)
                {
                    return subTask;
                }
            }
            return null;
        }
    }
}
