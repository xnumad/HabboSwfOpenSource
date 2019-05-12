package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;

    public class GoToRoomButtonElementHandler extends AbstractButtonElementHandler 
    {
        private var _roomId:int;


        override public function initialize(k:HabboLandingView, _arg_2:IWindow, _arg_3:Array, _arg_4:GenericWidget):void
        {
            super.initialize(k, _arg_2, _arg_3, _arg_4);
            this._roomId = int(_arg_3[2]);
        }

        override protected function onClick():void
        {
            landingView.navigator.goToPrivateRoom(this._roomId);
            landingView.tracking.trackGoogle("landingView", "click_gotoroom");
        }
    }
}
