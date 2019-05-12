package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;

    public class InternalLinkButtonElementHandler extends AbstractButtonElementHandler 
    {
        private var _link:String;
        private var _configurationCode:String;


        override public function initialize(k:HabboLandingView, _arg_2:IWindow, _arg_3:Array, _arg_4:GenericWidget):void
        {
            super.initialize(k, _arg_2, _arg_3, _arg_4);
            this._link = _arg_3[2];
            this._configurationCode = _arg_4._Str_12275;
        }

        override protected function onClick():void
        {
            landingView.context.createLinkEvent(this._link);
            landingView.tracking.trackEventLog("LandingView", this._configurationCode, "client_link", this._link);
        }
    }
}
