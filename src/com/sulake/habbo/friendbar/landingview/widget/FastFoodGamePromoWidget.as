package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.game.HabboGames;
    import com.sulake.core.window.events.WindowEvent;

    public class FastFoodGamePromoWidget implements ILandingViewWidget 
    {
        private var _landingView:HabboLandingView;
        private var _container:IWindowContainer;
        private var _completions:int;

        public function FastFoodGamePromoWidget(k:HabboLandingView)
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
            if (this._container)
            {
                this._container.dispose();
            }
            this._container = null;
        }

        public function initialize():void
        {
            this._container = IWindowContainer(this._landingView.getXmlWindow("fast_food_game_promo"));
            this._container.findChildByName("go_button").procedure = this._Str_5735;
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
                this._landingView.openGameCenterByGameName(HabboGames.BASEJUMP);
            }
        }
    }
}
