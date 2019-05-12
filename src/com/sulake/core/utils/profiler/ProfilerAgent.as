package com.sulake.core.utils.profiler
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IUpdateReceiver;
    import flash.utils.getQualifiedClassName;

    public class ProfilerAgent extends ProfilerAgentTask implements IDisposable 
    {
        protected var _receiver:IUpdateReceiver;

        public function ProfilerAgent(k:IUpdateReceiver)
        {
            this._receiver = k;
            var _local_2:String = getQualifiedClassName(this._receiver);
            super(_local_2.slice((_local_2.lastIndexOf(":") + 1), _local_2.length));
        }

        public function get receiver():IUpdateReceiver
        {
            return this._receiver;
        }

        override public function dispose():void
        {
            this._receiver = null;
            super.dispose();
        }

        public function update(k:int):void
        {
            if (!paused)
            {
                super.start();
                this._receiver.update(k);
                super.stop();
            }
        }
    }
}
