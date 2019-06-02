package com.sulake.habbo.room.object.visualization.data
{
    public class AnimationFrameSequenceData 
    {
        private var _frames:Array;
        private var _frameIndexes:Array;
        private var _frameRepeats:Array;
        private var _isRandom:Boolean = false;
        private var _loopCount:int = 1;

        public function AnimationFrameSequenceData(k:int, _arg_2:Boolean)
        {
            this._frames = [];
            this._frameIndexes = [];
            this._frameRepeats = [];
            super();
            if (k < 1)
            {
                k = 1;
            }
            this._loopCount = k;
            this._isRandom = _arg_2;
        }

        public function get isRandom():Boolean
        {
            return this._isRandom;
        }

        public function get _Str_2185():int
        {
            return this._frameIndexes.length * this._loopCount;
        }

        public function dispose():void
        {
            this._frames = [];
        }

        public function initialize():void
        {
            var k:int = 1;
            var _local_2:int = -1;
            var _local_3:int = (this._frameIndexes.length - 1);
            while (_local_3 >= 0)
            {
                if (this._frameIndexes[_local_3] == _local_2)
                {
                    k++;
                }
                else
                {
                    _local_2 = this._frameIndexes[_local_3];
                    k = 1;
                }
                this._frameRepeats[_local_3] = k;
                _local_3--;
            }
        }

        public function addFrame(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:DirectionalOffsetData):void
        {
            var _local_7:AnimationFrameData;
            var _local_8:int = 1;
            if (this._frames.length > 0)
            {
                _local_7 = this._frames[(this._frames.length - 1)];
                if (((((((((_local_7.id == k) && (!(_local_7.hasDirectionalOffsets()))) && (_local_7.x == _arg_2)) && (_local_7.y == _arg_3)) && (_local_7.randomX == _arg_4)) && (_arg_4 == 0)) && (_local_7.randomY == _arg_5)) && (_arg_5 == 0)))
                {
                    _local_8 = (_local_8 + _local_7.repeats);
                    this._frames.pop();
                }
            }
            var _local_9:AnimationFrameData;
            if (_arg_6 == null)
            {
                _local_9 = new AnimationFrameData(k, _arg_2, _arg_3, _arg_4, _arg_5, _local_8);
            }
            else
            {
                _local_9 = new AnimationFrameDirectionalData(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _local_8);
            }
            this._frames.push(_local_9);
            this._frameIndexes.push((this._frames.length - 1));
            this._frameRepeats.push(1);
        }

        public function _Str_2259(k:int):AnimationFrameData
        {
            if ((((this._frames.length == 0) || (k < 0)) || (k >= this._Str_2185)))
            {
                return null;
            }
            k = this._frameIndexes[(k % this._frameIndexes.length)];
            return this._frames[k] as AnimationFrameData;
        }

        public function _Str_1674(k:int):int
        {
            if (((k < 0) || (k >= this._Str_2185)))
            {
                return -1;
            }
            if (this._isRandom)
            {
                k = int((Math.random() * this._frameIndexes.length));
                if (k == this._frameIndexes.length)
                {
                    k--;
                }
            }
            return k;
        }

        public function getRepeats(k:int):int
        {
            if (((k < 0) || (k >= this._Str_2185)))
            {
                return 0;
            }
            return this._frameRepeats[(k % this._frameRepeats.length)];
        }
    }
}
