package com.sulake.habbo.catalog.club
{
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.XmlAsset;

    public class ClubGiftConfirmationDialog 
    {
        private var _offer:IPurchasableOffer;
        private var _controller:ClubGiftController;
        private var _view:IFrameWindow;

        public function ClubGiftConfirmationDialog(k:ClubGiftController, _arg_2:IPurchasableOffer)
        {
            this._offer = _arg_2;
            this._controller = k;
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
            this._view = (this.createWindow("club_gift_confirmation") as IFrameWindow);
            if (!this._view)
            {
                return;
            }
            this._view.procedure = this._Str_3545;
            this._view.center();
            var k:ITextWindow = (this._view.findChildByName("item_name") as ITextWindow);
            if (k)
            {
                k.text = this._Str_25688();
            }
            var _local_2:IWindowContainer = (this._view.findChildByName("image_border") as IWindowContainer);
            if (!_local_2)
            {
                return;
            }
            if (!this._offer.productContainer)
            {
                return;
            }
            this._offer.productContainer.view = _local_2;
            this._offer.productContainer.initProductIcon(this._controller.roomEngine);
        }

        private function _Str_25688():String
        {
            var k:IProductData;
            if (((this._offer) && (this._offer.product)))
            {
                k = this._offer.product.productData;
                if (k)
                {
                    return k.name;
                }
            }
            return "";
        }

        private function _Str_3545(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((((!(k)) || (!(_arg_2))) || (!(this._controller))) || (!(this._offer))))
            {
                return;
            }
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "select_button":
                    this._controller._Str_11237(this._offer.localizationId);
                    return;
                case "header_button_close":
                case "cancel_button":
                    this._controller._Str_4504();
                    return;
            }
        }

        private function createWindow(k:String):IWindow
        {
            if ((((!(this._controller)) || (!(this._controller.assets))) || (!(this._controller.windowManager))))
            {
                return null;
            }
            var _local_2:XmlAsset = (this._controller.assets.getAssetByName(k) as XmlAsset);
            if (((!(_local_2)) || (!(_local_2.content))))
            {
                return null;
            }
            var _local_3:XML = (_local_2.content as XML);
            if (!_local_3)
            {
                return null;
            }
            return this._controller.windowManager.buildFromXML(_local_3);
        }
    }
}





