//com.sulake.habbo.avatar.cache.AvatarImageActionCache

package com.sulake.habbo.avatar.cache{
    import flash.utils.Dictionary;

    public class AvatarImageActionCache {

        private var _cache:Dictionary;
        private var _lastAccessTime:int;

        public function AvatarImageActionCache();

        public function dispose():void;

        public function getDirectionCache(k:int):AvatarImageDirectionCache;

        public function updateDirectionCache(k:int, _arg_2:AvatarImageDirectionCache):void;

        public function updateLastAccesTime():void;

        public function getLastAccessTime():int;


    }
}//package com.sulake.habbo.avatar.cache

