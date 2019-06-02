//com.sulake.habbo.avatar.animation.IAnimationManager

package com.sulake.habbo.avatar.animation{
    import flash.utils.Dictionary;

    public /*dynamic*/ interface IAnimationManager {

        function get animations():Dictionary;
        function getAnimation(k:String):IAnimation;
        function getLayerData(k:String, _arg_2:int, _arg_3:String):IAnimationLayerData;

    }
}//package com.sulake.habbo.avatar.animation

