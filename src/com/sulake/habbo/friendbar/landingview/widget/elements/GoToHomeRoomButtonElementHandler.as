package com.sulake.habbo.friendbar.landingview.widget.elements
{
    public class GoToHomeRoomButtonElementHandler extends AbstractButtonElementHandler 
    {
        override protected function onClick():void
        {
            landingView.questEngine.reenableRoomCompetitionWindow();
            landingView.navigator.goToHomeRoom();
            landingView.tracking.trackGoogle("landingView", "click_gotohomeroom");
        }
    }
}
