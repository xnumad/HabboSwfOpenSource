//com.sulake.room.utils.IVector3d

package com.sulake.room.utils{
    import flash.geom.Vector3D;

    public /*dynamic*/ interface IVector3d {

        function get x():Number;
        function get y():Number;
        function get z():Number;
        function get length():Number;
        function toNativeVector3D():Vector3D;

    }
}//package com.sulake.room.utils

