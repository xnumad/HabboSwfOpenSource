package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;

    public class CatalogPromoSmallWidget extends CatalogPromoWidget 
    {
        public function CatalogPromoSmallWidget(k:HabboLandingView)
        {
            super(k);
        }

        override protected function get xmlAssetName():String
        {
            return "catalog_promo_small";
        }
    }
}
