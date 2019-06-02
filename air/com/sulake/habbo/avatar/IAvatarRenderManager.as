//com.sulake.habbo.avatar.IAvatarRenderManager

package com.sulake.habbo.avatar{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.avatar.structure.IFigureData;
    import com.sulake.core.assets.IAsset;
    import com.sulake.habbo.avatar.animation.IAnimationManager;
    import flash.events.IEventDispatcher;

    public /*dynamic*/ interface IAvatarRenderManager extends IUnknown {

        function createAvatarImage(k:String, _arg_2:String, _arg_3:String=null, _arg_4:IAvatarImageListener=null, _arg_5:String=null):IAvatarImage;
        function get assets():IAssetLibrary;
        function getFigureData():IFigureData;
        function getMandatoryAvatarPartSetIds(k:String, _arg_2:int):Array;
        function getAssetByName(k:String):IAsset;
        function get mode():String;
        function set mode(k:String):void;
        function injectFigureData(k:XML):void;
        function createFigureContainer(k:String):IAvatarFigureContainer;
        function isFigureReady(k:IAvatarFigureContainer):Boolean;
        function downloadFigure(k:IAvatarFigureContainer, _arg_2:IAvatarImageListener):void;
        function getAnimationManager():IAnimationManager;
        function get events():IEventDispatcher;
        function resetAssetManager():void;
        function resolveClubLevel(k:IAvatarFigureContainer, _arg_2:String, _arg_3:Array=null):int;
        function getItemIds():Array;
        function purgeAssets():void;
        function loadAvatarEditorLibrary():void;
        function purgeAvatarEditorLibrary():void;

    }
}//package com.sulake.habbo.avatar

