//com.sulake.habbo.room.object.visualization.data.AnimationSizeData

package com.sulake.habbo.room.object.visualization.data{
    import com.sulake.core.utils.Map;

    public class AnimationSizeData extends SizeData {

        private var _animations:Map;
        private var _animationIds:Array;

        public function AnimationSizeData(k:int, _arg_2:int);

        override public function dispose():void;

        public function defineAnimations(k:XML):Boolean;

        protected function createAnimationData():AnimationData;

        public function hasAnimation(k:int):Boolean;

        public function hasAnimationFrames():Boolean;

        public function getAnimationCount():int;

        public function getAnimationId(k:int):int;

        public function isImmediateChange(k:int, _arg_2:int):Boolean;

        public function getStartFrame(k:int, _arg_2:int):int;

        public function getFrame(k:int, _arg_2:int, _arg_3:int, _arg_4:int):AnimationFrame;

        public function getFrameFromSequence(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int):AnimationFrame;


    }
}//package com.sulake.habbo.room.object.visualization.data

