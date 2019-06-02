//com.sulake.room.utils.Vector3d

package com.sulake.room.utils{
    import flash.geom.Vector3D;

    public class Vector3d implements IVector3d {

        private var _x:Number;
        private var _y:Number;
        private var _z:Number;
        private var _length:Number;

        public function Vector3d(k:Number=0, _arg_2:Number=0, _arg_3:Number=0);

        public static function sum(k:IVector3d, _arg_2:IVector3d):Vector3d;

        public static function dif(k:IVector3d, _arg_2:IVector3d):Vector3d;

        public static function product(k:IVector3d, _arg_2:Number):Vector3d;

        public static function dotProduct(k:IVector3d, _arg_2:IVector3d):Number;

        public static function crossProduct(k:IVector3d, _arg_2:IVector3d):Vector3d;

        public static function scalarProjection(k:IVector3d, _arg_2:IVector3d):Number;

        public static function cosAngle(k:IVector3d, _arg_2:IVector3d):Number;

        public static function isEqual(k:IVector3d, _arg_2:IVector3d):Boolean;


        public function get x():Number;

        public function get y():Number;

        public function get z():Number;

        public function get length():Number;

        public function set x(k:Number):void;

        public function set y(k:Number):void;

        public function set z(k:Number):void;

        public function negate():void;

        public function add(k:IVector3d):void;

        public function sub(k:IVector3d):void;

        public function mul(k:Number):void;

        public function div(k:Number):void;

        public function assign(k:IVector3d):void;

        public function toString():String;

        public function toNativeVector3D():Vector3D;


    }
}//package com.sulake.room.utils

