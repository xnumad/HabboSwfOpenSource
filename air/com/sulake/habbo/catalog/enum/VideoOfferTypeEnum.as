//com.sulake.habbo.catalog.enum.VideoOfferTypeEnum

package com.sulake.habbo.catalog.enum{
    public class VideoOfferTypeEnum {

        public static const CREDIT:VideoOfferTypeEnum;
        public static const SNOWWAR:VideoOfferTypeEnum;

        private var _value:int;

        public function VideoOfferTypeEnum(k:int):void;

        public function get value():int;

        public function equals(k:VideoOfferTypeEnum):Boolean;


    }
}//package com.sulake.habbo.catalog.enum

