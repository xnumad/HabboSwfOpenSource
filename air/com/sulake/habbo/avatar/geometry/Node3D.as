//com.sulake.habbo.avatar.geometry.Node3D

package com.sulake.habbo.avatar.geometry{
    import flash.geom.Vector3D;

    public class Node3D {

        private var _location:Vector3D;
        private var _transformedLocation:Vector3D;
        private var _needsTransformation:Boolean;

        public function Node3D(k:Number, _arg_2:Number, _arg_3:Number);

        public function get location():Vector3D;

        public function get transformedLocation():Vector3D;

        public function applyTransform(k:Matrix4x4):void;


    }
}//package com.sulake.habbo.avatar.geometry

