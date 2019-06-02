//com.sulake.room.renderer.cache.RoomObjectLocationCacheItem

package com.sulake.room.renderer.cache{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.utils.IVector3d;

    public class RoomObjectLocationCacheItem {

        private var _roomObjectVariableAccurateZ:String;
        private var _geometryUpdateId:int;
        private var _objectUpdateId:int;
        private var _objectUpdateLoc:Vector3d;
        private var _screenLoc:Vector3d;
        private var _locationChanged:Boolean;

        public function RoomObjectLocationCacheItem(k:String);

        public function get locationChanged():Boolean;

        public function dispose():void;

        public function getScreenLocation(k:IRoomObject, _arg_2:IRoomGeometry):IVector3d;


    }
}//package com.sulake.room.renderer.cache

