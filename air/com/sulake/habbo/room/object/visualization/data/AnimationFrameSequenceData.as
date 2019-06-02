//com.sulake.habbo.room.object.visualization.data.AnimationFrameSequenceData

package com.sulake.habbo.room.object.visualization.data{
    public class AnimationFrameSequenceData {

        private var _frames:Array;
        private var _frameIndexes:Array;
        private var _frameRepeats:Array;
        private var _isRandom:Boolean;
        private var _loopCount:int;

        public function AnimationFrameSequenceData(k:int, _arg_2:Boolean);

        public function get isRandom():Boolean;

        public function get frameCount():int;

        public function dispose():void;

        public function initialize():void;

        public function addFrame(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:DirectionalOffsetData):void;

        public function getFrame(k:int):AnimationFrameData;

        public function getFrameIndex(k:int):int;

        public function getRepeats(k:int):int;


    }
}//package com.sulake.habbo.room.object.visualization.data

