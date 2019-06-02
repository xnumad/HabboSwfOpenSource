package com.sulake.room.utils
{
    public class Vector3d implements IVector3d 
    {
        private var _x:Number;
        private var _y:Number;
        private var _z:Number;
        private var _length:Number = NaN;

        public function Vector3d(k:Number=0, _arg_2:Number=0, _arg_3:Number=0)
        {
            this._x = k;
            this._y = _arg_2;
            this._z = _arg_3;
        }

        public static function sum(k:IVector3d, _arg_2:IVector3d):Vector3d
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return null;
            }
            var _local_3:Vector3d = new Vector3d((k.x + _arg_2.x), (k.y + _arg_2.y), (k.z + _arg_2.z));
            return _local_3;
        }

        public static function dif(k:IVector3d, _arg_2:IVector3d):Vector3d
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return null;
            }
            var _local_3:Vector3d = new Vector3d((k.x - _arg_2.x), (k.y - _arg_2.y), (k.z - _arg_2.z));
            return _local_3;
        }

        public static function product(k:IVector3d, _arg_2:Number):Vector3d
        {
            if (k == null)
            {
                return null;
            }
            var _local_3:Vector3d = new Vector3d((k.x * _arg_2), (k.y * _arg_2), (k.z * _arg_2));
            return _local_3;
        }

        public static function dotProduct(k:IVector3d, _arg_2:IVector3d):Number
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return 0;
            }
            return ((k.x * _arg_2.x) + (k.y * _arg_2.y)) + (k.z * _arg_2.z);
        }

        public static function crossProduct(k:IVector3d, _arg_2:IVector3d):Vector3d
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return null;
            }
            var _local_3:Vector3d = new Vector3d(((k.y * _arg_2.z) - (k.z * _arg_2.y)), ((k.z * _arg_2.x) - (k.x * _arg_2.z)), ((k.x * _arg_2.y) - (k.y * _arg_2.x)));
            return _local_3;
        }

        public static function scalarProjection(k:IVector3d, _arg_2:IVector3d):Number
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return -1;
            }
            var _local_3:Number = _arg_2.length;
            if (_local_3 > 0)
            {
                return (((k.x * _arg_2.x) + (k.y * _arg_2.y)) + (k.z * _arg_2.z)) / _local_3;
            }
            return -1;
        }

        public static function cosAngle(k:IVector3d, _arg_2:IVector3d):Number
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return 0;
            }
            var _local_3:Number = (k.length * _arg_2.length);
            if (_local_3 == 0)
            {
                return 0;
            }
            return Vector3d.dotProduct(k, _arg_2) / _local_3;
        }

        public static function isEqual(k:IVector3d, _arg_2:IVector3d):Boolean
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return false;
            }
            if ((((k.x == _arg_2.x) && (k.y == _arg_2.y)) && (k.z == _arg_2.z)))
            {
                return true;
            }
            return false;
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

        public function get length():Number
        {
            if (isNaN(this._length))
            {
                this._length = Math.sqrt((((this._x * this._x) + (this._y * this._y)) + (this._z * this._z)));
            }
            return this._length;
        }

        public function set x(k:Number):void
        {
            this._x = k;
            this._length = NaN;
        }

        public function set y(k:Number):void
        {
            this._y = k;
            this._length = NaN;
        }

        public function set z(k:Number):void
        {
            this._z = k;
            this._length = NaN;
        }

        public function negate():void
        {
            this._x = -(this._x);
            this._y = -(this._y);
            this._z = -(this._z);
        }

        public function add(k:IVector3d):void
        {
            if (k == null)
            {
                return;
            }
            this._x = (this._x + k.x);
            this._y = (this._y + k.y);
            this._z = (this._z + k.z);
            this._length = NaN;
        }

        public function sub(k:IVector3d):void
        {
            if (k == null)
            {
                return;
            }
            this._x = (this._x - k.x);
            this._y = (this._y - k.y);
            this._z = (this._z - k.z);
            this._length = NaN;
        }

        public function mul(k:Number):void
        {
            this._x = (this._x * k);
            this._y = (this._y * k);
            this._z = (this._z * k);
            this._length = NaN;
        }

        public function div(k:Number):void
        {
            if (k != 0)
            {
                this._x = (this._x / k);
                this._y = (this._y / k);
                this._z = (this._z / k);
                this._length = NaN;
            }
        }

        public function assign(k:IVector3d):void
        {
            if (k == null)
            {
                return;
            }
            this._x = k.x;
            this._y = k.y;
            this._z = k.z;
            this._length = NaN;
        }

        public function toString():String
        {
            return ("(" + [this._x, this._y, this._z].join(",")) + ")";
        }
    }
}
