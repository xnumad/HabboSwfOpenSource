//com.sulake.habbo.avatar.AvatarStructure

package com.sulake.habbo.avatar{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.avatar.geometry.AvatarModelGeometry;
    import com.sulake.habbo.avatar.actions.AvatarActionManager;
    import com.sulake.habbo.avatar.structure.FigureData;
    import com.sulake.habbo.avatar.structure.PartSetsData;
    import com.sulake.habbo.avatar.structure.AnimationData;
    import com.sulake.habbo.avatar.animation.AnimationManager;
    import com.sulake.habbo.avatar.actions.ActionDefinition;
    import flash.utils.Dictionary;
    import flash.events.Event;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.assets.AssetLibraryCollection;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.animation.AnimationLayerData;
    import com.sulake.habbo.avatar.animation.Animation;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.avatar.actions.ActiveActionData;
    import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
    import com.sulake.habbo.avatar.structure.AvatarCanvas;
    import com.sulake.habbo.avatar.actions.IActiveActionData;
    import flash.geom.Point;
    import com.sulake.habbo.avatar.structure.IFigureData;
    import flash.display.Stage;

    public class AvatarStructure extends EventDispatcherWrapper {

        private static const DOT_SEPARATOR:String;
        private static var _frameArrayCache:Map;

        private var _renderManager:AvatarRenderManager;
        private var _geometry:AvatarModelGeometry;
        private var _actionManager:AvatarActionManager;
        private var _figureData:FigureData;
        private var _partSetsData:PartSetsData;
        private var _animationData:AnimationData;
        private var _animationManager:AnimationManager;
        private var _defaultAction:ActionDefinition;
        private var _mandatorySetTypeIds:Dictionary;
        private var _bodyPartsCache:Dictionary;
        private var _dataLoaded:Boolean;

        public function AvatarStructure(k:AvatarRenderManager);

        private static function getPopulatedFrameArray(k:int):Array;


        override public function dispose():void;

        public function isReady():Boolean;

        public function loadFigureData():void;

        private function onFigureDataDownloadDone(k:Event=null):void;

        public function initGeometry(k:XML):void;

        public function initActions(k:IAssetLibrary, _arg_2:XML):void;

        public function initPartSets(k:XML):Boolean;

        public function initAnimation(k:XML):Boolean;

        public function initFigureData(k:XML):Boolean;

        public function injectFigureData(k:XML):void;

        public function registerAnimations(k:AssetLibraryCollection, _arg_2:String, _arg_3:int):void;

        public function getPartColor(k:IAvatarFigureContainer, _arg_2:String, _arg_3:int=0):IPartColor;

        public function getBodyPartData(k:String, _arg_2:int, _arg_3:String):AnimationLayerData;

        public function getAnimation(k:String):Animation;

        public function getActionDefinition(k:String):ActionDefinition;

        public function getActionDefinitionWithState(k:String):ActionDefinition;

        public function isMainAvatarSet(k:String):Boolean;

        public function sortActions(k:Vector.<ActiveActionData>):Vector.<ActiveActionData>;

        public function maxFrames(k:Vector.<ActiveActionData>):int;

        public function getMandatorySetTypeIds(k:String, _arg_2:int):Array;

        public function getDefaultPartSet(k:String, _arg_2:String):IFigurePartSet;

        public function getCanvasOffsets(k:Vector.<ActiveActionData>, _arg_2:String, _arg_3:int):Array;

        public function getCanvas(k:String, _arg_2:String):AvatarCanvas;

        public function removeDynamicItems(k:IAvatarImage):void;

        public function getActiveBodyPartIds(k:IActiveActionData, _arg_2:IAvatarImage, _arg_3:Array):Array;

        public function getBodyPartsUnordered(k:String):Array;

        public function getBodyParts(k:String, _arg_2:String, _arg_3:int):Vector.<String>;

        public function getFrameBodyPartOffset(k:IActiveActionData, _arg_2:int, _arg_3:int, _arg_4:String):Point;

        public function getParts(k:String, _arg_2:IAvatarFigureContainer, _arg_3:IActiveActionData, _arg_4:String, _arg_5:int, _arg_6:Array, _arg_7:IAvatarImage, _arg_8:Dictionary=null):Vector.<AvatarImagePartContainer>;

        public function get figureData():IFigureData;

        public function get animationManager():AnimationManager;

        public function displayGeometry(k:Stage):void;

        public function getItemIds():Array;


    }
}//package com.sulake.habbo.avatar

