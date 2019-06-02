//com.sulake.habbo.avatar.cache.AvatarImageDirectionCache

package com.sulake.habbo.avatar.cache{
    import __AS3__.vec.Vector;
    import com.sulake.habbo.avatar.AvatarImagePartContainer;
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.AvatarImageBodyPartContainer;

    public class AvatarImageDirectionCache {

        private static const KEY_SEPARATOR:String;
        private static const NO_FRAMES_KEY:String;

        private var _partList:Vector.<AvatarImagePartContainer>;
        private var _images:Dictionary;
        private var _keyCache:Dictionary;

        public function AvatarImageDirectionCache(k:Vector.<AvatarImagePartContainer>);

        public function dispose():void;

        public function getPartList():Vector.<AvatarImagePartContainer>;

        public function getImageContainer(k:int):AvatarImageBodyPartContainer;

        public function updateImageContainer(k:AvatarImageBodyPartContainer, _arg_2:int):void;

        private function getCacheKey(k:int):String;


    }
}//package com.sulake.habbo.avatar.cache

