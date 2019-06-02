//com.sulake.habbo.avatar.geometry.Matrix4x4

package com.sulake.habbo.avatar.geometry{
    import com.sulake.core.utils.Map;
    import flash.geom.Vector3D;

    public class Matrix4x4 {

        public static const IDENTITY:Matrix4x4;
        private static const TOLERANS:Number;
        private static var _cacheX:Map;
        private static var _cacheY:Map;
        private static var _cacheZ:Map;

        private var _data:Array;

        public function Matrix4x4(k:Number=0, _arg_2:Number=0, _arg_3:Number=0, _arg_4:Number=0, _arg_5:Number=0, _arg_6:Number=0, _arg_7:Number=0, _arg_8:Number=0, _arg_9:Number=0);

        public static function getXRotationMatrix(k:Number):Matrix4x4;

        public static function getYRotationMatrix(k:Number):Matrix4x4;

        public static function getZRotationMatrix(k:Number):Matrix4x4;


        public function identity():Matrix4x4;

        public function vectorMultiplication(k:Vector3D):Vector3D;

        public function multiply(k:Matrix4x4):Matrix4x4;

        public function scalarMultiply(k:Number):void;

        public function rotateX(k:Number):Matrix4x4;

        public function rotateY(k:Number):Matrix4x4;

        public function rotateZ(k:Number):Matrix4x4;

        public function skew():void;

        public function transpose():Matrix4x4;

        public function equals(k:Matrix4x4):Boolean;

        public function get data():Array;


    }
}//package com.sulake.habbo.avatar.geometry

