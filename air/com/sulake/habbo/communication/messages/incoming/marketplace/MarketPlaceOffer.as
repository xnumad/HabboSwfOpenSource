//com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOffer

package com.sulake.habbo.communication.messages.incoming.marketplace{
    import com.sulake.habbo.room.IStuffData;

    public class MarketPlaceOffer {

        private var _offerId:int;
        private var _furniId:int;
        private var _furniType:int;
        private var _extraData:String;
        private var _stuffData:IStuffData;
        private var _price:int;
        private var _status:int;
        private var _timeLeftMinutes:int;
        private var _averagePrice:int;
        private var _offerCount:int;

        public function MarketPlaceOffer(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:IStuffData, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:int, k0:int=-1);

        public function get offerId():int;

        public function get furniId():int;

        public function get furniType():int;

        public function get extraData():String;

        public function get stuffData():IStuffData;

        public function get price():int;

        public function get status():int;

        public function get timeLeftMinutes():int;

        public function get averagePrice():int;

        public function get offerCount():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.marketplace

