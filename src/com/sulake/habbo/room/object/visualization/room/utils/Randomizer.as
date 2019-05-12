package com.sulake.habbo.room.object.visualization.room.utils
{
    public class Randomizer 
    {
        public static const _Str_21045:int = 1;
        public static const _Str_20078:int = 16777216;
        private static var _Str_3699:Randomizer = null;

        private var _Str_16737:int = 1;
        private var _Str_16979:int = 16777216;
        private var _Str_25697:int = 69069;
        private var _Str_23320:int = 5;


        public static function _Str_17384(k:int=1):void
        {
            if (_Str_3699 == null)
            {
                _Str_3699 = new (Randomizer)();
            }
            _Str_3699._Str_15634 = k;
        }

        public static function _Str_26085(k:int=16777216):void
        {
            if (_Str_3699 == null)
            {
                _Str_3699 = new (Randomizer)();
            }
            _Str_3699._Str_25321 = k;
        }

        public static function _Str_1612(k:int, _arg_2:int, _arg_3:int):Array
        {
            if (_Str_3699 == null)
            {
                _Str_3699 = new (Randomizer)();
            }
            return _Str_3699._Str_24535(k, _arg_2, _arg_3);
        }

        public static function _Str_23572(k:int, _arg_2:int):Array
        {
            if (_Str_3699 == null)
            {
                _Str_3699 = new (Randomizer)();
            }
            return _Str_3699._Str_24231(k, _arg_2);
        }


        public function set _Str_15634(k:int):void
        {
            this._Str_16737 = k;
        }

        public function set _Str_25321(k:int):void
        {
            if (k < 1)
            {
                k = 1;
            }
            this._Str_16979 = k;
        }

        public function dispose():void
        {
        }

        public function _Str_24535(k:int, _arg_2:int, _arg_3:int):Array
        {
            var _local_4:Array = [];
            var _local_5:int;
            while (_local_5 < k)
            {
                _local_4.push(this._Str_19361(_arg_2, (_arg_3 - _arg_2)));
                _local_5++;
            }
            return _local_4;
        }

        public function _Str_24231(k:int, _arg_2:int):Array
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
                _local_7 = this._Str_19361(0, (_local_3.length - 1));
                _local_5.push(_local_3[_local_7]);
                _local_3.splice(_local_7, 1);
                _local_6++;
            }
            return _local_5;
        }

        private function _Str_24980():int
        {
            var k:int = ((this._Str_25697 * this._Str_16737) + this._Str_23320);
            if (k < 0)
            {
                k = -(k);
            }
            k = (k % this._Str_16979);
            this._Str_16737 = k;
            return k;
        }

        private function _Str_19361(k:int, _arg_2:int):int
        {
            var _local_3:int = this._Str_24980();
            if (_arg_2 < 1)
            {
                return k;
            }
            _local_3 = (k + ((_local_3 / this._Str_16979) * _arg_2));
            return _local_3;
        }
    }
}
