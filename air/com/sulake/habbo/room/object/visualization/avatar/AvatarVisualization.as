//com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization

package com.sulake.habbo.room.object.visualization.avatar{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.core.utils.Map;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.core.runtime.events.LowMemoryEvent;
    import starling.events.Event;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.core.assets.IAsset;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
    import com.sulake.habbo.room.object.visualization.avatar.additions.IAvatarAddition;

    public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener {

        private static const AVATAR_SPRITE_TAG:String;
        private static const AVATAR_SPRITE_DEFAULT_DEPTH:Number;
        private static const AVATAR_OWN_DEPTH_ADJUST:Number;
        private static const AVATAR_SPRITE_LAYING_DEPTH:Number;
        private static const BASE_Y_SCALE:int;
        private static const ANIMATION_UPDATE_INTERVAL_MS:int;
        private static const DEFAULT_CANVAS_OFFSETS:Array;
        private static const SNOWBOARDING_EFFECT:int;
        private static const MAX_AVATARS_WITH_EFFECT:int;
        private static var _isLowMemoryState:Boolean;
        private static const SPRITE_INDEX_AVATAR:int;
        private static const SPRITE_INDEX_SHADOW:int;
        private static const INITIAL_RESERVED_SPRITES:int;
        private static const ADDITION_ID_IDLE_BUBBLE:int;
        private static const ADDITION_ID_TYPING_BUBBLE:int;
        private static const ADDITION_ID_EXPRESSION:int;
        private static const ADDITION_ID_NUMBER_BUBBLE:int;
        private static const ADDITION_ID_GAME_CLICK_TARGET:int;
        private static const ADDITION_ID_MUTED_BUBBLE:int;
        private static const ADDITION_ID_GUIDE_STATUS_BUBBLE:int;

        private var _visualizationData:AvatarVisualizationData;
        private var _avatars:Map;
        private var _avatarsOnEffect:Map;
        private var _lastAnimFrameStamp:uint;
        private var _figure:String;
        private var _gender:String;
        private var _shadowAsset:BitmapDataAsset;
        private var _gpuMode:Boolean;
        private var _lastAvatarTextureId:String;
        private var _cleanUpCounter:int;
        private var _headAngle:int;
        private var _currentAngleDeg:int;
        private var _currentHeadAngleDeg:int;
        private var _extraSpritesStartIndex:int;
        private var _additions:Map;
        private var _posture:String;
        private var _postureParameter:String;
        private var _isTalking:Boolean;
        private var _isSleeping:Boolean;
        private var _isBlinking:Boolean;
        private var _expressionType:int;
        private var _gesture:int;
        private var _danceStyle:int;
        private var _mouseHighlight:int;
        private var _mouseHighlightEnabled:Boolean;
        private var _signType:int;
        private var _effectType:int;
        private var _effectJustApplied:Boolean;
        private var _carryObjectType:int;
        private var _useObjectType:int;
        private var _geometryOffset:int;
        private var _baseY:int;
        private var _isSittingManual:Boolean;
        private var _isLaying:Boolean;
        private var _layInside:Boolean;
        private var _activeAvatarImage:IAvatarImage;
        private var _isOwnAvatar:Boolean;
        private var _usedTextureNames:Array;
        private var _forceUpdate:Boolean;

        public function AvatarVisualization();

        override public function dispose():void;

        override public function hasAnimationFrames():Boolean;

        private function forgetAllButCurrentSharedTexture():void;

        private function forgetSharedTextures():void;

        private function onLowMemoryWarning(k:LowMemoryEvent):void;

        private function onTextureFullWarning(k:Event):void;

        public function get disposed():Boolean;

        public function get angle():int;

        public function get posture():String;

        override public function initialize(k:IRoomObjectVisualizationData):Boolean;

        private function updateFromModel(k:IRoomObjectModel, _arg_2:Number, _arg_3:Boolean):Boolean;

        private function updateFigure(k:String):Boolean;

        private function resetImages():void;

        private function validateActions(k:Number):void;

        private function getAvatarImage(k:Number, _arg_2:int):IAvatarImage;

        public function getAvatarRendererAsset(k:String):IAsset;

        private function updateDirections(k:IRoomObject, _arg_2:IRoomGeometry, _arg_3:Boolean):void;

        private function updateShadow(k:Number):void;

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Number, _arg_6:Number):Boolean;

        private function fixTypingBubbleRelativeDepth(k:Array):void;

        private function fixAvatarRelativeDepth(k:IRoomObjectSprite, _arg_2:Array):void;

        private function updateAdditions(k:Number):Boolean;

        private function updateSpriteWithData(k:IRoomObjectSprite, _arg_2:ISpriteDataContainer, _arg_3:int, _arg_4:Number, _arg_5:int):void;

        private function updateImageForSprite(k:IRoomObjectSprite, _arg_2:int):void;

        private function updateAvatarSpriteWithData(k:ISpriteDataContainer, _arg_2:int, _arg_3:Number, _arg_4:IRoomObjectSprite):void;

        private function updateAvatarSpriteForCPU(k:IRoomObjectModel, _arg_2:IRoomObjectSprite, _arg_3:Number, _arg_4:Array):void;

        private function updateAvatarSpriteForGPU(k:IRoomObjectSprite, _arg_2:Number, _arg_3:Array, _arg_4:int):void;

        private function applyToAvatarImage(k:IAvatarImage):void;

        private function updateSpriteCount():void;

        public function avatarImageReady(k:String):void;

        protected function get numAdditions():int;

        public function hasAddition(k:int):Boolean;

        public function addAddition(k:IAvatarAddition):IAvatarAddition;

        public function getAddition(k:int):IAvatarAddition;

        public function removeAddition(k:int):void;


    }
}//package com.sulake.habbo.room.object.visualization.avatar

