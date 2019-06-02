package com.sulake.habbo.catalog.enum
{
    public class VideoOfferTypeEnum 
    {
        public static const CREDIT:VideoOfferTypeEnum = new VideoOfferTypeEnum(0);
        public static const _SafeStr_7697:VideoOfferTypeEnum = new VideoOfferTypeEnum(1);

        private var _value:int = 0;

        public function VideoOfferTypeEnum(k:int):void
        {
            this._value = k;
        }

        public function get value():int
        {
            return this._value;
        }

        public function equals(k:VideoOfferTypeEnum):Boolean
        {
            return (k) && (k._value == this._value);
        }
    }
}
