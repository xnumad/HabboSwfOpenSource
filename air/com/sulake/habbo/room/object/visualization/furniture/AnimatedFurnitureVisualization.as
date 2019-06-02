//com.sulake.habbo.room.object.visualization.furniture.AnimatedFurnitureVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import com.sulake.habbo.room.object.visualization.data.AnimationStateData;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;

    public class AnimatedFurnitureVisualization extends FurnitureVisualization {

        public static const DEFAULT_ANIMATION_ID:int;

        private var _animationData:AnimatedFurnitureVisualizationData;
        private var _state:int;
        private var _animationState:AnimationStateData;
        private var _animationChangeTime:int;
        private var _frameIncrease:int;
        private var _hasAnimationFrames:Boolean;
        private var _previousAnimationScale:Number = 0;
        private var _animatedLayerCount:int;
        private var _directionChanged:Boolean;

        public function AnimatedFurnitureVisualization();

        protected function get animatedLayerCount():int;

        protected function get frameIncrease():int;

        override protected function set direction(k:int):void;

        override public function dispose():void;

        override public function hasAnimationFrames():Boolean;

        public function get animationId():int;

        protected function getAnimationId(k:AnimationStateData):int;

        override public function initialize(k:IRoomObjectVisualizationData):Boolean;

        override protected function updateObject(k:Number, _arg_2:Number):Boolean;

        override protected function updateModel(k:Number):Boolean;

        private function isPlayingTransition(k:AnimationStateData, _arg_2:int):Boolean;

        private function getCurrentState(k:AnimationStateData):int;

        protected function setAnimation(k:int):void;

        protected function setSubAnimation(k:AnimationStateData, _arg_2:int, _arg_3:Boolean=true):Boolean;

        protected function getLastFramePlayed(k:int):Boolean;

        protected function resetAllAnimationFrames():void;

        override protected function updateAnimation(k:Number, _arg_2:Boolean=false):int;

        protected function updateAnimations(k:Number):int;

        protected function updateFramesForAnimation(k:AnimationStateData, _arg_2:Number):int;

        override protected function getFrameNumber(k:int, _arg_2:int):int;

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int;

        protected function usesAnimationResetting():Boolean;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

