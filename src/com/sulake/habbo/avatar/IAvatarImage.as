package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime.IDisposable;
    import flash.display.BitmapData;
    import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
    import com.sulake.habbo.avatar.animation.IAnimationLayerData;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.animation.IAvatarDataContainer;

    public interface IAvatarImage extends IDisposable 
    {
        function _Str_818(_arg_1:String, _arg_2:Number=1):BitmapData;
        function getImage(_arg_1:String, _arg_2:Boolean, _arg_3:Number=1):BitmapData;
        function _Str_1009():Array;
        function setDirection(_arg_1:String, _arg_2:int):void;
        function setDirectionAngle(_arg_1:String, _arg_2:int):void;
        function _Str_953(_arg_1:int=1):void;
        function _Str_797():String;
        function _Str_754():Array;
        function getLayerData(_arg_1:ISpriteDataContainer):IAnimationLayerData;
        function getAsset(_arg_1:String):BitmapDataAsset;
        function getDirection():int;
        function _Str_784():IAvatarFigureContainer;
        function _Str_867(_arg_1:String):IPartColor;
        function _Str_899():Boolean;
        function _Str_781():Array;
        function _Str_913():void;
        function _Str_962():void;
        function appendAction(_arg_1:String, ... _args):Boolean;
        function get _Str_920():IAvatarDataContainer;
        function isPlaceholder():Boolean;
        function _Str_998():void;
        function get _Str_677():Boolean;
        function _Str_833():void;
        function get _Str_792():String;
    }
}
