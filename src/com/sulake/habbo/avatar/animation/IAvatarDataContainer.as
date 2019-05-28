package com.sulake.habbo.avatar.animation
{
    import flash.geom.ColorTransform;

    public interface IAvatarDataContainer 
    {
        function get ink():int;
        function get colorTransform():ColorTransform;
        function get paletteIsGrayscale():Boolean;
        function get reds():Array;
        function get greens():Array;
        function get blues():Array;
        function get alphas():Array;
    }
}
