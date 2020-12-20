package com.sulake.habbo.inventory.marketplace
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.inventory.HabboInventory;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets.ILimitedItemPreviewOverlayWidget;
    import com.sulake.habbo.window.widgets._Str_3083;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.inventory.items.FurnitureItem;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.window.utils.IConfirmDialog;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habboclient.ExternalVariables;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.habbo.window.utils.IAlertDialog;

    public class MarketplaceView implements IGetImageListener 
    {
        private var _windowManager:IHabboWindowManager;
        private var _assetLibrary:IAssetLibrary;
        private var _view:IFrameWindow;
        private var _model:MarketplaceModel;
        private var _roomEngine:IRoomEngine;
        private var _localization:IHabboLocalizationManager;
        private var _disposed:Boolean = false;
        private var _furniImageId:int;
        private var _askingPrice:int;
        private var _furniName:String;
        private var _habboInventory:HabboInventory;

        public function MarketplaceView(k:MarketplaceModel, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IRoomEngine, _arg_5:IHabboLocalizationManager, _arg_6:HabboInventory)
        {
            this._model = k;
            this._assetLibrary = _arg_3;
            this._windowManager = _arg_2;
            this._roomEngine = _arg_4;
            this._localization = _arg_5;
            this._habboInventory = _arg_6;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._model = null;
                this._assetLibrary = null;
                this._windowManager = null;
                this._roomEngine = null;
                this._localization = null;
                this.disposeView();
                this._disposed = true;
            }
        }

        private function disposeView():void
        {
            if (this._view != null)
            {
                this._view.dispose();
                this._view = null;
            }
        }

        public function showBuyTokens(k:int, _arg_2:int):void
        {
            if (this._localization)
            {
                this._localization.registerParameter("inventory.marketplace.buy_tokens.info", "price", k.toString());
                this._localization.registerParameter("inventory.marketplace.buy_tokens.info", "count", _arg_2.toString());
                this._localization.registerParameter("inventory.marketplace.buy_tokens.info", "free", (_arg_2 - 1).toString());
                this._localization.registerParameter("inventory.marketplace.buy_tokens.buy", "price", k.toString());
            }
            this._view = (this.createWindow("buy_marketplace_tokens_xml") as IFrameWindow);
            if (this._view == null)
            {
                return;
            }
            this._view.procedure = this.clickHandler;
            this._view.center();
        }

        public function showMakeOffer(k:FurnitureItem):void
        {
            var _local_4:ImageResult;
            var _local_5:String;
            var _local_6:String;
            var _local_8:IWidgetWindow;
            var _local_9:ILimitedItemPreviewOverlayWidget;
            var _local_10:IWidgetWindow;
            var _local_11:_Str_3083;
            if (((((!(k)) || (!(this._localization))) || (!(this._roomEngine))) || (!(this._model))))
            {
                return;
            }
            this._view = (this.createWindow("make_marketplace_offer_xml") as IFrameWindow);
            if (!this._view)
            {
                return;
            }
            var _local_2:ITextFieldWindow = (this._view.findChildByName("price_input") as ITextFieldWindow);
            if (_local_2 != null)
            {
                _local_2.restrict = "0-9";
            }
            this.checkPrice();
            this._localization.registerParameter("inventory.marketplace.make_offer.expiration_info", "time", this._model.expirationHours.toString());
            this._localization.registerParameter("inventory.marketplace.make_offer.min_price", "minprice", this._model.offerMinPrice.toString());
            this._localization.registerParameter("inventory.marketplace.make_offer.max_price", "maxprice", this._model.offerMaxPrice.toString());
            var _local_3:uint = 4293848814;
            if (!k.isWallItem)
            {
                _local_4 = this._roomEngine.getFurnitureImage(k.type, new Vector3d(90, 0, 0), 64, this, _local_3, String(k._Str_2794));
            }
            else
            {
                _local_4 = this._roomEngine.getWallItemImage(k.type, new Vector3d(90, 0, 0), 64, this, _local_3, k.stuffData.getLegacyString());
            }
            if (!_local_4)
            {
                return;
            }
            this._furniImageId = _local_4.id;
            this.setFurniImage(_local_4.data);
            if (k.isWallItem)
            {
                _local_5 = ("wallItem.name." + k.type);
                _local_6 = ("wallItem.desc." + k.type);
            }
            else
            {
                _local_5 = ("roomItem.name." + k.type);
                _local_6 = ("roomItem.desc." + k.type);
            }
            if (k.category == FurniCategory.POSTER)
            {
                _local_5 = (("poster_" + k.stuffData.getLegacyString()) + "_name");
                _local_6 = (("poster_" + k.stuffData.getLegacyString()) + "_desc");
            }
            this._furniName = this._localization.getLocalization(_local_5);
            this.setText("furni_name", ((("$" + "{") + _local_5) + "}"));
            this.setText("furni_desc", ((("$" + "{") + _local_6) + "}"));
            this._view.procedure = this.clickHandler;
            this._view.center();
            var _local_7:ITextWindow = (this._view.findChildByName("average_price") as ITextWindow);
            if (_local_7)
            {
                _local_7.visible = false;
            }
            if (((!(k.stuffData == null)) && (k.stuffData.uniqueSerialNumber > 0)))
            {
                _local_8 = IWidgetWindow(this._view.findChildByName("unique_item_overlay_widget"));
                _local_8.visible = true;
                _local_9 = ILimitedItemPreviewOverlayWidget(_local_8.widget);
                _local_9.serialNumber = k.stuffData.uniqueSerialNumber;
                _local_9.seriesSize = k.stuffData.uniqueSeriesSize;
            }
            if (((!(k.stuffData == null)) && (k.stuffData.rarityLevel >= 0)))
            {
                _local_10 = IWidgetWindow(this._view.findChildByName("rarity_item_overlay_widget"));
                _local_10.visible = true;
                _local_11 = _Str_3083(_local_10.widget);
                _local_11.rarityLevel = k.stuffData.rarityLevel;
            }
            this._model.getItemStats();
        }

        private function setFurniImage(k:BitmapData):void
        {
            if (((k == null) || (this._view == null)))
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._view.findChildByName("furni_image") as IBitmapWrapperWindow);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:BitmapData = new BitmapData(_local_2.width, _local_2.height, true, 0);
            var _local_4:int = ((_local_3.width - k.width) * 0.5);
            var _local_5:int = ((_local_3.height - k.height) * 0.5);
            _local_3.draw(k, new Matrix(1, 0, 0, 1, _local_4, _local_5));
            _local_2.bitmap = _local_3;
        }

        private function setText(k:String, _arg_2:String):void
        {
            if (this._view == null)
            {
                return;
            }
            var _local_3:ITextWindow = (this._view.findChildByName(k) as ITextWindow);
            if (_local_3 == null)
            {
                return;
            }
            _local_3.text = _arg_2;
        }

        public function showNoCredits(k:int):void
        {
            if (this._localization)
            {
                this._localization.registerParameter("inventory.marketplace.no_credits.info", "price", k.toString());
            }
            this._view = (this.createWindow("marketplace_no_credits_xml") as IFrameWindow);
            if (this._view == null)
            {
                return;
            }
            this._view.procedure = this.clickHandler;
            this._view.center();
        }

        private function showConfirmation():void
        {
            this._localization.registerParameter("inventory.marketplace.confirm_offer.info", "furniname", this._furniName);
            this._localization.registerParameter("inventory.marketplace.confirm_offer.info", "price", this._askingPrice.toString());
            var k:String = ("$" + "{inventory.marketplace.confirm_offer.title}");
            var _local_2:String = ("$" + "{inventory.marketplace.confirm_offer.info}");
            this._windowManager.confirm(k, _local_2, 0, this.confirmationCallback);
        }

        private function confirmationCallback(k:IConfirmDialog, _arg_2:WindowEvent):void
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return;
            }
            k.dispose();
            if (this._model == null)
            {
                return;
            }
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
            {
                this._model.makeOffer(this._askingPrice);
            }
            this._model.releaseItem();
        }

        private function createWindow(k:String):IWindow
        {
            if (((this._assetLibrary == null) || (this._windowManager == null)))
            {
                return null;
            }
            var _local_2:XmlAsset = (this._assetLibrary.getAssetByName(k) as XmlAsset);
            if (_local_2 == null)
            {
                return null;
            }
            return this._windowManager.buildFromXML((_local_2.content as XML));
        }

        private function clickHandler(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:ITextFieldWindow;
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "buy_tokens_button":
                        this._model.buyMarketplaceTokens();
                        this.disposeView();
                        break;
                    case "cancel_buy_tokens_button":
                    case "cancel_make_offer_button":
                    case "cancel_no_credits_button":
                    case "header_button_close":
                        this._model.releaseItem();
                        this.disposeView();
                        break;
                    case "make_offer_button":
                        _local_3 = (this._view.findChildByName("price_input") as ITextFieldWindow);
                        if (_local_3 != null)
                        {
                            this._askingPrice = parseInt(_local_3.text);
                            this.showConfirmation();
                        }
                        this.disposeView();
                        break;
                    case "get_credits_button":
                        this._model.releaseItem();
                        this.openCreditsPage();
                        this.disposeView();
                        break;
                }
            }
            if (k.type == WindowEvent.WINDOW_EVENT_CHANGE)
            {
                if (_arg_2.name == "price_input")
                {
                    this.checkPrice();
                }
            }
        }

        private function openCreditsPage():void
        {
            HabboWebTools.openWebPageAndMinimizeClient(this._habboInventory.getProperty(ExternalVariables.WEB_SHOP_RELATIVE_URL));
        }

        private function checkPrice():void
        {
            if (this._view == null)
            {
                return;
            }
            var k:ITextFieldWindow = (this._view.findChildByName("price_input") as ITextFieldWindow);
            if (k == null)
            {
                return;
            }
            var _local_2:int = parseInt(k.text);
            if (_local_2 > this._model.offerMaxPrice)
            {
                k.text = this._model.offerMaxPrice.toString();
                _local_2 = this._model.offerMaxPrice;
            }
            var _local_3:int = Math.max(Math.ceil(((this._model.commission * 0.01) * _local_2)), 1);
            var _local_4:int = (_local_2 + _local_3);
            var _local_5:IButtonWindow = (this._view.findChildByName("make_offer_button") as IButtonWindow);
            var _local_6:ITextWindow = (this._view.findChildByName("final_price") as ITextWindow);
            if (((_local_5 == null) || (_local_6 == null)))
            {
                return;
            }
            this._localization.registerParameter("inventory.marketplace.make_offer.final_price", "commission", _local_3.toString());
            this._localization.registerParameter("inventory.marketplace.make_offer.final_price", "finalprice", _local_4.toString());
            if (_local_2 < this._model.offerMinPrice)
            {
                _local_6.text = ("$" + "{inventory.marketplace.make_offer.min_price}");
                _local_5.disable();
            }
            else
            {
                _local_6.text = ("$" + "{inventory.marketplace.make_offer.final_price}");
                _local_5.enable();
            }
        }

        public function showResult(k:int):void
        {
            var _local_2:String;
            if (k == 1)
            {
                _local_2 = ("$" + "{inventory.marketplace.result.title.success}");
            }
            else
            {
                _local_2 = ("$" + "{inventory.marketplace.result.title.failure}");
            }
            var _local_3:* = ((("$" + "{inventory.marketplace.result.") + k) + "}");
            this._windowManager.alert(_local_2, _local_3, 0, this.closeAlert);
        }

        private function closeAlert(k:IAlertDialog, _arg_2:WindowEvent):void
        {
            if (k == null)
            {
                return;
            }
            this._model.releaseItem();
            k.dispose();
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (this._furniImageId == k)
            {
                this.setFurniImage(_arg_2);
            }
        }

        public function imageFailed(k:int):void
        {
        }

        public function showAlert(k:String, _arg_2:String):void
        {
            this._windowManager.alert(k, _arg_2, 0, this.closeAlert);
        }

        public function updateAveragePrice(k:int, _arg_2:int):void
        {
            if ((((!(this._view)) || (!(this._localization))) || (!(this._model))))
            {
                return;
            }
            var _local_3:ITextWindow = (this._view.findChildByName("average_price") as ITextWindow);
            if (!_local_3)
            {
                return;
            }
            var _local_4:int = Math.floor((k / (1 + (this._model.commission * 0.01))));
            this._localization.registerParameter("inventory.marketplace.make_offer.average_price", "days", _arg_2.toString());
            var _local_5:String = ((k == 0) ? " - " : k.toString());
            this._localization.registerParameter("inventory.marketplace.make_offer.average_price", "price", _local_5);
            var _local_6:String = ((_local_4 == 0) ? " - " : _local_4.toString());
            this._localization.registerParameter("inventory.marketplace.make_offer.average_price", "price_no_commission", _local_6);
            _local_3.visible = true;
        }
    }
}
