//com.sulake.room.renderer.cache.RoomObjectSortableSpriteCacheItem

package com.sulake.room.renderer.cache{
    import com.sulake.room.renderer.utils.SortableSprite;

    public class RoomObjectSortableSpriteCacheItem {

        private var _sprites:Array;
        private var _updateId1:int;
        private var _updateId2:int;
        private var _isEmpty:Boolean;

        public function RoomObjectSortableSpriteCacheItem();

        public function get spriteCount():int;

        public function get isEmpty():Boolean;

        public function dispose():void;

        public function addSprite(k:SortableSprite):void;

        public function getSprite(k:int):SortableSprite;

        public function needsUpdate(k:int, _arg_2:int):Boolean;

        public function setSpriteCount(k:int):void;


    }
}//package com.sulake.room.renderer.cache

