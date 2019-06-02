package com.sulake.room.renderer.cache
{
    public class RoomObjectCacheItem 
    {
        private var _objectId:int;
        private var _location:RoomObjectLocationCacheItem = null;
        private var _sprites:RoomObjectSortableSpriteCacheItem = null;

        public function RoomObjectCacheItem(k:String)
        {
            this._location = new RoomObjectLocationCacheItem(k);
            this._sprites = new RoomObjectSortableSpriteCacheItem();
        }

        public function get location():RoomObjectLocationCacheItem
        {
            return this._location;
        }

        public function get sprites():RoomObjectSortableSpriteCacheItem
        {
            return this._sprites;
        }

        public function dispose():void
        {
            if (this._location != null)
            {
                this._location.dispose();
                this._location = null;
            }
            if (this._sprites != null)
            {
                this._sprites.dispose();
                this._sprites = null;
            }
        }

        public function set _Str_1577(k:int):void
        {
            this._objectId = k;
        }

        public function get _Str_1577():int
        {
            return this._objectId;
        }
    }
}
