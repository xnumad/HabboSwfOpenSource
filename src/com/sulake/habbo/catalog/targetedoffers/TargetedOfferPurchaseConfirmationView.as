package com.sulake.habbo.catalog.targetedoffers
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.catalog.targetedoffers.data.TargetedOffer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.core.window.events.WindowEvent;

    public class TargetedOfferPurchaseConfirmationView extends OfferView 
    {
        private var _quantity:int;

        public function TargetedOfferPurchaseConfirmationView(k:OfferController, _arg_2:TargetedOffer, _arg_3:int)
        {
            super(k, _arg_2);
            this._quantity = _arg_3;
            _window = IWindowContainer(_Str_2278.catalog.windowManager.buildFromXML(XML(_Str_2278.catalog.assets.getAssetByName("targeted_offer_purchase_confirmation_xml").content)));
            var _local_4:HabboCatalog = (_Str_2278.catalog as HabboCatalog);
            if (_local_4.getBoolean("disclaimer.credit_spending.enabled"))
            {
                this._Str_3515(false);
            }
            else
            {
                _window.findChildByName("disclaimer").dispose();
                this._Str_3515(true);
            }
            ITextWindow(_window.findChildByName("product_name")).text = getLocalization(_arg_2.title);
            var _local_5:IWindowContainer = (_window.findChildByName("purchase_cost_box") as IWindowContainer);
            _local_4.utils._Str_6455(_local_5, _arg_2, _arg_3);
            var _local_6:ITextWindow = (_window.findChildByName("quantity") as ITextWindow);
            if (_local_6 != null)
            {
                if (((k.catalog._Str_7593) && (this._quantity > 1)))
                {
                    _local_6.text = ("X " + this._quantity);
                }
            }
            _window.procedure = this._Str_3055;
            _window.center();
        }

        private function _Str_3515(k:Boolean):void
        {
            if (_window == null)
            {
                return;
            }
            var _local_2:IWindow = _window.findChildByName("select_button");
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

        private function _Str_3055(k:WindowEvent, _arg_2:IWindow):void
        {
            if (!_Str_2278)
            {
                return;
            }
            if (k.type == WindowMouseEvent.DOWN)
            {
                switch (_arg_2.name)
                {
                    case "spending_disclaimer":
                        this._Str_3515(ICheckBoxWindow(_arg_2)._Str_2365);
                        return;
                    case "header_button_close":
                    case "cancel_button":
                        _Str_2278.maximizeOffer(_Str_2324);
                        return;
                    case "buy_button":
                        _Str_2278.purchaseTargetedOffer(_Str_2324, this._quantity);
                        return;
                }
            }
        }
    }
}



