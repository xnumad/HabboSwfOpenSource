package com.sulake.habbo.communication.messages.incoming.marketplace
{
    import com.sulake.habbo.room.IStuffData;

    public class MarketPlaceOffer
    {
        private var _offerId:int;
        private var _furniId:int;
        private var _furniType:int;
        private var _extraData:String;
        private var _stuffData:IStuffData;
        private var _price:int;
        private var _status:int;
        private var _timeLeftMinutes:int = -1;
        private var _averagePrice:int;
        private var _offerCount:int;

        public function MarketPlaceOffer(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:IStuffData, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:int, _arg_10:int=-1)
        {
            this._offerId = k;
            this._furniId = _arg_2;
            this._furniType = _arg_3;
            this._extraData = _arg_4;
            this._stuffData = _arg_5;
            this._price = _arg_6;
            this._status = _arg_7;
            this._timeLeftMinutes = _arg_8;
            this._averagePrice = _arg_9;
            this._offerCount = _arg_10;
        }

        public function get offerId():int
        {
            return this._offerId;
        }

        public function get furniId():int
        {
            return this._furniId;
        }

        public function get furniType():int
        {
            return this._furniType;
        }

        public function get extraData():String
        {
            return this._extraData;
        }

        public function get stuffData():IStuffData
        {
            return this._stuffData;
        }

        public function get price():int
        {
            return this._price;
        }

        public function get status():int
        {
            return this._status;
        }

        public function get timeLeftMinutes():int
        {
            return this._timeLeftMinutes;
        }

        public function get averagePrice():int
        {
            return this._averagePrice;
        }

        public function get offerCount():int
        {
            return this._offerCount;
        }
    }
}
