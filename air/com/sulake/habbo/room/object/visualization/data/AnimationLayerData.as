//com.sulake.habbo.room.object.visualization.data.AnimationLayerData

package com.sulake.habbo.room.object.visualization.data{
    public class AnimationLayerData {

        private var _frameSequences:Array;
        private var _frameSequencesLength:int;
        private var _frameCount:int;
        private var _loopCount:int;
        private var _frameRepeat:int;
        private var _isRandom:Boolean;

        public function AnimationLayerData(k:int, _arg_2:int, _arg_3:Boolean);

        public function get frameCount():int;

        public function dispose():void;

        public function addFrameSequence(k:int, _arg_2:Boolean):AnimationFrameSequenceData;

        public function calculateLength():void;

        public function getFrame(k:int, _arg_2:int):AnimationFrame;

        public function getFrameFromSequence(k:int, _arg_2:int, _arg_3:int, _arg_4:int):AnimationFrame;

        private function getFrameFromSpecificSequence(k:int, _arg_2:AnimationFrameSequenceData, _arg_3:int, _arg_4:int, _arg_5:Boolean):AnimationFrame;


    }
}//package com.sulake.habbo.room.object.visualization.data

