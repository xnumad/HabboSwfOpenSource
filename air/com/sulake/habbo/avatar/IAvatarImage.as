//com.sulake.habbo.avatar.IAvatarImage

package com.sulake.habbo.avatar{
    import com.sulake.core.runtime.IDisposable;
    import flash.display.BitmapData;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
    import com.sulake.habbo.avatar.animation.IAnimationLayerData;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.animation.IAvatarDataContainer;

    public /*dynamic*/ interface IAvatarImage extends IDisposable {

        function getCroppedImage(k:String):BitmapData;
        function getImage(k:String, _arg_2:Boolean):BitmapData;
        function setDirection(k:String, _arg_2:int):void;
        function setDirectionAngle(k:String, _arg_2:int):void;
        function updateAnimationByFrames(k:int):void;
        function getScale():String;
        function getSprites():Vector.<ISpriteDataContainer>;
        function getLayerData(k:ISpriteDataContainer):IAnimationLayerData;
        function getAsset(k:String):BitmapDataAsset;
        function getExplicitDirection():int;
        function getProjectedDirection():int;
        function getFigure():IAvatarFigureContainer;
        function getPartColor(k:String):IPartColor;
        function isAnimating():Boolean;
        function getCanvasOffsets():Array;
        function initActionAppends():void;
        function endActionAppends():void;
        function appendAction(k:String, ... _args):Boolean;
        function get avatarSpriteData():IAvatarDataContainer;
        function isPlaceholder():Boolean;
        function forceActionUpdate():void;
        function isFlippedHorizontally():Boolean;
        function getAvatarStateData(k:String, _arg_2:int):IAvatarStateData;
        function disposeInactiveActionCache():void;
        function setUniqueIdentifier(k:String):void;

    }
}//package com.sulake.habbo.avatar

