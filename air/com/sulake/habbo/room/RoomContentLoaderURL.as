//com.sulake.habbo.room.RoomContentLoaderURL

package com.sulake.habbo.room{
    public class RoomContentLoaderURL implements IRoomContentLoaderUrl {

        private static const FILE_TYPE_PNG:String;
        private static const FILE_TYPE_JPG:String;
        private static const CACHE_KEY_FURNI_PREFIX:String;
        private static const CACHE_KEY_ICON_PREFIX:String;

        private var _url:String;
        private var _cacheKey:String;
        private var _cacheRevision:int;
        private var _assetName:String;
        private var _fileType:String;

        public function RoomContentLoaderURL(k:String, _arg_2:String=null, _arg_3:int=-1, _arg_4:Boolean=false, _arg_5:String=null);

        public function get url():String;

        public function get cacheKey():String;

        public function get cacheRevision():int;

        public function get assetName():String;

        public function get fileType():String;


    }
}//package com.sulake.habbo.room

