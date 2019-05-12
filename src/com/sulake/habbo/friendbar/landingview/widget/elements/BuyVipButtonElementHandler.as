package com.sulake.habbo.friendbar.landingview.widget.elements
{
    public class BuyVipButtonElementHandler extends AbstractButtonElementHandler 
    {
        override protected function onClick():void
        {
            landingView.catalog.openClubCenter();
            landingView.tracking.trackGoogle("landingView", "click_buyVip");
        }
    }
}
