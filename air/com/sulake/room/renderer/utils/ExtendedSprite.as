//com.sulake.room.renderer.utils.ExtendedSprite

package com.sulake.room.renderer.utils{
    import flash.display.Bitmap;
    import flash.geom.Point;
    import flash.display.BitmapData;

    public class ExtendedSprite extends Bitmap {

        private var _threshold:int;
        private var _basePoint:Point;
        private var _tag:String;
        private var _identifier:String;
        private var _clickHandling:Boolean;
        private var _varyingDepth:Boolean;
        private var _bitmapData:ExtendedBitmapData;
        private var _width:int;
        private var _height:int;
        private var _updateID1:int;
        private var _updateID2:int;
        private var _offsetRefX:int;
        private var _offsetRefY:int;

        public function ExtendedSprite():void;

        public function get alphaTolerance():int;

        public function set alphaTolerance(k:int):void;

        public function get tag():String;

        public function set tag(k:String):void;

        public function get identifier():String;

        public function set identifier(k:String):void;

        public function get varyingDepth():Boolean;

        public function set varyingDepth(k:Boolean):void;

        public function get clickHandling():Boolean;

        public function set clickHandling(k:Boolean):void;

        public function get offsetRefX():int;

        public function set offsetRefX(k:int):void;

        public function get offsetRefY():int;

        public function set offsetRefY(k:int):void;

        public function dispose():void;

        override public function set bitmapData(k:BitmapData):void;

        public function needsUpdate(k:int, _arg_2:int):Boolean;

        override public function hitTestPoint(k:Number, _arg_2:Number, _arg_3:Boolean=false):Boolean;

        public function hitTest(k:int, _arg_2:int):Boolean;

        private function hitTestBitmapData(k:int, _arg_2:int):Boolean;


    }
}//package com.sulake.room.renderer.utils

