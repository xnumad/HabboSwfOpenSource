//com.sulake.habbo.room.object.visualization.data.AnimationFrameDirectionalData

package com.sulake.habbo.room.object.visualization.data{
    public class AnimationFrameDirectionalData extends AnimationFrameData {

        private var _directionalOffsets:DirectionalOffsetData;

        public function AnimationFrameDirectionalData(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:DirectionalOffsetData, _arg_7:int);

        override public function hasDirectionalOffsets():Boolean;

        override public function getX(k:int):int;

        override public function getY(k:int):int;


    }
}//package com.sulake.habbo.room.object.visualization.data

