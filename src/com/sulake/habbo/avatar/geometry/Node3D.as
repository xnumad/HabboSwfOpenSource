package com.sulake.habbo.avatar.geometry
{
    public class Node3D 
    {
        private var _location:Vector3D;
        private var _transformedLocation:Vector3D;
        private var _needsTransformation:Boolean = false;

        public function Node3D(k:Number, _arg_2:Number, _arg_3:Number)
        {
            this._transformedLocation = new Vector3D();
            super();
            this._location = new Vector3D(k, _arg_2, _arg_3);
            if ((((!(k == 0)) || (!(_arg_2 == 0))) || (!(_arg_3 == 0))))
            {
                this._needsTransformation = true;
            }
        }

        public function get location():Vector3D
        {
            return this._location;
        }

        public function get transformedLocation():Vector3D
        {
            return this._transformedLocation;
        }

        public function applyTransform(k:Matrix4x4):void
        {
            if (this._needsTransformation)
            {
                this._transformedLocation = k.vectorMultiplication(this._location);
            }
        }
    }
}
