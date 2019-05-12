package com.sulake.habbo.avatar.geometry
{
    public class Vector3D 
    {
        private var _x:Number;
        private var _y:Number;
        private var _z:Number;

        public function Vector3D(k:Number=0, _arg_2:Number=0, _arg_3:Number=0)
        {
            this._x = k;
            this._y = _arg_2;
            this._z = _arg_3;
        }

        public static function _Str_2224(k:Vector3D, _arg_2:Vector3D):Number
        {
            return ((k.x * _arg_2.x) + (k.y * _arg_2.y)) + (k.z * _arg_2.z);
        }

        public static function _Str_1645(k:Vector3D, _arg_2:Vector3D):Vector3D
        {
            var _local_3:Vector3D = new (Vector3D)();
            _local_3.x = ((k.y * _arg_2.z) - (k.z * _arg_2.y));
            _local_3.y = ((k.z * _arg_2.x) - (k.x * _arg_2.z));
            _local_3.z = ((k.x * _arg_2.y) - (k.y * _arg_2.x));
            return _local_3;
        }

        public static function subtract(k:Vector3D, _arg_2:Vector3D):Vector3D
        {
            return new Vector3D((k.x - _arg_2.x), (k.y - _arg_2.y), (k.z - _arg_2.z));
        }


        public function _Str_2224(k:Vector3D):Number
        {
            return ((this._x * k.x) + (this._y * k.y)) + (this._z * k.z);
        }

        public function _Str_1645(k:Vector3D):Vector3D
        {
            var _local_2:Vector3D = new Vector3D();
            _local_2.x = ((this._y * k.z) - (this._z * k.y));
            _local_2.y = ((this._z * k.x) - (this._x * k.z));
            _local_2.z = ((this._x * k.y) - (this._y * k.x));
            return _local_2;
        }

        public function subtract(k:Vector3D):void
        {
            this._x = (this._x - k.x);
            this._y = (this._y - k.y);
            this._z = (this._z - k.z);
        }

        public function add(k:Vector3D):void
        {
            this._x = (this._x + k.x);
            this._y = (this._y + k.y);
            this._z = (this._z + k.z);
        }

        public function normalize():void
        {
            var k:Number = (1 / this.length());
            this._x = (this._x * k);
            this._y = (this._y * k);
            this._z = (this._z * k);
        }

        public function length():Number
        {
            return Math.sqrt((((this._x * this._x) + (this._y * this._y)) + (this._z * this._z)));
        }

        public function toString():String
        {
            var k:* = (((((("Vector3D: (" + this._x) + ",") + this._y) + ",") + this._z) + ")");
            return k;
        }

        public function get x():Number
        {
            return this._x;
        }

        public function get y():Number
        {
            return this._y;
        }

        public function get z():Number
        {
            return this._z;
        }

        public function set x(k:Number):void
        {
            this._x = k;
        }

        public function set y(k:Number):void
        {
            this._y = k;
        }

        public function set z(k:Number):void
        {
            this._z = k;
        }
    }
}
