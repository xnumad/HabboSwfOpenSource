//com.sulake.habbo.room.object.visualization.room.TileCursorVisualization

package com.sulake.habbo.room.object.visualization.room{
    import com.sulake.habbo.room.object.visualization.furniture.AnimatedFurnitureVisualization;

    public class TileCursorVisualization extends AnimatedFurnitureVisualization {

        private var _tileHeight:Number = 0;

        public function TileCursorVisualization();

        public function get tileHeight():Number;

        public function set tileHeight(k:Number):void;

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int;


    }
}//package com.sulake.habbo.room.object.visualization.room

