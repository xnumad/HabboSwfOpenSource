//com.sulake.habbo.avatar.animation.ISpriteDataContainer

package com.sulake.habbo.avatar.animation{
    public /*dynamic*/ interface ISpriteDataContainer {

        function get animation():IAnimation;
        function get id():String;
        function get ink():int;
        function get member():String;
        function get hasDirections():Boolean;
        function get hasStaticY():Boolean;
        function getDirectionOffsetX(k:int):int;
        function getDirectionOffsetY(k:int):int;
        function getDirectionOffsetZ(k:int):int;
        function getCachedAssetName(k:int, _arg_2:int, _arg_3:int):String;
        function setCachedAssetName(k:int, _arg_2:int, _arg_3:int, _arg_4:String):void;

    }
}//package com.sulake.habbo.avatar.animation

