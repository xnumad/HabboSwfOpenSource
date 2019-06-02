//com.sulake.habbo.room.object.visualization.data.AnimationFrameData

package com.sulake.habbo.room.object.visualization.data{
    public class AnimationFrameData {

        private var _id:int;
        private var _x:int;
        private var _y:int;
        private var _randomX:int;
        private var _randomY:int;
        private var _repeats:int;

        public function AnimationFrameData(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int);

        public function get id():int;

        public function hasDirectionalOffsets():Boolean;

        public function getX(k:int):int;

        public function getY(k:int):int;

        public function get x():int;

        public function get y():int;

        public function get randomX():int;

        public function get randomY():int;

        public function get repeats():int;


    }
}//package com.sulake.habbo.room.object.visualization.data

