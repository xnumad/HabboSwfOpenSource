//com.sulake.habbo.avatar.animation.AnimationManager

package com.sulake.habbo.avatar.animation{
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.AvatarStructure;

    public class AnimationManager implements IAnimationManager {

        private var _animations:Dictionary;

        public function AnimationManager();

        public function registerAnimation(k:AvatarStructure, _arg_2:XML):Boolean;

        public function getAnimation(k:String):IAnimation;

        public function getLayerData(k:String, _arg_2:int, _arg_3:String):IAnimationLayerData;

        public function get animations():Dictionary;


    }
}//package com.sulake.habbo.avatar.animation

