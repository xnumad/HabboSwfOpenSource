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
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_4615;
    import com.sulake.habbo.catalog.navigation.RequestedPage;
    import com.sulake.habbo.catalog.purchase.RoomAdPurchaseData;
    import com.sulake.habbo.catalog.purchase.RentConfirmationWindow;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_3920;
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
    import com.sulake.habbo.communication.messages.incoming.users._Str_9145;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_7677;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_4508;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_8801;
    import com.sulake.habbo.communication.messages.incoming._Str_329._Str_4691;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_8409;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_8530;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_7086;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_7597;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_8078;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_7288;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPagesListEvent;
    import com.sulake.habbo.communication.messages.incoming.marketplace._Str_7697;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_8504;
    import com.sulake.habbo.communication.messages.incoming.marketplace._Str_5727;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_3352;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_8784;
    import com.sulake.habbo.communication.messages.incoming.marketplace._Str_7169;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_5417;
    import com.sulake.habbo.communication.messages.incoming.marketplace._Str_6344;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_5159;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_5264;
    import com.sulake.habbo.communication.messages.incoming.users.UserCreditsEvent;
    import com.sulake.habbo.communication.messages.incoming.users._Str_7452;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_5425;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_7706;
    import com.sulake.habbo.communication.messages.incoming.users._Str_3492;
    import com.sulake.habbo.communication.messages.incoming.marketplace._Str_6022;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_9560;
    import com.sulake.habbo.communication.messages.incoming.marketplace._Str_6345;
    import com.sulake.habbo.communication.messages.incoming._Str_329._Str_5376;
    import com.sulake.habbo.communication.messages.incoming._Str_329._Str_7079;
    import com.sulake.habbo.communication.messages.incoming.marketplace._Str_5946;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_5514;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_6375;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_9458;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_8418;
    import com.sulake.habbo.catalog.event.CatalogEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_12000;
    import com.sulake.habbo.catalog.navigation.ICatalogNavigator;
    import com.sulake.core.Core;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_9764;
    import com.sulake.habbo.catalog.navigation.ICatalogNode;
    import com.sulake.habbo.catalog.enum.CatalogType;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_11783;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_10613;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_9862;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_10123;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_10231;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_12242;
    import com.sulake.habbo.communication.messages.outgoing._Str_463._Str_11638;
    import com.sulake.habbo.communication.messages.outgoing._Str_463._Str_11776;
    import com.sulake.habbo.communication.messages.outgoing._Str_463._Str_12504;
    import com.sulake.habbo.catalog.navigation.CatalogNavigator;
    import com.sulake.habbo.catalog.viewer.Offer;
    import com.sulake.habbo.catalog.club.ClubBuyOfferData;
    import com.sulake.habbo.catalog.enum.CatalogPageName;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habboclient._Str_5079;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.habbo.catalog.purse.IPurse;
    import com.sulake.habbo.catalog.recycler.IRecycler;
    import com.sulake.habbo.communication.messages.outgoing._Str_307._Str_11584;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_10589;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_12488;
    import com.sulake.habbo.communication.messages.outgoing._Str_307._Str_9940;
    import com.sulake.habbo.communication.messages.outgoing._Str_307._Str_11685;
    import com.sulake.habbo.communication.messages.outgoing._Str_307._Str_12361;
    import com.sulake.habbo.communication.messages.outgoing._Str_307._Str_11296;
    import com.sulake.habbo.communication.messages.outgoing._Str_307._Str_7890;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_12442;
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
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_11178;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_11580;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import flash.events.TimerEvent;
    import flash.ui.Keyboard;
    import com.sulake.habbo.catalog.viewer.PageLocalization;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetRoomChangedEvent;
    import com.sulake.habbo.catalog.marketplace.MarketPlaceLogic;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_12034;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_10337;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_2853;
    import com.sulake.habbo.communication.messages.parser.catalog.CatalogPageMessageParser;
    import com.sulake.habbo.catalog.viewer.IPageLocalization;
    import com.sulake.habbo.catalog.viewer.Product;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_7694;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_7823;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_7635;
    import com.sulake.habbo.catalog.navigation.events.CatalogFurniPurchaseEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_7888;
    import com.sulake.habbo.communication.messages.parser.users._Str_7205;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetApproveNameResultEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.purse.UserCreditsMessageParser;
    import com.sulake.habbo.sound.HabboSoundConstants;
    import com.sulake.habbo.catalog.purse.PurseEvent;
    import com.sulake.habbo.catalog.purse.PurseUpdateEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_4007;
    import flash.external.ExternalInterface;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_7459;
    import com.sulake.habbo.communication.messages.parser.recycler.RecyclerStatusMessageParser;
    import com.sulake.habbo.communication.messages.parser.recycler.RecyclerFinishedMessageParser;
    import com.sulake.habbo.communication.messages.parser.recycler.RecyclerPrizesMessageParser;
    import com.sulake.habbo.communication.messages.parser.marketplace._Str_6774;
    import com.sulake.habbo.catalog.marketplace.MarketplaceItemStats;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceConfigurationMessageParser;
    import com.sulake.habbo.communication.messages.parser.marketplace._Str_6596;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_6792;
    import com.sulake.habbo.catalog.enum.ClubOfferRequestSource;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_7118;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSellablePetPalettesEvent;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.habbo.window.utils._Str_2910;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_12068;
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
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_12382;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_11648;
    import com.sulake.habbo.room.events.RoomEngineObjectPlacedEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_91._Str_5270;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_6790;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.core.window.components.IDesktopWindow;
    import flash.utils.getTimer;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_12467;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_11294;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_11905;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_7779;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_7328;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_6732;
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
        private static const _Str_6198:uint = 1;
        private static const _Str_6092:Point = new Point(100, 20);
        private static const _Str_16980:Point = new Point(100, 5);
        private static const _Str_18347:uint = 200;
        private static const _Str_12843:int = -1;

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
        private var _Str_7186:Boolean = false;
        private var _catalogViewer:CatalogViewer;
        private var _Str_5309:Dictionary;
        private var _purse:Purse;
        private var _recyclerLogic:RecyclerLogic;
        private var _Str_3633:IMarketPlace;
        private var _mainContainer:IWindowContainer;
        private var _purchaseConfirmationDialog:PurchaseConfirmationDialog;
        private var _Str_17309:String;
        private var _Str_14119:Boolean;
        private var _Str_19689:Boolean = true;
        private var _Str_17838:Boolean = false;
        private var _Str_20242:GiftWrappingConfiguration;
        private var _Str_10284:ClubGiftController;
        private var _Str_5949:ClubOfferHandler;
        private var _Str_6818:ClubExtendController;
        private var _Str_7969:Map;
        private var _Str_4151:Boolean = false;
        private var _Str_3644:IPurchasableOffer;
        private var _Str_8970:_Str_4431;
        private var _placedObjectPurchaseData:PlacedObjectPurchaseData;
        private var _Str_7793:Boolean;
        private var _Str_19190:Boolean;
        private var _Str_2616:RoomPreviewer;
        private var _Str_5439:GuildMembershipsController;
        private var _Str_13406:OfferController;
        private var _utils:HabboCatalogUtils;
        private var _Str_13637:Boolean = false;
        private var _Str_8001:String = null;
        private var _Str_9586:_Str_4615 = null;
        private var _Str_4643:RequestedPage;
        private var _Str_17093:int;
        private var _Str_4339:RoomAdPurchaseData;
        private var _Str_8700:RentConfirmationWindow;
        private var _Str_2432:Vector.<IMessageEvent>;
        private var _catalogType:String = "NORMAL";
        private var _Str_2509:Vector.<IFurnitureData>;
        private var _Str_8752:Vector.<_Str_3920>;
        private var _Str_6911:Timer;
        private var _Str_19956:Dictionary;
        private var _Str_21515:Boolean;
        private var _Str_18106:int = -1;
        private var _Str_16097:int;
        private var _Str_19671:int;
        private var _Str_14644:int;
        private var _Str_16084:int;
        private var _Str_12490:int;
        private var _Str_19072:int;
        private var _Str_12983:Boolean;
        private var _Str_13454:Boolean;
        private var _offerCenter:OfferCenter;
		private var _fireworkChargeDialog:FireworksChargeConfirmationDialog;

        public function HabboCatalog(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            this._Str_7969 = new Map();
            super(k, _arg_2, _arg_3);
            this._purse = new Purse();
            this._utils = new HabboCatalogUtils(this);
            registerUpdateReceiver(this, 1);
            this._Str_4643 = new RequestedPage();
            k.attachComponent(new HabboClubCenter(k, 0, _arg_3), [new IIDHabboClubCenter()]);
        }

        public static function _Str_25557(k:IWindow, _arg_2:BitmapData, _arg_3:int=0):void
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

        public function get _Str_22272():GiftWrappingConfiguration
        {
            return this._Str_20242;
        }

        public function get roomEngine():IRoomEngine
        {
            return this._roomEngine;
        }

        public function get soundManager():IHabboSoundManager
        {
            return this._soundManager;
        }

        public function get _Str_26451():RoomPreviewer
        {
            if (this._Str_2616 == null)
            {
                this._Str_22913();
            }
            return this._Str_2616;
        }

        public function get navigator():IHabboNavigator
        {
            return this._newNavigator._Str_2559;
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

        public function get _Str_5320():Vector.<_Str_3920>
        {
            return this._Str_8752;
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
                "callback":this._Str_3304
            }]), new ComponentDependency(new IIDRoomEngine(), function (k:IRoomEngine):void
            {
                _roomEngine = k;
            }, false, [{
                "type":RoomEngineObjectEvent.PLACED,
                "callback":this._Str_22513
            }, {
                "type":RoomEngineObjectEvent.PLACED_ON_USER,
                "callback":this._Str_23698
            }, {
                "type":RoomEngineObjectEvent.SELECTED,
                "callback":this._Str_23336
            }]), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localization = k;
            }, false), new ComponentDependency(new IIDHabboInventory(), function (k:IHabboInventory):void
            {
                _inventory = k;
            }, false, [{
                "type":HabboInventoryItemAddedEvent.HABBO_INVENTORY_ITEM_ADDED,
                "callback":this._Str_25495
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
                "callback":this._Str_24434
            }]), new ComponentDependency(new IIDHabboGroupsManager(), null, false, [{
                "type":GuildSettingsChangedInManageEvent.GSCIME_GUILD_VISUAL_SETTINGS_CHANGED,
                "callback":this._Str_15960
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
            this._Str_2432 = new Vector.<IMessageEvent>(0);
            this.addMessageEvent(new _Str_9145(this._Str_11705));
            this.addMessageEvent(new _Str_7677(this._Str_16050));
            this.addMessageEvent(new _Str_4508(this._Str_17254));
            this.addMessageEvent(new _Str_8801(this._Str_25682));
            this.addMessageEvent(new _Str_4691(this._Str_17153));
            this.addMessageEvent(new _Str_8409(this._Str_23986));
            this.addMessageEvent(new _Str_8530(this._Str_24685));
            this.addMessageEvent(new _Str_7086(this._Str_23734));
            this.addMessageEvent(new _Str_7597(this._Str_23158));
            this.addMessageEvent(new _Str_8078(this._Str_19518));
            this.addMessageEvent(new _Str_7288(this._Str_22941));
            this.addMessageEvent(new CatalogPagesListEvent(this._Str_25188));
            this.addMessageEvent(new _Str_7697(this._Str_25346));
            this.addMessageEvent(new _Str_8504(this._Str_11267));
            this.addMessageEvent(new _Str_5727(this._Str_16010));
            this.addMessageEvent(new _Str_3352(this._Str_2960));
            this.addMessageEvent(new _Str_8784(this._Str_23837));
            this.addMessageEvent(new _Str_7169(this._Str_25537));
            this.addMessageEvent(new _Str_5417(this._Str_24973));
            this.addMessageEvent(new _Str_6344(this._Str_23861));
            this.addMessageEvent(new _Str_5159(this._Str_4970));
            this.addMessageEvent(new _Str_5264(this._Str_12366));
            this.addMessageEvent(new UserCreditsEvent(this._Str_7504));
            this.addMessageEvent(new _Str_7452(this._Str_24089));
            this.addMessageEvent(new _Str_5425(this._Str_18504));
            this.addMessageEvent(new _Str_7706(this._Str_23194));
            this.addMessageEvent(new _Str_3492(this._Str_11640));
            this.addMessageEvent(new _Str_6022(this._Str_16181));
            this.addMessageEvent(new _Str_9560(this._Str_25412));
            this.addMessageEvent(new _Str_6345(this._Str_24794));
            this.addMessageEvent(new _Str_5376(this._Str_24950));
            this.addMessageEvent(new _Str_7079(this._Str_23749));
            this.addMessageEvent(new _Str_5946(this._Str_16617));
            this.addMessageEvent(new _Str_5514(this._Str_24443));
            this.addMessageEvent(new _Str_6375(this._Str_23226));
            this.addMessageEvent(new _Str_9458(this._Str_23753));
            this.addMessageEvent(new _Str_8418(this._Str_25811));
			this.addMessageEvent(new FireworkChargeDataEvent(this.onFireworkChargeHandler));
            context.addLinkEventTracker(this);
            this._sessionDataManager.loadProductData(this);
            this._Str_19190 = this._Str_10258();
            this._videoOfferManager = new VideoOfferManager(this);
            this._Str_13406 = new OfferController(this);
            this._Str_2509 = this._sessionDataManager.getFurniData(this);
            this._Str_19956 = null;
        }

        private function addMessageEvent(k:IMessageEvent):void
        {
            this._Str_2432.push(this._communicationManager.addHabboConnectionMessageEvent(k));
        }

        override public function dispose():void
        {
            var k:IMessageEvent;
            if (disposed)
            {
                return;
            }
            removeUpdateReceiver(this);
            if (((!(this._Str_2432 == null)) && (!(this._communicationManager == null))))
            {
                for each (k in this._Str_2432)
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
            this._Str_3633 = null;
            if (this._Str_5949 != null)
            {
                this._Str_5949.dispose();
                this._Str_5949 = null;
            }
            if (this._Str_6818 != null)
            {
                this._Str_6818.dispose();
                this._Str_6818 = null;
            }
            if (this._Str_7969 != null)
            {
                this._Str_7969.dispose();
                this._Str_7969 = null;
            }
            this._roomSession = null;
            if (this._Str_8700 != null)
            {
                this._Str_8700.dispose();
                this._Str_8700 = null;
            }
            this._Str_4663();
            this._Str_4151 = false;
            this._Str_8970 = null;
            if (this._Str_2616 != null)
            {
                this._Str_2616.dispose();
                this._Str_2616 = null;
            }
            if (this._Str_5439 != null)
            {
                this._Str_5439.dispose();
                this._Str_5439 = null;
            }
            if (this._utils != null)
            {
                this._utils.dispose();
                this._utils = null;
            }
            if (this._Str_4643)
            {
                this._Str_4643 = null;
            }
            if (this._Str_13406)
            {
                this._Str_13406.dispose();
                this._Str_13406 = null;
            }
            super.dispose();
        }

        private function init():Boolean
        {
            if (((!(this._initialized)) && (this._Str_7186)))
            {
                this._Str_7718();
                this._Str_25270();
                this._Str_22909();
                this._initialized = true;
                this._Str_12017();
                this._Str_24043();
                this._Str_24591();
                this._Str_22724();
                this._Str_25752();
                this._Str_23448();
                this._Str_23722();
                this._Str_25337();
                this._Str_25130();
                events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_INITIALIZED));
                this.send(new _Str_12000());
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
            if (this._Str_5309 != null)
            {
                for each (_local_2 in this._Str_5309)
                {
                    _local_2.dispose();
                }
                this._Str_5309 = null;
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
            this._Str_9330 = true;
            this._Str_17093 = k;
            this.send(new _Str_9764(k, _arg_2, _arg_3));
        }

        public function _Str_22641(k:int, _arg_2:String="", _arg_3:int=1):void
        {
            var _local_5:Vector.<ICatalogNode>;
            var _local_4:ICatalogNavigator = this.getCatalogNavigator(CatalogType.NORMAL);
            if (_local_4 != null)
            {
                _local_5 = _local_4._Str_5719(k, true);
                if (_local_5 != null)
                {
                    this._Str_18074(_local_5[0].pageId, k, _arg_2, _arg_3);
                }
            }
        }

        public function _Str_18074(k:int, _arg_2:int, _arg_3:String="", _arg_4:int=1):void
        {
            if (((this._Str_3064 == null) || (!(this._Str_3064.offerId == _arg_2))))
            {
                this.send(new _Str_11783(k, _arg_2, _arg_3, _arg_4));
            }
            else
            {
                if (((this._Str_4339._Str_8314) && (this._Str_4339.expirationTime.getTime() < new Date().getTime())))
                {
                    this._Str_4339._Str_8314 = false;
                }
                this.send(new _Str_10613(k, _arg_2, this._Str_3064.flatId, this._Str_3064.name, this._Str_3064._Str_8314, this._Str_3064.description, this._Str_3064._Str_2712));
            }
        }

        public function _Str_23708(k:int):void
        {
            this.send(new _Str_9862(k));
        }

        public function _Str_24571(k:int):void
        {
            this.send(new _Str_10123(k));
        }

        public function _Str_22436(k:int, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:Boolean=false):void
        {
            this.send(new _Str_10231(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9));
        }

        public function get _Str_3064():RoomAdPurchaseData
        {
            return this._Str_4339;
        }

        public function set _Str_3064(k:RoomAdPurchaseData):void
        {
            this._Str_4339 = k;
        }

        public function _Str_19478(k:String, _arg_2:int):void
        {
            this.send(new _Str_12242(k, _arg_2));
        }

        public function getRecyclerStatus():void
        {
            this.send(new _Str_11638());
        }

        public function getRecyclerPrizes():void
        {
            this.send(new _Str_11776());
        }

        public function sendRecycleItems(k:Array):void
        {
            this.send(new _Str_12504(k));
        }

        public function set giftReceiver(k:String):void
        {
            this._Str_17309 = k;
        }

        public function _Str_19095():int
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

        public function _Str_5649(k:IPurchasableOffer, _arg_2:int, _arg_3:String="", _arg_4:int=1, _arg_5:IStuffData=null, _arg_6:String=null, _arg_7:Boolean=true, _arg_8:BitmapData=null):void
        {
            var _local_11:Vector.<ICatalogNode>;
            var _local_12:Array;
            var _local_13:String;
            var _local_14:ICatalogNode;
            if (_arg_2 == CatalogNavigator._Str_5778)
            {
                _local_11 = this._Str_3361._Str_5719(k.offerId, true);
                if (_local_11 != null)
                {
                    _arg_2 = _local_11[0].pageId;
                }
            }
            Logger.log(("buy: " + [_arg_4, k.offerId, _arg_3]));
            var _local_9:int = k.priceInCredits;
            var _local_10:int = k.priceInActivityPoints;
            if (this._Str_7593)
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
                this.getHabboClubOffers(k.activityPointType);
                return;
            }
            if (((k is Offer) || (this._Str_14119)))
            {
                if (((this._purchaseConfirmationDialog == null) || (this._purchaseConfirmationDialog.disposed)))
                {
                    this._purchaseConfirmationDialog = new PurchaseConfirmationDialog(this._localization, assets);
                }
                _local_12 = [];
                if (this._friendsList != null)
                {
                    _local_12 = this._friendsList._Str_9287();
                }
                _local_13 = _arg_6;
                if (_local_13 == null)
                {
                    if (this._Str_17309 != null)
                    {
                        _local_13 = this._Str_17309;
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
                        _local_14 = this._Str_3361.getNodeByName(CatalogPageName.HC_MEMBERSHIP);
                        if (_local_14 != null)
                        {
                            _arg_2 = _local_14.pageId;
                        }
                    }
                    if (_arg_2 >= 0)
                    {
                        this._Str_5949.showConfirmation((k as ClubBuyOfferData), _arg_2);
                    }
                }
            }
            if (this._Str_14119)
            {
                this._Str_14119 = false;
                this._purchaseConfirmationDialog._Str_25849();
            }
        }

        public function _Str_8986(k:Boolean):void
        {
            this._Str_14119 = k;
        }

        private function _Str_22913():void
        {
            if ((((!(this._roomEngine == null)) && (this._roomEngine.isInitialized)) && (getBoolean("catalog.furniture.animation"))))
            {
                if (this._Str_2616 == null)
                {
                    this._Str_2616 = new RoomPreviewer(this._roomEngine);
                }
            }
        }

        private function _Str_10258():Boolean
        {
            return getBoolean("toolbar.new_additions.notification.enabled");
        }

        public function openCatalog():void
        {
            this._Str_5298();
            this.toggleCatalog(CatalogType.NORMAL, true);
        }

        public function openCatalogPage(k:String, _arg_2:String=null):void
        {
            this._Str_5298();
            this.toggleCatalog(((_arg_2 == null) ? CatalogType.NORMAL : _arg_2), true, false);
            if ((((!(this._initialized)) || (this._Str_5309 == null)) || (!(this._Str_3361._Str_3961))))
            {
                this._Str_4643._Str_23666 = k;
                return;
            }
            this._Str_3361.openPage(k);
        }

        public function openRoomAdCatalogPageInExtendedMode(k:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:Date, _arg_6:int):void
        {
            var _local_7:int = this._Str_17093;
            this._Str_4339 = new RoomAdPurchaseData();
            this._Str_4339.name = _arg_2;
            this._Str_4339._Str_8314 = true;
            this._Str_4339._Str_16649 = this._roomEngine.activeRoomId;
            this._Str_4339.description = _arg_3;
            this._Str_4339.flatId = this._roomEngine.activeRoomId;
            this._Str_4339.roomName = _arg_4;
            this._Str_4339.expirationTime = _arg_5;
            this._Str_4339._Str_2712 = _arg_6;
            this.openCatalogPage(k);
            var _local_8:ICatalogNode = this._Str_3361.getNodeByName(k);
            if (((!(_local_8 == null)) && (_local_8.pageId == _local_7)))
            {
                this._Str_15954();
            }
        }

        public function openCatalogPageByOfferId(k:int, _arg_2:String):void
        {
            this.openCatalogPageById(CatalogNavigator._Str_5778, k, _arg_2);
        }

        public function openCatalogPageById(k:int, _arg_2:int, _arg_3:String):void
        {
            if ((((this._initialized) && (!(this._Str_5309 == null))) && (this.getCatalogNavigator(_arg_3)._Str_3961)))
            {
                this.toggleCatalog(_arg_3, true, false);
                this._catalogViewer._Str_21608();
                this._Str_3361.openPageById(k, _arg_2);
            }
            else
            {
                this.toggleCatalog(_arg_3);
                this._Str_4643._Str_22771 = k;
                this._Str_4643._Str_7501 = _arg_2;
            }
        }

        public function openInventoryCategory(k:String):void
        {
            if (this._inventory == null)
            {
                return;
            }
            this._inventory._Str_4511(k);
        }

        public function openCreditsHabblet():void
        {
            HabboWebTools.openWebPageAndMinimizeClient(getProperty(_Str_5079.WEB_SHOP_RELATIVEURL));
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
            return this._Str_17838;
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

        public function _Str_18225(k:String, _arg_2:String, _arg_3:int=0):IFurnitureData
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
            return this._Str_3633;
        }

        public function _Str_24953():ClubGiftController
        {
            return this._Str_10284;
        }

        public function _Str_18172():ClubOfferHandler
        {
            return this._Str_5949;
        }

        public function _Str_25905():ClubExtendController
        {
            return this._Str_6818;
        }

        public function getPublicMarketPlaceOffers(k:int, _arg_2:int, _arg_3:String, _arg_4:int):void
        {
            this.send(new _Str_11584(k, _arg_2, _arg_3, _arg_4));
        }

        public function _Str_15954():void
        {
            this.send(new _Str_10589());
        }

        public function _Str_24759():void
        {
            this.send(new _Str_12488());
        }

        public function getOwnMarketPlaceOffers():void
        {
            this.send(new _Str_9940());
        }

        public function buyMarketPlaceOffer(k:int):void
        {
            this.send(new _Str_11685(k));
        }

        public function redeemSoldMarketPlaceOffers():void
        {
            this.send(new _Str_12361());
        }

        public function redeemExpiredMarketPlaceOffer(k:int):void
        {
            this.send(new _Str_11296(k));
        }

        public function getMarketplaceItemStats(k:int, _arg_2:int):void
        {
            if (!this._communicationManager)
            {
                return;
            }
            this.send(new _Str_7890(k, _arg_2));
        }

        public function _Str_16509():GuildMembershipsController
        {
            return this._Str_5439;
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

        public function _Str_20009(k:String):Array
        {
            var _local_2:Array = this._Str_7969.getValue(k);
            if (_local_2 != null)
            {
                return _local_2.slice();
            }
            this.send(new _Str_12442(k));
            return null;
        }

        private function _Str_12017():void
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

        private function _Str_3304(k:HabboToolbarEvent):void
        {
            if (k.type != HabboToolbarEvent.HTE_TOOLBAR_CLICK)
            {
                return;
            }
            switch (k._Str_3378)
            {
                case HabboToolbarIconEnum.CATALOGUE:
                    this.toggleCatalog(CatalogType.NORMAL);
                    return;
                case HabboToolbarIconEnum.BUILDER:
                    this.toggleCatalog(CatalogType.BUILDER);
                    return;
            }
        }

        private function _Str_26417(k:String, _arg_2:int):void
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
            if (((!(this._sessionDataManager.hasSecurity(SecurityLevelEnum._Str_3569))) && (!(this.buildersClubEnabled))))
            {
                k = CatalogType.NORMAL;
            }
            var _local_4:* = (!(k == this._catalogType));
            this._catalogType = k;
            this._Str_5298();
            if (this._mainContainer == null)
            {
                if (this.init() == false)
                {
                    return;
                }
            }
            if (((this._Str_3361 == null) || (!(this._Str_3361._Str_3961))))
            {
                this._Str_16894(this._catalogType);
            }
            if ((((!(this._Str_11577())) || (_arg_2)) || (_local_4)))
            {
                if (this._Str_7793)
                {
                    this._Str_7793 = false;
                    events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_NEW_ITEMS_HIDE));
                    this._Str_24130();
                }
                this._Str_20975();
            }
            else
            {
                if (!_Str_3942._Str_9211(this._mainContainer))
                {
                    this._Str_15729();
                }
            }
            if (this._Str_11577())
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
                this._Str_15371();
            }
            if (this._Str_11577())
            {
                events.dispatchEvent(new Event(HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_OPEN));
                if (((!(this._recyclerLogic == null)) && (this._Str_9089() == "recycler")))
                {
                    this._recyclerLogic.activate();
                }
            }
            else
            {
                events.dispatchEvent(new Event(HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_CLOSE));
                if (((!(this._recyclerLogic == null)) && (this._Str_9089() == "recycler")))
                {
                    this._recyclerLogic.cancel();
                }
            }
            if (this._recyclerLogic != null)
            {
                this.setupInventoryForRecycler(((this._recyclerLogic.active) && (this._Str_11577())));
            }
            if (((_local_4) && (!(this._Str_3361 == null))))
            {
                if (_arg_3)
                {
                    this._Str_3361.deactivateCurrentNode();
                    this._Str_3361.loadFrontPage();
                }
                this._Str_3361.showIndex();
                if (this._catalogViewer != null)
                {
                    this._catalogViewer._Str_21608();
                }
            }
        }

        private function _Str_9089():String
        {
            if (this._catalogViewer == null)
            {
                return "";
            }
            return this._catalogViewer._Str_9089();
        }

        private function _Str_16894(k:String):void
        {
            this.send(new _Str_11178(k));
        }

        private function _Str_24130():void
        {
            this.send(new _Str_11580());
        }

        private function _Str_25270():void
        {
            this._Str_5309 = new Dictionary();
            this._Str_5309[CatalogType.NORMAL] = new CatalogNavigator(this, this._mainContainer, CatalogType.NORMAL);
            this._Str_5309[CatalogType.BUILDER] = new CatalogNavigator(this, this._mainContainer, CatalogType.BUILDER);
            var k:BitmapDataAsset = (assets.getAssetByName("purse_coins_small") as BitmapDataAsset);
            this._Str_2972("creditsIcon", (k.content as BitmapData));
            var _local_2:BitmapDataAsset = (assets.getAssetByName("purse_pixels_small") as BitmapDataAsset);
            this._Str_2972("pixelsIcon", (_local_2.content as BitmapData));
            var _local_3:BitmapDataAsset = (assets.getAssetByName("purse_club_small") as BitmapDataAsset);
            this._Str_2972("clubIcon", (_local_3.content as BitmapData));
        }

        private function _Str_22909():void
        {
            var k:IWindowContainer = (this._mainContainer.findChildByName("layoutContainer") as IWindowContainer);
            this._catalogViewer = new CatalogViewer(this, k);
        }

        private function _Str_7718():void
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
            this._mainContainer = (this._windowManager.buildFromXML((_local_2.content as XML), _Str_6198) as IWindowContainer);
            this._mainContainer.tags.push("habbo_catalog");
            this._mainContainer.position = _Str_16980;
            this._Str_15729();
            var _local_3:IWindow = this._mainContainer.findChildByName("titlebar_close_button");
            if (_local_3 == null)
            {
                _local_3 = this._mainContainer.findChildByTag("close");
            }
            if (_local_3 != null)
            {
                _local_3.procedure = this._Str_3046;
            }
            var _local_4:ITextFieldWindow = (this._mainContainer.findChildByName("search.input") as ITextFieldWindow);
            if (_local_4)
            {
                _local_4.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN, this._Str_21398);
                _local_4.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_UP, this._Str_21398);
                _local_4.setSelection(0, _local_4.text.length);
                _local_4.focus();
                _local_5 = this._mainContainer.findChildByName("clear_search_button");
                if (_local_5)
                {
                    _local_5.addEventListener(WindowMouseEvent.CLICK, this._Str_15242);
                }
            }
        }

        public function set _Str_9330(k:Boolean):void
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

        private function _Str_26143(k:WindowMouseEvent):void
        {
            var _local_2:ITextFieldWindow = (k.target as ITextFieldWindow);
            if (_local_2)
            {
                _local_2.setSelection(0, _local_2.text.length);
                _local_2.focus();
            }
        }

        private function _Str_15242(k:WindowMouseEvent=null):void
        {
            var _local_2:ITextFieldWindow = (this._mainContainer.findChildByName("search.input") as ITextFieldWindow);
            _local_2.caption = "";
            _local_2.setSelection(0, _local_2.text.length);
            _local_2.focus();
            var _local_3:IStaticBitmapWrapperWindow = (this._mainContainer.findChildByName("search.clear.icon") as IStaticBitmapWrapperWindow);
            _local_3.assetUri = "common_small_pen";
            if (this._catalogViewer._Str_20548 > 0)
            {
                this._Str_3361.openPageById(this._catalogViewer._Str_20548, -1);
            }
            this._mainContainer.findChildByName("search.helper").visible = true;
        }

        private function _Str_21398(k:WindowKeyboardEvent):void
        {
            if (k.type == WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN)
            {
                if (this._Str_6911)
                {
                    this._Str_6911.stop();
                }
                return;
            }
            if (this._Str_6911 == null)
            {
                this._Str_6911 = new Timer(50, 1);
            }
            if (k.target.caption.length >= 3)
            {
                this._Str_6911.addEventListener(TimerEvent.TIMER, this._Str_24381);
                this._Str_6911.start();
            }
            var _local_2:IWindow = this._mainContainer.findChildByName("search.helper");
            _local_2.visible = (k.target.caption.length == 0);
            var _local_3:IStaticBitmapWrapperWindow = (this._mainContainer.findChildByName("search.clear.icon") as IStaticBitmapWrapperWindow);
            _local_3.assetUri = ((k.target.caption.length > 0) ? "icons_close" : "common_small_pen");
            if (k.target.caption.length == 0)
            {
                this._Str_15242();
            }
            else
            {
                if (k.keyCode == Keyboard.ENTER)
                {
                    this._Str_3310(k.target.caption);
                }
            }
        }

        private function _Str_24381(k:TimerEvent):void
        {
            var _local_2:ITextFieldWindow = (this._mainContainer.findChildByName("search.input") as ITextFieldWindow);
            this._Str_3310(_local_2.caption);
        }

        private function _Str_3310(k:String):void
        {
            var _local_5:IFurnitureData;
            var _local_6:String;
            var _local_7:Vector.<ICatalogNode>;
            var _local_8:Vector.<ICatalogNode>;
            if (this._Str_6911)
            {
                this._Str_6911.stop();
            }
            if ((((this._Str_2509 == null) || (k == null)) || (k.length == 0)))
            {
                return;
            }
            var _local_2:Array = [];
            var _local_3:Vector.<IFurnitureData> = new Vector.<IFurnitureData>(0);
            var _local_4:String = k.toLowerCase().replace(" ", "");
            for each (_local_5 in this._Str_2509)
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

                        if (((this._catalogType == CatalogType.BUILDER) && (_local_5.purchaseOfferId == _Str_12843)) && (_local_5.rentOfferId == _Str_12843))
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
                            _local_7 = this._Str_3361._Str_5719(_local_5.purchaseOfferId, true);
                            _local_8 = this._Str_3361._Str_5719(_local_5.rentOfferId, true);
                            if (((!(_local_7 == null)) || ((this._catalogType == CatalogType.NORMAL) && (!(_local_8 == null)))))
                            {
                                if (_local_6.indexOf(_local_4) >= 0)
                                {
                                    _local_3.push(_local_5);
                                    if (_local_3.length >= _Str_18347)
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
            this._Str_3361.deactivateCurrentNode();
            this._catalogViewer._Str_22433(_local_3);
            this._Str_3361.filter(_local_4, _local_2);
        }

        public function furniDataReady():void
        {
            this._Str_2509 = this._sessionDataManager.getFurniData(this);
            this._Str_19956 = null;
        }

        private function onRoomSessionEvent(k:RoomSessionEvent):void
        {
            switch (k.type)
            {
                case RoomSessionEvent.STARTED:
                    this._Str_17838 = k.session._Str_7411;
                    this._roomSession = k.session;
                    if (this._recyclerLogic != null)
                    {
                        this._recyclerLogic._Str_19372(true);
                    }
                    break;
                case RoomSessionEvent.ENDED:
                    this._Str_17838 = false;
                    this._roomSession = null;
                    if (this._recyclerLogic != null)
                    {
                        this._recyclerLogic._Str_19372(false);
                    }
                    break;
            }
            if (this._Str_3854 != null)
            {
                this._Str_3854.dispatchWidgetEvent(new CatalogWidgetRoomChangedEvent());
            }
        }

        private function _Str_24043():void
        {
            this._recyclerLogic = new RecyclerLogic(this, this._windowManager);
            this.getRecyclerPrizes();
        }

        private function _Str_24591():void
        {
            if (this._Str_3633 == null)
            {
                this._Str_3633 = new MarketPlaceLogic(this, this._windowManager, this._roomEngine);
            }
        }

        private function _Str_22724():void
        {
            if (this._Str_10284 == null)
            {
                this._Str_10284 = new ClubGiftController(this);
            }
        }

        private function _Str_23448():void
        {
            if (this._Str_5949 == null)
            {
                this._Str_5949 = new ClubOfferHandler(this, this.connection);
            }
        }

        private function _Str_23722():void
        {
            if (this._Str_6818 == null)
            {
                this._Str_6818 = new ClubExtendController(this);
            }
        }

        private function _Str_25337():void
        {
            if (this._Str_5439 == null)
            {
                this._Str_5439 = new GuildMembershipsController(this);
            }
        }

        private function _Str_25752():void
        {
            this.send(new _Str_12034());
        }

        public function _Str_17905(k:int):void
        {
            this.send(new _Str_10337(k));
        }

        private function _Str_3046(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_15729();
            if (this._catalogViewer != null)
            {
                this._catalogViewer._Str_20980();
            }
            if (((!(this._recyclerLogic == null)) && (this._Str_9089() == "recycler")))
            {
                this._recyclerLogic.cancel();
                this.setupInventoryForRecycler(false);
            }
        }

        private function _Str_25188(k:CatalogPagesListEvent):void
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
            switch (this._Str_4643._Str_3989)
            {
                case RequestedPage._Str_10657:
                    if (((((this._Str_7793) && (this._Str_19190)) && (!(this._Str_25184))) && (k.catalogType == CatalogType.NORMAL)))
                    {
                        events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_NEW_ITEMS_SHOW));
                        this.openCatalogPage(CatalogPageName.NEW_ADDITIONS);
                    }
                    else
                    {
                        _local_2.loadFrontPage();
                    }
                    return;
                case RequestedPage._Str_13019:
                    _local_2.openPageById(this._Str_4643.requestId, this._Str_4643._Str_7501);
                    this._Str_4643._Str_21345();
                    return;
                case RequestedPage._Str_15706:
                    _local_2.openPage(this._Str_4643._Str_22486);
                    this._Str_4643._Str_21345();
                    return;
            }
        }

        private function _Str_11267(k:_Str_8504):void
        {
            var _local_11:CatalogPageMessageOfferData;
            var _local_12:Vector.<IProduct>;
            var _local_13:IProductData;
            var _local_14:_Str_2853;
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
                    _local_16 = this.getFurnitureData(_local_14._Str_6164, _local_14.productType);
                    _local_12.push(new Product(_local_14.productType, _local_14._Str_6164, _local_14.extraParam, _local_14.productCount, _local_13, _local_16, this, _local_14._Str_18468, _local_14.uniqueLimitedItemSeriesSize, _local_14.uniqueLimitedItemsLeft));
                }
                if (((_local_12.length == 0) && (!(HabboCatalogUtils._Str_21831(_local_11.localizationId)))))
                {
                }
                else
                {
                    _local_15 = new Offer(_local_11.offerId, _local_11.localizationId, _local_11.isRent, _local_11.priceInCredits, _local_11.priceInActivityPoints, _local_11.activityPointType, _local_11.giftable, _local_11.clubLevel, _local_12, _local_11.bundlePurchaseAllowed, this);
                    if (((!(_local_15.productContainer == null)) && (this._Str_19704(_local_15))))
                    {
                        _local_10.push(_local_15);
                    }
                    else
                    {
                        _local_15.dispose();
                    }
                }
            }
            if (((!(_local_2._Str_5320 == null)) && (_local_2._Str_5320.length > 0)))
            {
                this._Str_8752 = _local_2._Str_5320;
            }
            if (((!(this._catalogViewer == null)) && (this._Str_17093 == _local_3)))
            {
                this._catalogViewer._Str_19388(_local_3, _local_4, _local_7, _local_10, _local_8, _local_9);
            }
            this._Str_9330 = false;
        }

        private function _Str_19704(k:Offer):Boolean
        {
            return (this._catalogType == CatalogType.NORMAL) || ((!(k.pricingModel == Offer.PRICING_MODEL_BUNDLE)) && (!(k.pricingModel == Offer.PRICING_MODEL_MULTI)));
        }

        private function _Str_12366(k:IMessageEvent):void
        {
            var _local_2:Boolean = this._Str_11577();
            this.reset();
            if (_local_2)
            {
                this._windowManager.alert("${catalog.alert.published.title}", "${catalog.alert.published.description}", 0, this._Str_7211);
            }
        }

        private function _Str_19518(k:IMessageEvent):void
        {
            var _local_2:_Str_8078 = (k as _Str_8078);
            var _local_3:_Str_7694 = _local_2.getParser();
            var _local_4:int = _local_3.errorCode;
            var _local_5:String = ((_local_4 > 0) ? (("${catalog.alert.purchaseerror.description." + _local_4) + "}") : "${catalog.alert.purchaseerror.description}");
            this._windowManager.alert("${catalog.alert.purchaseerror.title}", _local_5, 0, this._Str_7211);
            if (this._purchaseConfirmationDialog != null)
            {
                this._purchaseConfirmationDialog.dispose();
                this._purchaseConfirmationDialog = null;
            }
        }

        private function _Str_23734(k:IMessageEvent):void
        {
            var _local_2:_Str_7086 = (k as _Str_7086);
            var _local_3:_Str_7823 = _local_2.getParser();
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
            this._windowManager.alert("${catalog.alert.purchasenotallowed.title}", _local_5, 0, this._Str_7211);
        }

        private function _Str_16050(k:IMessageEvent):void
        {
            var _local_4:IBitmapWrapperWindow;
            var _local_5:BitmapData;
            var _local_6:Point;
            var _local_7:String;
            var _local_2:_Str_7677 = (k as _Str_7677);
            var _local_3:_Str_7635 = _local_2.getParser();
            events.dispatchEvent(new CatalogFurniPurchaseEvent(_local_3.offer.localizationId));
            if (this._purchaseConfirmationDialog != null)
            {
                if (((!(this._Str_4151)) && (!(this._purchaseConfirmationDialog._Str_23564()))))
                {
                    _local_4 = this._purchaseConfirmationDialog._Str_23480();
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

        private function _Str_23986(k:_Str_8409):void
        {
            if (this._purchaseConfirmationDialog != null)
            {
                this._purchaseConfirmationDialog._Str_23672();
            }
        }

        private function _Str_24443(k:IMessageEvent):void
        {
            var _local_2:_Str_5514 = (k as _Str_5514);
            var _local_3:_Str_7888 = _local_2.getParser();
            if (_local_3._Str_16424)
            {
                this.showNotEnoughCreditsAlert();
            }
            else
            {
                if (_local_3._Str_24352)
                {
                    this.getHabboClubOffers(_local_3.activityPointType);
                }
            }
            if (this._purchaseConfirmationDialog != null)
            {
                this._purchaseConfirmationDialog._Str_16424();
            }
        }

        public function _Str_6496(k:Boolean):void
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
            this._windowManager.confirm("${catalog.alert.notenough.title}", "${catalog.alert.notenough.credits.description}", 0, this._Str_23433);
        }

        public function getHabboClubOffers(k:int):void
        {
            var _local_2:String = ("catalog.alert.notenough.activitypoints.title." + k);
            var _local_3:String = ("catalog.alert.notenough.activitypoints.description." + k);
            if (k == ActivityPointTypeEnum.DUCKET)
            {
                this._windowManager.confirm(this.localization.getLocalization(_local_2), this.localization.getLocalization(_local_3), 0, this._Str_22501);
            }
            else
            {
                this._windowManager.alert(this.localization.getLocalization(_local_2), this.localization.getLocalization(_local_3), 0, this._Str_7211);
            }
        }

        private function _Str_25682(k:_Str_8801):void
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
            this._windowManager.alert("${catalog.alert.voucherredeem.ok.title}", _local_2, 0, this._Str_7211);
        }

        private function _Str_25811(k:_Str_8418):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:String = "${catalog.alert.voucherredeem.error.title}";
            var _local_3:* = (("${catalog.alert.voucherredeem.error.description." + k.errorCode) + "}");
            this._windowManager.alert(_local_2, _local_3, 0, this._Str_7211);
        }

        private function _Str_11705(k:_Str_9145):void
        {
            if (((k == null) || (this._catalogViewer == null)))
            {
                return;
            }
            var _local_2:_Str_7205 = k.getParser();
            this._catalogViewer.dispatchWidgetEvent(new CatalogWidgetApproveNameResultEvent(_local_2.result, _local_2.nameValidationInfo));
        }

        private function _Str_7504(k:IMessageEvent):void
        {
            var _local_2:UserCreditsEvent = (k as UserCreditsEvent);
            var _local_3:UserCreditsMessageParser = _local_2.getParser();
            this._purse.credits = _local_3.balance;
            this._Str_12017();
            if (((!(this._Str_19689)) && (!(this._soundManager == null))))
            {
                this._soundManager._Str_4375(HabboSoundConstants.PURCHASE);
            }
            this._Str_19689 = false;
            events.dispatchEvent(new PurseEvent(PurseEvent.CATALOG_PURSE_CREDIT_BALANCE, this._purse.credits, 0));
            events.dispatchEvent(new PurseUpdateEvent());
        }

        private function _Str_17254(k:IMessageEvent):void
        {
            var _local_2:_Str_4508 = (k as _Str_4508);
            this._purse._Str_18527[_local_2.type] = _local_2.amount;
            this._Str_12017();
            if (((!(this._soundManager == null)) && (_local_2.type == ActivityPointTypeEnum.DUCKET)))
            {
                this._soundManager._Str_4375(HabboSoundConstants.PIXELS);
            }
            events.dispatchEvent(new PurseEvent(PurseEvent.CATALOG_PURSE_ACTIVITY_POINT_BALANCE, _local_2.amount, _local_2.type));
            events.dispatchEvent(new PurseUpdateEvent());
        }

        private function _Str_4970(k:IMessageEvent):void
        {
            var _local_3:String;
            var _local_4:int;
            var _local_2:_Str_5159 = (k as _Str_5159);
            this._purse._Str_18527 = _local_2.points;
            this._Str_12017();
            for (_local_3 in _local_2.points)
            {
                _local_4 = int(_local_3);
                events.dispatchEvent(new PurseEvent(PurseEvent.CATALOG_PURSE_ACTIVITY_POINT_BALANCE, _local_2.points[_local_4], _local_4));
            }
            events.dispatchEvent(new PurseUpdateEvent());
        }

        private function _Str_11640(k:IMessageEvent):void
        {
            var _local_3:Boolean;
            var _local_2:_Str_4007 = (k as _Str_3492).getParser();
            this._purse.clubDays = Math.max(0, _local_2._Str_14465);
            this._purse.clubPeriods = Math.max(0, _local_2._Str_17546);
            this._purse.isVIP = _local_2.isVIP;
            this._purse.pastClubDays = _local_2.pastClubDays;
            this._purse.pastVipDays = _local_2.pastVipDays;
            this._purse._Str_14389 = ((_local_2._Str_9379 == _Str_4007._Str_14729) ? true : false);
            this._purse.minutesUntilExpiration = _local_2.minutesUntilExpiration;
            this._purse._Str_6312 = _local_2._Str_6312;
            if (ExternalInterface.available)
            {
                if (((_local_2.productName == "habbo_club") || (_local_2.productName == "club_habbo")))
                {
                    _local_3 = ((_local_2.isVIP) && (_local_2.minutesUntilExpiration > 0));
                    ExternalInterface.call("FlashExternalInterface.subscriptionUpdated", _local_3);
                }
            }
            this._Str_12017();
            if (_local_2._Str_9379 == _Str_4007._Str_12890)
            {
                this.reset();
                if (this._Str_8001 != null)
                {
                    this.openCatalogPage(this._Str_8001);
                    this._Str_8001 = null;
                }
            }
        }

        private function _Str_18504(k:_Str_5425):void
        {
            if (((!(k)) || (!(this._Str_10284))))
            {
                return;
            }
            var _local_2:_Str_7459 = k.getParser();
            if (!_local_2)
            {
                return;
            }
            this._Str_10284._Str_24745(_local_2._Str_12860, _local_2._Str_7574, _local_2.offers, _local_2._Str_24398);
        }

        private function _Str_24950(k:IMessageEvent):void
        {
            var _local_2:RecyclerStatusMessageParser = (k as _Str_5376).getParser();
            if (((_local_2 == null) || (this._recyclerLogic == null)))
            {
                return;
            }
            this._recyclerLogic._Str_25018(_local_2.recyclerStatus, _local_2.recyclerTimeoutSeconds);
        }

        private function _Str_17153(k:IMessageEvent):void
        {
            var _local_2:RecyclerFinishedMessageParser = (k as _Str_4691).getParser();
            if (((_local_2 == null) || (this._recyclerLogic == null)))
            {
                return;
            }
            this._recyclerLogic._Str_22958(_local_2.recyclerFinishedStatus, _local_2.prizeId);
        }

        private function _Str_23749(k:IMessageEvent):void
        {
            var _local_2:RecyclerPrizesMessageParser = (k as _Str_7079).getParser();
            if (((_local_2 == null) || (this._recyclerLogic == null)))
            {
                return;
            }
            this._recyclerLogic._Str_22273(_local_2.prizeLevels);
        }

        private function _Str_25346(k:IMessageEvent):void
        {
            if (this._Str_3633 != null)
            {
                this._Str_3633.onOffers(k);
            }
        }

        private function _Str_25537(k:IMessageEvent):void
        {
            if (this._Str_3633 != null)
            {
                this._Str_3633.onOwnOffers(k);
            }
        }

        private function _Str_23861(k:IMessageEvent):void
        {
            if (this._Str_3633 != null)
            {
                this._Str_3633.onBuyResult(k);
            }
        }

        private function _Str_24794(k:IMessageEvent):void
        {
            if (this._Str_3633 != null)
            {
                this._Str_3633.onCancelResult(k);
            }
        }

        private function _Str_23158(k:_Str_7597):void
        {
            if (k == null)
            {
                return;
            }
            this._Str_20242 = new GiftWrappingConfiguration(k);
        }

        private function _Str_16617(k:_Str_5946):void
        {
            if (((!(k)) || (!(this._Str_3633))))
            {
                return;
            }
            var _local_2:_Str_6774 = k.getParser();
            if (!_local_2)
            {
                return;
            }
            var _local_3:MarketplaceItemStats = new MarketplaceItemStats();
            _local_3._Str_3925 = _local_2._Str_3925;
            _local_3._Str_4121 = _local_2._Str_4121;
            _local_3._Str_10461 = _local_2._Str_10461;
            _local_3._Str_9174 = _local_2._Str_9174;
            _local_3._Str_11365 = _local_2._Str_11365;
            _local_3._Str_11956 = _local_2._Str_11956;
            _local_3._Str_9431 = _local_2._Str_9431;
            _local_3._Str_8798 = _local_2._Str_8798;
            this._Str_3633._Str_10038 = _local_3;
        }

        private function _Str_16010(k:_Str_5727):void
        {
            if (((!(k)) || (!(this._Str_3633))))
            {
                return;
            }
            var _local_2:MarketplaceConfigurationMessageParser = k.getParser();
            if (!_local_2)
            {
                return;
            }
            this._Str_3633._Str_5014 = _local_2.displayTime;
        }

        private function _Str_16181(k:_Str_6022):void
        {
            if (((!(k)) || (!(this._Str_3633))))
            {
                return;
            }
            var _local_2:_Str_6596 = k.getParser();
            if (!_local_2)
            {
                return;
            }
            if (_local_2.result == 1)
            {
                this._Str_3633.refreshOffers();
            }
        }

        private function _Str_23194(k:_Str_7706):void
        {
            var _local_2:_Str_6792 = k.getParser();
            if (((!(this._Str_5949 == null)) && ((((_local_2.source == ClubOfferRequestSource._Str_15734) || (_local_2.source == ClubOfferRequestSource._Str_12589)) || (_local_2.source == ClubOfferRequestSource._Str_15001)) || (_local_2.source == ClubOfferRequestSource._Str_15727))))
            {
                this._Str_5949.onOffers(_local_2);
            }
        }

        private function _Str_23226(k:_Str_6375):void
        {
            if (!this._initialized)
            {
                this.init();
            }
            if (this._Str_6818)
            {
                this._Str_6818._Str_24854(k);
            }
        }

        private function _Str_2960(k:IMessageEvent):void
        {
        }

        private function _Str_23837(k:_Str_8784):void
        {
            var _local_2:_Str_7118 = k.getParser();
            this._Str_7969.remove(_local_2.productCode);
            var _local_3:Array = _local_2._Str_13588;
            if (_local_3 != null)
            {
                this._Str_7969.add(_local_2.productCode, _local_3.slice());
                this._catalogViewer.dispatchWidgetEvent(new CatalogWidgetSellablePetPalettesEvent(_local_2.productCode, _local_3.slice()));
            }
        }

        private function _Str_2972(k:String, _arg_2:BitmapData):void
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

        private function _Str_7211(k:_Str_2418, _arg_2:WindowEvent):void
        {
            k.dispose();
            this._Str_4663();
        }

        private function _Str_23433(k:_Str_2910, _arg_2:WindowEvent):void
        {
            k.dispose();
            this._Str_4663();
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
            {
                HabboWebTools.openWebPageAndMinimizeClient(getProperty(_Str_5079.WEB_SHOP_RELATIVEURL));
            }
        }

        private function _Str_22501(k:_Str_2910, _arg_2:WindowEvent):void
        {
            var _local_3:String;
            k.dispose();
            this._Str_4663();
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
            {
                _local_3 = getProperty("link.format.duckets");
                if (_local_3 != "")
                {
                    this._windowManager.alert("${catalog.alert.external.link.title}", "${catalog.alert.external.link.desc}", 0, this._Str_7790);
                    HabboWebTools.navigateToURL(_local_3, "habboMain");
                }
            }
        }

        private function _Str_7790(k:_Str_2418, _arg_2:WindowEvent):void
        {
            k.dispose();
        }

        public function redeemVoucher(k:String):void
        {
            var _local_2:IMessageComposer = new _Str_12068(k);
            this.send(_local_2);
            _local_2.dispose();
            _local_2 = null;
        }

        public function productDataReady():void
        {
            this._Str_7186 = true;
            events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_INITIALIZED));
        }

        public function isDraggable(k:IPurchasableOffer):Boolean
        {
            return ((((((((getBoolean("catalog.drag_and_drop")) && (!(this._roomSession == null))) && ((this._catalogViewer._Str_3854 == null) || (this._catalogViewer._Str_3854._Str_21031))) && (((this._catalogType == CatalogType.NORMAL) && ((this._roomSession.isRoomController) || ((this._roomSession._Str_3672) && (this._roomSession.roomControllerLevel >= RoomControllerLevel.GUILD_MEMBER)))) || ((this._catalogType == CatalogType.BUILDER) && (this._Str_19136(k) == BuilderFurniPlaceableStatus._Str_8891)))) && (!(k.pricingModel == Offer.PRICING_MODEL_BUNDLE))) && (!(k.pricingModel == Offer.PRICING_MODEL_MULTI))) && (!(k.product == null))) && (!(k.product.productType == ProductTypeEnum.EFFECT))) && (!(k.product.productType == ProductTypeEnum.HABBO_CLUB));
        }

        public function _Str_19136(k:IPurchasableOffer):int
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:IRoomObject;
            var _local_5:RoomUserData;
            if (k == null)
            {
                return BuilderFurniPlaceableStatus._Str_12543;
            }
            if (((this._Str_20960 < 0) || (this._Str_20960 >= this._Str_24159)))
            {
                return BuilderFurniPlaceableStatus._Str_14564;
            }
            if (this.roomSession == null)
            {
                return BuilderFurniPlaceableStatus._Str_13563;
            }
            if (!this.roomSession.isRoomController)
            {
                return BuilderFurniPlaceableStatus._Str_10467;
            }
            if (((this.roomSession._Str_3672) && (!(getBoolean("builders.club.furniture.placement.group.room.enabled")))))
            {
                return BuilderFurniPlaceableStatus._Str_14160;
            }
            if (this._Str_10140 <= 0)
            {
                _local_2 = this.roomEngine.getRoomObjectCount(this.roomSession.roomId, RoomObjectCategoryEnum.CONST_100);
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _local_4 = this.roomEngine.getRoomObjectWithIndex(this.roomSession.roomId, _local_3, RoomObjectCategoryEnum.CONST_100);
                    _local_5 = this.roomSession.userDataManager.getUserDataByIndex(_local_4.getId());
                    if (((((!(_local_5 == null)) && (_local_5.type == RoomObjectTypeEnum.HABBO)) && (!(_local_5._Str_2713 == this.roomSession._Str_3871))) && (!(_local_5._Str_3853))))
                    {
                        return BuilderFurniPlaceableStatus._Str_14774;
                    }
                    _local_3++;
                }
            }
            return BuilderFurniPlaceableStatus._Str_8891;
        }

        private function _Str_21839(k:String, _arg_2:String):void
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

        public function _Str_8289(k:_Str_4431, _arg_2:IPurchasableOffer, _arg_3:Boolean=false):void
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
                    _local_5 = RoomObjectCategoryEnum.CONST_10;
                    break;
                case ProductTypeEnum.WALL:
                    _local_5 = RoomObjectCategoryEnum.CONST_20;
                    break;
            }
            var _local_6:Boolean = this._roomEngine.initializeRoomObjectInsert(RoomObjectPlacementSource.CATALOG, -(_arg_2.offerId), _local_5, _local_4.productClassId, ((_local_4.extraParam) ? _local_4.extraParam.toString() : null));
            if (_local_6)
            {
                this._Str_3644 = _arg_2;
                this._Str_8970 = k;
                this._Str_15729();
                this._Str_4151 = true;
                this._Str_21515 = _arg_3;
            }
        }

        private function _Str_23336(k:RoomEngineObjectEvent):void
        {
            var _local_2:RoomUserData;
            if (k == null)
            {
                return;
            }
            if (((this.buildersClubEnabled) && ((!(this._initialized)) || (!(this.getCatalogNavigator(CatalogType.BUILDER)._Str_3961)))))
            {
                this.init();
                this._Str_16894(CatalogType.BUILDER);
            }
            if (((k.type == RoomEngineObjectEvent.SELECTED) && (k.category == RoomObjectCategoryEnum.CONST_100)))
            {
                _local_2 = this._Str_22062(k);
                if (_local_2 != null)
                {
                    events.dispatchEvent(new CatalogUserEvent(CatalogEvent.CATALOG_USER_SELECTED, _local_2._Str_2394, _local_2.name));
                }
            }
        }

        private function _Str_24434(k:FriendBarSelectionEvent):void
        {
            var _local_2:int;
            var _local_3:String;
            var _local_4:_Str_4431;
            if (((this._Str_4151) && (k.type == FriendBarSelectionEvent.FBVE_FRIEND_SELECTED)))
            {
                this._Str_4663(true);
                if (((this._Str_3644 == null) || (this._Str_3644.disposed)))
                {
                    this._Str_7529();
                    return;
                }
                _local_2 = k._Str_9566;
                _local_3 = k._Str_24718;
                _local_4 = this._Str_8970;
                if (_local_4 != null)
                {
                    _local_4._Str_8347(true, _local_3);
                }
                this._Str_7529(false);
                this._Str_5298();
            }
        }

        private function _Str_22062(k:RoomEngineObjectEvent):RoomUserData
        {
            var _local_3:IRoomSession;
            var _local_2:RoomUserData;
            if (this._roomSessionManager != null)
            {
                _local_3 = this._roomSessionManager.getSession(k.roomId);
                if (_local_3 != null)
                {
                    _local_2 = _local_3.userDataManager.getUserDataByIndex(k._Str_1577);
                }
            }
            return _local_2;
        }

        private function _Str_23698(k:RoomEngineObjectPlacedOnUserEvent):void
        {
            var _local_2:String;
            var _local_3:RoomUserData;
            var _local_4:_Str_4431;
            if (((this._Str_4151) && (k.type == RoomEngineObjectEvent.PLACED_ON_USER)))
            {
                this._Str_4663(true);
                if (((this._Str_3644 == null) || (this._Str_3644.disposed)))
                {
                    this._Str_7529();
                    return;
                }
                _local_2 = null;
                _local_3 = this._Str_22062(k);
                if (_local_3 != null)
                {
                    _local_2 = _local_3.name;
                }
                _local_4 = this._Str_8970;
                if (_local_4 != null)
                {
                    _local_4._Str_8347(true, _local_2);
                }
                this._Str_7529(false);
                this._Str_5298();
            }
        }

        private function _Str_22513(k:RoomEngineObjectPlacedEvent):void
        {
            var _local_2:int;
            var _local_3:IProduct;
            var _local_4:Boolean;
            var _local_5:_Str_4431;
            var _local_6:IRoomObjectController;
            var _local_7:int;
            var _local_8:Vector.<ICatalogNode>;
            if (((this._Str_4151) && (k.type == RoomEngineObjectEvent.PLACED)))
            {
                this._Str_4663(true);
                if (((this._Str_3644 == null) || (this._Str_3644.disposed)))
                {
                    this._Str_7529();
                    return;
                }
                _local_2 = k.category;
                _local_3 = this._Str_3644.product;
                _local_4 = false;
                if (_local_2 == RoomObjectCategoryEnum.CONST_20)
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
                    this._Str_7529();
                    return;
                }
                this._placedObjectPurchaseData = new PlacedObjectPurchaseData(k.roomId, k._Str_1577, k.category, k._Str_7031, k.x, k.y, k.direction, this._Str_3644);
                _local_5 = this._Str_8970;
                if (_local_5 != null)
                {
                    _local_5._Str_8347(true, null);
                }
                switch (this._catalogType)
                {
                    case CatalogType.NORMAL:
                        if (_local_2 == RoomObjectCategoryEnum.CONST_10)
                        {
                            this._roomEngine.addObjectFurniture(k.roomId, k._Str_1577, _local_3.productClassId, new Vector3d(k.x, k.y, k.z), new Vector3d(k.direction, 0, 0), 0, new LegacyStuffData());
                        }
                        else
                        {
                            if (_local_2 == RoomObjectCategoryEnum.CONST_20)
                            {
                                switch (_local_3.furnitureData.className)
                                {
                                    case "floor":
                                    case "wallpaper":
                                    case "landscape":
                                        this._Str_21839(_local_3.furnitureData.className, _local_3.extraParam);
                                        break;
                                    default:
                                        this._roomEngine.addObjectWallItem(k.roomId, k._Str_1577, _local_3.productClassId, new Vector3d(k.x, k.y, k.z), new Vector3d((k.direction * 45), 0, 0), 0, k._Str_4766, 0);
                                }
                            }
                        }
                        _local_6 = (this._roomEngine.getRoomObject(k.roomId, k._Str_1577, k.category) as IRoomObjectController);
                        if (_local_6)
                        {
                            _local_6.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_ALPHA_MULTIPLIER, 0.5);
                        }
                        return;
                    case CatalogType.BUILDER:
                        _local_7 = this._Str_3644.page.pageId;
                        if (_local_7 == CatalogNavigator._Str_5778)
                        {
                            _local_8 = this._Str_3361._Str_5719(this._Str_3644.offerId, true);
                            if (_local_8 != null)
                            {
                                _local_7 = _local_8[0].pageId;
                            }
                        }
                        switch (_local_2)
                        {
                            case RoomObjectCategoryEnum.CONST_10:
                                this.send(new _Str_12382(_local_7, this._Str_3644.offerId, _local_3.extraParam, k.x, k.y, k.direction));
                                break;
                            case RoomObjectCategoryEnum.CONST_20:
                                this.send(new _Str_11648(_local_7, this._Str_3644.offerId, _local_3.extraParam, k._Str_7031));
                                break;
                        }
                        if (this._Str_21515)
                        {
                            this._Str_8289(_local_5, this._Str_3644, true);
                        }
                        else
                        {
                            this.toggleToBuildersClub();
                        }
                        return;
                }
            }
        }

        private function _Str_7529(k:Boolean=true):void
        {
            if (((k) && (this._Str_4151)))
            {
                this._Str_20975();
            }
            this._Str_4151 = false;
            this._Str_8970 = null;
        }

        public function _Str_24178(k:IPurchasableOffer):void
        {
            if (this._placedObjectPurchaseData)
            {
                if (this._placedObjectPurchaseData.offerId != k.offerId)
                {
                    this._Str_4663();
                }
            }
        }

        public function _Str_4663(k:Boolean=false):void
        {
            if (!k)
            {
                this._Str_7529();
            }
            if (this._placedObjectPurchaseData != null)
            {
                if (this._placedObjectPurchaseData.category == RoomObjectCategoryEnum.CONST_10)
                {
                    this._roomEngine.disposeObjectFurniture(this._placedObjectPurchaseData.roomId, this._placedObjectPurchaseData._Str_1577);
                }
                else
                {
                    if (this._placedObjectPurchaseData.category == RoomObjectCategoryEnum.CONST_20)
                    {
                        switch (this._placedObjectPurchaseData.furniData.className)
                        {
                            case "floor":
                            case "wallpaper":
                            case "landscape":
                                this._Str_21839("reset", "");
                                break;
                            default:
                                this._roomEngine.disposeObjectWallItem(this._placedObjectPurchaseData.roomId, this._placedObjectPurchaseData._Str_1577);
                        }
                    }
                    else
                    {
                        this._roomEngine.deleteRoomObject(this._placedObjectPurchaseData._Str_1577, this._placedObjectPurchaseData.category);
                    }
                }
                this._placedObjectPurchaseData.dispose();
                this._placedObjectPurchaseData = null;
            }
        }

        public function _Str_5298():void
        {
            if (this._Str_3644 != null)
            {
                this._roomEngine.cancelRoomObjectInsert();
                this._Str_4151 = false;
                this._Str_3644 = null;
            }
        }

        private function _Str_25495(k:HabboInventoryItemAddedEvent):void
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
                    _local_2 = k._Str_17550;
                    _local_3 = this._placedObjectPurchaseData.category;
                    _local_4 = this._placedObjectPurchaseData._Str_7031;
                    _local_5 = this._placedObjectPurchaseData.x;
                    _local_6 = this._placedObjectPurchaseData.y;
                    _local_7 = this._placedObjectPurchaseData.direction;
                    switch (k.category)
                    {
                        case FurniCategory._Str_3683:
                            _local_8 = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId, RoomObjectVariableEnum.ROOM_FLOOR_TYPE);
                            if (this._placedObjectPurchaseData.extraParameter != _local_8)
                            {
                                this.send(new _Str_5270(_local_2));
                            }
                            break;
                        case FurniCategory._Str_3639:
                            _local_9 = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId, RoomObjectVariableEnum.ROOM_WALL_TYPE);
                            if (this._placedObjectPurchaseData.extraParameter != _local_9)
                            {
                                this.send(new _Str_5270(_local_2));
                            }
                            break;
                        case FurniCategory._Str_3432:
                            _local_10 = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId, RoomObjectVariableEnum.ROOM_LANDSCAPE_TYPE);
                            if (this._placedObjectPurchaseData.extraParameter != _local_10)
                            {
                                this.send(new _Str_5270(_local_2));
                            }
                            break;
                        default:
                            this.send(new _Str_6790(_local_2, _local_3, _local_4, _local_5, _local_6, _local_7));
                    }
                    this._Str_4663();
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
                this._Str_7078(_arg_2, _arg_3);
                return;
            }
            if (k)
            {
                HabboCatalog._Str_25557(k, (_local_4.content as BitmapData));
            }
        }

        public function get imageGalleryHost():String
        {
            return getProperty("image.library.catalogue.url");
        }

        private function _Str_7078(k:String, _arg_2:Function):void
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

        private function _Str_20975():void
        {
            var k:IDesktopWindow;
            if ((((!(this._windowManager == null)) && (!(this._mainContainer == null))) && (this._mainContainer.parent == null)))
            {
                k = this._windowManager.getDesktop(_Str_6198);
                if (k != null)
                {
                    k.addChild(this._mainContainer);
                }
            }
        }

        private function _Str_15729():void
        {
            var k:IDesktopWindow;
            if ((((!(this._windowManager == null)) && (!(this._mainContainer == null))) && (!(this._mainContainer.parent == null))))
            {
                k = this._windowManager.getDesktop(_Str_6198);
                if (((!(k == null)) && (!(this._Str_13637))))
                {
                    k.removeChild(this._mainContainer);
                    if (this._catalogViewer != null)
                    {
                        this._catalogViewer._Str_20980();
                    }
                }
                this._Str_13637 = false;
            }
        }

        private function _Str_11577():Boolean
        {
            return ((!(this._windowManager == null)) && (!(this._mainContainer == null))) && (!(this._mainContainer.parent == null));
        }

        public function update(k:uint):void
        {
            var _local_2:Number;
            var _local_3:Number;
            if (this._Str_2616 != null)
            {
                this._Str_2616.updatePreviewRoomView();
            }
            if ((getTimer() - this._Str_19072) > 500)
            {
                _local_2 = this._Str_10140;
                _local_3 = this._Str_23332;
                if ((((_local_2 > -3) && (_local_2 < 200)) || ((_local_3 > -3) && (_local_3 < 200))))
                {
                    this._Str_15371();
                }
            }
        }

        public function _Str_24089(k:_Str_7452):void
        {
            if (this._Str_5439)
            {
                this._Str_5439._Str_23306(k);
            }
        }

        public function _Str_10922(k:int=1):Boolean
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

        private function _Str_15960(k:GuildSettingsChangedInManageEvent):void
        {
            if (this._Str_5439)
            {
                this._Str_5439._Str_15960(k._Str_3916);
            }
        }

        public function get avatarEditor():IHabboAvatarEditor
        {
            return this._avatarEditor;
        }

        public function _Str_26111(k:IPurchasableOffer):void
        {
            this.send(new _Str_12467(k.offerId));
        }

        public function _Str_24636(k:int):void
        {
            var _local_2:ICatalogNode = this._Str_3361.getNodeById(k);
            if (_local_2)
            {
                this._Str_8001 = _local_2.pageName;
            }
            else
            {
                this._Str_8001 = "frontpage";
            }
        }

        public function _Str_23687():void
        {
            this._Str_8001 = null;
            this._Str_13637 = false;
        }

        public function _Str_22294():void
        {
            this._Str_13637 = (!(this._Str_8001 == null));
        }

        private function _Str_25130():void
        {
            if (getBoolean("bundle.dynamic.discounts.enabled"))
            {
                this._Str_25131();
            }
        }

        private function _Str_25131():void
        {
            this.send(new _Str_11294());
        }

        public function sendGetProductOffer(k:int):void
        {
            this.send(new _Str_11905(k));
        }

        private function _Str_22941(k:_Str_7288):void
        {
            var _local_2:_Str_7779 = k.getParser();
            this._Str_9586 = _local_2._Str_5195;
            this._utils._Str_24024();
        }

        private function _Str_24685(k:_Str_8530):void
        {
            this._windowManager.alert("${catalog.alert.limited_edition_sold_out.title}", "${catalog.alert.limited_edition_sold_out.message}", 0, this._Str_7211);
            if (this._purchaseConfirmationDialog != null)
            {
                this._purchaseConfirmationDialog.dispose();
                this._purchaseConfirmationDialog = null;
            }
        }

        private function _Str_25412(k:_Str_9560):void
        {
            var _local_7:Offer;
            var _local_8:IFurnitureData;
            var _local_2:_Str_7328 = k.getParser();
            var _local_3:CatalogPageMessageOfferData = _local_2._Str_17889;
            if (((!(_local_3)) || (_local_3.products.length == 0)))
            {
                return;
            }
            var _local_4:_Str_2853 = _local_3.products[0];
            if (_local_4._Str_18468)
            {
                this._catalogViewer._Str_3854._Str_19621(_local_3.offerId, _local_4.uniqueLimitedItemsLeft);
            }
            var _local_5:Vector.<IProduct> = new Vector.<IProduct>(0);
            var _local_6:IProductData = this.getProductData(_local_3.localizationId);
            for each (_local_4 in _local_3.products)
            {
                _local_8 = this.getFurnitureData(_local_4._Str_6164, _local_4.productType);
                _local_5.push(new Product(_local_4.productType, _local_4._Str_6164, _local_4.extraParam, _local_4.productCount, _local_6, _local_8, this, _local_4._Str_18468, _local_4.uniqueLimitedItemSeriesSize, _local_4.uniqueLimitedItemsLeft));
            }
            _local_7 = new Offer(_local_3.offerId, _local_3.localizationId, _local_3.isRent, _local_3.priceInCredits, _local_3.priceInActivityPoints, _local_3.activityPointType, _local_3.giftable, _local_3.clubLevel, _local_5, _local_3.bundlePurchaseAllowed, this);
            if (!this._Str_19704(_local_7))
            {
                _local_7.dispose();
                return;
            }
            if (((this._catalogViewer) && (this._catalogViewer._Str_3854)))
            {
                _local_7.page = this._catalogViewer._Str_3854;
                this._catalogViewer._Str_3854.dispatchWidgetEvent(new SelectProductEvent(_local_7));
                if (((_local_7.product) && (_local_7.product.productType == ProductTypeEnum.WALL)))
                {
                    this._catalogViewer._Str_3854.dispatchWidgetEvent(new SetExtraPurchaseParameterEvent(_local_7.product.extraParam));
                }
                if (((this._Str_4151) && (this._Str_3644)))
                {
                    this._Str_3644 = _local_7;
                }
            }
        }

        private function _Str_24973(k:_Str_5417):void
        {
            var _local_2:_Str_6732 = k.getParser();
            this._Str_16097 = _local_2._Str_15864;
            this._Str_19671 = _local_2._Str_24094;
            this._Str_14644 = _local_2._Str_3709;
            this._Str_12490 = getTimer();
            this._Str_16084 = _local_2._Str_24379;
            if (ExternalInterface.available)
            {
                ExternalInterface.call("FlashExternalInterface.updateBuildersClub", (this._Str_14644 > 0));
            }
            if (this._Str_3854 != null)
            {
                this._Str_3854.dispatchWidgetEvent(new CatalogWidgetBuilderSubscriptionUpdatedEvent());
            }
            this._Str_15371();
        }

        private function _Str_23753(k:_Str_9458):void
        {
            this._Str_18106 = k.getParser()._Str_10882;
            if (this._Str_3854 != null)
            {
                this._Str_3854.dispatchWidgetEvent(new CatalogWidgetBuilderSubscriptionUpdatedEvent());
            }
            this._Str_15371();
        }

        private function _Str_15371():void
        {
            var k:Number = (this._Str_14644 - ((getTimer() - this._Str_12490) / 1000));
            var _local_2:Number = (this._Str_16084 - ((getTimer() - this._Str_12490) / 1000));
            if ((((this._Str_12983) && (k <= 0)) && (_local_2 > 0)))
            {
                events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_BUILDER_MEMBERSHIP_IN_GRACE));
            }
            else
            {
                if (((this._Str_13454) && (_local_2 <= 0)))
                {
                    events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_BUILDER_MEMBERSHIP_EXPIRED));
                }
            }
            this._Str_12983 = (k > 0);
            this._Str_13454 = (_local_2 > 0);
            var _local_3:String = ("builder.header.status." + ((this._Str_12983) ? "member" : ((this._Str_13454) ? "grace" : "trial")));
            var _local_4:String = this._localization.getLocalization(_local_3);
            this._localization.registerParameter("builder.header.title", "bcstatus", _local_4);
            var _local_5:String = ((this._Str_12983) ? FriendlyTime.format(this._localization, k) : ((this._Str_13454) ? FriendlyTime.format(this._localization, _local_2) : _local_4));
            this._localization.registerParameter("builder.header.status.membership", "duration", (('<font color="#ff8d00"><b>' + _local_5) + "</b></font>"));
            this._localization.registerParameter("builder.header.status.limit", "count", (('<font color="#ff8d00"><b>' + this._Str_18106) + "</b></font>"));
            this._localization.registerParameter("builder.header.status.limit", "limit", (('<font color="#ff8d00"><b>' + this._Str_16097) + "</b></font>"));
            this._Str_19072 = getTimer();
        }

        public function get discountEnabled():Boolean
        {
            return (getBoolean("bundle.dynamic.discounts.enabled")) && (!(this._catalogType == CatalogType.BUILDER));
        }

        public function get _Str_5195():_Str_4615
        {
            return this._Str_9586;
        }

        public function get _Str_7593():Boolean
        {
            return (getBoolean("catalog.multiple.purchase.enabled")) && (!(this._catalogType == CatalogType.BUILDER));
        }

        public function get _Str_25184():Boolean
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
                if (!this.getCatalogNavigator(CatalogType.NORMAL)._Str_3961)
                {
                    this._Str_16894(CatalogType.NORMAL);
                }
                this._utils.showVipBenefits();
            }
        }

        public function get _Str_3854():ICatalogPage
        {
            return (this._catalogViewer == null) ? null : this._catalogViewer._Str_3854;
        }

        public function displayProductIcon(k:String, _arg_2:int, _arg_3:IBitmapWrapperWindow):void
        {
            this._utils.displayProductIcon(k, _arg_2, _arg_3);
        }

        public function openRentConfirmationWindow(k:IFurnitureData, _arg_2:Boolean, _arg_3:int=-1, _arg_4:int=-1, _arg_5:Boolean=false):void
        {
            if (this._Str_8700 == null)
            {
                this._Str_8700 = new RentConfirmationWindow(this);
            }
            this._Str_8700.show(k, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        public function get roomSession():IRoomSession
        {
            return this._roomSession;
        }

        public function get eventUrlPrefix():String
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
            return (this._Str_5309 != null) ? this._Str_5309[k] : null;
        }

        public function get _Str_3361():ICatalogNavigator
        {
            return this.getCatalogNavigator(this._catalogType);
        }

        public function get _Str_24159():int
        {
            return this._Str_16097;
        }

        public function get _Str_20960():int
        {
            return this._Str_18106;
        }

        public function get _Str_26280():int
        {
            return this._Str_19671;
        }

        public function get _Str_10140():Number
        {
            return this._Str_14644 - ((getTimer() - this._Str_12490) / 1000);
        }

        public function get _Str_23332():Number
        {
            return this._Str_16084 - ((getTimer() - this._Str_12490) / 1000);
        }

        public function get isDoorModeOverriddenInCurrentRoom():Boolean
        {
            var k:int;
            var _local_4:IRoomObject;
            var _local_5:IRoomObject;
            if (((!(this.buildersClubEnabled)) || (this._Str_10140 > 0)))
            {
                return false;
            }
            var _local_2:int = this.roomEngine.getRoomObjectCount(this.roomSession.roomId, RoomObjectCategoryEnum.CONST_10);
            k = 0;
            while (k < _local_2)
            {
                _local_4 = this.roomEngine.getRoomObjectWithIndex(this.roomSession.roomId, k, RoomObjectCategoryEnum.CONST_10);
                if (_Str_6093._Str_7070(_local_4.getId()))
                {
                    return true;
                }
                k++;
            }
            var _local_3:int = this.roomEngine.getRoomObjectCount(this.roomSession.roomId, RoomObjectCategoryEnum.CONST_20);
            k = 0;
            while (k < _local_3)
            {
                _local_5 = this.roomEngine.getRoomObjectWithIndex(this.roomSession.roomId, k, RoomObjectCategoryEnum.CONST_20);
                if (_Str_6093._Str_7070(_local_5.getId()))
                {
                    return true;
                }
                k++;
            }
            return false;
        }

        public function _Str_17606(k:IOfferExtension):IOfferCenter
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
