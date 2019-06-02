//com.sulake.habbo.room.object.visualization.room.RoomPlaneGeometry

package com.sulake.habbo.room.object.visualization.room{
    import away3d.primitives.PrimitiveBase;
    import flash.geom.Vector3D;
    import __AS3__.vec.Vector;
    import away3d.core.base.CompactSubGeometry;

    public class RoomPlaneGeometry extends PrimitiveBase {

        private static const NUM_VERTICES:int;

        private var _loc:Vector3D;
        private var _leftSide:Vector3D;
        private var _rightSide:Vector3D;

        public function RoomPlaneGeometry(k:Vector3D, _arg_2:Vector3D, _arg_3:Vector3D);

        private static function addVertex(k:Vector3D, _arg_2:uint, _arg_3:Vector.<Number>):void;


        override public function dispose():void;

        override protected function buildGeometry(k:CompactSubGeometry):void;

        override protected function buildUVs(k:CompactSubGeometry):void;


    }
}//package com.sulake.habbo.room.object.visualization.room

