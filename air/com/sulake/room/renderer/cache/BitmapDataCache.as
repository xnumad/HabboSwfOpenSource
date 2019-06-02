//com.sulake.room.renderer.cache.BitmapDataCache

package com.sulake.room.renderer.cache{
    import com.sulake.core.utils.Map;
    import com.sulake.room.renderer.utils.ExtendedBitmapData;

    public class BitmapDataCache {

        private var _dataMap:Map;
        private var _memUsage:int;
        private var _memLimit:int;
        private var _maxMemory:int;
        private var _increaseSize:int;

        public function BitmapDataCache(k:int, _arg_2:int, _arg_3:int=1);

        public function get memUsage():int;

        public function get memLimit():int;

        public function dispose():void;

        public function compress():void;

        private function increaseMemoryLimit():void;

        private function removeItem(k:String):Boolean;

        public function getBitmapData(k:String):ExtendedBitmapData;

        public function addBitmapData(k:String, _arg_2:ExtendedBitmapData):void;


    }
}//package com.sulake.room.renderer.cache

