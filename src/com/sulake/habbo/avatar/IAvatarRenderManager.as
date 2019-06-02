package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.avatar.structure.IStructureData;
    import __AS3__.vec.Vector;
    import com.sulake.core.assets.IAsset;
    import com.sulake.habbo.avatar.animation.IAnimationManager;
    import flash.events.IEventDispatcher;
    import flash.utils.Dictionary;

    public interface IAvatarRenderManager extends IUnknown 
    {
        function createAvatarImage(_arg_1:String, _arg_2:String, _arg_3:String=null, _arg_4:IAvatarImageListener=null, _arg_5:_Str_936=null):IAvatarImage;
        function get assets():IAssetLibrary;
        function _Str_813():IStructureData;
        function getFigureStringWithFigureIds(_arg_1:String, _arg_2:String, _arg_3:Vector.<int>):String;
        function isValidFigureSetForGender(_arg_1:int, _arg_2:String):Boolean;
        function _Str_838(_arg_1:String, _arg_2:int):Array;
        function getAssetByName(_arg_1:String):IAsset;
        function get mode():String;
        function set mode(_arg_1:String):void;
        function _Str_882(_arg_1:XML):void;
        function _Str_718(_arg_1:String):IAvatarFigureContainer;
        function _Str_961(_arg_1:IAvatarFigureContainer):Boolean;
        function _Str_889(_arg_1:IAvatarFigureContainer, _arg_2:IAvatarImageListener):void;
        function _Str_723():IAnimationManager;
        function get events():IEventDispatcher;
        function resetAssetManager():void;
        function _Str_932(_arg_1:IAvatarFigureContainer, _arg_2:String, _arg_3:Array=null):int;
        function _Str_672():Array;
        function get _Str_906():Dictionary;
    }
}
