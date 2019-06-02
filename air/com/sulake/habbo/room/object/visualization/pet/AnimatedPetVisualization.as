//com.sulake.habbo.room.object.visualization.pet.AnimatedPetVisualization

package com.sulake.habbo.room.object.visualization.pet{
    import com.sulake.habbo.room.object.visualization.furniture.AnimatedFurnitureVisualization;
    import com.sulake.habbo.room.object.visualization.data.AnimationStateData;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;

    public class AnimatedPetVisualization extends AnimatedFurnitureVisualization {

        private static const HEAD_SPRITE_TAG:String;
        private static const SADDLE_SPRITE_TAG:String;
        private static const HAIR_SPRITE_TAG:String;
        private static const ADDITIONAL_SPRITE_COUNT:int;
        private static const EXPERIENCE_BUBBLE_VISIBLE_IN_MS:int;
        private static const EXPERIENCE_BUBBLE_ASSET_NAME:String;
        private static const POSTURE_ANIMATION_INDEX:int;
        private static const GESTURE_ANIMATION_INDEX:int;
        private static const ANIMATION_INDEX_COUNT:int;

        private var _posture:String;
        private var _gesture:String;
        private var _isSleeping:Boolean;
        private var _headDirection:int;
        private var _experienceData:ExperienceData;
        private var _experienceTimeStamp:int;
        private var _experience:int;
        private var _animationData:AnimatedPetVisualizationData;
        private var _paletteName:String;
        private var _paletteIndex:int;
        private var _customLayerIds:Array;
        private var _customPartIds:Array;
        private var _customPaletteIds:Array;
        private var _color:int;
        private var _headOnly:Boolean;
        private var _isRiding:Boolean;
        private var _animationStates:Array;
        private var _animationOver:Boolean;
        private var _headSprites:Array;
        private var _nonHeadSprites:Array;
        private var _saddleSprites:Array;
        private var _previousAnimationDirection:int;

        public function AnimatedPetVisualization();

        override public function dispose():void;

        override protected function getAnimationId(k:AnimationStateData):int;

        override public function initialize(k:IRoomObjectVisualizationData):Boolean;

        override public function hasAnimationFrames():Boolean;

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Number, _arg_6:Number):Boolean;

        override protected function updateAnimation(k:Number, _arg_2:Boolean=false):int;

        override protected function updateModel(k:Number):Boolean;

        private function updateExperienceBubble(k:int):void;

        private function validateActions(k:String, _arg_2:String):void;

        override protected function updateLayerCount(k:int):void;

        override protected function getAdditionalSpriteCount():int;

        override protected function setAnimation(k:int):void;

        private function getAnimationStateData(k:int):AnimationStateData;

        private function setAnimationForIndex(k:int, _arg_2:int):void;

        override protected function resetAllAnimationFrames():void;

        override protected function updateAnimations(k:Number):int;

        override protected function getFrameNumber(k:int, _arg_2:int):int;

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getAsset(k:String, _arg_2:int=-1):IGraphicAsset;

        override protected function getSpriteZOffset(k:int, _arg_2:int, _arg_3:int):Number;

        override protected function getSpriteAssetName(k:int, _arg_2:int):String;

        override protected function getSpriteColor(k:int, _arg_2:int, _arg_3:int):int;

        private function getDirection(k:int, _arg_2:int):int;

        private function isHeadSprite(k:int):Boolean;

        private function isNonHeadSprite(k:int):Boolean;

        private function isSaddleSprite(k:int):Boolean;


    }
}//package com.sulake.habbo.room.object.visualization.pet

