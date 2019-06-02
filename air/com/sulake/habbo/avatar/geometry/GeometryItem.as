//com.sulake.habbo.avatar.geometry.GeometryItem

package com.sulake.habbo.avatar.geometry{
    import flash.geom.Vector3D;

    public class GeometryItem extends Node3D {

        private var _id:String;
        private var _radius:Number;
        private var _normal:Vector3D;
        private var _isDoubleSided:Boolean;
        private var _isDynamic:Boolean;

        public function GeometryItem(k:XML, _arg_2:Boolean=false);

        public function getDistance(k:Vector3D):Number;

        public function get id():String;

        public function get normal():Vector3D;

        public function get isDoubleSided():Boolean;

        public function toString():String;

        public function get isDynamic():Boolean;


    }
}//package com.sulake.habbo.avatar.geometry

