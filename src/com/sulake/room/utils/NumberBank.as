package com.sulake.room.utils
{
    public class NumberBank 
    {
        private var _size:int = 0;
        private var _reservedNumbers:Array;
        private var _freeNumbers:Array;

        public function NumberBank(k:int)
        {
            this._reservedNumbers = [];
            this._freeNumbers = [];
            super();
            if (k < 0)
            {
                k = 0;
            }
            var _local_2:int;
            while (_local_2 < k)
            {
                this._freeNumbers.push(_local_2);
                _local_2++;
            }
        }

        public function dispose():void
        {
            this._reservedNumbers = null;
            this._freeNumbers = null;
            this._size = 0;
        }

        public function reserveNumber():int
        {
            var k:int;
            if (this._freeNumbers.length > 0)
            {
                k = (this._freeNumbers.pop() as int);
                this._reservedNumbers.push(k);
                return k;
            }
            return -1;
        }

        public function freeNumber(k:int):void
        {
            var _local_2:int = this._reservedNumbers.indexOf(k);
            if (_local_2 >= 0)
            {
                this._reservedNumbers.splice(_local_2, 1);
                this._freeNumbers.push(k);
            }
        }
    }
}
