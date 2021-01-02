package com.sulake.habbo.catalog.targetedoffers
{
    import com.sulake.habbo.session.product.IProductDataListener;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.catalog.targetedoffers.util.MallOfferExternalInterfaceHelper;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.communication.messages.incoming.catalog.TargetedOfferEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.TargetedOfferNotFoundEvent;
    import com.sulake.habbo.catalog.purse.PurseUpdateEvent;
    import com.sulake.habbo.communication.messages.outgoing.catalog.GetNextTargetedOfferComposer;
    import com.sulake.habbo.communication.messages.parser.catalog.TargetedOfferParser;
    import com.sulake.habbo.catalog.targetedoffers.data.TargetedOffer;
    import com.sulake.habbo.communication.enum.TargetedOfferTrackingStateEnum;
    import com.sulake.habbo.catalog.targetedoffers.data.HabboMallOffer;
    import com.sulake.habbo.communication.messages.outgoing.catalog.ShopTargetedOfferViewedComposer;
    import com.sulake.habbo.communication.messages.outgoing.catalog.SetTargetedOfferStateComposer;
    import com.sulake.habbo.communication.messages.outgoing.catalog.PurchaseTargetedOfferComposer;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.catalog.targetedoffers.util.EventLogActions;
    import com.sulake.habbo.toolbar.ToolbarDisplayExtensionIds;
    import com.sulake.habbo.toolbar.ExtensionFixedSlotsEnum;
    import com.sulake.core.window.IWindow;

    public class OfferController implements IProductDataListener 
    {
        private var _offerDialog:TargetedOfferDialogView;
        private var _mallOfferDialog:MallOfferDialogView;
        private var _extension:IDisposable;
        private var _confirmation:TargetedOfferPurchaseConfirmationView;
        private var _externalInterfaceHelper:MallOfferExternalInterfaceHelper;
        private var _catalog:HabboCatalog;
        private var _disposed:Boolean;

        public function OfferController(k:HabboCatalog)
        {
            this._catalog = k;
            this._catalog.connection.addMessageEvent(new TargetedOfferEvent(this._Str_25111));
            this._catalog.connection.addMessageEvent(new TargetedOfferNotFoundEvent(this.onTargetedOfferNotFound));
            this._catalog.events.addEventListener(PurseUpdateEvent.CATALOG_PURSE_UPDATE, this.onPurseUpdate);
            this._catalog.sessionDataManager.addProductsReadyEventListener(this);
        }

        public function get catalog():HabboCatalog
        {
            return this._catalog;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            this._Str_6602();
            if (this._externalInterfaceHelper)
            {
                this._externalInterfaceHelper.dispose();
                this._externalInterfaceHelper = null;
            }
        }

        public function productDataReady():void
        {
            this._catalog.connection.send(new GetNextTargetedOfferComposer());
        }

        private function _Str_25111(k:TargetedOfferEvent):void
        {
            var _local_2:TargetedOfferParser = k.getParser();
            var _local_3:TargetedOffer = new TargetedOffer(_local_2.data);
            if (_local_3._Str_11180 == TargetedOfferTrackingStateEnum.MINIMIZED)
            {
                this.minimizeOffer(_local_3);
            }
            else
            {
                this.maximizeOffer(_local_3);
            }
        }

        private function onTargetedOfferNotFound(k:TargetedOfferNotFoundEvent):void
        {
            this._externalInterfaceHelper = new MallOfferExternalInterfaceHelper(this);
        }

        public function _Str_22982(k:HabboMallOffer):void
        {
            if (k._Str_11180 == TargetedOfferTrackingStateEnum.REJECTED)
            {
                return;
            }
            switch (k._Str_11180)
            {
                case 0:
                case TargetedOfferTrackingStateEnum.PREVIEWED:
                case TargetedOfferTrackingStateEnum.SELECTED:
                    this.maximizeMallOffer(k);
                    return;
                case TargetedOfferTrackingStateEnum.REJECTED:
                    return;
                default:
                    this.minimizeMallOffer(k);
            }
        }

        public function maximizeMallOffer(k:HabboMallOffer):void
        {
            if (this._mallOfferDialog)
            {
                return;
            }
            this._Str_6602();
            this._mallOfferDialog = new MallOfferDialogView(this, k);
            this._catalog.connection.send(new ShopTargetedOfferViewedComposer(k.targetedOfferId, TargetedOfferTrackingStateEnum.PREVIEWED));
        }

        public function minimizeMallOffer(k:HabboMallOffer, _arg_2:Boolean=false):void
        {
            this._Str_6602();
            this._extension = new MallOfferMinimizedView(this, k);
        }

        public function onHabboMallOfferOpened(k:HabboMallOffer):void
        {
            this._catalog.connection.send(new ShopTargetedOfferViewedComposer(k.targetedOfferId, TargetedOfferTrackingStateEnum.OFFERED));
            this._catalog.openCreditsHabblet();
            this.minimizeMallOffer(k);
        }

        public function onHabboMallOfferClosed(k:HabboMallOffer):void
        {
            this._catalog.connection.send(new ShopTargetedOfferViewedComposer(k.targetedOfferId, TargetedOfferTrackingStateEnum.MINIMIZED));
            this.minimizeMallOffer(k);
        }

        public function minimizeOffer(k:TargetedOffer):void
        {
            this._Str_6602();
            this._extension = new TargetedOfferMinimizedView(this, k);
            this._catalog.connection.send(new SetTargetedOfferStateComposer(k.id, TargetedOfferTrackingStateEnum.MINIMIZED));
        }

        public function maximizeOffer(k:TargetedOffer):void
        {
            var _local_2:String;
            if (this._offerDialog)
            {
                return;
            }
            this._Str_6602();
            if (!k.isExpired())
            {
                _local_2 = this._Str_24354(k);
                this._offerDialog = new TargetedOfferDialogView(this, k);
                if ((((!(_local_2 == null)) && (_local_2.length > 0)) && (this._catalog.assets.hasAsset(_local_2))))
                {
                    this._offerDialog._Str_6297(_local_2);
                }
                else
                {
                    this._offerDialog._Str_6297("targeted_offer_dialog_xml");
                }
                this._catalog.connection.send(new SetTargetedOfferStateComposer(k.id, TargetedOfferTrackingStateEnum.OFFERED));
            }
        }

        public function purchaseTargetedOffer(k:TargetedOffer, _arg_2:int):void
        {
            this._catalog.connection.send(new PurchaseTargetedOfferComposer(k.id, _arg_2));
            k._Str_24338(_arg_2);
            if (k.purchaseLimit > 0)
            {
                this.minimizeOffer(k);
            }
            else
            {
                this._Str_6602();
            }
        }

        public function sendLogEvent(k:String, _arg_2:String=""):void
        {
            if (((!(this._catalog)) || (!(this._catalog.connection))))
            {
                return;
            }
            this._catalog.connection.send(new EventLogMessageComposer("TargetedOffers", "FLASH.UNKNOWN", k, _arg_2));
        }

        public function purchaseCredits(k:TargetedOffer):void
        {
            this.sendLogEvent(EventLogActions.TARGETED_OFFER_OPEN_CREDITS_PAGE_CLICKED, k.identifier);
            this._catalog.openCreditsHabblet();
        }

        public function attachExtension(k:IWindow):void
        {
            this._catalog.toolbar.extensionView.attachExtension(ToolbarDisplayExtensionIds.TARGETED_OFFER, k, ExtensionFixedSlotsEnum._Str_16348);
        }

        public function showConfirmation(k:TargetedOffer, _arg_2:int):void
        {
            if (this._confirmation)
            {
                return;
            }
            this._Str_6602();
            this._confirmation = new TargetedOfferPurchaseConfirmationView(this, k, _arg_2);
        }

        private function onPurseUpdate(k:PurseUpdateEvent):void
        {
            if (this._offerDialog)
            {
                this._offerDialog._Str_18148();
            }
        }

        public function _Str_6602():void
        {
            if (this._offerDialog)
            {
                this._offerDialog.dispose();
                this._offerDialog = null;
            }
            if (this._mallOfferDialog)
            {
                this._mallOfferDialog.dispose();
                this._mallOfferDialog = null;
            }
            if (this._extension)
            {
                this._catalog.toolbar.extensionView.detachExtension(ToolbarDisplayExtensionIds.TARGETED_OFFER);
                this._extension.dispose();
                this._extension = null;
            }
            if (this._confirmation)
            {
                this._confirmation.dispose();
                this._confirmation = null;
            }
        }

        private function _Str_24354(k:TargetedOffer):String
        {
            return this._catalog.getProperty(("targeted.offer.override.layout." + k.id));
        }
    }
}
