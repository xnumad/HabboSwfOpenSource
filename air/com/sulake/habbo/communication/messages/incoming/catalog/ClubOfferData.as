//com.sulake.habbo.communication.messages.incoming.catalog.ClubOfferData

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ClubOfferData {

        private var _offerId:int;
        private var _productCode:String;
        private var _priceCredits:int;
        private var _priceActivityPoints:int;
        private var _priceActivityPointType:int;
        private var _vip:Boolean;
        private var _months:int;
        private var _extraDays:int;
        private var _daysLeftAfterPurchase:int;
        private var _year:int;
        private var _month:int;
        private var _day:int;

        public function ClubOfferData(k:IMessageDataWrapper);

        public function get offerId():int;

        public function get productCode():String;

        public function get priceCredits():int;

        public function get vip():Boolean;

        public function get months():int;

        public function get extraDays():int;

        public function get daysLeftAfterPurchase():int;

        public function get year():int;

        public function get month():int;

        public function get day():int;

        public function get priceActivityPoints():int;

        public function get priceActivityPointType():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

