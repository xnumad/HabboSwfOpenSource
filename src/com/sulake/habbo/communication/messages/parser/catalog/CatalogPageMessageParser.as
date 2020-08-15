package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogLocalizationData;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
    import com.sulake.habbo.communication.messages.incoming.catalog.FrontPageItem;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class CatalogPageMessageParser implements IMessageParser 
    {
        private var _pageId:int;
        private var _catalogType:String;
        private var _layoutCode:String;
        private var _localization:CatalogLocalizationData;
        private var _offers:Vector.<CatalogPageMessageOfferData>;
        private var _offerId:int;
        private var _acceptSeasonCurrencyAsCredits:Boolean;
        private var _frontPageItems:Vector.<FrontPageItem>;


        public function get pageId():int
        {
            return this._pageId;
        }

        public function get catalogType():String
        {
            return this._catalogType;
        }

        public function get layoutCode():String
        {
            return this._layoutCode;
        }

        public function get localization():CatalogLocalizationData
        {
            return this._localization;
        }

        public function get offers():Vector.<CatalogPageMessageOfferData>
        {
            return this._offers;
        }

        public function get offerId():int
        {
            return this._offerId;
        }

        public function get acceptSeasonCurrencyAsCredits():Boolean
        {
            return this._acceptSeasonCurrencyAsCredits;
        }

        public function get frontPageItems():Vector.<FrontPageItem>
        {
            return this._frontPageItems;
        }

        public function flush():Boolean
        {
            this._pageId = -1;
            this._catalogType = "";
            this._layoutCode = "";
            this._localization = null;
            this._offers = new Vector.<CatalogPageMessageOfferData>(0);
            this._offerId = -1;
            this._acceptSeasonCurrencyAsCredits = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._pageId = k.readInteger();
            this._catalogType = k.readString();
            this._layoutCode = k.readString();
            this._localization = new CatalogLocalizationData(k);
            this._offers = new Vector.<CatalogPageMessageOfferData>(0);
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._offers.push(new CatalogPageMessageOfferData(k));
                _local_3++;
            }
            this._offerId = k.readInteger(); //usually -1, whyever would a CatalogPage have an offerId anyways?
            this._acceptSeasonCurrencyAsCredits = k.readBoolean();
            if (k.bytesAvailable)
            {
                this._frontPageItems = new Vector.<FrontPageItem>(0);
                _local_2 = k.readInteger();
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    this._frontPageItems.push(new FrontPageItem(k));
                    _local_3++;
                }
            }
            return true;
        }
    }
}
