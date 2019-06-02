//com.sulake.habbo.room.object.visualization.data.DirectionData

package com.sulake.habbo.room.object.visualization.data{
    public class DirectionData {

        public static const USE_DEFAULT_DIRECTION:int;

        private var _layers:Array;

        public function DirectionData(k:int);

        public function dispose():void;

        public function get layerCount():int;

        private function getLayer(k:int):LayerData;

        public function getTag(k:int):String;

        public function setTag(k:int, _arg_2:String):void;

        public function getInk(k:int):int;

        public function setInk(k:int, _arg_2:int):void;

        public function getAlpha(k:int):int;

        public function setAlpha(k:int, _arg_2:int):void;

        public function getIgnoreMouse(k:int):Boolean;

        public function setIgnoreMouse(k:int, _arg_2:Boolean):void;

        public function getXOffset(k:int):int;

        public function setXOffset(k:int, _arg_2:int):void;

        public function getYOffset(k:int):int;

        public function setYOffset(k:int, _arg_2:int):void;

        public function getZOffset(k:int):Number;

        public function setZOffset(k:int, _arg_2:Number):void;

        public function copyValues(k:DirectionData):void;


    }
}//package com.sulake.habbo.room.object.visualization.data

