//com.sulake.habbo.room.object.visualization.furniture.AnimatedFurnitureVisualizationData

package com.sulake.habbo.room.object.visualization.furniture{
    import com.sulake.habbo.room.object.visualization.data.SizeData;
    import com.sulake.habbo.room.object.visualization.data.AnimationFrame;

    public class AnimatedFurnitureVisualizationData extends FurnitureVisualizationData {

        public function AnimatedFurnitureVisualizationData();

        override protected function createSizeData(k:int, _arg_2:int, _arg_3:int):SizeData;

        override protected function processVisualizationElement(k:SizeData, _arg_2:XML):Boolean;

        public function hasAnimation(k:int, _arg_2:int):Boolean;

        public function getAnimationCount(k:int):int;

        public function getAnimationId(k:int, _arg_2:int):int;

        public function isImmediateChange(k:int, _arg_2:int, _arg_3:int):Boolean;

        public function getStartFrame(k:int, _arg_2:int, _arg_3:int):int;

        public function getFrame(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):AnimationFrame;

        public function getFrameFromSequence(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:int):AnimationFrame;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

