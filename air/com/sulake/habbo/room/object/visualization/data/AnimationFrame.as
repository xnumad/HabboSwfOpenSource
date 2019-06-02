//com.sulake.habbo.room.object.visualization.data.AnimationFrame

package com.sulake.habbo.room.object.visualization.data{
    public class AnimationFrame {

        public static const FRAME_REPEAT_FOREVER:int;
        public static const SEQUENCE_NOT_DEFINED:int;
        private static const POOL_SIZE_LIMIT:int;
        private static const POOL:Array;

        private var _id:int;
        private var _x:int;
        private var _y:int;
        private var _repeats:int;
        private var _frameRepeats:int;
        private var _remainingFrameRepeats:int;
        private var _activeSequence:int;
        private var _activeSequenceOffset:int;
        private var _isLastFrame:Boolean;
        private var _isRecycled:Boolean;

        public function AnimationFrame();

        public static function allocate(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:Boolean, _arg_7:int=-1, _arg_8:int=0):AnimationFrame;


        public function get id():int;

        public function get x():int;

        public function get y():int;

        public function get repeats():int;

        public function get frameRepeats():int;

        public function get isLastFrame():Boolean;

        public function get remainingFrameRepeats():int;

        public function set remainingFrameRepeats(k:int):void;

        public function get activeSequence():int;

        public function get activeSequenceOffset():int;

        public function recycle():void;


    }
}//package com.sulake.habbo.room.object.visualization.data

