package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_364._Str_3075;
    import com.sulake.core.window.events.WindowEvent;

    public class HabboTalentsPromoWidget implements ILandingViewWidget 
    {
        private var _landingView:HabboLandingView;
        private var _container:IWindowContainer;

        public function HabboTalentsPromoWidget(k:HabboLandingView)
        {
            this._landingView = k;
        }

        public function get container():IWindow
        {
            return this._container;
        }

        public function dispose():void
        {
            this._landingView = null;
            this._container = null;
        }

        public function initialize():void
        {
            this._container = IWindowContainer(this._landingView.getXmlWindow("habbo_talents_promo"));
            this._container.findChildByName("go_button").procedure = this._Str_5735;
            HabboLandingView._Str_9079(this._container, "title_txt", "hdr_line");
        }

        public function refresh():void
        {
        }

        public function get disposed():Boolean
        {
            return this._landingView == null;
        }

        private function _Str_5735(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._landingView.tracking.trackTalentTrackOpen(this._landingView.sessionDataManager.currentTalentTrack, "landingpagepromo");
                this._landingView.send(new _Str_3075(this._landingView.sessionDataManager.currentTalentTrack));
            }
        }
    }
}

