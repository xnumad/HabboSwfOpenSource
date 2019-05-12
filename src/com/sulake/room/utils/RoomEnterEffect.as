package com.sulake.room.utils
{
    import flash.utils.getTimer;

    public class RoomEnterEffect 
    {
        public static const _Str_14599:int = 0;
        public static const _Str_11894:int = 1;
        public static const _Str_14215:int = 2;
        public static const _Str_12882:int = 3;
        private static var _Str_621:int = _Str_14599;//0
        private static var _Str_7125:Boolean = false;
        private static var _Str_11007:Number;
        private static var _Str_12311:int = 0;
        private static var _Str_6886:int = (20 * 1000);//20000
        private static var _Str_7448:int = 2000;


        public static function init(k:int, _arg_2:int):void
        {
            _Str_11007 = 0;
            _Str_6886 = k;
            _Str_7448 = _arg_2;
            _Str_12311 = getTimer();
            _Str_621 = _Str_11894;
        }

        public static function _Str_23419():void
        {
            if (((_Str_621 == _Str_14599) || (_Str_621 == _Str_12882)))
            {
                return;
            }
            var k:int = (getTimer() - _Str_12311);
            if (k > (_Str_6886 + _Str_7448))
            {
                _Str_621 = _Str_12882;
                return;
            }
            _Str_7125 = true;
            if (k < _Str_6886)
            {
                _Str_621 = _Str_11894;
                return;
            }
            _Str_621 = _Str_14215;
            _Str_11007 = ((k - _Str_6886) / _Str_7448);
        }

        public static function _Str_22392():void
        {
            _Str_7125 = false;
        }

        public static function _Str_19559():Boolean
        {
            return (_Str_7125) && (_Str_1349());
        }

        public static function _Str_1349():Boolean
        {
            if (((_Str_621 == _Str_11894) || (_Str_621 == _Str_14215)))
            {
                return true;
            }
            return false;
        }

        public static function _Str_16017(k:Number=0, _arg_2:Number=1):Number
        {
            return Math.min(Math.max(_Str_11007, k), _arg_2);
        }

        public static function get _Str_17562():int
        {
            return _Str_6886 + _Str_7448;
        }
    }
}
