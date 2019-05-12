package com.sulake.habbo.avatar.structure.animation
{
    public class AnimationActionPart 
    {
        private var _frames:Array;

        public function AnimationActionPart(k:XML)
        {
            var _local_2:XML;
            var _local_3:int;
            super();
            this._frames = new Array();
            for each (_local_2 in k.frame)
            {
                this._frames.push(new AnimationFrame(_local_2));
                _local_3 = parseInt(_local_2.@repeats);
                if (_local_3 > 1)
                {
                    while (--_local_3 > 0)
                    {
                        this._frames.push(this._frames[(this._frames.length - 1)]);
                    }
                }
            }
        }

        public function get frames():Array
        {
            return this._frames;
        }
    }
}
