package com.sulake.habbo.communication.messages.incoming.catalog
{
    import flash.utils.getTimer;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FrontPageItem
    {
        public static const _Str_13638:int = 0;
        public static const _Str_15225:int = 1;
        public static const _Str_17904:int = 2;

        private var _type:int;
        private var _position:int;
        private var _itemName:String;
        private var _itemPromoImage:String;
        private var _cataloguePageLocation:String;
        private var _productCode:String;
        private var _productOfferID:int;
        private var _expirationTime:int;

        public function FrontPageItem(k:IMessageDataWrapper)
        {
            if (!k)
            {
                return;
            }
            this._position = k.readInteger();
            this._itemName = k.readString();
            this._itemPromoImage = k.readString();
            this._type = k.readInteger();
            switch (this._type)
            {
                case _Str_13638:
                    this._cataloguePageLocation = k.readString();
                    break;
                case _Str_17904:
                    this._productCode = k.readString();
                    break;
                case _Str_15225:
                    this._productOfferID = k.readInteger();
                    break;
            }
            var _local_2:int = k.readInteger();
            this._expirationTime = ((_local_2 > 0) ? ((_local_2 * 1000) + getTimer()) : 0);
        }

        public function get position():int
        {
            return this._position;
        }

        public function get itemName():String
        {
            return this._itemName;
        }

        public function get itemPromoImage():String
        {
            return this._itemPromoImage;
        }

        public function get cataloguePageLocation():String
        {
            return this._cataloguePageLocation;
        }

        public function get offerExpires():Boolean
        {
            return this._expirationTime > 0;
        }

        public function get secondsToExpiration():int
        {
            return this._expirationTime - getTimer();
        }

        public function get type():int
        {
            return this._type;
        }

        public function get productCode():String
        {
            return this._productCode;
        }

        public function get productOfferID():int
        {
            return this._productOfferID;
        }
    }
}
