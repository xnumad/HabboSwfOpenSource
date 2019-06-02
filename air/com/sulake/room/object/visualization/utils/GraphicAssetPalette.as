//com.sulake.room.object.visualization.utils.GraphicAssetPalette

package com.sulake.room.object.visualization.utils{
    import flash.utils.ByteArray;
    import flash.display.BitmapData;

    public class GraphicAssetPalette {

        private static var BLANK:Array;

        private var _palette:Array;
        private var _primaryColor:int;
        private var _secondaryColor:int;

        public function GraphicAssetPalette(k:ByteArray, _arg_2:int, _arg_3:int);

        public function get primaryColor():int;

        public function get secondaryColor():int;

        public function dispose():void;

        public function colorizeBitmap(k:BitmapData):void;


    }
}//package com.sulake.room.object.visualization.utils

