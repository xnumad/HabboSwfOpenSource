package com.sulake.habbo.friendbar.landingview.widget.elements
{
    public class CreditHabbletButtonElementHandler extends AbstractButtonElementHandler 
    {


        override protected function onClick():void
        {
            landingView.catalog.openCreditsHabblet();
            landingView.tracking.trackGoogle("landingView", "click_credithabblet");
        }
    }
}
