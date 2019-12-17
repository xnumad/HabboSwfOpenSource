package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events._Str_4201;
    import com.sulake.habbo.catalog.enum.CatalogType;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSpinnerEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.catalog.purchase._Str_11981;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.habbo.catalog.viewer.Offer;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetInitPurchaseEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetRoomPreviewerStuffDataEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events._Str_3308;

    public class PurchaseCatalogWidget extends CatalogWidget
    {
        private var _stubPurchaseVipXML:XML;
        private var _stub:IWindowContainer;
        private var _offer:IPurchasableOffer;
        private var _additionalParameters:String = "";
        private var _previewStuffData:IStuffData = null;
        private var _quantity:int = 1;
        private var _purchaseCallback:Function;
        private var _catalog:HabboCatalog;
        private var _noGiftOption:Boolean;
        private var _extraParamRequired:Boolean = false;
        private var _enabled:Boolean = true;

        public function PurchaseCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._catalog = _arg_2;
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            events.removeEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_3115);
            events.removeEventListener(CatalogWidgetEvent.SET_EXTRA_PARM, this._Str_19234);
            events.removeEventListener(CatalogWidgetEvent.PURCHASE_OVERRIDE, this._Str_21783);
            events.removeEventListener(CatalogWidgetEvent.SET_PREVIEWER_STUFFDATA, this._Str_20167);
            events.removeEventListener(CatalogWidgetEvent.TOGGLE, this._Str_19636);
            super.dispose();
        }

        private function _Str_19636(k:_Str_4201):void
        {
            if (k._Str_25555 == CatalogWidgetEnum.PURCHASE)
            {
                this._enabled = k.enabled;
                window.visible = this._enabled;
            }
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            if (this._catalog.catalogType == CatalogType.BUILDER)
            {
                _window.visible = false;
                return true;
            }
            _Str_2819(CatalogWidgetEnum.PURCHASE);
            _window.findChildByName("selection_information").visible = true;
            _window.findChildByName("default_buttons").visible = false;
            this._noGiftOption = false;
            if (window.tags.indexOf("ROOM_INITIATE_PURCHASE") > -1)
            {
                this._catalog._Str_24759();
            }
            _window.findChildByName("buy_button").addEventListener(WindowMouseEvent.CLICK, this._Str_8396);
            var k:IButtonWindow = (_window.findChildByName("gift_button") as IButtonWindow);
            if (window.tags.indexOf("NO_GIFT_OPTION") > -1)
            {
                this._noGiftOption = true;
                k.visible = false;
            }
            k.addEventListener(WindowMouseEvent.CLICK, this._Str_18825);
            k.disable();
            var _local_2:XmlAsset = (this._catalog.assets.getAssetByName("purchaseWidgetBuyVipStub") as XmlAsset);
            if (_local_2 != null)
            {
                this._stubPurchaseVipXML = (_local_2.content as XML);
            }
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_3115);
            events.addEventListener(CatalogWidgetEvent.SET_EXTRA_PARM, this._Str_19234);
            events.addEventListener(CatalogWidgetEvent.PURCHASE_OVERRIDE, this._Str_21783);
            events.addEventListener(CatalogWidgetEvent.INIT_PURCHASE, this._Str_25569);
            events.addEventListener(CatalogWidgetEvent.SET_PREVIEWER_STUFFDATA, this._Str_20167);
            events.addEventListener(CatalogWidgetSpinnerEvent.CWSE_VALUE_CHANGED, this._Str_25792);
            events.addEventListener(CatalogWidgetEvent.EXTRA_PARAM_REQUIRED_FOR_BUY, this._Str_22307);
            events.addEventListener(CatalogWidgetEvent.TOGGLE, this._Str_19636);
            return true;
        }

        private function _Str_21783(k:CatalogWidgetPurchaseOverrideEvent):void
        {
            this._purchaseCallback = k.callback;
        }

        private function _Str_24516(k:IPurchasableOffer):void
        {
            var _local_2:IWindowContainer;
            if (this._stub != null)
            {
                this._stub.visible = false;
                _window.removeChild(this._stub);
                this._stub.dispose();
                this._stub = null;
            }
        }

        private function get _Str_7923():Boolean
        {
            return !((this._extraParamRequired) && (this._additionalParameters == ""));
        }

        private function _Str_3115(k:SelectProductEvent):void
        {
            var _local_2:IWindow;
            var _local_3:Boolean;
            this._quantity = 1;
            this._offer = k.offer;
            _window.findChildByName("selection_information").visible = false;
            _window.findChildByName("default_buttons").visible = true;
            this._Str_24516(this._offer);
            this._catalog._Str_8986(false);
            if (this._stub == null)
            {
                this._Str_10113(this._Str_7923);
                this._Str_4401(this._Str_7923);
                _Str_11981._Str_21471(this._offer, _window.findChildByName("purchase_label"));
                _local_2 = _window.findChildByName("gift_button");
                if (_local_2 != null)
                {
                    _local_2.visible = ((!(this._offer.isRentOffer)) && (!(this._noGiftOption)));
                }
                if (!this._offer.giftable)
                {
                    this._Str_4401(false);
                }
                _local_3 = this._Str_24901(this._offer);
                if (_local_3)
                {
                    this._Str_10113(false);
                    this._Str_4401(false);
                }
                window.visible = this._enabled;
            }
            else
            {
                this._Str_10113(false);
                this._Str_4401(false);
            }
        }

        private function _Str_24901(k:IPurchasableOffer):Boolean
        {
            var _local_2:IProduct;
            var _local_3:Boolean;
            if (k != null)
            {
                if (k.pricingModel == Offer.PRICING_MODEL_SINGLE)
                {
                    _local_2 = this._offer.product;
                    if (((!(_local_2 == null)) && (_local_2.isUniqueLimitedItem)))
                    {
                        _local_3 = (_local_2.uniqueLimitedItemsLeft == 0);
                        return _local_3;
                    }
                }
            }
            return false;
        }

        private function _Str_10113(k:Boolean):void
        {
            if (this._catalog.sessionDataManager.isAccountSafetyLocked())
            {
                k = false;
            }
            this._Str_8735("buy_button", k);
        }

        private function _Str_4401(k:Boolean):void
        {
            if (this._catalog.sessionDataManager.isAccountSafetyLocked())
            {
                k = false;
            }
            this._Str_8735("gift_button", k);
        }

        private function _Str_8735(k:String, _arg_2:Boolean):void
        {
            if (_window == null)
            {
                return;
            }
            var _local_3:IWindow = _window.findChildByName(k);
            if (_local_3 == null)
            {
                return;
            }
            if (_arg_2)
            {
                _local_3.enable();
                _local_3.blend = 1;
            }
            else
            {
                _local_3.disable();
                _local_3.blend = 0.5;
            }
        }

        private function _Str_19234(k:SetExtraPurchaseParameterEvent):void
        {
            this._additionalParameters = k.parameter;
            this._Str_10113(this._Str_7923);
            this._Str_4401(((((!(this._offer == null)) && (this._offer.giftable)) && (this._Str_7923)) && (this._quantity == 1)));
        }

        private function _Str_8396(event:WindowMouseEvent, isGift:Boolean=false):void
        {
            if (!this._catalog._Str_10922(this._offer.clubLevel))
            {
                this._catalog.openClubCenter();
                return;
            }
            this._catalog._Str_8986(isGift);
            if (this._purchaseCallback == null)
            {
                if (this._offer != null)
                {
                    if (((!(this._catalog._Str_3064 == null)) && (this._catalog._Str_3064.offerId == this._offer.offerId)))
                    {
                        if (this._catalog._Str_3064.flatId == 0)
                        {
                            this._catalog.windowManager.alert("${roomad.error.title}", "${roomad.alert.no.available.room}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                            {
                                k.dispose();
                            });
                            return;
                        }
                        if ((((this._catalog._Str_3064.name == null) || (this._catalog._Str_3064.name.length < 5)) || (this._catalog._Str_3064.name.substr(0, 1) == " ")))
                        {
                            this._catalog.windowManager.alert("${roomad.error.title}", "${roomad.alert.name.empty}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                            {
                                k.dispose();
                            });
                            return;
                        }
                    }
                    this._catalog._Str_5649(this._offer, page.pageId, this._additionalParameters, this._quantity, this._previewStuffData, null, true, null);
                }
            }
            else
            {
                this._purchaseCallback(event);
            }
        }

        private function _Str_18825(k:WindowMouseEvent):void
        {
            this._Str_8396(k, true);
            HabboTracking.getInstance().trackEventLog("Catalog", "click", "client.buy_as_gift.clicked");
        }

        private function _Str_25569(k:CatalogWidgetInitPurchaseEvent):void
        {
            if (this._offer != null)
            {
                this._catalog._Str_5649(this._offer, page.pageId, this._additionalParameters, this._quantity, this._previewStuffData, null, true, null);
            }
        }

        private function _Str_25989(k:WindowMouseEvent):void
        {
            this._catalog._Str_24636(page.pageId);
            this._catalog.openClubCenter();
            HabboTracking.getInstance().trackEventLog("Catalog", "click", "BUY_CLUB");
        }

        private function _Str_20167(k:SetRoomPreviewerStuffDataEvent):void
        {
            this._previewStuffData = k.stuffData;
        }

        private function _Str_25792(k:CatalogWidgetSpinnerEvent):void
        {
            this._quantity = k.value;
            if (this._quantity > 1)
            {
                this._Str_4401(false);
            }
            else
            {
                if (((!(this._offer == null)) && (this._Str_7923)))
                {
                    this._Str_4401(this._offer.giftable);
                }
            }
        }

        private function _Str_22307(k:_Str_3308):void
        {
            this._extraParamRequired = true;
            this._Str_10113(this._Str_7923);
            this._Str_4401((((!(this._offer == null)) && (this._Str_7923)) && (this._quantity == 1)));
        }
    }
}
