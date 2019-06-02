//com.sulake.habbo.avatar.animation.SpriteDataContainer

package com.sulake.habbo.avatar.animation{
    import flash.utils.Dictionary;

    public class SpriteDataContainer implements ISpriteDataContainer {

        private var _animation:IAnimation;
        private var _id:String;
        private var _ink:int;
        private var _member:String;
        private var _hasDirections:Boolean;
        private var _hasStaticY:Boolean;
        private var _dx:Array;
        private var _dy:Array;
        private var _dz:Array;
        private var _cachedAssetNames:Dictionary;

        public function SpriteDataContainer(k:IAnimation, _arg_2:XML);

        private static function createCacheKey(k:int, _arg_2:int, _arg_3:int):int;


        public function getDirectionOffsetX(k:int):int;

        public function getDirectionOffsetY(k:int):int;

        public function getDirectionOffsetZ(k:int):int;

        public function get animation():IAnimation;

        public function get id():String;

        public function get ink():int;

        public function get member():String;

        public function get hasDirections():Boolean;

        public function get hasStaticY():Boolean;

        public function getCachedAssetName(k:int, _arg_2:int, _arg_3:int):String;

        public function setCachedAssetName(k:int, _arg_2:int, _arg_3:int, _arg_4:String):void;


    }
}//package com.sulake.habbo.avatar.animation

