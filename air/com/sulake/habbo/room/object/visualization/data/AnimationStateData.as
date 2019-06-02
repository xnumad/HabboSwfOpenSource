//com.sulake.habbo.room.object.visualization.data.AnimationStateData

package com.sulake.habbo.room.object.visualization.data{
    import __AS3__.vec.Vector;

    public class AnimationStateData {

        private var _animationId:int;
        private var _animationAfterTransitionId:int;
        private var _animationOver:Boolean;
        private var _frameCounter:int;
        private var _frames:Vector.<AnimationFrame>;
        private var _lastFramePlayed:Vector.<Boolean>;
        private var _animationPlayed:Vector.<Boolean>;
        private var _layerCount:int;

        public function AnimationStateData();

        public function get animationOver():Boolean;

        public function set animationOver(k:Boolean):void;

        public function get frameCounter():int;

        public function set frameCounter(k:int):void;

        public function get animationId():int;

        public function set animationId(k:int):void;

        public function get animationAfterTransitionId():int;

        public function set animationAfterTransitionId(k:int):void;

        public function dispose():void;

        public function setLayerCount(k:int):void;

        public function resetAnimationFrames(k:Boolean=true):void;

        private function recycleFrames():void;

        public function getFrame(k:int):AnimationFrame;

        public function setFrame(k:int, _arg_2:AnimationFrame):void;

        public function getAnimationPlayed(k:int):Boolean;

        public function setAnimationPlayed(k:int, _arg_2:Boolean):void;

        public function getLastFramePlayed(k:int):Boolean;

        public function setLastFramePlayed(k:int, _arg_2:Boolean):void;


    }
}//package com.sulake.habbo.room.object.visualization.data

