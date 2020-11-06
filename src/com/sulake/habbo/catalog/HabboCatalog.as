package com.sulake.habbo.catalog
{
	import com.sulake.habbo.catalog.purchase.FireworksChargeConfirmationDialog;
    import com.sulake.core.runtime.Component;
	import com.sulake.habbo.communication.messages.incoming.catalog.FireworkChargeDataEvent;
	import com.sulake.habbo.communication.messages.incoming.catalog.FireworkChargeDataParser;
    import com.sulake.habbo.session.product.IProductDataListener;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.session.furniture.IFurniDataListener;
    import flash.geom.Point;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.inventory.IHabboInventory;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.sound.IHabboSoundManager;
    import com.sulake.habbo.friendlist.IHabboFriendsList;
    import com.sulake.habbo.navigator.IHabboNewNavigator;
    import com.sulake.habbo.avatar.IHabboAvatarEditor;
    import com.sulake.habbo.quest.IHabboQuestEngine;
    import com.sulake.habbo.catalog.viewer.CatalogViewer;
    import flash.utils.Dictionary;
    import com.sulake.habbo.catalog.purse.Purse;
    import com.sulake.habbo.catalog.recycler.RecyclerLogic;
    import com.sulake.habbo.catalog.marketplace.IMarketPlace;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.purchase.PurchaseConfirmationDialog;
    import com.sulake.habbo.catalog.purchase.GiftWrappingConfiguration;
    import com.sulake.habbo.catalog.club.ClubGiftController;
    import com.sulake.habbo.catalog.club.ClubOfferHandler;
    import com.sulake.habbo.catalog.club.ClubExtendController;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.catalog.viewer._Str_4431;
    import com.sulake.habbo.catalog.purchase.PlacedObjectPurchaseData;
    import com.sulake.habbo.room.preview.RoomPreviewer;
    import com.sulake.habbo.catalog.guilds.GuildMembershipsController;
    import com.sulake.habbo.catalog.targetedoffers.OfferController;
    import com.sulake.habbo.communication.messages.incoming.catalog.BundleDiscountRuleset;
    import com.sulake.habbo.catalog.navigation.RequestedPage;
    import com.sulake.habbo.catalog.purchase.RoomAdPurchaseData;
    import com.sulake.habbo.catalog.purchase.RentConfirmationWindow;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.communication.messages.incoming.catalog.FrontPageItem;
    import flash.utils.Timer;
    import com.sulake.habbo.catalog.offers.OfferCenter;
    import com.sulake.habbo.catalog.clubcenter.HabboClubCenter;
    import com.sulake.iid.IIDHabboClubCenter;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.IDisplayObjectWrapper;
    import flash.display.BitmapData;
    import flash.display.Bitmap;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.navigator.IHabboNavigator;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboInventory;
    import com.sulake.habbo.inventory.events.HabboInventoryItemAddedEvent;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboSoundManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.iid.IIDHabboNewNavigator;
    import com.sulake.iid.IIDHabboFriendBar;
    import com.sulake.habbo.friendbar.events.FriendBarSelectionEvent;
    import com.sulake.iid.IIDHabboGroupsManager;
    import com.sulake.habbo.groups.events.GuildSettingsChangedInManageEvent;
    import com.sulake.iid.IIDHabboAvatarEditor;
    import com.sulake.iid.IIDHabboQuestEngine;
    import com.sulake.habbo.communication.messages.incoming.users.ApproveNameMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.PurchaseOKMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications.HabboActivityPointNotificationMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.VoucherRedeemOkMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.recycler.RecyclerFinishedEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.GiftReceiverNotFoundEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.LimitedEditionSoldOutEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.PurchaseNotAllowedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.PurchaseErrorMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.BundleDiscountRulesetMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPagesListEvent;
    import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOffersEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceConfigurationEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.SellablePetPalettesMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOwnOffersEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.BuildersClubSubscriptionStatusMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceBuyOfferResultEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications.ActivityPointsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPublishedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.CreditBalanceEvent;
    import com.sulake.habbo.communication.messages.incoming.users.GuildMembershipsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.ClubGiftInfoEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.HabboClubOffersMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.ScrSendUserInfoEvent;
    import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceMakeOfferResult;
    import com.sulake.habbo.communication.messages.incoming.catalog.ProductOfferEvent;
    import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceCancelOfferResultEvent;
    import com.sulake.habbo.communication.messages.incoming.recycler.RecyclerStatusEvent;
    import com.sulake.habbo.communication.messages.incoming.recycler.RecyclerPrizesEvent;
    import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceItemStatsEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.NotEnoughBalanceMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.HabboClubExtendOfferMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.BuildersClubFurniCountMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.VoucherRedeemErrorMessageEvent;
    import com.sulake.habbo.catalog.event.CatalogEvent;
    import com.sulake.habbo.communication.messages.outgoing.catalog.BuildersClubQueryFurniCountMessageComposer;
    import com.sulake.habbo.catalog.navigation.ICatalogNavigator;
    import com.sulake.core.Core;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.catalog.GetCatalogPageComposer;
    import com.sulake.habbo.catalog.navigation.ICatalogNode;
    import com.sulake.habbo.catalog.enum.CatalogType;
    import com.sulake.habbo.communication.messages.outgoing.catalog.PurchaseFromCatalogComposer;
    import com.sulake.habbo.communication.messages.outgoing.catalog.PurchaseRoomAdMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.catalog.PurchaseVipMembershipExtensionComposer;
    import com.sulake.habbo.communication.messages.outgoing.catalog.PurchaseBasicMembershipExtensionComposer;
    import com.sulake.habbo.communication.messages.outgoing.catalog.PurchaseFromCatalogAsGiftComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.ApproveNameMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.recycler.GetRecyclerStatusMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.recycler.GetRecyclerPrizesMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.recycler.RecycleItemsMessageComposer;
    import com.sulake.habbo.catalog.navigation.CatalogNavigator;
    import com.sulake.habbo.catalog.viewer.Offer;
    import com.sulake.habbo.catalog.club.ClubBuyOfferData;
    import com.sulake.habbo.catalog.enum.CatalogPageName;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habboclient.ExternalVariables;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.habbo.catalog.purse.IPurse;
    import com.sulake.habbo.catalog.recycler.IRecycler;
    import com.sulake.habbo.communication.messages.outgoing.marketplace.GetMarketplaceOffersMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.catalog.GetRoomAdPurchaseInfoComposer;
    import com.sulake.habbo.communication.messages.outgoing.catalog.RoomAdPurchaseInitiatedComposer;
    import com.sulake.habbo.communication.messages.outgoing.marketplace.GetMarketplaceOwnOffersMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.marketplace.BuyMarketplaceOfferMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.marketplace.RedeemMarketplaceOfferCreditsMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.marketplace.CancelMarketplaceOfferMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.marketplace.GetMarketplaceItemStatsComposer;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.communication.messages.outgoing.catalog.GetSellablePetPalettesComposer;
    import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
    import com.sulake.habbo.window.enum._Str_8057;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.utils._Str_3942;
    import com.sulake.habbo.tracking.HabboTracking;
    import flash.events.Event;
    import com.sulake.habbo.catalog.enum.HabboCatalogTrackingEvent;
    import com.sulake.habbo.communication.messages.outgoing.catalog.GetCatalogIndexComposer;
    import com.sulake.habbo.communication.messages.outgoing.catalog.MarkCatalogNewAdditionsPageOpenedComposer;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import flash.events.TimerEvent;
    import flash.ui.Keyboard;
    import com.sulake.habbo.catalog.viewer.PageLocalization;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetRoomChangedEvent;
    import com.sulake.habbo.catalog.marketplace.MarketPlaceLogic;
    import com.sulake.habbo.communication.messages.outgoing.catalog.GetGiftWrappingConfigurationComposer;
    import com.sulake.habbo.communication.messages.outgoing.catalog.GetClubOffersMessageComposer;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
    import com.sulake.habbo.communication.messages.parser.catalog.CatalogPageMessageParser;
    import com.sulake.habbo.catalog.viewer.IPageLocalization;
    import com.sulake.habbo.catalog.viewer.Product;
    import com.sulake.habbo.communication.messages.parser.catalog.PurchaseErrorMessageParser;
    import com.sulake.habbo.communication.messages.parser.catalog.PurchaseNotAllowedMessageParser;
    import com.sulake.habbo.communication.messages.parser.catalog.PurchaseOKMessageParser;
    import com.sulake.habbo.catalog.navigation.events.CatalogFurniPurchaseEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.NotEnoughBalanceMessageParser;
    import com.sulake.habbo.communication.messages.parser.users.ApproveNameMessageParser;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetApproveNameResultEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.purse.CreditBalanceParser;
    import com.sulake.habbo.sound.HabboSoundTypesEnum;
    import com.sulake.habbo.catalog.purse.PurseEvent;
    import com.sulake.habbo.catalog.purse.PurseUpdateEvent;
    import com.sulake.habbo.communication.messages.parser.users.ScrSendUserInfoMessageParser;
    import flash.external.ExternalInterface;
    import com.sulake.habbo.communication.messages.parser.catalog.ClubGiftInfoParser;
    import com.sulake.habbo.communication.messages.parser.recycler.RecyclerStatusMessageParser;
    import com.sulake.habbo.communication.messages.parser.recycler.RecyclerFinishedMessageParser;
    import com.sulake.habbo.communication.messages.parser.recycler.RecyclerPrizesMessageParser;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceItemStatsParser;
    import com.sulake.habbo.catalog.marketplace.MarketplaceItemStats;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceConfigurationMessageParser;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceMakeOfferResultParser;
    import com.sulake.habbo.communication.messages.parser.catalog.HabboClubOffersMessageParser;
    import com.sulake.habbo.catalog.enum.ClubOfferRequestSource;
    import com.sulake.habbo.communication.messages.parser.catalog.SellablePetPalettesParser;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSellablePetPalettesEvent;
    import com.sulake.habbo.window.utils.IAlertDialog;
    import com.sulake.habbo.window.utils.IConfirmDialog;
    import com.sulake.habbo.communication.messages.outgoing.catalog.RedeemVoucherMessageComposer;
    import com.sulake.habbo.catalog.enum.BuilderFurniPlaceableStatus;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.enum.RoomObjectPlacementSource;
    import com.sulake.habbo.catalog.event.CatalogUserEvent;
    import com.sulake.habbo.room.events.RoomEngineObjectPlacedOnUserEvent;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.object.data.LegacyStuffData;
    import com.sulake.habbo.communication.messages.outgoing.catalog.BuildersClubPlaceRoomItemMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.catalog.BuildersClubPlaceWallItemMessageComposer;
    import com.sulake.habbo.room.events.RoomEngineObjectPlacedEvent;
    import com.sulake.habbo.communication.messages.outgoing.inventory.furni.RequestRoomPropertySet;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.habbo.communication.messages.outgoing.room.engine.PlaceObjectMessageComposer;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.core.window.components.IDesktopWindow;
    import flash.utils.getTimer;
    import com.sulake.habbo.communication.messages.outgoing.catalog.GetIsOfferGiftableComposer;
    import com.sulake.habbo.communication.messages.outgoing.catalog.GetBundleDiscountRulesetComposer;
    import com.sulake.habbo.communication.messages.outgoing.catalog.GetProductOfferComposer;
    import com.sulake.habbo.communication.messages.parser.catalog.BundleDiscountRulesetMessageParser;
    import com.sulake.habbo.communication.messages.parser.catalog.ProductOfferMessageParser;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.BuildersClubSubscriptionStatusMessageParser;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetBuilderSubscriptionUpdatedEvent;
    import com.sulake.habbo.utils.FriendlyTime;
    import com.sulake.habbo.catalog.viewer.ICatalogPage;
    import com.sulake.habbo.utils._Str_6093;
    import com.sulake.habbo.catalog.offers.IOfferExtension;
    import com.sulake.habbo.catalog.offers.IOfferCenter;
    import __AS3__.vec.*;
    import com.sulake.iid.*;

    public class HabboCatalog extends Component implements IHabboCatalog, IProductDataListener, IUpdateReceiver, ILinkEventTracker, IFurniDataListener 
    {
        private static const DESKTOP_WINDOW_LAYER:uint = 1;
        private static const DEFAULT_VIEW_LOCATION:Point = new Point(100, 20);
        private static const DEFAULT_VIEW_LOCATION_LARGE:Point = new Point(100, 5);
        private static const MAX_SEARCH_RESULTS_LENGTH:uint = 200;
        private static const NO_KNOWN_OFFER:int = -1;

        private var _windowManager:IHabboWindowManager;
        private var _communicationManager:IHabboCommunicationManager;
        private var _toolbar:IHabboToolbar;
        private var _roomEngine:IRoomEngine;
        private var _roomSessionManager:IRoomSessionManager;
        private var _roomSession:IRoomSession;
        private var _localization:IHabboLocalizationManager;
        private var _inventory:IHabboInventory;
        private var _sessionDataManager:ISessionDataManager;
        private var _avatarRenderManager:IAvatarRenderManager;
        private var _soundManager:IHabboSoundManager;
        private var _friendsList:IHabboFriendsList;
        private var _newNavigator:IHabboNewNavigator;
        private var _avatarEditor:IHabboAvatarEditor;
        private var _questEngine:IHabboQuestEngine;
        private var _videoOfferManager:VideoOfferManager;
        private var _initialized:Boolean = false;
        private var _productDataReady:Boolean = false;
        private var _catalogViewer:CatalogViewer;
        private var _catalogNavigators:Dictionary;
        private var _purse:Purse;
        private var _recyclerLogic:RecyclerLogic;
        private var _marketplace:IMarketPlace;
        private var _mainContainer:IWindowContainer;
        private var _purchaseConfirmationDialog:PurchaseConfirmationDialog;
        private var _giftReceiver:String;
        private var _skipToGifting:Boolean;
        private var _firstBalanceCredits:Boolean = true;
        private var _privateRoomSessionActive:Boolean = false;
        private var _giftWrappingConfiguration:GiftWrappingConfiguration;
        private var _clubGiftController:ClubGiftController;
        private var _clubOfferHandler:ClubOfferHandler;
        private var _clubExtendController:ClubExtendController;
        private var _sellablePetPalettes:Map;
        private var _isObjectMoverRequested:Boolean = false;
        private var _purchasableOffer:IPurchasableOffer;
        private var _Str_8970:_Str_4431;
        private var _placedObjectPurchaseData:PlacedObjectPurchaseData;
        private var _Str_7793:Boolean;
        private var _Str_19190:Boolean;
        private var _roomPreviewer:RoomPreviewer;
        private var _guildMembershipsController:GuildMembershipsController;
        private var _offerController:OfferController;
        private var _utils:HabboCatalogUtils;
        private var _doNotCloseAfterVipPurchase:Boolean = false;
        private var _pageToOpenAfterVipPurchase:String = null;
        private var _bundleDiscountRuleset:BundleDiscountRuleset = null;
        private var _requestedPage:RequestedPage;
        private var _pageId:int;
        private var _roomAdPurchaseData:RoomAdPurchaseData;
        private var _rentConfirmationWindow:RentConfirmationWindow;
        private var _messageEvents:Vector.<IMessageEvent>;
        private var _catalogType:String = "NORMAL";
        private var _furnitureData:Vector.<IFurnitureData>;
        private var _frontPageItems:Vector.<FrontPageItem>;
        private var _keyUpSearchTimer:Timer;
        private var _pagesVisibleInBuilderMode:Dictionary;
        private var _placeMultipleObjects:Boolean;
        private var _builderFurniCount:int = -1;
        private var _builderFurniLimit:int;
        private var _builderMaxFurniLimit:int;
        private var _builderMembershipSecondsLeft:int;
        private var _builderMembershipSecondsLeftWithGrace:int;
        private var _builderMembershipUpdateTime:int;
        private var _builderMembershipDisplayUpdateTime:int;
        private var _builderMembershipActiveSoFar:Boolean;
        private var _builderMembershipActiveWithGrace:Boolean;
        private var _offerCenter:OfferCenter;
		private var _fireworkChargeDialog:FireworksChargeConfirmationDialog;

        public function HabboCatalog(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            this._sellablePetPalettes = new Map();
            super(k, _arg_2, _arg_3);
            this._purse = new Purse();
            this._utils = new HabboCatalogUtils(this);
            registerUpdateReceiver(this, 1);
            this._requestedPage = new RequestedPage();
            k.attachComponent(new HabboClubCenter(k, 0, _arg_3), [new IIDHabboClubCenter()]);
        }

        public static function setElementImageCentered(k:IWindow, _arg_2:BitmapData, _arg_3:int=0):void
        {
            var _local_7:IBitmapWrapperWindow;
            var _local_8:IDisplayObjectWrapper;
            if (_arg_2 == null)
            {
                return;
            }
            if (k == null)
            {
                return;
            }
            if (k.disposed)
            {
                return;
            }
            var _local_4:int = ((_arg_3 > 0) ? _arg_3 : k.height);
            var _local_5:int = ((k.width - _arg_2.width) / 2);
            var _local_6:int = ((_local_4 - _arg_2.height) / 2);
            if ((k as IBitmapWrapperWindow) != null)
            {
                _local_7 = IBitmapWrapperWindow(k);
                if (((_local_7.bitmap == null) || (_arg_3 > 0)))
                {
                    _local_7.bitmap = new BitmapData(k.width, _local_4, true, 0xFFFFFF);
                }
                _local_7.bitmap.fillRect(_local_7.bitmap.rect, 0xFFFFFF);
                _local_7.bitmap.copyPixels(_arg_2, _arg_2.rect, new Point(_local_5, _local_6), null, null, false);
                k.invalidate();
            }
            else
            {
                if ((k as IDisplayObjectWrapper) != null)
                {
                    _local_8 = IDisplayObjectWrapper(k);
                    _local_8.setDisplayObject(new Bitmap(_arg_2));
                    k.invalidate();
                }
            }
        }


        public function get sessionDataManager():ISessionDataManager
        {
            return this._sessionDataManager;
        }

        public function get avatarRenderManager():IAvatarRenderManager
        {
            return this._avatarRenderManager;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localization;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get connection():IConnection
        {
            return this._communicationManager.connection;
        }

        public function get toolbar():IHabboToolbar
        {
            return this._toolbar;
        }

        public function get giftWrappingConfiguration():GiftWrappingConfiguration
        {
            return this._giftWrappingConfiguration;
        }

        public function get roomEngine():IRoomEngine
        {
            return this._roomEngine;
        }

        public function get soundManager():IHabboSoundManager
        {
            return this._soundManager;
        }

        public function get roomPreviewer():RoomPreviewer
        {
            if (this._roomPreviewer == null)
            {
                this.initializeRoomPreviewer();
            }
            return this._roomPreviewer;
        }

        public function get navigator():IHabboNavigator
        {
            return this._newNavigator.legacyNavigator;
        }

        public function get utils():HabboCatalogUtils
        {
            return this._utils;
        }

        public function get questEngine():IHabboQuestEngine
        {
            return this._questEngine;
        }

        public function get videoOffers():IVideoOfferManager
        {
            return this._videoOfferManager;
        }

        public function get frontPageItems():Vector.<FrontPageItem>
        {
            return this._frontPageItems;
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            }), new ComponentDependency(new IIDHabboToolbar(), function (k:IHabboToolbar):void
            {
                _toolbar = k;
            }, false, [{
                "type":HabboToolbarEvent.HTE_TOOLBAR_CLICK,
                "callback":this.onHabboToolbarEvent
            }]), new ComponentDependency(new IIDRoomEngine(), function (k:IRoomEngine):void
            {
                _roomEngine = k;
            }, false, [{
                "type":RoomEngineObjectEvent.PLACED,
                "callback":this.onObjectPlacedInRoom
            }, {
                "type":RoomEngineObjectEvent.PLACED_ON_USER,
                "callback":this.onObjectPlaceOnUser
            }, {
                "type":RoomEngineObjectEvent.SELECTED,
                "callback":this.onObjectSelected
            }]), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localization = k;
            }, false), new ComponentDependency(new IIDHabboInventory(), function (k:IHabboInventory):void
            {
                _inventory = k;
            }, false, [{
                "type":HabboInventoryItemAddedEvent.HABBO_INVENTORY_ITEM_ADDED,
                "callback":this.onItemAddedToInventory
            }]), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }), new ComponentDependency(new IIDAvatarRenderManager(), function (k:IAvatarRenderManager):void
            {
                _avatarRenderManager = k;
            }, false), new ComponentDependency(new IIDHabboSoundManager(), function (k:IHabboSoundManager):void
            {
                _soundManager = k;
            }, false), new ComponentDependency(new IIDHabboRoomSessionManager(), function (k:IRoomSessionManager):void
            {
                _roomSessionManager = k;
            }, false, [{
                "type":RoomSessionEvent.STARTED,
                "callback":this.onRoomSessionEvent
            }, {
                "type":RoomSessionEvent.ENDED,
                "callback":this.onRoomSessionEvent
            }]), new ComponentDependency(new IIDHabboFriendList(), function (k:IHabboFriendsList):void
            {
                _friendsList = k;
            }, false), new ComponentDependency(new IIDHabboNewNavigator(), function (k:IHabboNewNavigator):void
            {
                _newNavigator = k;
            }, false), new ComponentDependency(new IIDHabboFriendBar(), null, false, [{
                "type":FriendBarSelectionEvent.FBVE_FRIEND_SELECTED,
                "callback":this.onFriendBarSelectionEvent
            }]), new ComponentDependency(new IIDHabboGroupsManager(), null, false, [{
                "type":GuildSettingsChangedInManageEvent.GSCIME_GUILD_VISUAL_SETTINGS_CHANGED,
                "callback":this.onGuildVisualSettingsChanged
            }]), new ComponentDependency(new IIDHabboAvatarEditor(), function (k:IHabboAvatarEditor):void
            {
                _avatarEditor = k;
            }, false), new ComponentDependency(new IIDHabboQuestEngine(), function (k:IHabboQuestEngine):void
            {
                _questEngine = k;
            }, false)]));
        }

        override protected function initComponent():void
        {
            this._messageEvents = new Vector.<IMessageEvent>(0);
            this.addMessageEvent(new ApproveNameMessageEvent(this.onApproveNameResult));
            this.addMessageEvent(new PurchaseOKMessageEvent(this.onPurchaseOK));
            this.addMessageEvent(new HabboActivityPointNotificationMessageEvent(this.onActivityPointNotification));
            this.addMessageEvent(new VoucherRedeemOkMessageEvent(this.onVoucherRedeemOk));
            this.addMessageEvent(new RecyclerFinishedEvent(this.onRecyclerFinished));
            this.addMessageEvent(new GiftReceiverNotFoundEvent(this.onGiftReceiverNotFound));
            this.addMessageEvent(new LimitedEditionSoldOutEvent(this.onLimitedEditionSoldOut));
            this.addMessageEvent(new PurchaseNotAllowedMessageEvent(this.onPurchaseNotAllowed));
            this.addMessageEvent(new GiftWrappingConfigurationEvent(this.onGiftWrappingConfiguration));
            this.addMessageEvent(new PurchaseErrorMessageEvent(this.onPurchaseError));
            this.addMessageEvent(new BundleDiscountRulesetMessageEvent(this.onBundleDiscountRulesetMessageEvent));
            this.addMessageEvent(new CatalogPagesListEvent(this.onCatalogIndex));
            this.addMessageEvent(new MarketPlaceOffersEvent(this.onMarketPlaceOffers));
            this.addMessageEvent(new CatalogPageMessageEvent(this.onCatalogPage));
            this.addMessageEvent(new MarketplaceConfigurationEvent(this.onMarketplaceConfiguration));
            this.addMessageEvent(new CloseConnectionMessageEvent(this.onRoomExit));
            this.addMessageEvent(new SellablePetPalettesMessageEvent(this.onSellablePalettes));
            this.addMessageEvent(new MarketPlaceOwnOffersEvent(this.onMarketPlaceOwnOffers));
            this.addMessageEvent(new BuildersClubSubscriptionStatusMessageEvent(this.onBuildersClubSubscriptionStatus));
            this.addMessageEvent(new MarketplaceBuyOfferResultEvent(this.onMarketPlaceBuyResult));
            this.addMessageEvent(new ActivityPointsMessageEvent(this.onActivityPoints));
            this.addMessageEvent(new CatalogPublishedMessageEvent(this.onCatalogPublished));
            this.addMessageEvent(new CreditBalanceEvent(this.onCreditBalance));
            this.addMessageEvent(new GuildMembershipsMessageEvent(this.onGuildMemberships));
            this.addMessageEvent(new ClubGiftInfoEvent(this.onClubGiftInfo));
            this.addMessageEvent(new HabboClubOffersMessageEvent(this.onHabboClubOffers));
            this.addMessageEvent(new ScrSendUserInfoEvent(this.onSubscriptionInfo));
            this.addMessageEvent(new MarketplaceMakeOfferResult(this.onMarketplaceMakeOfferResult));
            this.addMessageEvent(new ProductOfferEvent(this.onProductOffer));
            this.addMessageEvent(new MarketplaceCancelOfferResultEvent(this.onMarketPlaceCancelResult));
            this.addMessageEvent(new RecyclerStatusEvent(this._Str_24950));
            this.addMessageEvent(new RecyclerPrizesEvent(this._Str_23749));
            this.addMessageEvent(new MarketplaceItemStatsEvent(this.onMarketplaceItemStats));
            this.addMessageEvent(new NotEnoughBalanceMessageEvent(this.onNotEnoughBalance));
            this.addMessageEvent(new HabboClubExtendOfferMessageEvent(this.onHabboClubExtendOffer));
            this.addMessageEvent(new BuildersClubFurniCountMessageEvent(this.onBuildersClubFurniCount));
            this.addMessageEvent(new VoucherRedeemErrorMessageEvent(this.onVoucherRedeemError));
			this.addMessageEvent(new FireworkChargeDataEvent(this.onFireworkChargeHandler));
            context.addLinkEventTracker(this);
            this._sessionDataManager.loadProductData(this);
            this._Str_19190 = this.isNewItemsNotificationEnabled();
            this._videoOfferManager = new VideoOfferManager(this);
            this._offerController = new OfferController(this);
            this._furnitureData = this._sessionDataManager.getFurniData(this);
            this._pagesVisibleInBuilderMode = null;
        }

        private function addMessageEvent(k:IMessageEvent):void
        {
            this._messageEvents.push(this._communicationManager.addHabboConnectionMessageEvent(k));
        }

        override public function dispose():void
        {
            var k:IMessageEvent;
            if (disposed)
            {
                return;
            }
            removeUpdateReceiver(this);
            if (((!(this._messageEvents == null)) && (!(this._communicationManager == null))))
            {
                for each (k in this._messageEvents)
                {
                    this._communicationManager.removeHabboConnectionMessageEvent(k);
                }
            }
            if (this._videoOfferManager)
            {
                this._videoOfferManager.dispose();
                this._videoOfferManager = null;
            }
            if (this._offerCenter != null)
            {
                this._offerCenter.dispose();
                this._offerCenter = null;
            }
            this.reset(true);
            context.removeLinkEventTracker(this);
            if (this._purchaseConfirmationDialog != null)
            {
                this._purchaseConfirmationDialog.dispose();
                this._purchaseConfirmationDialog = null;
            }
            if (this._recyclerLogic != null)
            {
                this._recyclerLogic.dispose();
                this._recyclerLogic = null;
            }
            this._purse = null;
            this._marketplace = null;
            if (this._clubOfferHandler != null)
            {
                this._clubOfferHandler.dispose();
                this._clubOfferHandler = null;
            }
            if (this._clubExtendController != null)
            {
                this._clubExtendController.dispose();
                this._clubExtendController = null;
            }
            if (this._sellablePetPalettes != null)
            {
                this._sellablePetPalettes.dispose();
                this._sellablePetPalettes = null;
            }
            this._roomSession = null;
            if (this._rentConfirmationWindow != null)
            {
                this._rentConfirmationWindow.dispose();
                this._rentConfirmationWindow = null;
            }
            this.resetPlacedOfferData();
            this._isObjectMoverRequested = false;
            this._Str_8970 = null;
            if (this._roomPreviewer != null)
            {
                this._roomPreviewer.dispose();
                this._roomPreviewer = null;
            }
            if (this._guildMembershipsController != null)
            {
                this._guildMembershipsController.dispose();
                this._guildMembershipsController = null;
            }
            if (this._utils != null)
            {
                this._utils.dispose();
                this._utils = null;
            }
            if (this._requestedPage)
            {
                this._requestedPage = null;
            }
            if (this._offerController)
            {
                this._offerController.dispose();
                this._offerController = null;
            }
            super.dispose();
        }

        private function init():Boolean
        {
            if (((!(this._initialized)) && (this._productDataReady)))
            {
                this.createMainWindow();
                this.createCatalogNavigators();
                this.createCatalogViewer();
                this._initialized = true;
                this.updatePurse();
                this._Str_24043();
                this.createMarketPlace();
                this.createClubGiftController();
                this.getGiftWrappingConfiguration();
                this.createClubBuyController();
                this.createClubExtendController();
                this.createGroupMembershipsController();
                this.initBundleDiscounts();
                events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_INITIALIZED));
                this.send(new BuildersClubQueryFurniCountMessageComposer());
                return true;
            }
            return false;
        }

        private function reset(k:Boolean=false):void
        {
            var _local_2:ICatalogNavigator;
            var _local_3:Boolean;
            this._initialized = false;
            if (this._catalogViewer != null)
            {
                this._catalogViewer.dispose();
                this._catalogViewer = null;
            }
            if (this._catalogNavigators != null)
            {
                for each (_local_2 in this._catalogNavigators)
                {
                    _local_2.dispose();
                }
                this._catalogNavigators = null;
            }
            if (this._mainContainer != null)
            {
                this._mainContainer.dispose();
                this._mainContainer = null;
            }
            if (!k)
            {
                if (this._sessionDataManager == null)
                {
                    Core.crash("Could not reload product data after reset() because _sessionDataManager was null", Core.ERROR_CATEGORY_PRODUCT_DATA);
                    return;
                }
                _local_3 = this._sessionDataManager.loadProductData(this);
                if (_local_3)
                {
                    this.init();
                }
                else
                {
                    events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_NOT_READY));
                }
            }
        }

        private function send(k:IMessageComposer):void
        {
            if (this.connection == null)
            {
                return;
            }
            this.connection.send(k);
        }

        public function loadCatalogPage(k:int, _arg_2:int, _arg_3:String):void
        {
            this.isBusy = true;
            this._pageId = k;
            this.send(new GetCatalogPageComposer(k, _arg_2, _arg_3));
        }

        public function purchaseOffer(k:int, _arg_2:String="", _arg_3:int=1):void
        {
            var _local_5:Vector.<ICatalogNode>;
            var _local_4:ICatalogNavigator = this.getCatalogNavigator(CatalogType.NORMAL);
            if (_local_4 != null)
            {
                _local_5 = _local_4._Str_5719(k, true);
                if (_local_5 != null)
                {
                    this.purchaseProduct(_local_5[0].pageId, k, _arg_2, _arg_3);
                }
            }
        }

        public function purchaseProduct(k:int, _arg_2:int, _arg_3:String="", _arg_4:int=1):void
        {
            if (((this.roomAdPurchaseData == null) || (!(this.roomAdPurchaseData.offerId == _arg_2))))
            {
                this.send(new PurchaseFromCatalogComposer(k, _arg_2, _arg_3, _arg_4));
            }
            else
            {
                if (((this._roomAdPurchaseData._Str_8314) && (this._roomAdPurchaseData.expirationTime.getTime() < new Date().getTime())))
                {
                    this._roomAdPurchaseData._Str_8314 = false;
                }
                this.send(new PurchaseRoomAdMessageComposer(k, _arg_2, this.roomAdPurchaseData.flatId, this.roomAdPurchaseData.name, this.roomAdPurchaseData._Str_8314, this.roomAdPurchaseData.description, this.roomAdPurchaseData.categoryId));
            }
        }

        public function purchaseVipMembershipExtension(k:int):void
        {
            this.send(new PurchaseVipMembershipExtensionComposer(k));
        }

        public function purchaseBasicMembershipExtension(k:int):void
        {
            this.send(new PurchaseBasicMembershipExtensionComposer(k));
        }

        public function purchaseProductAsGift(k:int, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:Boolean=false):void
        {
            this.send(new PurchaseFromCatalogAsGiftComposer(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9));
        }

        public function get roomAdPurchaseData():RoomAdPurchaseData
        {
            return this._roomAdPurchaseData;
        }

        public function set roomAdPurchaseData(k:RoomAdPurchaseData):void
        {
            this._roomAdPurchaseData = k;
        }

        public function approveName(k:String, _arg_2:int):void
        {
            this.send(new ApproveNameMessageComposer(k, _arg_2));
        }

        public function getRecyclerStatus():void
        {
            this.send(new GetRecyclerStatusMessageComposer());
        }

        public function getRecyclerPrizes():void
        {
            this.send(new GetRecyclerPrizesMessageComposer());
        }

        public function sendRecycleItems(k:Array):void
        {
            this.send(new RecycleItemsMessageComposer(k));
        }

        public function set giftReceiver(k:String):void
        {
            this._giftReceiver = k;
        }

        public function getSeasonalCurrencyActivityPointType():int
        {
            return getInteger("seasonalcurrencyindicator.currency", 1);
        }
		
		public function buySnowWarTokensOffer():void
        {
            /*if (this._SafeStr_6561 != null)
            {
                this._SafeStr_6635(this._SafeStr_6561, -1, "");
            }
            else
            {
                this._SafeStr_6307.connection.send(new _SafeStr_2201());
            };*/
			//TODO: Snowstorm. Possibly related to buying game tokens.
        }

        public function showPurchaseConfirmation(k:IPurchasableOffer, _arg_2:int, _arg_3:String="", _arg_4:int=1, _arg_5:IStuffData=null, _arg_6:String=null, _arg_7:Boolean=true, _arg_8:BitmapData=null):void
        {
            var _local_11:Vector.<ICatalogNode>;
            var _local_12:Array;
            var _local_13:String;
            var _local_14:ICatalogNode;
            if (_arg_2 == CatalogNavigator._Str_5778)
            {
                _local_11 = this.currentCatalogNavigator._Str_5719(k.offerId, true);
                if (_local_11 != null)
                {
                    _arg_2 = _local_11[0].pageId;
                }
            }
            Logger.log(("buy: " + [_arg_4, k.offerId, _arg_3]));
            var _local_9:int = k.priceInCredits;
            var _local_10:int = k.priceInActivityPoints;
            if (this.multiplePurchaseEnabled)
            {
                _local_9 = this._utils._Str_4488(true, k.priceInCredits, _arg_4);
                _local_10 = this._utils._Str_4488(true, k.priceInActivityPoints, _arg_4);
            }
            if (((_local_9 > 0) && (_local_9 > this._purse.credits)))
            {
                this.showNotEnoughCreditsAlert();
                return;
            }
            if (((_local_10 > 0) && (_local_10 > this._purse.getActivityPointsForType(k.activityPointType))))
            {
                this.showNotEnoughActivityPointsAlert(k.activityPointType);
                return;
            }
            if (((k is Offer) || (this._skipToGifting)))
            {
                if (((this._purchaseConfirmationDialog == null) || (this._purchaseConfirmationDialog.disposed)))
                {
                    this._purchaseConfirmationDialog = new PurchaseConfirmationDialog(this._localization, assets);
                }
                _local_12 = [];
                if (this._friendsList != null)
                {
                    _local_12 = this._friendsList.getFriendNames();
                }
                _local_13 = _arg_6;
                if (_local_13 == null)
                {
                    if (this._giftReceiver != null)
                    {
                        _local_13 = this._giftReceiver;
                    }
                }
                this._purchaseConfirmationDialog._Str_6059(this, this._roomEngine, k, _arg_2, _arg_3, _arg_4, _arg_5, _local_12, _local_13, _arg_8);
            }
            else
            {
                if ((k is ClubBuyOfferData))
                {
                    if (_arg_2 == -1)
                    {
                        _local_14 = this.currentCatalogNavigator.getNodeByName(CatalogPageName.HC_MEMBERSHIP);
                        if (_local_14 != null)
                        {
                            _arg_2 = _local_14.pageId;
                        }
                    }
                    if (_arg_2 >= 0)
                    {
                        this._clubOfferHandler.showConfirmation((k as ClubBuyOfferData), _arg_2);
                    }
                }
            }
            if (this._skipToGifting)
            {
                this._skipToGifting = false;
                this._purchaseConfirmationDialog.turnIntoGifting();
            }
        }

        public function purchaseWillBeGift(k:Boolean):void
        {
            this._skipToGifting = k;
        }

        private function initializeRoomPreviewer():void
        {
            if ((((!(this._roomEngine == null)) && (this._roomEngine.isInitialized)) && (getBoolean("catalog.furniture.animation"))))
            {
                if (this._roomPreviewer == null)
                {
                    this._roomPreviewer = new RoomPreviewer(this._roomEngine);
                }
            }
        }

        private function isNewItemsNotificationEnabled():Boolean
        {
            return getBoolean("toolbar.new_additions.notification.enabled");
        }

        public function openCatalog():void
        {
            this.cancelFurniInMover();
            this.toggleCatalog(CatalogType.NORMAL, true);
        }

        public function openCatalogPage(k:String, _arg_2:String=null):void
        {
            this.cancelFurniInMover();
            this.toggleCatalog(((_arg_2 == null) ? CatalogType.NORMAL : _arg_2), true, false);
            if ((((!(this._initialized)) || (this._catalogNavigators == null)) || (!(this.currentCatalogNavigator.initialized))))
            {
                this._requestedPage.requestByName = k;
                return;
            }
            this.currentCatalogNavigator.openPage(k);
        }

        public function openRoomAdCatalogPageInExtendedMode(k:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:Date, _arg_6:int):void
        {
            var _local_7:int = this._pageId;
            this._roomAdPurchaseData = new RoomAdPurchaseData();
            this._roomAdPurchaseData.name = _arg_2;
            this._roomAdPurchaseData._Str_8314 = true;
            this._roomAdPurchaseData._Str_16649 = this._roomEngine.activeRoomId;
            this._roomAdPurchaseData.description = _arg_3;
            this._roomAdPurchaseData.flatId = this._roomEngine.activeRoomId;
            this._roomAdPurchaseData.roomName = _arg_4;
            this._roomAdPurchaseData.expirationTime = _arg_5;
            this._roomAdPurchaseData.categoryId = _arg_6;
            this.openCatalogPage(k);
            var _local_8:ICatalogNode = this.currentCatalogNavigator.getNodeByName(k);
            if (((!(_local_8 == null)) && (_local_8.pageId == _local_7)))
            {
                this.getRoomAdsPurchaseInfo();
            }
        }

        public function openCatalogPageByOfferId(k:int, _arg_2:String):void
        {
            this.openCatalogPageById(CatalogNavigator._Str_5778, k, _arg_2);
        }

        public function openCatalogPageById(k:int, _arg_2:int, _arg_3:String):void
        {
            if ((((this._initialized) && (!(this._catalogNavigators == null))) && (this.getCatalogNavigator(_arg_3).initialized)))
            {
                this.toggleCatalog(_arg_3, true, false);
                this._catalogViewer._Str_21608();
                this.currentCatalogNavigator.openPageById(k, _arg_2);
            }
            else
            {
                this.toggleCatalog(_arg_3);
                this._requestedPage.requestById = k;
                this._requestedPage._Str_7501 = _arg_2;
            }
        }

        public function openInventoryCategory(k:String):void
        {
            if (this._inventory == null)
            {
                return;
            }
            this._inventory.toggleInventoryPage(k);
        }

        public function openCreditsHabblet():void
        {
            HabboWebTools.openWebPageAndMinimizeClient(getProperty(ExternalVariables.WEB_SHOP_RELATIVE_URL));
        }

        public function setupInventoryForRecycler(k:Boolean):void
        {
            if (this._inventory == null)
            {
                return;
            }
            this._inventory._Str_20251(k);
        }

        public function get privateRoomSessionActive():Boolean
        {
            return this._privateRoomSessionActive;
        }

        public function get tradingActive():Boolean
        {
            if (this._inventory == null)
            {
                return false;
            }
            return this._inventory.tradingActive;
        }

        public function requestInventoryFurniToRecycler():int
        {
            if (this._inventory == null)
            {
                return 0;
            }
            return this._inventory._Str_15313();
        }

        public function returnInventoryFurniFromRecycler(k:int):Boolean
        {
            if (this._inventory == null)
            {
                return false;
            }
            return this._inventory.returnInventoryFurniFromRecycler(k);
        }

        public function getProductData(k:String):IProductData
        {
            return this._sessionDataManager.getProductData(k);
        }

        public function getFurnitureData(k:int, _arg_2:String):IFurnitureData
        {
            var _local_3:IFurnitureData;
            if (_arg_2 == ProductTypeEnum.FLOOR)
            {
                _local_3 = this._sessionDataManager.getFloorItemData(k);
            }
            if (_arg_2 == ProductTypeEnum.WALL)
            {
                _local_3 = this._sessionDataManager.getWallItemData(k);
            }
            return _local_3;
        }

        public function getFurnitureDataByName(k:String, _arg_2:String, _arg_3:int=0):IFurnitureData
        {
            var _local_4:IFurnitureData;
            if (this._sessionDataManager == null)
            {
                return null;
            }
            if (_arg_2 == ProductTypeEnum.FLOOR)
            {
                _local_4 = this._sessionDataManager.getFloorItemDataByName(k);
            }
            if (_arg_2 == ProductTypeEnum.WALL)
            {
                _local_4 = this._sessionDataManager.getWallItemDataByName(k);
            }
            return _local_4;
        }

        public function getPurse():IPurse
        {
            return this._purse;
        }

        public function getRecycler():IRecycler
        {
            return this._recyclerLogic;
        }

        public function getMarketPlace():IMarketPlace
        {
            return this._marketplace;
        }

        public function getClubGiftController():ClubGiftController
        {
            return this._clubGiftController;
        }

        public function getClubBuyController():ClubOfferHandler
        {
            return this._clubOfferHandler;
        }

        public function getClubExtendController():ClubExtendController
        {
            return this._clubExtendController;
        }

        public function getPublicMarketPlaceOffers(k:int, _arg_2:int, _arg_3:String, _arg_4:int):void
        {
            this.send(new GetMarketplaceOffersMessageComposer(k, _arg_2, _arg_3, _arg_4));
        }

        public function getRoomAdsPurchaseInfo():void
        {
            this.send(new GetRoomAdPurchaseInfoComposer());
        }

        public function sendRoomAdPurchaseInitiatedEvent():void
        {
            this.send(new RoomAdPurchaseInitiatedComposer());
        }

        public function getOwnMarketPlaceOffers():void
        {
            this.send(new GetMarketplaceOwnOffersMessageComposer());
        }

        public function buyMarketPlaceOffer(k:int):void
        {
            this.send(new BuyMarketplaceOfferMessageComposer(k));
        }

        public function redeemSoldMarketPlaceOffers():void
        {
            this.send(new RedeemMarketplaceOfferCreditsMessageComposer());
        }

        public function redeemExpiredMarketPlaceOffer(k:int):void
        {
            this.send(new CancelMarketplaceOfferMessageComposer(k));
        }

        public function getMarketplaceItemStats(k:int, _arg_2:int):void
        {
            if (!this._communicationManager)
            {
                return;
            }
            this.send(new GetMarketplaceItemStatsComposer(k, _arg_2));
        }

        public function getGroupMembershipsController():GuildMembershipsController
        {
            return this._guildMembershipsController;
        }

        public function getPixelEffectIcon(k:int):BitmapData
        {
            var _local_2:BitmapDataAsset = ((this._inventory as Component).assets.getAssetByName((("fx_icon_" + k) + "_png")) as BitmapDataAsset);
            if (((!(_local_2 == null)) && (!(_local_2.content == null))))
            {
                return (_local_2.content as BitmapData).clone();
            }
            return new BitmapData(1, 1, true, 0xFFFFFF);
        }

        public function getSubscriptionProductIcon(k:int):BitmapData
        {
            var _local_2:BitmapDataAsset = (assets.getAssetByName("icon_hc") as BitmapDataAsset);
            if (_local_2 != null)
            {
                return (_local_2.content as BitmapData).clone();
            }
            return new BitmapData(1, 1, true, 0xFFFFFF);
        }

        public function getSellablePetPalettes(k:String):Array
        {
            var _local_2:Array = this._sellablePetPalettes.getValue(k);
            if (_local_2 != null)
            {
                return _local_2.slice();
            }
            this.send(new GetSellablePetPalettesComposer(k));
            return null;
        }

        private function updatePurse():void
        {
            var _local_2:String;
            if (this._mainContainer == null)
            {
                return;
            }
            this._localization.registerParameter("catalog.purse.creditbalance", "balance", String(this._purse.credits));
            this._localization.registerParameter("catalog.purse.pixelbalance", "balance", String(this._purse.getActivityPointsForType(ActivityPointTypeEnum.DUCKET)));
            var k:uint = _Str_8057._Str_17515;
            if (!this._purse.hasClubLeft)
            {
                _local_2 = "catalog.purse.club.join";
            }
            else
            {
                if (this._purse.isVIP)
                {
                    _local_2 = "catalog.purse.vipdays";
                    k = _Str_8057._Str_16032;
                }
                else
                {
                    _local_2 = "catalog.purse.clubdays";
                }
                this._localization.registerParameter(_local_2, "days", String(this._purse.clubDays));
                this._localization.registerParameter(_local_2, "months", String(this._purse.clubPeriods));
            }
            var _local_3:IIconWindow = (this._mainContainer.findChildByName("clubIcon") as IIconWindow);
            if (_local_3)
            {
                _local_3.style = k;
            }
            var _local_4:ITextWindow = (this._mainContainer.findChildByName("clubText") as ITextWindow);
            if (_local_4)
            {
                _local_4.caption = this._localization.getLocalization(_local_2);
            }
        }

        private function onHabboToolbarEvent(k:HabboToolbarEvent):void
        {
            if (k.type != HabboToolbarEvent.HTE_TOOLBAR_CLICK)
            {
                return;
            }
            switch (k.iconId)
            {
                case HabboToolbarIconEnum.CATALOGUE:
                    this.toggleCatalog(CatalogType.NORMAL);
                    return;
                case HabboToolbarIconEnum.BUILDER:
                    this.toggleCatalog(CatalogType.BUILDER);
                    return;
            }
        }

        private function setElementColour(k:String, _arg_2:int):void
        {
            if (this._mainContainer == null)
            {
                return;
            }
            var _local_3:IWindow = this._mainContainer.findChildByName(k);
            if (_local_3 != null)
            {
                _local_3.color = _arg_2;
            }
        }

        public function get buildersClubEnabled():Boolean
        {
            return getBoolean("builders.club.enabled");
        }

        public function toggleCatalog(k:String, _arg_2:Boolean=false, _arg_3:Boolean=true):void
        {
            var _local_5:ITextFieldWindow;
            if (((!(this._sessionDataManager.hasSecurity(SecurityLevelEnum.MODERATOR))) && (!(this.buildersClubEnabled))))
            {
                k = CatalogType.NORMAL;
            }
            var _local_4:* = (!(k == this._catalogType));
            this._catalogType = k;
            this.cancelFurniInMover();
            if (this._mainContainer == null)
            {
                if (this.init() == false)
                {
                    return;
                }
            }
            if (((this.currentCatalogNavigator == null) || (!(this.currentCatalogNavigator.initialized))))
            {
                this.refreshCatalogIndex(this._catalogType);
            }
            if ((((!(this.mainWindowVisible())) || (_arg_2)) || (_local_4)))
            {
                if (this._Str_7793)
                {
                    this._Str_7793 = false;
                    events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_NEW_ITEMS_HIDE));
                    this.markNewAdditionPageOpened();
                }
                this.showMainWindow();
            }
            else
            {
                if (!_Str_3942._Str_9211(this._mainContainer))
                {
                    this.hideMainWindow();
                }
            }
            if (this.mainWindowVisible())
            {
                if (this._mainContainer != null)
                {
                    this._mainContainer.activate();
                    _local_5 = (this._mainContainer.findChildByName("search.input") as ITextFieldWindow);
                    if (_local_5)
                    {
                        _local_5.focus();
                        _local_5.setSelection(0, _local_5.text.length);
                    }
                }
                else
                {
                    Logger.log("[Catalog] No main container!");
                }
                HabboTracking.getInstance().trackGoogle("catalogue", "open");
            }
            if (this._mainContainer != null)
            {
                this._mainContainer.color = ((k == CatalogType.NORMAL) ? 4296112 : 16758076);
                this._mainContainer.caption = ((k == CatalogType.NORMAL) ? "${catalog.title}" : "${builder.catalog.title}");
                this._mainContainer.findChildByName("catalog.header.background.border").color = ((k == CatalogType.NORMAL) ? 4281819765 : 4283320388);
                this._mainContainer.findChildByName("catalog.header.background.body").color = ((k == CatalogType.NORMAL) ? 4279123794 : 4281149220);
                this._mainContainer.findChildByName("catalog.mode.header").visible = (k == CatalogType.NORMAL);
                this._mainContainer.findChildByName("builder.mode.header").visible = (k == CatalogType.BUILDER);
                this.refreshBuilderStatus();
            }
            if (this.mainWindowVisible())
            {
                events.dispatchEvent(new Event(HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_OPEN));
                if (((!(this._recyclerLogic == null)) && (this.getCurrentLayoutCode() == "recycler")))
                {
                    this._recyclerLogic.activate();
                }
            }
            else
            {
                events.dispatchEvent(new Event(HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_CLOSE));
                if (((!(this._recyclerLogic == null)) && (this.getCurrentLayoutCode() == "recycler")))
                {
                    this._recyclerLogic.cancel();
                }
            }
            if (this._recyclerLogic != null)
            {
                this.setupInventoryForRecycler(((this._recyclerLogic.active) && (this.mainWindowVisible())));
            }
            if (((_local_4) && (!(this.currentCatalogNavigator == null))))
            {
                if (_arg_3)
                {
                    this.currentCatalogNavigator.deactivateCurrentNode();
                    this.currentCatalogNavigator.loadFrontPage();
                }
                this.currentCatalogNavigator.showIndex();
                if (this._catalogViewer != null)
                {
                    this._catalogViewer._Str_21608();
                }
            }
        }

        private function getCurrentLayoutCode():String
        {
            if (this._catalogViewer == null)
            {
                return "";
            }
            return this._catalogViewer.getCurrentLayoutCode();
        }

        private function refreshCatalogIndex(k:String):void
        {
            this.send(new GetCatalogIndexComposer(k));
        }

        private function markNewAdditionPageOpened():void
        {
            this.send(new MarkCatalogNewAdditionsPageOpenedComposer());
        }

        private function createCatalogNavigators():void
        {
            this._catalogNavigators = new Dictionary();
            this._catalogNavigators[CatalogType.NORMAL] = new CatalogNavigator(this, this._mainContainer, CatalogType.NORMAL);
            this._catalogNavigators[CatalogType.BUILDER] = new CatalogNavigator(this, this._mainContainer, CatalogType.BUILDER);
            var k:BitmapDataAsset = (assets.getAssetByName("purse_coins_small") as BitmapDataAsset);
            this.setElementImage("creditsIcon", (k.content as BitmapData));
            var _local_2:BitmapDataAsset = (assets.getAssetByName("purse_pixels_small") as BitmapDataAsset);
            this.setElementImage("pixelsIcon", (_local_2.content as BitmapData));
            var _local_3:BitmapDataAsset = (assets.getAssetByName("purse_club_small") as BitmapDataAsset);
            this.setElementImage("clubIcon", (_local_3.content as BitmapData));
        }

        private function createCatalogViewer():void
        {
            var k:IWindowContainer = (this._mainContainer.findChildByName("layoutContainer") as IWindowContainer);
            this._catalogViewer = new CatalogViewer(this, k);
        }

        private function createMainWindow():void
        {
            var k:String;
            var _local_5:IWindow;
            if (this.useNonTabbedCatalog())
            {
                k = "catalog_ubuntu";
            }
            else
            {
                k = "catalog_ubuntu_with_tabs";
            }
            var _local_2:XmlAsset = (assets.getAssetByName(k) as XmlAsset);
            this._mainContainer = (this._windowManager.buildFromXML((_local_2.content as XML), DESKTOP_WINDOW_LAYER) as IWindowContainer);
            this._mainContainer.tags.push("habbo_catalog");
            this._mainContainer.position = DEFAULT_VIEW_LOCATION_LARGE;
            this.hideMainWindow();
            var _local_3:IWindow = this._mainContainer.findChildByName("titlebar_close_button");
            if (_local_3 == null)
            {
                _local_3 = this._mainContainer.findChildByTag("close");
            }
            if (_local_3 != null)
            {
                _local_3.procedure = this.onWindowClose;
            }
            var _local_4:ITextFieldWindow = (this._mainContainer.findChildByName("search.input") as ITextFieldWindow);
            if (_local_4)
            {
                _local_4.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN, this.onSearchInputEvent);
                _local_4.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_UP, this.onSearchInputEvent);
                _local_4.setSelection(0, _local_4.text.length);
                _local_4.focus();
                _local_5 = this._mainContainer.findChildByName("clear_search_button");
                if (_local_5)
                {
                    _local_5.addEventListener(WindowMouseEvent.CLICK, this.onClearSearch);
                }
            }
        }

        public function set isBusy(k:Boolean):void
        {
            var _local_2:IWindow;
            if (this._mainContainer)
            {
                this._mainContainer.caption = ((k) ? "${generic.loading}" : "${catalog.title}");
                _local_2 = this._mainContainer.findChildByName("search_waiting_for_results_mask");
                if (_local_2)
                {
                    _local_2.visible = k;
                }
            }
        }

        private function onSelectSearch(k:WindowMouseEvent):void
        {
            var _local_2:ITextFieldWindow = (k.target as ITextFieldWindow);
            if (_local_2)
            {
                _local_2.setSelection(0, _local_2.text.length);
                _local_2.focus();
            }
        }

        private function onClearSearch(k:WindowMouseEvent=null):void
        {
            var _local_2:ITextFieldWindow = (this._mainContainer.findChildByName("search.input") as ITextFieldWindow);
            _local_2.caption = "";
            _local_2.setSelection(0, _local_2.text.length);
            _local_2.focus();
            var _local_3:IStaticBitmapWrapperWindow = (this._mainContainer.findChildByName("search.clear.icon") as IStaticBitmapWrapperWindow);
            _local_3.assetUri = "common_small_pen";
            if (this._catalogViewer._Str_20548 > 0)
            {
                this.currentCatalogNavigator.openPageById(this._catalogViewer._Str_20548, -1);
            }
            this._mainContainer.findChildByName("search.helper").visible = true;
        }

        private function onSearchInputEvent(k:WindowKeyboardEvent):void
        {
            if (k.type == WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN)
            {
                if (this._keyUpSearchTimer)
                {
                    this._keyUpSearchTimer.stop();
                }
                return;
            }
            if (this._keyUpSearchTimer == null)
            {
                this._keyUpSearchTimer = new Timer(50, 1);
            }
            if (k.target.caption.length >= 3)
            {
                this._keyUpSearchTimer.addEventListener(TimerEvent.TIMER, this.onKeyUpSearchTimer);
                this._keyUpSearchTimer.start();
            }
            var _local_2:IWindow = this._mainContainer.findChildByName("search.helper");
            _local_2.visible = (k.target.caption.length == 0);
            var _local_3:IStaticBitmapWrapperWindow = (this._mainContainer.findChildByName("search.clear.icon") as IStaticBitmapWrapperWindow);
            _local_3.assetUri = ((k.target.caption.length > 0) ? "icons_close" : "common_small_pen");
            if (k.target.caption.length == 0)
            {
                this.onClearSearch();
            }
            else
            {
                if (k.keyCode == Keyboard.ENTER)
                {
                    this.performSearch(k.target.caption);
                }
            }
        }

        private function onKeyUpSearchTimer(k:TimerEvent):void
        {
            var _local_2:ITextFieldWindow = (this._mainContainer.findChildByName("search.input") as ITextFieldWindow);
            this.performSearch(_local_2.caption);
        }

        private function performSearch(k:String):void
        {
            var _local_5:IFurnitureData;
            var _local_6:String;
            var _local_7:Vector.<ICatalogNode>;
            var _local_8:Vector.<ICatalogNode>;
            if (this._keyUpSearchTimer)
            {
                this._keyUpSearchTimer.stop();
            }
            if ((((this._furnitureData == null) || (k == null)) || (k.length == 0)))
            {
                return;
            }
            var _local_2:Array = [];
            var _local_3:Vector.<IFurnitureData> = new Vector.<IFurnitureData>(0);
            var _local_4:String = k.toLowerCase().replace(" ", "");
            for each (_local_5 in this._furnitureData)
            {
                if (((this._catalogType == CatalogType.BUILDER) && (!(_local_5.availableForBuildersClub))))
                {
                }
                else
                {
                    if (((this._catalogType == CatalogType.NORMAL) && (_local_5.excludedFromDynamic)))
                    {
                    }
                    else
                    {
                        _local_6 = [_local_5.className, _local_5.localizedName, _local_5.description].join(" ");
                        _local_6 = _local_6.replace(/ /gi, "").toLowerCase();

                        if (((this._catalogType == CatalogType.BUILDER) && (_local_5.purchaseOfferId == NO_KNOWN_OFFER)) && (_local_5.rentOfferId == NO_KNOWN_OFFER))
                        {
                            if (((!(_local_5.furniLine == "")) && (_local_2.indexOf(_local_5.furniLine) < 0)))
                            {
                                if (_local_6.indexOf(_local_4) >= 0)
                                {
                                    _local_2.push(_local_5.furniLine);
                                }
                            }
                        }
                        else
                        {
                            _local_7 = this.currentCatalogNavigator._Str_5719(_local_5.purchaseOfferId, true);
                            _local_8 = this.currentCatalogNavigator._Str_5719(_local_5.rentOfferId, true);
                            if (((!(_local_7 == null)) || ((this._catalogType == CatalogType.NORMAL) && (!(_local_8 == null)))))
                            {
                                if (_local_6.indexOf(_local_4) >= 0)
                                {
                                    _local_3.push(_local_5);
                                    if (_local_3.length >= MAX_SEARCH_RESULTS_LENGTH)
                                    {
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            this.localization.registerParameter("catalog.search.results", "count", _local_3.length.toString());
            this.localization.registerParameter("catalog.search.results", "needle", k);
            this._mainContainer.findChildByName(PageLocalization.CATALOG_HEADER_TITLE).caption = "${catalog.search.header}";
            this.currentCatalogNavigator.deactivateCurrentNode();
            this._catalogViewer._Str_22433(_local_3);
            this.currentCatalogNavigator.filter(_local_4, _local_2);
        }

        public function furniDataReady():void
        {
            this._furnitureData = this._sessionDataManager.getFurniData(this);
            this._pagesVisibleInBuilderMode = null;
        }

        private function onRoomSessionEvent(k:RoomSessionEvent):void
        {
            switch (k.type)
            {
                case RoomSessionEvent.STARTED:
                    this._privateRoomSessionActive = k.session.isPrivateRoom;
                    this._roomSession = k.session;
                    if (this._recyclerLogic != null)
                    {
                        this._recyclerLogic._Str_19372(true);
                    }
                    break;
                case RoomSessionEvent.ENDED:
                    this._privateRoomSessionActive = false;
                    this._roomSession = null;
                    if (this._recyclerLogic != null)
                    {
                        this._recyclerLogic._Str_19372(false);
                    }
                    break;
            }
            if (this.currentPage != null)
            {
                this.currentPage.dispatchWidgetEvent(new CatalogWidgetRoomChangedEvent());
            }
        }

        private function _Str_24043():void
        {
            this._recyclerLogic = new RecyclerLogic(this, this._windowManager);
            this.getRecyclerPrizes();
        }

        private function createMarketPlace():void
        {
            if (this._marketplace == null)
            {
                this._marketplace = new MarketPlaceLogic(this, this._windowManager, this._roomEngine);
            }
        }

        private function createClubGiftController():void
        {
            if (this._clubGiftController == null)
            {
                this._clubGiftController = new ClubGiftController(this);
            }
        }

        private function createClubBuyController():void
        {
            if (this._clubOfferHandler == null)
            {
                this._clubOfferHandler = new ClubOfferHandler(this, this.connection);
            }
        }

        private function createClubExtendController():void
        {
            if (this._clubExtendController == null)
            {
                this._clubExtendController = new ClubExtendController(this);
            }
        }

        private function createGroupMembershipsController():void
        {
            if (this._guildMembershipsController == null)
            {
                this._guildMembershipsController = new GuildMembershipsController(this);
            }
        }

        private function getGiftWrappingConfiguration():void
        {
            this.send(new GetGiftWrappingConfigurationComposer());
        }

        public function getHabboClubOffers(k:int):void
        {
            this.send(new GetClubOffersMessageComposer(k));
        }

        private function onWindowClose(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this.hideMainWindow();
            if (this._catalogViewer != null)
            {
                this._catalogViewer._Str_20980();
            }
            if (((!(this._recyclerLogic == null)) && (this.getCurrentLayoutCode() == "recycler")))
            {
                this._recyclerLogic.cancel();
                this.setupInventoryForRecycler(false);
            }
        }

        private function onCatalogIndex(k:CatalogPagesListEvent):void
        {
            var _local_2:ICatalogNavigator = this.getCatalogNavigator(k.catalogType);
            if (_local_2 == null)
            {
                return;
            }
            this._Str_7793 = k._Str_16264;
            _local_2.buildCatalogIndex(k.root);
            if (k.catalogType == this._catalogType)
            {
                _local_2.showIndex();
            }
            switch (this._requestedPage._Str_3989)
            {
                case RequestedPage.REQUEST_TYPE_NONE:
                    if (((((this._Str_7793) && (this._Str_19190)) && (!(this.newAdditionsPageOpenDisabled))) && (k.catalogType == CatalogType.NORMAL)))
                    {
                        events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_NEW_ITEMS_SHOW));
                        this.openCatalogPage(CatalogPageName.NEW_ADDITIONS);
                    }
                    else
                    {
                        _local_2.loadFrontPage();
                    }
                    return;
                case RequestedPage.REQUEST_TYPE_ID:
                    _local_2.openPageById(this._requestedPage.requestId, this._requestedPage._Str_7501);
                    this._requestedPage.resetRequest();
                    return;
                case RequestedPage.REQUEST_TYPE_NAME:
                    _local_2.openPage(this._requestedPage._Str_22486);
                    this._requestedPage.resetRequest();
                    return;
            }
        }

        private function onCatalogPage(k:CatalogPageMessageEvent):void
        {
            var _local_11:CatalogPageMessageOfferData;
            var _local_12:Vector.<IProduct>;
            var _local_13:IProductData;
            var _local_14:CatalogPageMessageProductData;
            var _local_15:Offer;
            var _local_16:IFurnitureData;
            var _local_2:CatalogPageMessageParser = k.getParser();
            if (_local_2.catalogType != this._catalogType)
            {
                return;
            }
            var _local_3:int = _local_2.pageId;
            var _local_4:String = _local_2.layoutCode;
            var _local_5:Array = _local_2.localization.images.concat();
            var _local_6:Array = _local_2.localization.texts.concat();
            var _local_7:IPageLocalization = new PageLocalization(_local_5, _local_6);
            var _local_8:int = _local_2.offerId;
            var _local_9:Boolean = _local_2.acceptSeasonCurrencyAsCredits;
            var _local_10:Vector.<IPurchasableOffer> = new Vector.<IPurchasableOffer>(0);
            for each (_local_11 in _local_2.offers)
            {
                _local_12 = new Vector.<IProduct>(0);
                _local_13 = this.getProductData(_local_11.localizationId);
                for each (_local_14 in _local_11.products)
                {
                    _local_16 = this.getFurnitureData(_local_14.furniClassId, _local_14.productType);
                    _local_12.push(new Product(_local_14.productType, _local_14.furniClassId, _local_14.extraParam, _local_14.productCount, _local_13, _local_16, this, _local_14.uniqueLimitedItem, _local_14.uniqueLimitedItemSeriesSize, _local_14.uniqueLimitedItemsLeft));
                }
                if (((_local_12.length == 0) && (!(HabboCatalogUtils._Str_21831(_local_11.localizationId)))))
                {
                }
                else
                {
                    _local_15 = new Offer(_local_11.offerId, _local_11.localizationId, _local_11.isRent, _local_11.priceInCredits, _local_11.priceInActivityPoints, _local_11.activityPointType, _local_11.giftable, _local_11.clubLevel, _local_12, _local_11.bundlePurchaseAllowed, this);
                    if (((!(_local_15.productContainer == null)) && (this.isOfferCompatibleWithCurrentMode(_local_15))))
                    {
                        _local_10.push(_local_15);
                    }
                    else
                    {
                        _local_15.dispose();
                    }
                }
            }
            if (((!(_local_2.frontPageItems == null)) && (_local_2.frontPageItems.length > 0)))
            {
                this._frontPageItems = _local_2.frontPageItems;
            }
            if (((!(this._catalogViewer == null)) && (this._pageId == _local_3)))
            {
                this._catalogViewer._Str_19388(_local_3, _local_4, _local_7, _local_10, _local_8, _local_9);
            }
            this.isBusy = false;
        }

        private function isOfferCompatibleWithCurrentMode(k:Offer):Boolean
        {
            return (this._catalogType == CatalogType.NORMAL) || ((!(k.pricingModel == Offer.PRICING_MODEL_BUNDLE)) && (!(k.pricingModel == Offer.PRICING_MODEL_MULTI)));
        }

        private function onCatalogPublished(k:IMessageEvent):void
        {
            var _local_2:Boolean = this.mainWindowVisible();
            this.reset();
            if (_local_2)
            {
                this._windowManager.alert("${catalog.alert.published.title}", "${catalog.alert.published.description}", 0, this.alertDialogEventProcessor);
            }
        }

        private function onPurchaseError(k:IMessageEvent):void
        {
            var _local_2:PurchaseErrorMessageEvent = (k as PurchaseErrorMessageEvent);
            var _local_3:PurchaseErrorMessageParser = _local_2.getParser();
            var _local_4:int = _local_3.errorCode;
            var _local_5:String = ((_local_4 > 0) ? (("${catalog.alert.purchaseerror.description." + _local_4) + "}") : "${catalog.alert.purchaseerror.description}");
            this._windowManager.alert("${catalog.alert.purchaseerror.title}", _local_5, 0, this.alertDialogEventProcessor);
            if (this._purchaseConfirmationDialog != null)
            {
                this._purchaseConfirmationDialog.dispose();
                this._purchaseConfirmationDialog = null;
            }
        }

        private function onPurchaseNotAllowed(k:IMessageEvent):void
        {
            var _local_2:PurchaseNotAllowedMessageEvent = (k as PurchaseNotAllowedMessageEvent);
            var _local_3:PurchaseNotAllowedMessageParser = _local_2.getParser();
            var _local_4:int = _local_3.errorCode;
            var _local_5:String = "";
            switch (_local_4)
            {
                case 1:
                    _local_5 = "${catalog.alert.purchasenotallowed.hc.description}";
                    break;
                default:
                    _local_5 = "${catalog.alert.purchasenotallowed.unknown.description}";
            }
            this._windowManager.alert("${catalog.alert.purchasenotallowed.title}", _local_5, 0, this.alertDialogEventProcessor);
        }

        private function onPurchaseOK(k:IMessageEvent):void
        {
            var _local_4:IBitmapWrapperWindow;
            var _local_5:BitmapData;
            var _local_6:Point;
            var _local_7:String;
            var _local_2:PurchaseOKMessageEvent = (k as PurchaseOKMessageEvent);
            var _local_3:PurchaseOKMessageParser = _local_2.getParser();
            events.dispatchEvent(new CatalogFurniPurchaseEvent(_local_3.offer.localizationId));
            if (this._purchaseConfirmationDialog != null)
            {
                if (((!(this._isObjectMoverRequested)) && (!(this._purchaseConfirmationDialog.isGiftPurchase()))))
                {
                    _local_4 = this._purchaseConfirmationDialog.getIconWrapper();
                    if (_local_4)
                    {
                        _local_5 = _local_4.bitmap;
                        if (_local_5)
                        {
                            _local_6 = new Point();
                            _local_4.getGlobalPosition(_local_6);
                            _local_7 = HabboToolbarIconEnum.INVENTORY;
                            if (this._purchaseConfirmationDialog.productType == ProductTypeEnum.EFFECT)
                            {
                                _local_7 = HabboToolbarIconEnum.MEMENU;
                            }
                            this._toolbar.createTransitionToIcon(_local_7, _local_5.clone(), _local_6.x, _local_6.y);
                        }
                    }
                }
                this._purchaseConfirmationDialog.dispose();
            }
            this._purchaseConfirmationDialog = null;
        }

        private function onGiftReceiverNotFound(k:GiftReceiverNotFoundEvent):void
        {
            if (this._purchaseConfirmationDialog != null)
            {
                this._purchaseConfirmationDialog.receiverNotFound();
            }
        }

        private function onNotEnoughBalance(k:IMessageEvent):void
        {
            var _local_2:NotEnoughBalanceMessageEvent = (k as NotEnoughBalanceMessageEvent);
            var _local_3:NotEnoughBalanceMessageParser = _local_2.getParser();
            if (_local_3.notEnoughCredits)
            {
                this.showNotEnoughCreditsAlert();
            }
            else
            {
                if (_local_3._Str_24352)
                {
                    this.showNotEnoughActivityPointsAlert(_local_3.activityPointType);
                }
            }
            if (this._purchaseConfirmationDialog != null)
            {
                this._purchaseConfirmationDialog.notEnoughCredits();
            }
        }

        public function setLeftPaneVisibility(k:Boolean):void
        {
            if (!this._mainContainer)
            {
                return;
            }
            var _local_2:IWindow = this._mainContainer.findChildByName("navigationContainer");
            if (_local_2)
            {
                _local_2.visible = k;
            }
            _local_2 = this._mainContainer.findChildByName("searchContainer");
            if (_local_2)
            {
                _local_2.visible = k;
            }
        }

        public function showNotEnoughCreditsAlert():void
        {
            if (!this._windowManager)
            {
                return;
            }
            this._windowManager.confirm("${catalog.alert.notenough.title}", "${catalog.alert.notenough.credits.description}", 0, this.noCreditsConfirmDialogEventProcessor);
        }

        public function showNotEnoughActivityPointsAlert(k:int):void
        {
            var _local_2:String = ("catalog.alert.notenough.activitypoints.title." + k);
            var _local_3:String = ("catalog.alert.notenough.activitypoints.description." + k);
            if (k == ActivityPointTypeEnum.DUCKET)
            {
                this._windowManager.confirm(this.localization.getLocalization(_local_2), this.localization.getLocalization(_local_3), 0, this.noDucketsConfirmDialogEventProcessor);
            }
            else
            {
                this._windowManager.alert(this.localization.getLocalization(_local_2), this.localization.getLocalization(_local_3), 0, this.alertDialogEventProcessor);
            }
        }

        private function onVoucherRedeemOk(k:VoucherRedeemOkMessageEvent):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:String = "${catalog.alert.voucherredeem.ok.description}";
            if (k.productName != "")
            {
                _local_2 = "catalog.alert.voucherredeem.ok.description.furni";
                this._localization.registerParameter(_local_2, "productName", k.productName);
                this._localization.registerParameter(_local_2, "productDescription", k.productDescription);
                _local_2 = (("${" + _local_2) + "}");
            }
            this._windowManager.alert("${catalog.alert.voucherredeem.ok.title}", _local_2, 0, this.alertDialogEventProcessor);
        }

        private function onVoucherRedeemError(k:VoucherRedeemErrorMessageEvent):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:String = "${catalog.alert.voucherredeem.error.title}";
            var _local_3:* = (("${catalog.alert.voucherredeem.error.description." + k.errorCode) + "}");
            this._windowManager.alert(_local_2, _local_3, 0, this.alertDialogEventProcessor);
        }

        private function onApproveNameResult(k:ApproveNameMessageEvent):void
        {
            if (((k == null) || (this._catalogViewer == null)))
            {
                return;
            }
            var _local_2:ApproveNameMessageParser = k.getParser();
            this._catalogViewer.dispatchWidgetEvent(new CatalogWidgetApproveNameResultEvent(_local_2.result, _local_2.nameValidationInfo));
        }

        private function onCreditBalance(k:IMessageEvent):void
        {
            var _local_2:CreditBalanceEvent = (k as CreditBalanceEvent);
            var _local_3:CreditBalanceParser = _local_2.getParser();
            this._purse.credits = _local_3.balance;
            this.updatePurse();
            if (((!(this._firstBalanceCredits)) && (!(this._soundManager == null))))
            {
                this._soundManager.playSound(HabboSoundTypesEnum.PURCHASE);
            }
            this._firstBalanceCredits = false;
            events.dispatchEvent(new PurseEvent(PurseEvent.CATALOG_PURSE_CREDIT_BALANCE, this._purse.credits, 0));
            events.dispatchEvent(new PurseUpdateEvent());
        }

        private function onActivityPointNotification(k:IMessageEvent):void
        {
            var _local_2:HabboActivityPointNotificationMessageEvent = (k as HabboActivityPointNotificationMessageEvent);
            this._purse.activityPoints[_local_2.type] = _local_2.amount;
            this.updatePurse();
            if (((!(this._soundManager == null)) && (_local_2.type == ActivityPointTypeEnum.DUCKET)))
            {
                this._soundManager.playSound(HabboSoundTypesEnum.PIXELS);
            }
            events.dispatchEvent(new PurseEvent(PurseEvent.CATALOG_PURSE_ACTIVITY_POINT_BALANCE, _local_2.amount, _local_2.type));
            events.dispatchEvent(new PurseUpdateEvent());
        }

        private function onActivityPoints(k:IMessageEvent):void
        {
            var _local_3:String;
            var _local_4:int;
            var _local_2:ActivityPointsMessageEvent = (k as ActivityPointsMessageEvent);
            this._purse.activityPoints = _local_2.points;
            this.updatePurse();
            for (_local_3 in _local_2.points)
            {
                _local_4 = int(_local_3);
                events.dispatchEvent(new PurseEvent(PurseEvent.CATALOG_PURSE_ACTIVITY_POINT_BALANCE, _local_2.points[_local_4], _local_4));
            }
            events.dispatchEvent(new PurseUpdateEvent());
        }

        private function onSubscriptionInfo(k:IMessageEvent):void
        {
            var _local_3:Boolean;
            var _local_2:ScrSendUserInfoMessageParser = (k as ScrSendUserInfoEvent).getParser();
            this._purse.clubDays = Math.max(0, _local_2.daysToPeriodEnd);
            this._purse.clubPeriods = Math.max(0, _local_2.periodsSubscribedAhead);
            this._purse.isVIP = _local_2.isVIP;
            this._purse.pastClubDays = _local_2.pastClubDays;
            this._purse.pastVipDays = _local_2.pastVipDays;
            this._purse.isExpiring = ((_local_2.responseType == ScrSendUserInfoMessageParser.RESPONSE_TYPE_DISCOUNT_AVAILABLE) ? true : false);
            this._purse.minutesUntilExpiration = _local_2.minutesUntilExpiration;
            this._purse.minutesSinceLastModified = _local_2.minutesSinceLastModified;
            if (ExternalInterface.available)
            {
                if (((_local_2.productName == "habbo_club") || (_local_2.productName == "club_habbo")))
                {
                    _local_3 = ((_local_2.isVIP) && (_local_2.minutesUntilExpiration > 0));
                    ExternalInterface.call("FlashExternalInterface.subscriptionUpdated", _local_3);
                }
            }
            this.updatePurse();
            if (_local_2.responseType == ScrSendUserInfoMessageParser.RESPONSE_TYPE_PURCHASE)
            {
                this.reset();
                if (this._pageToOpenAfterVipPurchase != null)
                {
                    this.openCatalogPage(this._pageToOpenAfterVipPurchase);
                    this._pageToOpenAfterVipPurchase = null;
                }
            }
        }

        private function onClubGiftInfo(k:ClubGiftInfoEvent):void
        {
            if (((!(k)) || (!(this._clubGiftController))))
            {
                return;
            }
            var _local_2:ClubGiftInfoParser = k.getParser();
            if (!_local_2)
            {
                return;
            }
            this._clubGiftController._Str_24745(_local_2._Str_12860, _local_2._Str_7574, _local_2.offers, _local_2._Str_24398);
        }

        private function _Str_24950(k:IMessageEvent):void
        {
            var _local_2:RecyclerStatusMessageParser = (k as RecyclerStatusEvent).getParser();
            if (((_local_2 == null) || (this._recyclerLogic == null)))
            {
                return;
            }
            this._recyclerLogic._Str_25018(_local_2.recyclerStatus, _local_2.recyclerTimeoutSeconds);
        }

        private function onRecyclerFinished(k:IMessageEvent):void
        {
            var _local_2:RecyclerFinishedMessageParser = (k as RecyclerFinishedEvent).getParser();
            if (((_local_2 == null) || (this._recyclerLogic == null)))
            {
                return;
            }
            this._recyclerLogic._Str_22958(_local_2.recyclerFinishedStatus, _local_2.prizeId);
        }

        private function _Str_23749(k:IMessageEvent):void
        {
            var _local_2:RecyclerPrizesMessageParser = (k as RecyclerPrizesEvent).getParser();
            if (((_local_2 == null) || (this._recyclerLogic == null)))
            {
                return;
            }
            this._recyclerLogic._Str_22273(_local_2.prizeLevels);
        }

        private function onMarketPlaceOffers(k:IMessageEvent):void
        {
            if (this._marketplace != null)
            {
                this._marketplace.onOffers(k);
            }
        }

        private function onMarketPlaceOwnOffers(k:IMessageEvent):void
        {
            if (this._marketplace != null)
            {
                this._marketplace.onOwnOffers(k);
            }
        }

        private function onMarketPlaceBuyResult(k:IMessageEvent):void
        {
            if (this._marketplace != null)
            {
                this._marketplace.onBuyResult(k);
            }
        }

        private function onMarketPlaceCancelResult(k:IMessageEvent):void
        {
            if (this._marketplace != null)
            {
                this._marketplace.onCancelResult(k);
            }
        }

        private function onGiftWrappingConfiguration(k:GiftWrappingConfigurationEvent):void
        {
            if (k == null)
            {
                return;
            }
            this._giftWrappingConfiguration = new GiftWrappingConfiguration(k);
        }

        private function onMarketplaceItemStats(k:MarketplaceItemStatsEvent):void
        {
            if (((!(k)) || (!(this._marketplace))))
            {
                return;
            }
            var _local_2:MarketplaceItemStatsParser = k.getParser();
            if (!_local_2)
            {
                return;
            }
            var _local_3:MarketplaceItemStats = new MarketplaceItemStats();
            _local_3.averagePrice = _local_2.averagePrice;
            _local_3.offerCount = _local_2.offerCount;
            _local_3.historyLength = _local_2.historyLength;
            _local_3.dayOffsets = _local_2.dayOffsets;
            _local_3.averagePrices = _local_2.averagePrices;
            _local_3.soldAmounts = _local_2.soldAmounts;
            _local_3.furniCategoryId = _local_2.furniCategoryId;
            _local_3.furniTypeId = _local_2.furniTypeId;
            this._marketplace.itemStats = _local_3;
        }

        private function onMarketplaceConfiguration(k:MarketplaceConfigurationEvent):void
        {
            if (((!(k)) || (!(this._marketplace))))
            {
                return;
            }
            var _local_2:MarketplaceConfigurationMessageParser = k.getParser();
            if (!_local_2)
            {
                return;
            }
            this._marketplace.averagePricePeriod = _local_2.displayTime;
        }

        private function onMarketplaceMakeOfferResult(k:MarketplaceMakeOfferResult):void
        {
            if (((!(k)) || (!(this._marketplace))))
            {
                return;
            }
            var _local_2:MarketplaceMakeOfferResultParser = k.getParser();
            if (!_local_2)
            {
                return;
            }
            if (_local_2.result == 1)
            {
                this._marketplace.refreshOffers();
            }
        }

        private function onHabboClubOffers(k:HabboClubOffersMessageEvent):void
        {
            var _local_2:HabboClubOffersMessageParser = k.getParser();
            if (((!(this._clubOfferHandler == null)) && ((((_local_2.source == ClubOfferRequestSource._Str_15734) || (_local_2.source == ClubOfferRequestSource._Str_12589)) || (_local_2.source == ClubOfferRequestSource._Str_15001)) || (_local_2.source == ClubOfferRequestSource._Str_15727))))
            {
                this._clubOfferHandler.onOffers(_local_2);
            }
        }

        private function onHabboClubExtendOffer(k:HabboClubExtendOfferMessageEvent):void
        {
            if (!this._initialized)
            {
                this.init();
            }
            if (this._clubExtendController)
            {
                this._clubExtendController._Str_24854(k);
            }
        }

        private function onRoomExit(k:IMessageEvent):void
        {
        }

        private function onSellablePalettes(k:SellablePetPalettesMessageEvent):void
        {
            var _local_2:SellablePetPalettesParser = k.getParser();
            this._sellablePetPalettes.remove(_local_2.productCode);
            var _local_3:Array = _local_2._Str_13588;
            if (_local_3 != null)
            {
                this._sellablePetPalettes.add(_local_2.productCode, _local_3.slice());
                this._catalogViewer.dispatchWidgetEvent(new CatalogWidgetSellablePetPalettesEvent(_local_2.productCode, _local_3.slice()));
            }
        }

        private function setElementImage(k:String, _arg_2:BitmapData):void
        {
            var _local_3:IBitmapWrapperWindow = (this._mainContainer.findChildByName(k) as IBitmapWrapperWindow);
            if (_local_3 != null)
            {
                _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height, true, 0);
                _local_3.bitmap.copyPixels(_arg_2, _arg_2.rect, new Point(0, 0));
            }
            else
            {
                Logger.log(("Could not find element: " + k));
            }
        }

        private function alertDialogEventProcessor(k:IAlertDialog, _arg_2:WindowEvent):void
        {
            k.dispose();
            this.resetPlacedOfferData();
        }

        private function noCreditsConfirmDialogEventProcessor(k:IConfirmDialog, _arg_2:WindowEvent):void
        {
            k.dispose();
            this.resetPlacedOfferData();
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
            {
                HabboWebTools.openWebPageAndMinimizeClient(getProperty(ExternalVariables.WEB_SHOP_RELATIVE_URL));
            }
        }

        private function noDucketsConfirmDialogEventProcessor(k:IConfirmDialog, _arg_2:WindowEvent):void
        {
            var _local_3:String;
            k.dispose();
            this.resetPlacedOfferData();
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
            {
                _local_3 = getProperty("link.format.duckets");
                if (_local_3 != "")
                {
                    this._windowManager.alert("${catalog.alert.external.link.title}", "${catalog.alert.external.link.desc}", 0, this.onExternalLink);
                    HabboWebTools.navigateToURL(_local_3, "habboMain");
                }
            }
        }

        private function onExternalLink(k:IAlertDialog, _arg_2:WindowEvent):void
        {
            k.dispose();
        }

        public function redeemVoucher(k:String):void
        {
            var _local_2:IMessageComposer = new RedeemVoucherMessageComposer(k);
            this.send(_local_2);
            _local_2.dispose();
            _local_2 = null;
        }

        public function productDataReady():void
        {
            this._productDataReady = true;
            events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_INITIALIZED));
        }

        public function isDraggable(k:IPurchasableOffer):Boolean
        {
            return ((((((((getBoolean("catalog.drag_and_drop")) && (!(this._roomSession == null))) && ((this._catalogViewer.currentPage == null) || (this._catalogViewer.currentPage._Str_21031))) && (((this._catalogType == CatalogType.NORMAL) && ((this._roomSession.isRoomOwner) || ((this._roomSession.isGuildRoom) && (this._roomSession.roomControllerLevel >= RoomControllerLevel.GUILD_MEMBER)))) || ((this._catalogType == CatalogType.BUILDER) && (this.getBuilderFurniPlaceableStatus(k) == BuilderFurniPlaceableStatus.OKAY)))) && (!(k.pricingModel == Offer.PRICING_MODEL_BUNDLE))) && (!(k.pricingModel == Offer.PRICING_MODEL_MULTI))) && (!(k.product == null))) && (!(k.product.productType == ProductTypeEnum.EFFECT))) && (!(k.product.productType == ProductTypeEnum.HABBO_CLUB));
        }

        public function getBuilderFurniPlaceableStatus(k:IPurchasableOffer):int
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:IRoomObject;
            var _local_5:RoomUserData;
            if (k == null)
            {
                return BuilderFurniPlaceableStatus.MISSING_OFFER;
            }
            if (((this.builderFurniCount < 0) || (this.builderFurniCount >= this.builderFurniLimit)))
            {
                return BuilderFurniPlaceableStatus.FURNI_LIMIT_REACHED;
            }
            if (this.roomSession == null)
            {
                return BuilderFurniPlaceableStatus.NOT_IN_ROOM;
            }
            if (!this.roomSession.isRoomOwner)
            {
                return BuilderFurniPlaceableStatus.NOT_ROOM_OWNER;
            }
            if (((this.roomSession.isGuildRoom) && (!(getBoolean("builders.club.furniture.placement.group.room.enabled")))))
            {
                return BuilderFurniPlaceableStatus.GUILD_ROOM;
            }
            if (this.builderSecondsLeft <= 0)
            {
                _local_2 = this.roomEngine.getRoomObjectCount(this.roomSession.roomId, RoomObjectCategoryEnum.OBJECT_CATEGORY_USER);
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _local_4 = this.roomEngine.getRoomObjectWithIndex(this.roomSession.roomId, _local_3, RoomObjectCategoryEnum.OBJECT_CATEGORY_USER);
                    _local_5 = this.roomSession.userDataManager.getUserDataByIndex(_local_4.getId());
                    if (((((!(_local_5 == null)) && (_local_5.type == RoomObjectTypeEnum.HABBO)) && (!(_local_5.roomObjectId == this.roomSession.ownUserRoomId))) && (!(_local_5.isModerator))))
                    {
                        return BuilderFurniPlaceableStatus.VISITORS_IN_ROOM;
                    }
                    _local_3++;
                }
            }
            return BuilderFurniPlaceableStatus.OKAY;
        }

        private function updateRoom(k:String, _arg_2:String):void
        {
            var _local_3:String = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId, RoomObjectVariableEnum.ROOM_WALL_TYPE);
            var _local_4:String = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId, RoomObjectVariableEnum.ROOM_FLOOR_TYPE);
            var _local_5:String = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId, RoomObjectVariableEnum.ROOM_LANDSCAPE_TYPE);
            _local_3 = (((_local_3) && (_local_3.length > 0)) ? _local_3 : "101");
            _local_4 = (((_local_4) && (_local_4.length > 0)) ? _local_4 : "101");
            _local_5 = (((_local_5) && (_local_5.length > 0)) ? _local_5 : "1.1");
            switch (k)
            {
                case "floor":
                    this._roomEngine.updateObjectRoom(this._roomEngine.activeRoomId, _arg_2, _local_3, _local_5, true);
                    return;
                case "wallpaper":
                    this._roomEngine.updateObjectRoom(this._roomEngine.activeRoomId, _local_4, _arg_2, _local_5, true);
                    return;
                case "landscape":
                    this._roomEngine.updateObjectRoom(this._roomEngine.activeRoomId, _local_4, _local_3, _arg_2, true);
                    return;
                default:
                    this._roomEngine.updateObjectRoom(this._roomEngine.activeRoomId, _local_4, _local_3, _local_5, true);
            }
        }

        public function requestSelectedItemToMover(k:_Str_4431, _arg_2:IPurchasableOffer, _arg_3:Boolean=false):void
        {
            var _local_5:int;
            if (!this.isDraggable(_arg_2))
            {
                return;
            }
            var _local_4:IProduct = _arg_2.product;
            switch (_local_4.productType)
            {
                case ProductTypeEnum.FLOOR:
                    _local_5 = RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE;
                    break;
                case ProductTypeEnum.WALL:
                    _local_5 = RoomObjectCategoryEnum.OBJECT_CATEGORY_WALLITEM;
                    break;
            }
            var _local_6:Boolean = this._roomEngine.initializeRoomObjectInsert(RoomObjectPlacementSource.CATALOG, -(_arg_2.offerId), _local_5, _local_4.productClassId, ((_local_4.extraParam) ? _local_4.extraParam.toString() : null));
            if (_local_6)
            {
                this._purchasableOffer = _arg_2;
                this._Str_8970 = k;
                this.hideMainWindow();
                this._isObjectMoverRequested = true;
                this._placeMultipleObjects = _arg_3;
            }
        }

        private function onObjectSelected(k:RoomEngineObjectEvent):void
        {
            var _local_2:RoomUserData;
            if (k == null)
            {
                return;
            }
            if (((this.buildersClubEnabled) && ((!(this._initialized)) || (!(this.getCatalogNavigator(CatalogType.BUILDER).initialized)))))
            {
                this.init();
                this.refreshCatalogIndex(CatalogType.BUILDER);
            }
            if (((k.type == RoomEngineObjectEvent.SELECTED) && (k.category == RoomObjectCategoryEnum.OBJECT_CATEGORY_USER)))
            {
                _local_2 = this.getUserDataForEvent(k);
                if (_local_2 != null)
                {
                    events.dispatchEvent(new CatalogUserEvent(CatalogEvent.CATALOG_USER_SELECTED, _local_2.id, _local_2.name));
                }
            }
        }

        private function onFriendBarSelectionEvent(k:FriendBarSelectionEvent):void
        {
            var _local_2:int;
            var _local_3:String;
            var _local_4:_Str_4431;
            if (((this._isObjectMoverRequested) && (k.type == FriendBarSelectionEvent.FBVE_FRIEND_SELECTED)))
            {
                this.resetPlacedOfferData(true);
                if (((this._purchasableOffer == null) || (this._purchasableOffer.disposed)))
                {
                    this.resetObjectMover();
                    return;
                }
                _local_2 = k._Str_9566;
                _local_3 = k._Str_24718;
                _local_4 = this._Str_8970;
                if (_local_4 != null)
                {
                    _local_4._Str_8347(true, _local_3);
                }
                this.resetObjectMover(false);
                this.cancelFurniInMover();
            }
        }

        private function getUserDataForEvent(k:RoomEngineObjectEvent):RoomUserData
        {
            var _local_3:IRoomSession;
            var _local_2:RoomUserData;
            if (this._roomSessionManager != null)
            {
                _local_3 = this._roomSessionManager.getSession(k.roomId);
                if (_local_3 != null)
                {
                    _local_2 = _local_3.userDataManager.getUserDataByIndex(k.objectId);
                }
            }
            return _local_2;
        }

        private function onObjectPlaceOnUser(k:RoomEngineObjectPlacedOnUserEvent):void
        {
            var _local_2:String;
            var _local_3:RoomUserData;
            var _local_4:_Str_4431;
            if (((this._isObjectMoverRequested) && (k.type == RoomEngineObjectEvent.PLACED_ON_USER)))
            {
                this.resetPlacedOfferData(true);
                if (((this._purchasableOffer == null) || (this._purchasableOffer.disposed)))
                {
                    this.resetObjectMover();
                    return;
                }
                _local_2 = null;
                _local_3 = this.getUserDataForEvent(k);
                if (_local_3 != null)
                {
                    _local_2 = _local_3.name;
                }
                _local_4 = this._Str_8970;
                if (_local_4 != null)
                {
                    _local_4._Str_8347(true, _local_2);
                }
                this.resetObjectMover(false);
                this.cancelFurniInMover();
            }
        }

        private function onObjectPlacedInRoom(k:RoomEngineObjectPlacedEvent):void
        {
            var _local_2:int;
            var _local_3:IProduct;
            var _local_4:Boolean;
            var _local_5:_Str_4431;
            var _local_6:IRoomObjectController;
            var _local_7:int;
            var _local_8:Vector.<ICatalogNode>;
            if (((this._isObjectMoverRequested) && (k.type == RoomEngineObjectEvent.PLACED)))
            {
                this.resetPlacedOfferData(true);
                if (((this._purchasableOffer == null) || (this._purchasableOffer.disposed)))
                {
                    this.resetObjectMover();
                    return;
                }
                _local_2 = k.category;
                _local_3 = this._purchasableOffer.product;
                _local_4 = false;
                if (_local_2 == RoomObjectCategoryEnum.OBJECT_CATEGORY_WALLITEM)
                {
                    switch (_local_3.furnitureData.className)
                    {
                        case "floor":
                        case "wallpaper":
                        case "landscape":
                            _local_4 = ((k.placedOnFloor) || (k.placedOnWall));
                            break;
                        default:
                            _local_4 = k._Str_4057;
                    }
                }
                else
                {
                    _local_4 = k._Str_4057;
                }
                if (!_local_4)
                {
                    this.resetObjectMover();
                    return;
                }
                this._placedObjectPurchaseData = new PlacedObjectPurchaseData(k.roomId, k.objectId, k.category, k._Str_7031, k.x, k.y, k.direction, this._purchasableOffer);
                _local_5 = this._Str_8970;
                if (_local_5 != null)
                {
                    _local_5._Str_8347(true, null);
                }
                switch (this._catalogType)
                {
                    case CatalogType.NORMAL:
                        if (_local_2 == RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE)
                        {
                            this._roomEngine.addObjectFurniture(k.roomId, k.objectId, _local_3.productClassId, new Vector3d(k.x, k.y, k.z), new Vector3d(k.direction, 0, 0), 0, new LegacyStuffData());
                        }
                        else
                        {
                            if (_local_2 == RoomObjectCategoryEnum.OBJECT_CATEGORY_WALLITEM)
                            {
                                switch (_local_3.furnitureData.className)
                                {
                                    case "floor":
                                    case "wallpaper":
                                    case "landscape":
                                        this.updateRoom(_local_3.furnitureData.className, _local_3.extraParam);
                                        break;
                                    default:
                                        this._roomEngine.addObjectWallItem(k.roomId, k.objectId, _local_3.productClassId, new Vector3d(k.x, k.y, k.z), new Vector3d((k.direction * 45), 0, 0), 0, k._Str_4766, 0);
                                }
                            }
                        }
                        _local_6 = (this._roomEngine.getRoomObject(k.roomId, k.objectId, k.category) as IRoomObjectController);
                        if (_local_6)
                        {
                            _local_6.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_ALPHA_MULTIPLIER, 0.5);
                        }
                        return;
                    case CatalogType.BUILDER:
                        _local_7 = this._purchasableOffer.page.pageId;
                        if (_local_7 == CatalogNavigator._Str_5778)
                        {
                            _local_8 = this.currentCatalogNavigator._Str_5719(this._purchasableOffer.offerId, true);
                            if (_local_8 != null)
                            {
                                _local_7 = _local_8[0].pageId;
                            }
                        }
                        switch (_local_2)
                        {
                            case RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE:
                                this.send(new BuildersClubPlaceRoomItemMessageComposer(_local_7, this._purchasableOffer.offerId, _local_3.extraParam, k.x, k.y, k.direction));
                                break;
                            case RoomObjectCategoryEnum.OBJECT_CATEGORY_WALLITEM:
                                this.send(new BuildersClubPlaceWallItemMessageComposer(_local_7, this._purchasableOffer.offerId, _local_3.extraParam, k._Str_7031));
                                break;
                        }
                        if (this._placeMultipleObjects)
                        {
                            this.requestSelectedItemToMover(_local_5, this._purchasableOffer, true);
                        }
                        else
                        {
                            this.toggleToBuildersClub();
                        }
                        return;
                }
            }
        }

        private function resetObjectMover(k:Boolean=true):void
        {
            if (((k) && (this._isObjectMoverRequested)))
            {
                this.showMainWindow();
            }
            this._isObjectMoverRequested = false;
            this._Str_8970 = null;
        }

        public function syncPlacedOfferWithPurchase(k:IPurchasableOffer):void
        {
            if (this._placedObjectPurchaseData)
            {
                if (this._placedObjectPurchaseData.offerId != k.offerId)
                {
                    this.resetPlacedOfferData();
                }
            }
        }

        public function resetPlacedOfferData(k:Boolean=false):void
        {
            if (!k)
            {
                this.resetObjectMover();
            }
            if (this._placedObjectPurchaseData != null)
            {
                if (this._placedObjectPurchaseData.category == RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE)
                {
                    this._roomEngine.disposeObjectFurniture(this._placedObjectPurchaseData.roomId, this._placedObjectPurchaseData.objectId);
                }
                else
                {
                    if (this._placedObjectPurchaseData.category == RoomObjectCategoryEnum.OBJECT_CATEGORY_WALLITEM)
                    {
                        switch (this._placedObjectPurchaseData.furniData.className)
                        {
                            case "floor":
                            case "wallpaper":
                            case "landscape":
                                this.updateRoom("reset", "");
                                break;
                            default:
                                this._roomEngine.disposeObjectWallItem(this._placedObjectPurchaseData.roomId, this._placedObjectPurchaseData.objectId);
                        }
                    }
                    else
                    {
                        this._roomEngine.deleteRoomObject(this._placedObjectPurchaseData.objectId, this._placedObjectPurchaseData.category);
                    }
                }
                this._placedObjectPurchaseData.dispose();
                this._placedObjectPurchaseData = null;
            }
        }

        public function cancelFurniInMover():void
        {
            if (this._purchasableOffer != null)
            {
                this._roomEngine.cancelRoomObjectInsert();
                this._isObjectMoverRequested = false;
                this._purchasableOffer = null;
            }
        }

        private function onItemAddedToInventory(k:HabboInventoryItemAddedEvent):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:String;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:String;
            var _local_9:String;
            var _local_10:String;
            if (((!(this._placedObjectPurchaseData == null)) && (this._placedObjectPurchaseData.productClassId == k.classId)))
            {
                if (this._placedObjectPurchaseData.roomId == this._roomEngine.activeRoomId)
                {
                    _local_2 = k.stripId;
                    _local_3 = this._placedObjectPurchaseData.category;
                    _local_4 = this._placedObjectPurchaseData._Str_7031;
                    _local_5 = this._placedObjectPurchaseData.x;
                    _local_6 = this._placedObjectPurchaseData.y;
                    _local_7 = this._placedObjectPurchaseData.direction;
                    switch (k.category)
                    {
                        case FurniCategory.FLOOR:
                            _local_8 = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId, RoomObjectVariableEnum.ROOM_FLOOR_TYPE);
                            if (this._placedObjectPurchaseData.extraParameter != _local_8)
                            {
                                this.send(new RequestRoomPropertySet(_local_2));
                            }
                            break;
                        case FurniCategory.WALL_PAPER:
                            _local_9 = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId, RoomObjectVariableEnum.ROOM_WALL_TYPE);
                            if (this._placedObjectPurchaseData.extraParameter != _local_9)
                            {
                                this.send(new RequestRoomPropertySet(_local_2));
                            }
                            break;
                        case FurniCategory.LANDSCAPE:
                            _local_10 = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId, RoomObjectVariableEnum.ROOM_LANDSCAPE_TYPE);
                            if (this._placedObjectPurchaseData.extraParameter != _local_10)
                            {
                                this.send(new RequestRoomPropertySet(_local_2));
                            }
                            break;
                        default:
                            this.send(new PlaceObjectMessageComposer(_local_2, _local_3, _local_4, _local_5, _local_6, _local_7));
                    }
                    this.resetPlacedOfferData();
                }
            }
        }

        public function setImageFromAsset(k:IWindow, _arg_2:String, _arg_3:Function):void
        {
            if (((!(_arg_2)) || (!(assets))))
            {
                return;
            }
            var _local_4:BitmapDataAsset = (assets.getAssetByName(_arg_2) as BitmapDataAsset);
            if (_local_4 == null)
            {
                this.retrievePreviewAsset(_arg_2, _arg_3);
                return;
            }
            if (k)
            {
                HabboCatalog.setElementImageCentered(k, (_local_4.content as BitmapData));
            }
        }

        public function get imageGalleryHost():String
        {
            return getProperty("image.library.catalogue.url");
        }

        private function retrievePreviewAsset(k:String, _arg_2:Function):void
        {
            if (((!(k)) || (!(assets))))
            {
                return;
            }
            var _local_3:* = ((this.imageGalleryHost + k) + ".png");
            var _local_4:URLRequest = new URLRequest(_local_3);
            var _local_5:AssetLoaderStruct = assets.loadAssetFromFile(k, _local_4, "image/png");
            if (!_local_5)
            {
                return;
            }
            if (_arg_2 != null)
            {
                _local_5.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, _arg_2);
            }
        }

        private function showMainWindow():void
        {
            var k:IDesktopWindow;
            if ((((!(this._windowManager == null)) && (!(this._mainContainer == null))) && (this._mainContainer.parent == null)))
            {
                k = this._windowManager.getDesktop(DESKTOP_WINDOW_LAYER);
                if (k != null)
                {
                    k.addChild(this._mainContainer);
                }
            }
        }

        private function hideMainWindow():void
        {
            var k:IDesktopWindow;
            if ((((!(this._windowManager == null)) && (!(this._mainContainer == null))) && (!(this._mainContainer.parent == null))))
            {
                k = this._windowManager.getDesktop(DESKTOP_WINDOW_LAYER);
                if (((!(k == null)) && (!(this._doNotCloseAfterVipPurchase))))
                {
                    k.removeChild(this._mainContainer);
                    if (this._catalogViewer != null)
                    {
                        this._catalogViewer._Str_20980();
                    }
                }
                this._doNotCloseAfterVipPurchase = false;
            }
        }

        private function mainWindowVisible():Boolean
        {
            return ((!(this._windowManager == null)) && (!(this._mainContainer == null))) && (!(this._mainContainer.parent == null));
        }

        public function update(k:uint):void
        {
            var _local_2:Number;
            var _local_3:Number;
            if (this._roomPreviewer != null)
            {
                this._roomPreviewer.updatePreviewRoomView();
            }
            if ((getTimer() - this._builderMembershipDisplayUpdateTime) > 500)
            {
                _local_2 = this.builderSecondsLeft;
                _local_3 = this.builderSecondsLeftWithGrace;
                if ((((_local_2 > -3) && (_local_2 < 200)) || ((_local_3 > -3) && (_local_3 < 200))))
                {
                    this.refreshBuilderStatus();
                }
            }
        }

        public function onGuildMemberships(k:GuildMembershipsMessageEvent):void
        {
            if (this._guildMembershipsController)
            {
                this._guildMembershipsController.onGuildMembershipsMessageEvent(k);
            }
        }

        public function verifyClubLevel(k:int=1):Boolean
        {
            if (this._sessionDataManager.clubLevel >= k)
            {
                return true;
            }
            this.openClubCenter();
            return false;
        }

        public function openClubCenter():void
        {
            context.createLinkEvent("habboUI/open/hccenter");
        }

        private function onGuildVisualSettingsChanged(k:GuildSettingsChangedInManageEvent):void
        {
            if (this._guildMembershipsController)
            {
                this._guildMembershipsController.onGuildVisualSettingsChanged(k.guildId);
            }
        }

        public function get avatarEditor():IHabboAvatarEditor
        {
            return this._avatarEditor;
        }

        public function checkGiftable(k:IPurchasableOffer):void
        {
            this.send(new GetIsOfferGiftableComposer(k.offerId));
        }

        public function rememberPageDuringVipPurchase(k:int):void
        {
            var _local_2:ICatalogNode = this.currentCatalogNavigator.getNodeById(k);
            if (_local_2)
            {
                this._pageToOpenAfterVipPurchase = _local_2.pageName;
            }
            else
            {
                this._pageToOpenAfterVipPurchase = "frontpage";
            }
        }

        public function forgetPageDuringVipPurchase():void
        {
            this._pageToOpenAfterVipPurchase = null;
            this._doNotCloseAfterVipPurchase = false;
        }

        public function doNotCloseAfterVipPurchase():void
        {
            this._doNotCloseAfterVipPurchase = (!(this._pageToOpenAfterVipPurchase == null));
        }

        private function initBundleDiscounts():void
        {
            if (getBoolean("bundle.dynamic.discounts.enabled"))
            {
                this.sendGetBundleDiscountRuleset();
            }
        }

        private function sendGetBundleDiscountRuleset():void
        {
            this.send(new GetBundleDiscountRulesetComposer());
        }

        public function sendGetProductOffer(k:int):void
        {
            this.send(new GetProductOfferComposer(k));
        }

        private function onBundleDiscountRulesetMessageEvent(k:BundleDiscountRulesetMessageEvent):void
        {
            var _local_2:BundleDiscountRulesetMessageParser = k.getParser();
            this._bundleDiscountRuleset = _local_2.bundleDiscountRuleset;
            this._utils._Str_24024();
        }

        private function onLimitedEditionSoldOut(k:LimitedEditionSoldOutEvent):void
        {
            this._windowManager.alert("${catalog.alert.limited_edition_sold_out.title}", "${catalog.alert.limited_edition_sold_out.message}", 0, this.alertDialogEventProcessor);
            if (this._purchaseConfirmationDialog != null)
            {
                this._purchaseConfirmationDialog.dispose();
                this._purchaseConfirmationDialog = null;
            }
        }

        private function onProductOffer(k:ProductOfferEvent):void
        {
            var _local_7:Offer;
            var _local_8:IFurnitureData;
            var _local_2:ProductOfferMessageParser = k.getParser();
            var _local_3:CatalogPageMessageOfferData = _local_2._Str_17889;
            if (((!(_local_3)) || (_local_3.products.length == 0)))
            {
                return;
            }
            var _local_4:CatalogPageMessageProductData = _local_3.products[0];
            if (_local_4.uniqueLimitedItem)
            {
                this._catalogViewer.currentPage._Str_19621(_local_3.offerId, _local_4.uniqueLimitedItemsLeft);
            }
            var _local_5:Vector.<IProduct> = new Vector.<IProduct>(0);
            var _local_6:IProductData = this.getProductData(_local_3.localizationId);
            for each (_local_4 in _local_3.products)
            {
                _local_8 = this.getFurnitureData(_local_4.furniClassId, _local_4.productType);
                _local_5.push(new Product(_local_4.productType, _local_4.furniClassId, _local_4.extraParam, _local_4.productCount, _local_6, _local_8, this, _local_4.uniqueLimitedItem, _local_4.uniqueLimitedItemSeriesSize, _local_4.uniqueLimitedItemsLeft));
            }
            _local_7 = new Offer(_local_3.offerId, _local_3.localizationId, _local_3.isRent, _local_3.priceInCredits, _local_3.priceInActivityPoints, _local_3.activityPointType, _local_3.giftable, _local_3.clubLevel, _local_5, _local_3.bundlePurchaseAllowed, this);
            if (!this.isOfferCompatibleWithCurrentMode(_local_7))
            {
                _local_7.dispose();
                return;
            }
            if (((this._catalogViewer) && (this._catalogViewer.currentPage)))
            {
                _local_7.page = this._catalogViewer.currentPage;
                this._catalogViewer.currentPage.dispatchWidgetEvent(new SelectProductEvent(_local_7));
                if (((_local_7.product) && (_local_7.product.productType == ProductTypeEnum.WALL)))
                {
                    this._catalogViewer.currentPage.dispatchWidgetEvent(new SetExtraPurchaseParameterEvent(_local_7.product.extraParam));
                }
                if (((this._isObjectMoverRequested) && (this._purchasableOffer)))
                {
                    this._purchasableOffer = _local_7;
                }
            }
        }

        private function onBuildersClubSubscriptionStatus(k:BuildersClubSubscriptionStatusMessageEvent):void
        {
            var _local_2:BuildersClubSubscriptionStatusMessageParser = k.getParser();
            this._builderFurniLimit = _local_2._Str_15864;
            this._builderMaxFurniLimit = _local_2._Str_24094;
            this._builderMembershipSecondsLeft = _local_2._Str_3709;
            this._builderMembershipUpdateTime = getTimer();
            this._builderMembershipSecondsLeftWithGrace = _local_2._Str_24379;
            if (ExternalInterface.available)
            {
                ExternalInterface.call("FlashExternalInterface.updateBuildersClub", (this._builderMembershipSecondsLeft > 0));
            }
            if (this.currentPage != null)
            {
                this.currentPage.dispatchWidgetEvent(new CatalogWidgetBuilderSubscriptionUpdatedEvent());
            }
            this.refreshBuilderStatus();
        }

        private function onBuildersClubFurniCount(k:BuildersClubFurniCountMessageEvent):void
        {
            this._builderFurniCount = k.getParser().furniCount;
            if (this.currentPage != null)
            {
                this.currentPage.dispatchWidgetEvent(new CatalogWidgetBuilderSubscriptionUpdatedEvent());
            }
            this.refreshBuilderStatus();
        }

        private function refreshBuilderStatus():void
        {
            var k:Number = (this._builderMembershipSecondsLeft - ((getTimer() - this._builderMembershipUpdateTime) / 1000));
            var _local_2:Number = (this._builderMembershipSecondsLeftWithGrace - ((getTimer() - this._builderMembershipUpdateTime) / 1000));
            if ((((this._builderMembershipActiveSoFar) && (k <= 0)) && (_local_2 > 0)))
            {
                events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_BUILDER_MEMBERSHIP_IN_GRACE));
            }
            else
            {
                if (((this._builderMembershipActiveWithGrace) && (_local_2 <= 0)))
                {
                    events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_BUILDER_MEMBERSHIP_EXPIRED));
                }
            }
            this._builderMembershipActiveSoFar = (k > 0);
            this._builderMembershipActiveWithGrace = (_local_2 > 0);
            var _local_3:String = ("builder.header.status." + ((this._builderMembershipActiveSoFar) ? "member" : ((this._builderMembershipActiveWithGrace) ? "grace" : "trial")));
            var _local_4:String = this._localization.getLocalization(_local_3);
            this._localization.registerParameter("builder.header.title", "bcstatus", _local_4);
            var _local_5:String = ((this._builderMembershipActiveSoFar) ? FriendlyTime.format(this._localization, k) : ((this._builderMembershipActiveWithGrace) ? FriendlyTime.format(this._localization, _local_2) : _local_4));
            this._localization.registerParameter("builder.header.status.membership", "duration", (('<font color="#ff8d00"><b>' + _local_5) + "</b></font>"));
            this._localization.registerParameter("builder.header.status.limit", "count", (('<font color="#ff8d00"><b>' + this._builderFurniCount) + "</b></font>"));
            this._localization.registerParameter("builder.header.status.limit", "limit", (('<font color="#ff8d00"><b>' + this._builderFurniLimit) + "</b></font>"));
            this._builderMembershipDisplayUpdateTime = getTimer();
        }

        public function get discountEnabled():Boolean
        {
            return (getBoolean("bundle.dynamic.discounts.enabled")) && (!(this._catalogType == CatalogType.BUILDER));
        }

        public function get bundleDiscountRuleset():BundleDiscountRuleset
        {
            return this._bundleDiscountRuleset;
        }

        public function get multiplePurchaseEnabled():Boolean
        {
            return (getBoolean("catalog.multiple.purchase.enabled")) && (!(this._catalogType == CatalogType.BUILDER));
        }

        public function get newAdditionsPageOpenDisabled():Boolean
        {
            return getBoolean("catalog.new.additions.page.open.disabled");
        }

        public function showVipBenefits():void
        {
            if (!this._utils)
            {
                this.init();
            }
            if (this._utils)
            {
                if (!this.getCatalogNavigator(CatalogType.NORMAL).initialized)
                {
                    this.refreshCatalogIndex(CatalogType.NORMAL);
                }
                this._utils.showVipBenefits();
            }
        }

        public function get currentPage():ICatalogPage
        {
            return (this._catalogViewer == null) ? null : this._catalogViewer.currentPage;
        }

        public function displayProductIcon(k:String, _arg_2:int, _arg_3:IBitmapWrapperWindow):void
        {
            this._utils.displayProductIcon(k, _arg_2, _arg_3);
        }

        public function openRentConfirmationWindow(k:IFurnitureData, _arg_2:Boolean, _arg_3:int=-1, _arg_4:int=-1, _arg_5:Boolean=false):void
        {
            if (this._rentConfirmationWindow == null)
            {
                this._rentConfirmationWindow = new RentConfirmationWindow(this);
            }
            this._rentConfirmationWindow.show(k, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        public function get roomSession():IRoomSession
        {
            return this._roomSession;
        }

        public function get linkPattern():String
        {
            return "catalog/";
        }

        public function linkReceived(k:String):void
        {
            var link:Array = k.split("/");
            if (link.length < 2)
            {
                return;
            }
            switch (link[1])
            {
                case "open":
                    if (link.length > 2)
                    {
                        this.openCatalogPage(link[2]);
                    }
                    else
                    {
                        this.openCatalog();
                    }
                    return;
                case "warehouse":
                    if (link.length > 2)
                    {
                        this.openCatalogPage(link[2], CatalogType.BUILDER);
                    }
                    else
                    {
                        this.toggleCatalog(CatalogType.BUILDER, true);
                    }
                    return;
                case "club_buy":
                    this.openClubCenter();
                    return;
                default:
                    Logger.log(("Catalog unknown link-type receive: " + link[1]));
            }
        }

        public function get inventory():IHabboInventory
        {
            return this._inventory;
        }

        public function get mainContainer():IWindowContainer
        {
            return this._mainContainer;
        }

        public function toggleToBuildersClub():void
        {
            this.toggleCatalog(CatalogType.BUILDER);
        }

        public function get catalogType():String
        {
            return this._catalogType;
        }

        public function getCatalogNavigator(k:String):ICatalogNavigator
        {
            return (this._catalogNavigators != null) ? this._catalogNavigators[k] : null;
        }

        public function get currentCatalogNavigator():ICatalogNavigator
        {
            return this.getCatalogNavigator(this._catalogType);
        }

        public function get builderFurniLimit():int
        {
            return this._builderFurniLimit;
        }

        public function get builderFurniCount():int
        {
            return this._builderFurniCount;
        }

        public function get builderMaxFurniLimit():int
        {
            return this._builderMaxFurniLimit;
        }

        public function get builderSecondsLeft():Number
        {
            return this._builderMembershipSecondsLeft - ((getTimer() - this._builderMembershipUpdateTime) / 1000);
        }

        public function get builderSecondsLeftWithGrace():Number
        {
            return this._builderMembershipSecondsLeftWithGrace - ((getTimer() - this._builderMembershipUpdateTime) / 1000);
        }

        public function get isDoorModeOverriddenInCurrentRoom():Boolean
        {
            var k:int;
            var _local_4:IRoomObject;
            var _local_5:IRoomObject;
            if (((!(this.buildersClubEnabled)) || (this.builderSecondsLeft > 0)))
            {
                return false;
            }
            var _local_2:int = this.roomEngine.getRoomObjectCount(this.roomSession.roomId, RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE);
            k = 0;
            while (k < _local_2)
            {
                _local_4 = this.roomEngine.getRoomObjectWithIndex(this.roomSession.roomId, k, RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE);
                if (_Str_6093._Str_7070(_local_4.getId()))
                {
                    return true;
                }
                k++;
            }
            var _local_3:int = this.roomEngine.getRoomObjectCount(this.roomSession.roomId, RoomObjectCategoryEnum.OBJECT_CATEGORY_WALLITEM);
            k = 0;
            while (k < _local_3)
            {
                _local_5 = this.roomEngine.getRoomObjectWithIndex(this.roomSession.roomId, k, RoomObjectCategoryEnum.OBJECT_CATEGORY_WALLITEM);
                if (_Str_6093._Str_7070(_local_5.getId()))
                {
                    return true;
                }
                k++;
            }
            return false;
        }

        public function getOfferCenter(k:IOfferExtension):IOfferCenter
        {
            if (this._offerCenter == null)
            {
                this._offerCenter = new OfferCenter(this.windowManager, assets, this);
            }
            this._offerCenter._Str_24459 = k;
            return this._offerCenter;
        }

        public function isNewIdentity():Boolean
        {
            return getInteger("new.identity", 0) > 0;
        }

        public function useNonTabbedCatalog():Boolean
        {
            return getBoolean("client.desktop.use.non.tabbed.catalog");
        }

		private function onFireworkChargeHandler(_arg_1:FireworkChargeDataEvent):void
        {
            var parser:FireworkChargeDataParser = _arg_1.getParser();
            if (((this._fireworkChargeDialog == null) || (this._fireworkChargeDialog.disposed)))
            {
                this._fireworkChargeDialog = new FireworksChargeConfirmationDialog(this, this._localization);
            }
            this._fireworkChargeDialog._SafeStr_8412(parser.fireworkChargeData);
        }
    }
}
