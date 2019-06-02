package com.sulake.habbo.catalog.club
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.catalog.purse.IPurse;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.core.window.events.WindowEvent;

    public class ClubBuyConfirmationDialog 
    {
        private var _offer:ClubBuyOfferData;
        private var _controller:ClubOfferHandler;
        private var _view:IFrameWindow;
        private var _pageId:int;

        public function ClubBuyConfirmationDialog(k:ClubOfferHandler, _arg_2:ClubBuyOfferData, _arg_3:int)
        {
            this._offer = _arg_2;
            this._controller = k;
            this._pageId = _arg_3;
            this.showConfirmation();
        }

        public function dispose():void
        {
            this._controller = null;
            this._offer = null;
            if (this._view)
            {
                this._view.dispose();
                this._view = null;
            }
        }

        public function showConfirmation():void
        {
            if (((!(this._offer)) || (!(this._controller))))
            {
                return;
            }
            this._view = (this._controller.catalog.utils.createWindow("club_buy_confirmation") as IFrameWindow);
            if (!this._view)
            {
                return;
            }
            this._view.procedure = this._Str_3545;
            this._view.center();
            if (this._controller.catalog.getBoolean("disclaimer.credit_spending.enabled"))
            {
                this._Str_3515(false);
            }
            else
            {
                this._view.findChildByName("disclaimer").dispose();
                this._Str_3515(true);
            }
            var k:IHabboLocalizationManager = this._controller.localization;
            var _local_2:IPurse = this._controller.getPurse();
            var _local_3:String = (((_local_2.hasClubLeft) && (_local_2.isVIP)) ? "extension." : "subscription.");
            var _local_4:String = ((this._offer.months == 0) ? "days" : "months");
            var _local_5:String = (("catalog.vip.buy.confirm." + _local_3) + _local_4);
            k.registerParameter(_local_5, ("num_" + _local_4), String(((this._offer.months == 0) ? this._offer._Str_15178 : this._offer.months)));
            this._view.findChildByName("subscription_name").caption = k.getLocalization(_local_5);
            k.registerParameter("catalog.vip.buy.confirm.end_date", "day", String(this._offer.day));
            k.registerParameter("catalog.vip.buy.confirm.end_date", "month", String(this._offer.month));
            k.registerParameter("catalog.vip.buy.confirm.end_date", "year", String(this._offer.year));
            this._controller.catalog.utils._Str_6455((this._view.findChildByName("purchase_cost_box") as IWindowContainer), this._offer);
        }

        private function _Str_3515(k:Boolean):void
        {
            if (this._view == null)
            {
                return;
            }
            var _local_2:IWindow = this._view.findChildByName("select_button");
            if (_local_2 == null)
            {
                return;
            }
            if (k)
            {
                _local_2.enable();
            }
            else
            {
                _local_2.disable();
            }
        }

        private function _Str_3545(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((((!(k)) || (!(_arg_2))) || (!(this._controller))) || (!(this._offer))))
            {
                return;
            }
            if (((!(k.type == WindowMouseEvent.CLICK)) && (!(k.type == WindowMouseEvent.DOUBLE_CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "spending_disclaimer":
                    this._Str_3515(ICheckBoxWindow(_arg_2)._Str_2365);
                    return;
                case "select_button":
                    this._controller.catalog._Str_22294();
                    this._controller._Str_11237(this._offer, this._pageId);
                    return;
                case "header_button_close":
                case "cancel_button":
                    this._controller.catalog._Str_23687();
                    this._controller._Str_4504();
                    return;
            }
        }
    }
}
