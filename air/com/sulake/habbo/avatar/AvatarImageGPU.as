//com.sulake.habbo.avatar.AvatarImageGPU

package com.sulake.habbo.avatar{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.avatar.actions.IActiveActionData;
    import com.sulake.habbo.avatar.alias.AssetAliasCollection;
    import com.sulake.habbo.avatar.cache.AvatarImageCache;
    import com.sulake.habbo.avatar.animation.IAvatarDataContainer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.avatar.actions.ActiveActionData;
    import flash.display.BitmapData;
    import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.animation.IAnimationLayerData;
    import com.sulake.core.assets.BitmapDataAsset;

    public class AvatarImageGPU implements IAvatarImage, IDisposable {

        private static const CHANNELS_EQUAL:String;
        private static const CHANNELS_UNIQUE:String;
        private static const CHANNELS_RED:String;
        private static const CHANNELS_GREEN:String;
        private static const CHANNELS_BLUE:String;
        private static const CHANNELS_SATURATED:String;
        private static const DEFAULT_ACTION:String;
        private static const DEFAULT_DIR:int;
        private static const DEFAULT_AVATAR_SET:String;
        protected static var _sharedTextureCache:Map;

        protected var _structure:AvatarStructure;
        protected var _scale:String;
        protected var _explicitMainDirection:int;
        protected var _projectedMainDirection:int;
        protected var _headDirection:int;
        protected var _flipH:Boolean;
        protected var _mainAction:IActiveActionData;
        protected var _uniqueIdentifier:String;
        protected var _isDisposed:Boolean;
        protected var _canvasOffsets:Array;
        protected var _assets:AssetAliasCollection;
        protected var _cache:AvatarImageCache;
        protected var _figure:AvatarFigureContainer;
        protected var _avatarSpriteData:IAvatarDataContainer;
        protected var _actions:Vector.<ActiveActionData>;
        protected var _image:BitmapData;
        private var _defaultAction:ActiveActionData;
        private var _frameCounter:int;
        private var _directionOffset:int;
        private var _sprites:Vector.<ISpriteDataContainer>;
        private var _isAnimating:Boolean;
        private var _animationHasResetOnToggle:Boolean;
        private var _actionsSorted:Boolean;
        private var _sortedActions:Vector.<ActiveActionData>;
        private var _currentActionsInt:uint;
        private var _stateDatas:Dictionary;
        private var _animFrameCount:int;
        private var _cachedBodyParts:Vector.<String>;
        private var _cachedBodyPartsDirection:int;
        private var _cachedBodyPartsGeometryType:String;
        private var _cachedBodyPartsAvatarSet:String;
        private var _cachedStateKeys:Array;
        protected var _lastStateKey:String;
        protected var _lastStateSetType:String;
        protected var _lastStateDirection:int;
        private var _actionNames:Vector.<String>;

        public function AvatarImageGPU(k:AvatarStructure, _arg_2:AssetAliasCollection, _arg_3:AvatarFigureContainer, _arg_4:String);

        public function dispose():void;

        public function get disposed():Boolean;

        public function disposeInactiveActionCache():void;

        public function getFigure():IAvatarFigureContainer;

        public function getScale():String;

        public function getPartColor(k:String):IPartColor;

        public function setUniqueIdentifier(k:String):void;

        public function setDirection(k:String, _arg_2:int):void;

        public function isFlippedHorizontally():Boolean;

        public function setDirectionAngle(k:String, _arg_2:int):void;

        public function getSprites():Vector.<ISpriteDataContainer>;

        public function getCanvasOffsets():Array;

        public function getLayerData(k:ISpriteDataContainer):IAnimationLayerData;

        public function updateAnimationByFrames(k:int):void;

        private function getStateKey(k:String, _arg_2:int):String;

        private function getCachedStateKey(k:int, _arg_2:int):String;

        private function getBodyParts(k:String, _arg_2:String, _arg_3:int):Vector.<String>;

        public function getImage(k:String, _arg_2:Boolean):BitmapData;

        public function getCroppedImage(k:String):BitmapData;

        public function getAvatarStateData(k:String, _arg_2:int):IAvatarStateData;

        public function getAsset(k:String):BitmapDataAsset;

        public function getProjectedDirection():int;

        public function getExplicitDirection():int;

        public function initActionAppends():void;

        public function endActionAppends():void;

        public function appendAction(k:String, ... _args):Boolean;

        protected function addActionData(k:String, _arg_2:String=""):void;

        public function isAnimating():Boolean;

        private function resetActions():Boolean;

        private function isHeadTurnPreventedByAction():Boolean;

        private function sortActions():void;

        private function setActionsToParts():void;

        private function setActionToParts(k:IActiveActionData):void;

        private function resetBodyPartCache(k:IActiveActionData):void;

        public function get avatarSpriteData():IAvatarDataContainer;

        private function convertToGrayscale(k:BitmapData, _arg_2:String="CHANNELS_EQUAL"):BitmapData;

        private function errorThis(k:String):void;

        private function logThis(k:String):void;

        public function isPlaceholder():Boolean;

        public function forceActionUpdate():void;

        public function get animationHasResetOnToggle():Boolean;


    }
}//package com.sulake.habbo.avatar

