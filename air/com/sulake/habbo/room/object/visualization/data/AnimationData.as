//com.sulake.habbo.room.object.visualization.data.AnimationData

package com.sulake.habbo.room.object.visualization.data{
    import com.sulake.core.utils.Map;

    public class AnimationData {

        public static const DEFAULT_FRAME_NUMBER:int;
        private static const TRANSITION_TO_ANIMATION_OFFSET:int;
        private static const TRANSITION_FROM_ANIMATION_OFFSET:int;

        private var _layers:Map;
        private var _frameCount:int;
        private var _randomStart:Boolean;
        private var _immediateChanges:Array;

        public function AnimationData();

        public static function getTransitionToAnimationId(k:int):int;

        public static function getTransitionFromAnimationId(k:int):int;

        public static function isTransitionToAnimation(k:int):Boolean;

        public static function isTransitionFromAnimation(k:int):Boolean;


        public function dispose():void;

        public function setImmediateChanges(k:Array):void;

        public function isImmediateChange(k:int):Boolean;

        public function get frameCount():int;

        public function getStartFrame(k:int):int;

        public function initialize(k:XML):Boolean;

        private function addLayer(k:int, _arg_2:int, _arg_3:int, _arg_4:Boolean, _arg_5:XML):Boolean;

        private function readDirectionalOffsets(k:XML):DirectionalOffsetData;

        public function getFrame(k:int, _arg_2:int, _arg_3:int):AnimationFrame;

        public function getFrameFromSequence(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):AnimationFrame;


    }
}//package com.sulake.habbo.room.object.visualization.data

