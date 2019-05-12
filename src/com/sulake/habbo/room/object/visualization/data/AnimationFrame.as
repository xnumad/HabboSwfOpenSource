package com.sulake.habbo.room.object.visualization.data
{
    public class AnimationFrame 
    {
        public static const _Str_9016:int = -1;
        public static const _Str_14684:int = -1;
        private static const _Str_17315:int = 3000;
        private static const _Str_2469:Array = [];

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
            var _local_9:AnimationFrame = ((_Str_2469.length > 0) ? _Str_2469.pop() : new (AnimationFrame)());
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
                _arg_5 = _Str_9016;
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

        public function get _Str_26059():int
        {
            return this._frameRepeats;
        }

        public function get _Str_20105():Boolean
        {
            return this._isLastFrame;
        }

        public function get _Str_9508():int
        {
            if (this._frameRepeats < 0)
            {
                return _Str_9016;
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

        public function get _Str_23099():int
        {
            return this._activeSequence;
        }

        public function get _Str_25212():int
        {
            return this._activeSequenceOffset;
        }

        public function recycle():void
        {
            if (!this._isRecycled)
            {
                this._isRecycled = true;
                if (_Str_2469.length < _Str_17315)
                {
                    _Str_2469.push(this);
                }
            }
        }
    }
}
