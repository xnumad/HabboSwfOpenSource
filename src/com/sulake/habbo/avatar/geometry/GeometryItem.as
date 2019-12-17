package com.sulake.habbo.avatar.geometry
{
    public class GeometryItem extends Node3D 
    {
        private var _id:String;
        private var _radius:Number;
        private var _normal:Vector3D;
        private var _isDoubleSided:Boolean = false;
        private var _isDynamic:Boolean = false;

        public function GeometryItem(k:XML, _arg_2:Boolean=false)
        {
            super(parseFloat(k.@x), parseFloat(k.@y), parseFloat(k.@z));
            this._id = String(k.@id);
            this._radius = parseFloat(k.@radius);
            this._normal = new Vector3D(parseFloat(k.@nx), parseFloat(k.@ny), parseFloat(k.@nz));
            this._isDoubleSided = (parseInt(k.@double) as Boolean);
            this._isDynamic = _arg_2;
        }

        public function getDistance(k:Vector3D):Number
        {
            var _local_2:Number = Math.abs(((k.z - this.transformedLocation.z) - this._radius));
            var _local_3:Number = Math.abs(((k.z - this.transformedLocation.z) + this._radius));
            return Math.min(_local_2, _local_3);
        }

        public function get id():String
        {
            return this._id;
        }

        public function get normal():Vector3D
        {
            return this._normal;
        }

        public function get isDoubleSided():Boolean
        {
            return this._isDoubleSided;
        }

        public function toString():String
        {
            var k:String = ((((this._id + ": ") + this.location) + " - ") + this.transformedLocation);
            return k;
        }

        public function get isDynamic():Boolean
        {
            return this._isDynamic;
        }
    }
}
