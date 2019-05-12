package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;

    public class PromotedRoomButtonElementHandler extends AbstractButtonElementHandler 
    {
        private var _categoryCode:String;


        override protected function onClick():void
        {
            landingView.goToRoom(this._categoryCode);
            landingView.tracking.trackGoogle("landingView", ("click_promotedroom" + this._categoryCode));
        }

        override public function initialize(k:HabboLandingView, _arg_2:IWindow, _arg_3:Array, _arg_4:GenericWidget):void
        {
            super.initialize(k, _arg_2, _arg_3, _arg_4);
            if (_arg_3.length > 1)
            {
                this._categoryCode = _arg_3[2];
            }
        }
    }
}
