package com.sulake.habbo.avatar.animation
{
    import flash.utils.Dictionary;

    public interface IAnimationManager 
    {
        function get animations():Dictionary;
        function _Str_720(_arg_1:String):IAnimation;
        function _Str_607(_arg_1:String, _arg_2:int, _arg_3:String):IAnimationLayerData;
    }
}
