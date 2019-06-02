//com.sulake.habbo.room.object.visualization.data.LayerData

package com.sulake.habbo.room.object.visualization.data{
    public class LayerData {

        public static const DEFAULT_TAG:String;
        public static const DEFAULT_INK:int;
        public static const DEFAULT_ALPHA:int;
        public static const DEFAULT_IGNORE_MOUSE:Boolean;
        public static const DEFAULT_X_OFFSET:int;
        public static const DEFAULT_Y_OFFSET:int;
        public static const DEFAULT_Z_OFFSET:int;
        public static const INK_ADD:int;
        public static const INK_SUBTRACT:int;
        public static const INK_DARKEN:int;

        private var _tag:String;
        private var _ink:int;
        private var _alpha:int;
        private var _ignoreMouse:Boolean;
        private var _xOffset:int;
        private var _yOffset:int;
        private var _zOffset:Number = 0;

        public function LayerData();

        public function set tag(k:String):void;

        public function get tag():String;

        public function set ink(k:int):void;

        public function get ink():int;

        public function set alpha(k:int):void;

        public function get alpha():int;

        public function set ignoreMouse(k:Boolean):void;

        public function get ignoreMouse():Boolean;

        public function set xOffset(k:int):void;

        public function get xOffset():int;

        public function set yOffset(k:int):void;

        public function get yOffset():int;

        public function set zOffset(k:Number):void;

        public function get zOffset():Number;

        public function copyValues(k:LayerData):void;


    }
}//package com.sulake.habbo.room.object.visualization.data

