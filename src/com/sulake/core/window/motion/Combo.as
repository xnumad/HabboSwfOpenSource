package com.sulake.core.window.motion
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class Combo extends Motion 
    {
        private var _runningMotions:Vector.<Motion>;
        private var _removedMotions:Vector.<Motion>;

        public function Combo(... k)
        {
            var _local_2:Motion;
            this._runningMotions = new Vector.<Motion>();
            this._removedMotions = new Vector.<Motion>();
            for each (_local_2 in k)
            {
                this._runningMotions.push(_local_2);
            }
            super(((this._runningMotions.length > 0) ? this._runningMotions[0].target : null));
        }

        override public function start():void
        {
            super.start();
            var k:Motion;
            for each (k in this._runningMotions)
            {
                k.start();
            }
        }

        override public function tick(k:int):void
        {
            super.tick(k);
            var _local_2:Motion;
            while ((_local_2 = this._removedMotions.pop()) != null)
            {
                this._runningMotions.splice(this._removedMotions.indexOf(_local_2), 1);
                if (_local_2.running)
                {
                    _local_2.stop();
                }
            }
            for each (_local_2 in this._runningMotions)
            {
                if (_local_2.running)
                {
                    _local_2.tick(k);
                }
                if (_local_2.complete)
                {
                    this._removedMotions.push(_local_2);
                }
            }
            if (this._runningMotions.length > 0)
            {
                for each (_local_2 in this._runningMotions)
                {
                    _target = _local_2.target;
                    if (((_target) && (!(_target.disposed))))
                    {
                        break;
                    }
                }
                _complete = false;
            }
            else
            {
                _complete = true;
            }
        }
    }
}
