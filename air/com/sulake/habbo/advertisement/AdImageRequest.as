//com.sulake.habbo.advertisement.AdImageRequest

package com.sulake.habbo.advertisement{
    public class AdImageRequest {

        private var _roomId:int;
        private var _objectId:int;
        private var _objectCategory:int;
        private var _imageURL:String;
        private var _clickURL:String;
        private var _maxImageDimension:int;

        public function AdImageRequest(k:int, _arg_2:String=null, _arg_3:String=null, _arg_4:int=-1, _arg_5:int=-1, _arg_6:int=-1);

        public function get roomId():int;

        public function get objectId():int;

        public function get objectCategory():int;

        public function get imageURL():String;

        public function get clickURL():String;

        public function get maxImageDimension():int;


    }
}//package com.sulake.habbo.advertisement

