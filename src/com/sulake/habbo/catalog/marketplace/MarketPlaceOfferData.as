package com.sulake.habbo.catalog.marketplace
{
    import com.sulake.habbo.room.IStuffData;
    import flash.display.BitmapData;

    public class MarketPlaceOfferData implements IMarketPlaceOfferData 
    {
        public static const TYPE_LANDSCAPE:int = 1;
        public static const TYPE_FLOOR:int = 2;

        private var _offerId:int;
        private var _furniId:int;
        private var _furniType:int;
        private var _extraData:String;
        private var _stuffData:IStuffData;
        private var _price:int;
        private var _averagePrice:int;
        private var _imageCallback:int;
        private var _status:int;
        private var _timeLeftMinutes:int = -1;
        private var _offerCount:int;
        private var _image:BitmapData;

        public function MarketPlaceOfferData(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:IStuffData, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:int=-1)
        {
            this._offerId = k;
            this._furniId = _arg_2;
            this._furniType = _arg_3;
            this._extraData = _arg_4;
            this._stuffData = _arg_5;
            this._price = _arg_6;
            this._status = _arg_7;
            this._averagePrice = _arg_8;
            this._offerCount = _arg_9;
        }

        public function dispose():void
        {
            if (this._image)
            {
                this._image.dispose();
                this._image = null;
            }
            if (this._stuffData)
            {
                this._stuffData = null;
            }
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

        public function get _Str_3925():int
        {
            return this._averagePrice;
        }

        public function get image():BitmapData
        {
            return this._image;
        }

        public function set image(k:BitmapData):void
        {
            if (this._image != null)
            {
                this._image.dispose();
            }
            this._image = k;
        }

        public function set _Str_4774(k:int):void
        {
            this._imageCallback = k;
        }

        public function get _Str_4774():int
        {
            return this._imageCallback;
        }

        public function get status():int
        {
            return this._status;
        }

        public function get _Str_5853():int
        {
            return this._timeLeftMinutes;
        }

        public function set _Str_5853(k:int):void
        {
            this._timeLeftMinutes = k;
        }

        public function set price(k:int):void
        {
            this._price = k;
        }

        public function set offerId(k:int):void
        {
            this._offerId = k;
        }

        public function get _Str_4121():int
        {
            return this._offerCount;
        }

        public function set _Str_4121(k:int):void
        {
            this._offerCount = k;
        }

        public function get isUniqueLimitedItem():Boolean
        {
            return (!(this.stuffData == null)) && (this.stuffData.uniqueSerialNumber > 0);
        }
    }
}
