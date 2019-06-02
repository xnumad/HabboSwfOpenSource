//com.sulake.room.renderer.cache.RoomObjectCache

package com.sulake.room.renderer.cache{
    import flash.utils.Dictionary;

    public class RoomObjectCache {

        private var _data:Dictionary;
        private var _roomObjectVariableAccurateZ:String;

        public function RoomObjectCache(k:String);

        public function dispose():void;

        public function getObjectCache(k:String):RoomObjectCacheItem;

        public function removeObjectCache(k:String):void;


    }
}//package com.sulake.room.renderer.cache

