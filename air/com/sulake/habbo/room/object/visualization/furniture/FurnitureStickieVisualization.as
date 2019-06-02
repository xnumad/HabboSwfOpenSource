//com.sulake.habbo.room.object.visualization.furniture.FurnitureStickieVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;

    public class FurnitureStickieVisualization extends FurnitureVisualization {

        private var _data:FurnitureVisualizationData;

        public function FurnitureStickieVisualization();

        override public function initialize(k:IRoomObjectVisualizationData):Boolean;

        override protected function getSpriteColor(k:int, _arg_2:int, _arg_3:int):int;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

