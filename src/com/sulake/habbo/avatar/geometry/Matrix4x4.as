package com.sulake.habbo.avatar.geometry
{
    public class Matrix4x4 
    {
        public static const IDENTITY:Matrix4x4 = new Matrix4x4(1, 0, 0, 0, 1, 0, 0, 0, 1);
        private static const TOLERANS:Number = 1E-18;

        private var _data:Array;

        public function Matrix4x4(k:Number=0, _arg_2:Number=0, _arg_3:Number=0, _arg_4:Number=0, _arg_5:Number=0, _arg_6:Number=0, _arg_7:Number=0, _arg_8:Number=0, _arg_9:Number=0)
        {
            this._data = [k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9];
        }

        public static function getXRotationMatrix(k:Number):Matrix4x4
        {
            var _local_2:Number = ((k * Math.PI) / 180);
            var _local_3:Number = Math.cos(_local_2);
            var _local_4:Number = Math.sin(_local_2);
            var _local_5:Matrix4x4 = new Matrix4x4(1, 0, 0, 0, _local_3, -(_local_4), 0, _local_4, _local_3);
            return _local_5;
        }

        public static function getYRotationMatrix(k:Number):Matrix4x4
        {
            var _local_2:Number = ((k * Math.PI) / 180);
            var _local_3:Number = Math.cos(_local_2);
            var _local_4:Number = Math.sin(_local_2);
            var _local_5:Matrix4x4 = new Matrix4x4(_local_3, 0, _local_4, 0, 1, 0, -(_local_4), 0, _local_3);
            return _local_5;
        }

        public static function getZRotationMatrix(k:Number):Matrix4x4
        {
            var _local_2:Number = ((k * Math.PI) / 180);
            var _local_3:Number = Math.cos(_local_2);
            var _local_4:Number = Math.sin(_local_2);
            var _local_5:Matrix4x4 = new Matrix4x4(_local_3, -(_local_4), 0, _local_4, _local_3, 0, 0, 0, 1);
            return _local_5;
        }


        public function identity():Matrix4x4
        {
            this._data = [1, 0, 0, 0, 1, 0, 0, 0, 1];
            return this;
        }

        public function vectorMultiplication(k:Vector3D):Vector3D
        {
            var _local_2:Number = (((k.x * this._data[0]) + (k.y * this._data[3])) + (k.z * this._data[6]));
            var _local_3:Number = (((k.x * this._data[1]) + (k.y * this._data[4])) + (k.z * this._data[7]));
            var _local_4:Number = (((k.x * this._data[2]) + (k.y * this._data[5])) + (k.z * this._data[8]));
            return new Vector3D(_local_2, _local_3, _local_4);
        }

        public function multiply(k:Matrix4x4):Matrix4x4
        {
            var _local_2:Number = (((this._data[0] * k.data[0]) + (this._data[1] * k.data[3])) + (this._data[2] * k.data[6]));
            var _local_3:Number = (((this._data[0] * k.data[1]) + (this._data[1] * k.data[4])) + (this._data[2] * k.data[7]));
            var _local_4:Number = (((this._data[0] * k.data[2]) + (this._data[1] * k.data[5])) + (this._data[2] * k.data[8]));
            var _local_5:Number = (((this._data[3] * k.data[0]) + (this._data[4] * k.data[3])) + (this._data[5] * k.data[6]));
            var _local_6:Number = (((this._data[3] * k.data[1]) + (this._data[4] * k.data[4])) + (this._data[5] * k.data[7]));
            var _local_7:Number = (((this._data[3] * k.data[2]) + (this._data[4] * k.data[5])) + (this._data[5] * k.data[8]));
            var _local_8:Number = (((this._data[6] * k.data[0]) + (this._data[7] * k.data[3])) + (this._data[8] * k.data[6]));
            var _local_9:Number = (((this._data[6] * k.data[1]) + (this._data[7] * k.data[4])) + (this._data[8] * k.data[7]));
            var _local_10:Number = (((this._data[6] * k.data[2]) + (this._data[7] * k.data[5])) + (this._data[8] * k.data[8]));
            return new Matrix4x4(_local_2, _local_3, _local_4, _local_5, _local_6, _local_7, _local_8, _local_9, _local_10);
        }

        public function scalarMultiply(k:Number):void
        {
            var _local_2:int;
            while (_local_2 < this._data.length)
            {
                this._data[_local_2] = (this._data[_local_2] * k);
                _local_2++;
            }
        }

        public function rotateX(k:Number):Matrix4x4
        {
            var _local_2:Number = ((k * Math.PI) / 180);
            var _local_3:Number = Math.cos(_local_2);
            var _local_4:Number = Math.sin(_local_2);
            var _local_5:Matrix4x4 = new Matrix4x4(1, 0, 0, 0, _local_3, -(_local_4), 0, _local_4, _local_3);
            return _local_5.multiply(this);
        }

        public function rotateY(k:Number):Matrix4x4
        {
            var _local_2:Number = ((k * Math.PI) / 180);
            var _local_3:Number = Math.cos(_local_2);
            var _local_4:Number = Math.sin(_local_2);
            var _local_5:Matrix4x4 = new Matrix4x4(_local_3, 0, _local_4, 0, 1, 0, -(_local_4), 0, _local_3);
            return _local_5.multiply(this);
        }

        public function rotateZ(k:Number):Matrix4x4
        {
            var _local_2:Number = ((k * Math.PI) / 180);
            var _local_3:Number = Math.cos(_local_2);
            var _local_4:Number = Math.sin(_local_2);
            var _local_5:Matrix4x4 = new Matrix4x4(_local_3, -(_local_4), 0, _local_4, _local_3, 0, 0, 0, 1);
            return _local_5.multiply(this);
        }

        public function skew():void
        {
        }

        public function transpose():Matrix4x4
        {
            return new Matrix4x4(this._data[0], this._data[3], this._data[6], this._data[1], this._data[4], this._data[7], this._data[2], this._data[5], this._data[8]);
        }

        public function equals(k:Matrix4x4):Boolean
        {
            return false;
        }

        public function get data():Array
        {
            return this._data;
        }
    }
}
