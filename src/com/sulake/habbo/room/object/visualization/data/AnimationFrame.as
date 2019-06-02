package com.sulake.habbo.room.object.visualization.data
{
    public class AnimationFrame 
    {
        public static const FRAME_REPEAT_FOREVER:int = -1;
        public static const SEQUENCE_NOT_DEFINED:int = -1;
        private static const POOL_SIZE_LIMIT:int = 3000;
        private static const POOL:Array = [];

        private var _id:int = 0;
        private var _x:int = 0;
        private var _y:int = 0;
        private var _repeats:int = 1;
        private var _frameRepeats:int = 1;
        private var _remainingFrameRepeats:int = 1;
        private var _activeSequence:int = -1;
        private var _activeSequenceOffset:int = 0;
        private var _isLastFrame:Boolean = false;
        private var _isRecycled:Boolean = false;


        public static function _Str_2363(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:Boolean, _arg_7:int=-1, _arg_8:int=0):AnimationFrame
        {
            var _local_9:AnimationFrame = ((POOL.length > 0) ? POOL.pop() : new (AnimationFrame)());
            _local_9._isRecycled = false;
            _local_9._id = k;
            _local_9._x = _arg_2;
            _local_9._y = _arg_3;
            _local_9._isLastFrame = _arg_6;
            if (_arg_4 < 1)
            {
                _arg_4 = 1;
            }
            _local_9._repeats = _arg_4;
            if (_arg_5 < 0)
            {
                _arg_5 = FRAME_REPEAT_FOREVER;
            }
            _local_9._frameRepeats = _arg_5;
            _local_9._remainingFrameRepeats = _arg_5;
            if (_arg_7 >= 0)
            {
                _local_9._activeSequence = _arg_7;
                _local_9._activeSequenceOffset = _arg_8;
            }
            return _local_9;
        }


        public function get id():int
        {
            if (this._id >= 0)
            {
                return this._id;
            }
            return -(this._id) * Math.random();
        }

        public function get x():int
        {
            return this._x;
        }

        public function get y():int
        {
            return this._y;
        }

        public function get repeats():int
        {
            return this._repeats;
        }

        public function get frameRepeats():int
        {
            return this._frameRepeats;
        }

        public function get isLastFrame():Boolean
        {
            return this._isLastFrame;
        }

        public function get _Str_9508():int
        {
            if (this._frameRepeats < 0)
            {
                return FRAME_REPEAT_FOREVER;
            }
            return this._remainingFrameRepeats;
        }

        public function set _Str_9508(k:int):void
        {
            if (k < 0)
            {
                k = 0;
            }
            if (((this._frameRepeats > 0) && (k > this._frameRepeats)))
            {
                k = this._frameRepeats;
            }
            this._remainingFrameRepeats = k;
        }

        public function get activeSequence():int
        {
            return this._activeSequence;
        }

        public function get activeSequenceOffset():int
        {
            return this._activeSequenceOffset;
        }

        public function recycle():void
        {
            if (!this._isRecycled)
            {
                this._isRecycled = true;
                if (POOL.length < POOL_SIZE_LIMIT)
                {
                    POOL.push(this);
                }
            }
        }
    }
}
