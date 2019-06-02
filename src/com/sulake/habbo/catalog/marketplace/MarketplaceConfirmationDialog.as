package com.sulake.habbo.catalog.marketplace
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.localization.ILocalization;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_3353;
    import com.sulake.habbo.window.widgets._Str_3083;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.assets.XmlAsset;

    public class MarketplaceConfirmationDialog implements IGetImageListener 
    {
        private var _marketplace:MarketPlaceLogic;
        private var _catalog:IHabboCatalog;
        private var _roomEngine:IRoomEngine;
        private var _window:IFrameWindow;
        private var _offer:MarketPlaceOfferData;

        public function MarketplaceConfirmationDialog(k:MarketPlaceLogic, _arg_2:IHabboCatalog, _arg_3:IRoomEngine)
        {
            this._marketplace = k;
            this._catalog = _arg_2;
            this._roomEngine = _arg_3;
        }

        public function dispose():void
        {
            this._marketplace = null;
            this._catalog = null;
            this._roomEngine = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            this._offer = null;
        }

        public function showConfirmation(k:int, _arg_2:MarketPlaceOfferData):void
        {
            var _local_4:String;
            var _local_5:ILocalization;
            var _local_6:String;
            var _local_7:IWindow;
            var _local_8:IWidgetWindow;
            var _local_9:_Str_3353;
            var _local_10:IWidgetWindow;
            var _local_11:_Str_3083;
            var _local_12:IWindow;
            if (!_arg_2)
            {
                return;
            }
            this._offer = _arg_2;
            if ((((!(this._marketplace)) || (!(this._catalog))) || (!(this._catalog.localization))))
            {
                return;
            }
            if (this._window)
            {
                this._window.dispose();
            }
            this._window = (this.createWindow("marketplace_purchase_confirmation") as IFrameWindow);
            this._window.procedure = this.eventHandler;
            this._window.center();
            var _local_3:ITextWindow = (this._window.findChildByName("header_text") as ITextWindow);
            if (_local_3)
            {
                if (k == this._marketplace._Str_19658)
                {
                    _local_3.text = ("$" + "{catalog.marketplace.confirm_header}");
                }
                if (k == this._marketplace._Str_22006)
                {
                    _local_3.text = ("$" + "{catalog.marketplace.confirm_higher_header}");
                }
            }
            _local_3 = (this._window.findChildByName("item_name") as ITextWindow);
            if (_local_3)
            {
                _local_3.text = ((("$" + "{") + this._marketplace.getNameLocalizationKey(_arg_2)) + "}");
            }
            _local_3 = (this._window.findChildByName("item_price") as ITextWindow);
            if (_local_3)
            {
                _local_4 = this._catalog.localization.getLocalization("catalog.marketplace.confirm_price");
                _local_4 = _local_4.replace("%price%", this._offer.price);
                _local_3.text = _local_4;
            }
            _local_3 = (this._window.findChildByName("item_average_price") as ITextWindow);
            if (_local_3)
            {
                _local_5 = this._catalog.localization.getLocalizationRaw("catalog.marketplace.offer_details.average_price");
                if (_local_5)
                {
                    _local_4 = _local_5.raw;
                    _local_4 = _local_4.replace("%days%", this._marketplace._Str_5014.toString());
                    _local_6 = ((this._offer._Str_3925 == 0) ? " - " : this._offer._Str_3925.toString());
                    _local_4 = _local_4.replace("%average%", _local_6);
                    _local_3.text = _local_4;
                }
                else
                {
                    _local_3.visible = false;
                }
            }
            _local_3 = (this._window.findChildByName("offer_count") as ITextWindow);
            if (_local_3)
            {
                _local_5 = this._catalog.localization.getLocalizationRaw("catalog.marketplace.offer_details.offer_count");
                if (_local_5)
                {
                    _local_4 = _local_5.raw;
                    _local_4 = _local_4.replace("%count%", this._offer._Str_4121);
                    _local_3.text = _local_4;
                }
                else
                {
                    _local_3.visible = false;
                }
            }
            if (_arg_2.isUniqueLimitedItem)
            {
                _local_7 = this._window.findChildByName("unique_item_background_bitmap");
                _local_7.visible = true;
                _local_8 = IWidgetWindow(this._window.findChildByName("unique_item_overlay_widget"));
                _local_9 = _Str_3353(_local_8.widget);
                _local_8.visible = true;
                _local_9._Str_3442 = _arg_2.stuffData.uniqueSerialNumber;
                _local_9.animated = true;
            }
            if (((_arg_2.stuffData) && (_arg_2.stuffData.rarityLevel >= 0)))
            {
                _local_10 = IWidgetWindow(this._window.findChildByName("rarity_item_overlay_widget"));
                _local_11 = _Str_3083(_local_10.widget);
                _local_10.visible = true;
                _local_11.rarityLevel = _arg_2.stuffData.rarityLevel;
            }
            this._Str_3523();
            if ((this._catalog as HabboCatalog).getBoolean("disclaimer.credit_spending.enabled"))
            {
                this._Str_3515(false);
            }
            else
            {
                _local_12 = this._window.findChildByName("disclaimer");
                this._window.height = (this._window.height - _local_12.height);
                _local_12.dispose();
                this._Str_3515(true);
            }
        }

        private function _Str_3523():void
        {
            var k:ImageResult;
            var _local_2:IBitmapWrapperWindow;
            if ((((!(this._offer)) || (!(this._window))) || (!(this._roomEngine))))
            {
                return;
            }
            if (!this._offer.image)
            {
                if (this._offer.furniType == 1)
                {
                    k = this._roomEngine.getFurnitureIcon(this._offer.furniId, this);
                }
                else
                {
                    if (this._offer.furniType == 2)
                    {
                        k = this._roomEngine.getWallItemIcon(this._offer.furniId, this);
                    }
                }
                if (((k) && (k.data)))
                {
                    this._offer.image = (k.data as BitmapData);
                    this._offer._Str_4774 = k.id;
                }
            }
            if (this._offer.image != null)
            {
                _local_2 = (this._window.findChildByName("item_image") as IBitmapWrapperWindow);
                if (_local_2)
                {
                    if (_local_2.bitmap)
                    {
                        _local_2.bitmap.dispose();
                        _local_2.bitmap = null;
                    }
                    _local_2.bitmap = new BitmapData(_local_2.width, _local_2.height, true, 0);
                    _local_2.bitmap.draw(this._offer.image, new Matrix(1, 0, 0, 1, ((_local_2.width - this._offer.image.width) / 2), ((_local_2.height - this._offer.image.height) / 2)));
                }
            }
        }

        private function eventHandler(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((!(k)) || (!(_arg_2))))
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
                case "buy_button":
                    this._catalog.buyMarketPlaceOffer(this._offer.offerId);
                    this.hide();
                    return;
                case "header_button_close":
                case "cancel_button":
                    this.hide();
                    return;
            }
        }

        private function hide():void
        {
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (((this._offer) && (this._offer._Str_4774 == k)))
            {
                this._offer.image = _arg_2;
                this._Str_3523();
            }
        }

        public function imageFailed(k:int):void
        {
        }

        private function createWindow(k:String):IWindow
        {
            if ((((!(this._catalog)) || (!(this._catalog.assets))) || (!(this._catalog.windowManager))))
            {
                return null;
            }
            var _local_2:XmlAsset = (this._catalog.assets.getAssetByName(k) as XmlAsset);
            if (((!(_local_2)) || (!(_local_2.content))))
            {
                return null;
            }
            var _local_3:XML = (_local_2.content as XML);
            if (!_local_3)
            {
                return null;
            }
            return this._catalog.windowManager.buildFromXML(_local_3);
        }

        private function _Str_3515(k:Boolean):void
        {
            if (this._window == null)
            {
                return;
            }
            var _local_2:IWindow = this._window.findChildByName("buy_button");
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
    }
}
