package com.sulake.habbo.avatar.animation
{
    import flash.utils.Dictionary;

    public interface IAnimationManager 
    {
        function get animations():Dictionary;
        function getAnimation(_arg_1:String):IAnimation;
        function getLayerData(_arg_1:String, _arg_2:int, _arg_3:String):IAnimationLayerData;
    }
}
