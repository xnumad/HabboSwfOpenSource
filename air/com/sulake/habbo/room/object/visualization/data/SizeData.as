//com.sulake.habbo.room.object.visualization.data.SizeData

package com.sulake.habbo.room.object.visualization.data{
    import com.sulake.core.utils.Map;

    public class SizeData {

        public static const LAYER_LIMIT:int;
        public static const DEFAULT_DIRECTION:int;

        private var _layerCount:int;
        private var _angle:int;
        private var _defaultDirection:DirectionData;
        private var _directions:Map;
        private var _colors:Map;
        private var _lastDirectionData:DirectionData;
        private var _lastDirection:int;

        public function SizeData(k:int, _arg_2:int);

        public function dispose():void;

        public function get layerCount():int;

        public function defineLayers(k:XML):Boolean;

        public function defineDirections(k:XML):Boolean;

        private function defineDirection(k:DirectionData, _arg_2:XMLList):Boolean;

        public function defineColors(k:XML):Boolean;

        public function getDirectionValue(k:int):int;

        private function getDirectionData(k:int):DirectionData;

        public function getTag(k:int, _arg_2:int):String;

        public function getInk(k:int, _arg_2:int):int;

        public function getAlpha(k:int, _arg_2:int):int;

        public function getColor(k:int, _arg_2:int):uint;

        public function getIgnoreMouse(k:int, _arg_2:int):Boolean;

        public function getXOffset(k:int, _arg_2:int):int;

        public function getYOffset(k:int, _arg_2:int):int;

        public function getZOffset(k:int, _arg_2:int):Number;


    }
}//package com.sulake.habbo.room.object.visualization.data

