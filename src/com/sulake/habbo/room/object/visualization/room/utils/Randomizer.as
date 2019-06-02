package com.sulake.habbo.room.object.visualization.room.utils
{
    public class Randomizer 
    {
        public static const DEFAULT_SEED:int = 1;
        public static const DEFAULT_MODULUS:int = 16777216;
        private static var _randomizer:Randomizer = null;

        private var _seed:int = 1;
        private var _modulus:int = 16777216;
        private var _multiplier:int = 69069;
        private var _increment:int = 5;


        public static function setSeed(k:int=1):void
        {
            if (_randomizer == null)
            {
                _randomizer = new (Randomizer)();
            }
            _randomizer.seed = k;
        }

        public static function setModulus(k:int=16777216):void
        {
            if (_randomizer == null)
            {
                _randomizer = new (Randomizer)();
            }
            _randomizer.modulus = k;
        }

        public static function getValues(k:int, _arg_2:int, _arg_3:int):Array
        {
            if (_randomizer == null)
            {
                _randomizer = new (Randomizer)();
            }
            return _randomizer.getRandomValues(k, _arg_2, _arg_3);
        }

        public static function getArray(k:int, _arg_2:int):Array
        {
            if (_randomizer == null)
            {
                _randomizer = new (Randomizer)();
            }
            return _randomizer.getRandomArray(k, _arg_2);
        }


        public function set seed(k:int):void
        {
            this._seed = k;
        }

        public function set modulus(k:int):void
        {
            if (k < 1)
            {
                k = 1;
            }
            this._modulus = k;
        }

        public function dispose():void
        {
        }

        public function getRandomValues(k:int, _arg_2:int, _arg_3:int):Array
        {
            var _local_4:Array = [];
            var _local_5:int;
            while (_local_5 < k)
            {
                _local_4.push(this.iterateScaled(_arg_2, (_arg_3 - _arg_2)));
                _local_5++;
            }
            return _local_4;
        }

        public function getRandomArray(k:int, _arg_2:int):Array
        {
            var _local_7:int;
            if (((k > _arg_2) || (_arg_2 > 1000)))
            {
                return null;
            }
            var _local_3:Array = [];
            var _local_4:int;
            while (_local_4 <= _arg_2)
            {
                _local_3.push(_local_4);
                _local_4++;
            }
            var _local_5:Array = [];
            var _local_6:int;
            while (_local_6 < k)
            {
                _local_7 = this.iterateScaled(0, (_local_3.length - 1));
                _local_5.push(_local_3[_local_7]);
                _local_3.splice(_local_7, 1);
                _local_6++;
            }
            return _local_5;
        }

        private function iterate():int
        {
            var k:int = ((this._multiplier * this._seed) + this._increment);
            if (k < 0)
            {
                k = -(k);
            }
            k = (k % this._modulus);
            this._seed = k;
            return k;
        }

        private function iterateScaled(k:int, _arg_2:int):int
        {
            var _local_3:int = this.iterate();
            if (_arg_2 < 1)
            {
                return k;
            }
            _local_3 = (k + ((_local_3 / this._modulus) * _arg_2));
            return _local_3;
        }
    }
}
