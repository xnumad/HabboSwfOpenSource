package com.sulake.habbo.utils
{
    public class FixedSizeStack 
    {
        private var _data:Array;
        private var _maxSize:int = 0;
        private var _index:int = 0;

        public function FixedSizeStack(k:int)
        {
            this._data = [];
            super();
            this._maxSize = k;
        }

        public function reset():void
        {
            this._data = [];
            this._index = 0;
        }

        public function _Str_22775(k:int):void
        {
            if (this._data.length < this._maxSize)
            {
                this._data.push(k);
            }
            else
            {
                this._data[this._index] = k;
            }
            this._index = ((this._index + 1) % this._maxSize);
        }

        public function _Str_25797():int
        {
            var k:int = int.MIN_VALUE;
            var _local_2:int;
            while (_local_2 < this._maxSize)
            {
                if (this._data[_local_2] > k)
                {
                    k = this._data[_local_2];
                }
                _local_2++;
            }
            return k;
        }

        public function _Str_26219():int
        {
            var k:int = int.MAX_VALUE;
            var _local_2:int;
            while (_local_2 < this._maxSize)
            {
                if (this._data[_local_2] < k)
                {
                    k = this._data[_local_2];
                }
                _local_2++;
            }
            return k;
        }
    }
}
