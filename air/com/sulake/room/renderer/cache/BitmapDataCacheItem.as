//com.sulake.room.renderer.cache.BitmapDataCacheItem

package com.sulake.room.renderer.cache{
    import com.sulake.room.renderer.utils.ExtendedBitmapData;

    public class BitmapDataCacheItem {

        private var _bitmapData:ExtendedBitmapData;
        private var _name:String;
        private var _memUsage:int;

        public function BitmapDataCacheItem(k:ExtendedBitmapData, _arg_2:String);

        public function get bitmapData():ExtendedBitmapData;

        public function get memUsage():int;

        public function get useCount():int;

        public function get name():String;

        public function set bitmapData(k:ExtendedBitmapData):void;

        public function dispose():void;


    }
}//package com.sulake.room.renderer.cache

