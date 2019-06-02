//com.sulake.habbo.avatar.geometry.GeometryBodyPart

package com.sulake.habbo.avatar.geometry{
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.IAvatarImage;
    import flash.geom.Vector3D;

    public class GeometryBodyPart extends Node3D {

        private static const HELPER_PARTS_ARR:Array;
        private static const HELPER_SORTABLE_PARTS:Array;
        private static const HELPER_SORTED_PARTS:Array;

        private var _id:String;
        private var _parts:Dictionary;
        private var _radius:Number;
        private var _dynamicParts:Dictionary;

        public function GeometryBodyPart(k:XML);

        public function getDynamicParts(k:IAvatarImage):Array;

        public function getPartIds(k:IAvatarImage):Array;

        public function removeDynamicParts(k:IAvatarImage):Boolean;

        public function addPart(k:XML, _arg_2:IAvatarImage):Boolean;

        public function hasPart(k:String, _arg_2:IAvatarImage):Boolean;

        public function getParts(k:Matrix4x4, _arg_2:Vector3D, _arg_3:IAvatarImage):Array;

        public function getDistance(k:Vector3D):Number;

        public function get id():String;

        private function orderParts(k:Array, _arg_2:Array):Number;

        public function get radius():Number;


    }
}//package com.sulake.habbo.avatar.geometry

