package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;
    import com.sulake.habbo.catalog.IPurchasableOffer;

    public class ProductOfferUpdatedEvent extends Event 
    {
        private var _offer:IPurchasableOffer;

        public function ProductOfferUpdatedEvent(k:IPurchasableOffer, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(CatalogWidgetEvent.PRODUCT_OFFER_UPDATED, _arg_2, _arg_3);
            this._offer = k;
        }

        public function get offer():IPurchasableOffer
        {
            return this._offer;
        }
    }
}
