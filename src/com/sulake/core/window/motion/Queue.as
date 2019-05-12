package com.sulake.core.window.motion
{
	import com.sulake.core.window.motion.Motion; Motion;
    public class Queue extends Motion 
    {
        private var _motion:Motion;
        private var _queue:Vector.<Motion>;

        public function Queue(... k)
        {
            var _local_2:Motion;
            this._queue = new Vector.<Motion>();
            super(((k) ? Motion(k[0]).target : null));
            for each (_local_2 in k)
            {
                this._queue.push(_local_2);
            }
            this._motion = k[0];
            _complete = (this._motion == null);
        }

        override public function get running():Boolean
        {
            return ((_running) && (this._motion)) ? this._motion.running : false;
        }

        override public function start():void
        {
            super.start();
            this._motion.start();
        }

        override public function update(k:Number):void
        {
            super.update(k);
            if (this._motion.running)
            {
                this._motion.update(k);
            }
        }

        override public function stop():void
        {
            super.stop();
            this._motion.stop();
        }

        override public function tick(k:int):void
        {
            super.tick(k);
            var _local_2:int;
            this._motion.tick(k);
            if (this._motion.complete)
            {
                this._motion.stop();
                _local_2 = this._queue.indexOf(this._motion);
                if (_local_2 < (this._queue.length - 1))
                {
                    this._motion = this._queue[(_local_2 + 1)];
                    _target = this._motion.target;
                    this._motion.start();
                }
                else
                {
                    _complete = true;
                }
            }
        }
    }
}
