package com.sulake.core.utils.profiler
{
    import flash.text.TextField;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IProfiler;
    import flash.text.TextFormat;

    public class ProfilerViewer extends TextField implements IDisposable 
    {
        protected var _disposed:Boolean = false;
        private var _profiler:IProfiler;

        public function ProfilerViewer(k:IProfiler)
        {
            var _local_2:TextFormat = new TextFormat("Courier New", 8);
            defaultTextFormat = _local_2;
            setTextFormat(_local_2);
            textColor = 0xFFFFFF;
            width = 10;
            height = 10;
            autoSize = "left";
            mouseEnabled = false;
            selectable = false;
            super();
            if (k)
            {
                this._profiler = k;
                this._profiler.addStopEventListener(this.refresh);
            }
        }

        private static function padAlign(k:String, _arg_2:int, _arg_3:String=" ", _arg_4:Boolean=false):String
        {
            var _local_5:int = (_arg_2 - k.length);
            if (_local_5 <= 0)
            {
                return k.substring(0, _arg_2);
            }
            var _local_6:String = "";
            var _local_7:int;
            while (_local_7 < _local_5)
            {
                _local_6 = (_local_6 + _arg_3);
                _local_7++;
            }
            return (_arg_4) ? (_local_6 + k) : (k + _local_6);
        }


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function set profiler(k:IProfiler):void
        {
            if (((!(this._profiler)) && (k)))
            {
                this._profiler = k;
                this._profiler.addStopEventListener(this.refresh);
            }
        }

        public function get profiler():IProfiler
        {
            return this._profiler;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (parent != null)
                {
                    parent.removeChild(this);
                }
                if (this._profiler)
                {
                    this._profiler.removeStopEventListener(this.refresh);
                    this._profiler = null;
                }
                this._disposed = true;
            }
        }

        public function refresh():void
        {
            text = (((((((((((((((((((padAlign("task", 30) + "|") + padAlign("#rounds", 10, " ", true)) + "|") + padAlign("latest ms", 10, " ", true)) + "|") + padAlign("average ms", 10, " ", true)) + "|") + padAlign("total ms", 10, " ", true)) + "|\r") + padAlign("", 30, "-")) + "|") + padAlign("", 10, "-")) + "|") + padAlign("", 10, "-")) + "|") + padAlign("", 10, "-")) + "|") + padAlign("", 10, "-")) + "|\r");
            var k:Array = this._profiler.getProfilerAgentsInArray();
            while (k.length > 0)
            {
                this.recursiveUpdate(k.pop(), 0);
            }
            if (parent)
            {
                parent.swapChildren(this, parent.getChildAt((parent.numChildren - 1)));
            }
        }

        private function recursiveUpdate(task:ProfilerAgentTask, taskNumber:uint):void
        {
            text = (text + (((((((((padAlign(String(task.name), 30) + "|") + padAlign(String(task.rounds), 10)) + "|") + padAlign(String(task.latest), 10)) + "|") + padAlign(String(task.average), 10)) + "|") + padAlign(String(task.total), 10)) + "|\r"));
            var index:uint;
            while (index < task.numSubTasks)
            {
                this.recursiveUpdate(task.getSubTaskAt(index), (taskNumber + 1));
                index++;
            }
        }
    }
}
