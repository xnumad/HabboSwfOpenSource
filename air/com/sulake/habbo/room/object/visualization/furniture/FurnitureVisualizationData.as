//com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualizationData

package com.sulake.habbo.room.object.visualization.furniture{
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.room.object.visualization.data.SizeData;

    public class FurnitureVisualizationData implements IRoomObjectVisualizationData {

        public static const LAYER_LIMIT:int;
        public static const LAST_LAYER_INDEX:int;
        public static const LAYER_NAMES:Array;

        private var _sizeDatas:Map;
        private var _sizes:Array;
        private var _lastSizeData:SizeData;
        private var _lastSizeDataScale:int;
        private var _lastSize:int;
        private var _lastSizeScale:int;
        private var _type:String;
        private var _hasAnimationFrames:Boolean;

        public function FurnitureVisualizationData();

        public function dispose():void;

        public function initialize(k:XML):Boolean;

        protected function reset():void;

        public function hasAnimationFrames():Boolean;

        protected function defineVisualizations(k:XML):Boolean;

        protected function createSizeData(k:int, _arg_2:int, _arg_3:int):SizeData;

        protected function processVisualizationElement(k:SizeData, _arg_2:XML):Boolean;

        public function getType():String;

        private function getSizeIndex(k:int):int;

        public function getSize(k:int):int;

        public function getLayerCount(k:int):int;

        public function getDirectionValue(k:int, _arg_2:int):int;

        public function getTag(k:int, _arg_2:int, _arg_3:int):String;

        public function getInk(k:int, _arg_2:int, _arg_3:int):int;

        public function getAlpha(k:int, _arg_2:int, _arg_3:int):int;

        public function getColor(k:int, _arg_2:int, _arg_3:int):int;

        public function getIgnoreMouse(k:int, _arg_2:int, _arg_3:int):Boolean;

        public function getXOffset(k:int, _arg_2:int, _arg_3:int):int;

        public function getYOffset(k:int, _arg_2:int, _arg_3:int):int;

        public function getZOffset(k:int, _arg_2:int, _arg_3:int):Number;

        protected function getSizeData(k:int):SizeData;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

