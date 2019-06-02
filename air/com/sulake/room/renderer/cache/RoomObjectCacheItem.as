//com.sulake.room.renderer.cache.RoomObjectCacheItem

package com.sulake.room.renderer.cache{
    public class RoomObjectCacheItem {

        private var _location:RoomObjectLocationCacheItem;
        private var _sprites:RoomObjectSortableSpriteCacheItem;

        public function RoomObjectCacheItem(k:String);

        public function get location():RoomObjectLocationCacheItem;

        public function get sprites():RoomObjectSortableSpriteCacheItem;

        public function dispose():void;


    }
}//package com.sulake.room.renderer.cache

