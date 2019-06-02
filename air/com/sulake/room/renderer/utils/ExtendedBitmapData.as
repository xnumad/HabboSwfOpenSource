//com.sulake.room.renderer.utils.ExtendedBitmapData

package com.sulake.room.renderer.utils{
    import flash.display.BitmapData;
    import flash.geom.Point;

    public class ExtendedBitmapData extends BitmapData {

        private static const ZERO_POINT:Point;

        private var _referenceCount:int;
        private var _disposed:Boolean;

        public function ExtendedBitmapData(k:int, _arg_2:int, _arg_3:Boolean=true, _arg_4:uint=0);

        public function get referenceCount():int;

        public function get disposed():Boolean;

        public function addReference():void;

        override public function dispose():void;

        override public function clone():BitmapData;


    }
}//package com.sulake.room.renderer.utils

