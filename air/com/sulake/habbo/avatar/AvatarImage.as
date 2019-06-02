//com.sulake.habbo.avatar.AvatarImage

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
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;

    public class AvatarImage implements IAvatarImage, IDisposable {

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
        protected var _mainDirection:int;
        protected var _setMainDirection:int;
        protected var _headDirection:int;
        protected var _flipH:Boolean;
        protected var _mainAction:IActiveActionData;
        protected var _isDisposed:Boolean;
        private var _useTextures:Boolean;
        protected var _canvasOffsets:Array;
        protected var _assets:AssetAliasCollection;
        protected var _cache:AvatarImageCache;
        protected var _figure:AvatarFigureContainer;
        protected var _avatarSpriteData:IAvatarDataContainer;
        protected var _actions:Vector.<ActiveActionData>;
        protected var _image:BitmapData;
        protected var _textureCache:Map;
        private var _defaultAction:IActiveActionData;
        private var _frameCounter:int;
        private var _directionOffset:int;
        private var _changes:Boolean;
        private var _sprites:Vector.<ISpriteDataContainer>;
        private var _isAnimating:Boolean;
        private var _animationHasResetOnToggle:Boolean;
        private var _actionsSorted:Boolean;
        private var _sortedActions:Vector.<ActiveActionData>;
        private var _lastActionsStr:String;
        private var _currentActionsStr:String;
        private var _fullImageCache:Map;
        protected var _isCachedImage:Boolean;
        private var _useFullImageCache:Boolean;
        private var _effectIdInUse:int;
        private var _textureOffsets:Dictionary;
        private var _animFrameCount:int;
        private var _cachedBodyParts:Vector.<String>;
        private var _cachedBodyPartsDirection:int;
        private var _cachedBodyPartsGeometryType:String;
        private var _cachedBodyPartsAvatarSet:String;

        public function AvatarImage(k:AvatarStructure, _arg_2:AssetAliasCollection, _arg_3:AvatarFigureContainer, _arg_4:String);

        public function dispose():void;

        public function get disposed():Boolean;

        public function disposeInactiveActionCache():void;

        public function getFigure():IAvatarFigureContainer;

        public function getScale():String;

        public function getPartColor(k:String):IPartColor;

        public function setDirection(k:String, _arg_2:int):void;

        private function setDirectionAir(k:String, _arg_2:int):void;

        public function isFlippedHorizontally():Boolean;

        public function setDirectionAngle(k:String, _arg_2:int):void;

        public function getSprites():Vector.<ISpriteDataContainer>;

        public function getCanvasOffsets():Array;

        public function getLayerData(k:ISpriteDataContainer):IAnimationLayerData;

        public function updateAnimationByFrames(k:int):void;

        private function getFullImageCacheKey():String;

        public function getTextureCacheKey(k:String, _arg_2:int):String;

        public function getTextureOffset(k:String, _arg_2:int):Point;

        private function setTextureOffset(k:String, _arg_2:int, _arg_3:Point):void;

        private function getBodyParts(k:String, _arg_2:String, _arg_3:int):Vector.<String>;

        public function getImage(k:String, _arg_2:Boolean):BitmapData;

        public function getCroppedImage(k:String):BitmapData;

        protected function getFullImage(k:String):BitmapData;

        protected function cacheFullImage(k:String, _arg_2:BitmapData):void;

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

        private function sortActions():Boolean;

        private function setActionsToParts():void;

        private function setActionToParts(k:IActiveActionData):void;

        private function resetBodyPartCache(k:IActiveActionData):void;

        public function get avatarSpriteData():IAvatarDataContainer;

        private function convertToGrayscale(k:BitmapData, _arg_2:String="CHANNELS_EQUAL"):BitmapData;

        private function errorThis(k:String):void;

        private function logThis(k:String):void;

        public function isPlaceholder():Boolean;

        public function forceActionUpdate():void;

        public function getAvatarStateData(k:String, _arg_2:int):IAvatarStateData;

        public function setUniqueIdentifier(k:String):void;


    }
}//package com.sulake.habbo.avatar

