//com.sulake.habbo.tablet.catalog.HabboTabletCatalog

package com.sulake.habbo.tablet.catalog{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.session.product.IProductDataListener;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.session.furniture.IFurniDataListener;
    import flash.geom.Point;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.tablet.inventory.IHabboTabletInventory;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.tablet.navigator.IHabboTabletNavigator;
    import flash.utils.Dictionary;
    import com.sulake.habbo.tablet.catalog.purse.Purse;
    import com.sulake.habbo.tablet.catalog.marketplace.IMarketPlace;
    import com.sulake.habbo.tablet.catalog.purchase.GiftWrappingConfiguration;
    import com.sulake.habbo.tablet.catalog.club.ClubGiftController;
    import com.sulake.habbo.tablet.catalog.club.ClubBuyController;
    import com.sulake.habbo.tablet.catalog.club.DirectVipBuyController;
    import com.sulake.habbo.tablet.catalog.club.ClubExtendController;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.tablet.catalog.viewer.IDragAndDropDoneReceiver;
    import com.sulake.habbo.tablet.catalog.purchase.PlacedObjectPurchaseData;
    import com.sulake.habbo.room.preview.RoomPreviewer;
    import com.sulake.habbo.tablet.catalog.viewer.GameTokensOffer;
    import com.sulake.habbo.communication.messages.incoming.catalog.BundleDiscountRuleset;
    import com.sulake.habbo.tablet.catalog.navigation.RequestedPage;
    import com.sulake.habbo.tablet.catalog.purchase.RoomAdPurchaseData;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import flash.utils.Timer;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.runtime.ComponentDependency;
    import starling.display.DisplayObject;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.tablet.catalog.navigation.ICatalogNode;
    import com.sulake.habbo.room.IStuffData;
    import flash.display.BitmapData;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.tablet.catalog.purse.IPurse;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogIndexMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
    import com.sulake.habbo.tablet.catalog.viewer.Offer;
    import com.sulake.habbo.communication.messages.incoming.catalog.GiftReceiverNotFoundEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.VoucherRedeemOkMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.VoucherRedeemErrorMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.ApproveNameMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.ClubGiftInfoEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.HabboClubOffersMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.HabboClubExtendOfferMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.SellablePetPalettesMessageEvent;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.habbo.session.IUserData;
    import com.sulake.habbo.room.events.RoomEngineObjectPlacedOnUserEvent;
    import com.sulake.habbo.room.events.RoomEngineObjectPlacedEvent;
    import com.sulake.habbo.communication.messages.incoming.users.GuildMembershipsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.SnowWarGameTokensMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.BundleDiscountRulesetMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.LimitedEditionSoldOutEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.ProductOfferEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.BuildersClubSubscriptionStatusMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog.BuildersClubFurniCountMessageEvent;
    import com.sulake.habbo.tablet.catalog.viewer.ICatalogPage;
    import com.sulake.habbo.tablet.catalog.navigation.ICatalogNavigator;
    import com.sulake.habbo.tablet.catalog.recycler.IRecycler;

    public class HabboTabletCatalog extends Component implements IHabboTabletCatalog, IProductDataListener, IUpdateReceiver, IFurniDataListener {

        private static const DEFAULT_VIEW_LOCATION:Point;
        private static const DEFAULT_VIEW_LOCATION_LARGE:Point;
        public static const MAX_SEARCH_RESULTS_LENGTH:uint;

        private var _communication:IHabboCommunicationManager;
        private var _roomEngine:IRoomEngine;
        private var _roomSessionManager:IRoomSessionManager;
        private var _roomSession:IRoomSession;
        private var _localization:IHabboLocalizationManager;
        private var _inventory:IHabboTabletInventory;
        private var _sessionDataManager:ISessionDataManager;
        private var _avatarRenderManager:IAvatarRenderManager;
        private var _navigator:IHabboTabletNavigator;
        private var _videoOfferManager:VideoOfferManager;
        private var _initialized:Boolean;
        private var _productDataReady:Boolean;
        private var _catalogNavigators:Dictionary;
        private var _purse:Purse;
        private var _marketPlace:IMarketPlace;
        private var _viewController:CatalogViewController;
        private var _giftReceiver:String;
        private var _skipToGifting:Boolean;
        private var _firstBalanceCredits:Boolean;
        private var _privateRoomSessionActive:Boolean;
        private var _giftWrappingConfiguration:GiftWrappingConfiguration;
        private var _clubGiftController:ClubGiftController;
        private var _clubBuyController:ClubBuyController;
        private var _directVipBuyController:DirectVipBuyController;
        private var _clubExtendController:ClubExtendController;
        private var _sellablePetPalettes:Map;
        private var _isObjectMoverRequested:Boolean;
        private var _offerInFurniPlacing:IPurchasableOffer;
        private var _offerPlacingCallbackReceiver:IDragAndDropDoneReceiver;
        private var _placedOfferData:PlacedObjectPurchaseData;
        private var _newAdditionsAvailable:Boolean;
        private var _newAddtionsAvailableEnabled:Boolean;
        private var _roomPreviewer:RoomPreviewer;
        private var _doNotCloseAfterVipPurchase:Boolean;
        private var _pageToOpenAfterVipPurchase:String;
        private var _snowWarTokensOffer:GameTokensOffer;
        private var _bundleDiscountRuleset:BundleDiscountRuleset;
        private var _requestedPage:RequestedPage;
        private var _lastPageRequestId:int;
        private var _roomAdPurchaseData:RoomAdPurchaseData;
        private var _messageEvents:Vector.<IMessageEvent>;
        private var _catalogType:String;
        private var _furnitureData:Vector.<IFurnitureData>;
        private var _keyUpSearchTimer:Timer;
        private var _pagesVisibleInBuilderMode:Dictionary;
        private var _placeMultipleObjects:Boolean;
        private var _builderFurniCount:int;
        private var _builderFurniLimit:int;
        private var _builderMaxFurniLimit:int;
        private var _builderMembershipSecondsLeft:int;
        private var _builderMembershipUpdateTime:int;
        private var _builderMembershipDisplayUpdateTime:int;
        private var _builderMembershipActiveSoFar:Boolean;
        private var _utils:TabletCatalogUtils;
        private var _inAppPurchaseProductIds:Vector.<String>;

        public function HabboTabletCatalog(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null);

        public function get sessionDataManager():ISessionDataManager;

        public function get avatarRenderManager():IAvatarRenderManager;

        public function get localization():IHabboLocalizationManager;

        public function get communication():IHabboCommunicationManager;

        public function get connection():IConnection;

        public function get giftWrappingConfiguration():GiftWrappingConfiguration;

        public function get roomEngine():IRoomEngine;

        public function get roomPreviewer():RoomPreviewer;

        public function get navigator():IHabboTabletNavigator;

        public function get videoOffers():IVideoOfferManager;

        public function get inAppPurchaseProductIds():Vector.<String>;

        override protected function get dependencies():Vector.<ComponentDependency>{
        }
        override protected function initComponent():void;

        private function addMessageEvent(k:IMessageEvent):void;

        override public function dispose():void;

        private function init():Boolean;

        public function isViewLoaded():Boolean;

        public function get view():DisplayObject;

        public function get viewController():CatalogViewController;

        public function closeView():void;

        public function showClubPurchaseView():void;

        private function reset(k:Boolean=false):void;

        private function send(k:IMessageComposer):void;

        public function loadNode(k:ICatalogNode):void;

        public function purchaseGameTokensOffer():void;

        public function purchaseOffer(k:int, _arg_2:String="", _arg_3:int=1):void;

        public function purchaseProduct(k:int, _arg_2:int, _arg_3:String="", _arg_4:int=1):void;

        public function purchaseVipMembershipExtension(k:int):void;

        public function purchaseBasicMembershipExtension(k:int):void;

        public function purchaseProductAsGift(k:int, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:Boolean=false):void;

        public function get roomAdPurchaseData():RoomAdPurchaseData;

        public function set roomAdPurchaseData(k:RoomAdPurchaseData):void;

        public function approveName(k:String, _arg_2:int):void;

        public function getRecyclerStatus():void;

        public function getRecyclerPrizes():void;

        public function sendRecycleItems(k:Array):void;

        public function set giftReceiver(k:String):void;

        public function getSeasonalCurrencyActivityPointType():int;

        public function showPurchaseConfirmation(k:IPurchasableOffer, _arg_2:int, _arg_3:String="", _arg_4:int=1, _arg_5:IStuffData=null, _arg_6:String=null, _arg_7:Boolean=true, _arg_8:BitmapData=null):void;

        public function purchaseWillBeGift(k:Boolean):void;

        private function initializeRoomPreviewer():void;

        private function isNewItemsNotificationEnabled():Boolean;

        public function openCatalog():void;

        public function openCatalogPage(k:String, _arg_2:String=null):void;

        public function openRoomAdCatalogPageInExtendedMode(k:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:Date):void;

        public function openCatalogPageByOfferId(k:int, _arg_2:String):void;

        public function openCatalogPageById(k:int, _arg_2:int, _arg_3:String):void;

        public function openInventoryCategory(k:String):void;

        public function openCreditsHabblet():void;

        public function setupInventoryForRecycler(k:Boolean):void;

        public function get privateRoomSessionActive():Boolean;

        public function get tradingActive():Boolean;

        public function requestInventoryFurniToRecycler():int;

        public function returnInventoryFurniFromRecycler(k:int):Boolean;

        public function getProductData(k:String):IProductData;

        public function getFurnitureData(k:int, _arg_2:String):IFurnitureData;

        public function getFurnitureDataByName(k:String, _arg_2:String, _arg_3:int=0):IFurnitureData;

        public function getPurse():IPurse;

        public function getMarketPlace():IMarketPlace;

        public function getClubGiftController():ClubGiftController;

        public function getClubBuyController():ClubBuyController;

        public function getClubExtendController():ClubExtendController;

        public function getRoomAdsPurchaseInfo():void;

        public function sendRoomAdPurchaseInitiatedEvent():void;

        public function getPixelEffectIcon(k:int):BitmapData;

        public function getSubscriptionProductIcon(k:int):BitmapData;

        public function getSellablePetPalettes(k:String):Array;

        private function updatePurse():void;

        public function get buildersClubEnabled():Boolean;

        public function toggleCatalog(k:String, _arg_2:Boolean=false, _arg_3:Boolean=true):void;

        private function getCurrentLayoutCode():String;

        private function refreshCatalogIndex(k:String):void;

        private function markNewAdditionPageOpened():void;

        private function createCatalogNavigators():void;

        private function createCatalogViewer():void;

        private function createMainWindow():void;

        private function performSearch(k:String):void;

        public function furniDataReady():void;

        private function onRoomSessionEvent(k:RoomSessionEvent):void;

        private function createClubGiftController():void;

        private function createClubBuyController():void;

        private function createClubExtendController():void;

        private function getGiftWrappingConfiguration():void;

        public function getHabboClubOffers(k:int):void;

        public function getHabboClubExtendOffer():void;

        private function onCatalogIndex(k:CatalogIndexMessageEvent):void;

        private function onCatalogPage(k:CatalogPageMessageEvent):void;

        private function handleInAppPurchasePage(k:Vector.<CatalogPageMessageOfferData>):void;

        private function isOfferCompatibleWithCurrentMode(k:Offer):Boolean;

        private function onCatalogPublished(k:IMessageEvent):void;

        private function onPurchaseError(k:IMessageEvent):void;

        private function onPurchaseNotAllowed(k:IMessageEvent):void;

        private function onPurchaseOK(k:IMessageEvent):void;

        private function onGiftReceiverNotFound(k:GiftReceiverNotFoundEvent):void;

        private function onNotEnoughBalance(k:IMessageEvent):void;

        public function showNotEnoughCreditsAlert():void;

        private function onVoucherRedeemOk(k:VoucherRedeemOkMessageEvent):void;

        private function onVoucherRedeemError(k:VoucherRedeemErrorMessageEvent):void;

        private function showAlert(title:String, desc:String):void{
        }
        private function onApproveNameResult(k:ApproveNameMessageEvent):void;

        private function onCreditBalance(k:IMessageEvent):void;

        private function onActivityPointNotification(k:IMessageEvent):void;

        private function onActivityPoints(k:IMessageEvent):void;

        private function onSubscriptionInfo(k:IMessageEvent):void;

        private function onClubGiftInfo(k:ClubGiftInfoEvent):void;

        private function onGiftWrappingConfiguration(k:GiftWrappingConfigurationEvent):void;

        private function onHabboClubOffers(k:HabboClubOffersMessageEvent):void;

        private function onHabboClubExtendOffer(k:HabboClubExtendOfferMessageEvent):void;

        private function onRoomExit(k:IMessageEvent):void;

        private function onSellablePalettes(k:SellablePetPalettesMessageEvent):void;

        private function setElementImage(k:String, _arg_2:BitmapData):void;

        public function redeemVoucher(k:String):void;

        public function productDataReady():void;

        public function isDraggable(k:IPurchasableOffer):Boolean;

        public function getBuilderFurniPlaceableStatus(k:IPurchasableOffer):int;

        private function updateRoom(k:String, _arg_2:String):void;

        public function requestSelectedItemToMover(k:IDragAndDropDoneReceiver, _arg_2:IPurchasableOffer, _arg_3:Boolean=false):void;

        private function onObjectSelected(k:RoomEngineObjectEvent):void;

        private function getUserDataForEvent(k:RoomEngineObjectEvent):IUserData;

        private function onObjectPlaceOnUser(k:RoomEngineObjectPlacedOnUserEvent):void;

        private function onObjectPlacedInRoom(k:RoomEngineObjectPlacedEvent):void;

        private function resetObjectMover(k:Boolean=true):void;

        public function syncPlacedOfferWithPurchase(k:IPurchasableOffer):void;

        public function resetPlacedOfferData(k:Boolean=false):void;

        public function cancelFurniInMover():void;

        public function get imageGalleryHost():String;

        private function retrievePreviewAsset(k:String, _arg_2:Function):void;

        private function showMainWindow():void;

        private function hideMainWindow():void;

        private function mainWindowVisible():Boolean;

        public function update(k:uint):void;

        public function onGuildMemberships(k:GuildMembershipsMessageEvent):void;

        private function onSnowWarGameTokenOffer(k:SnowWarGameTokensMessageEvent):void;

        public function buySnowWarTokensOffer():void;

        public function openClubBuy(k:int, _arg_2:String):void;

        public function checkGiftable(k:IPurchasableOffer):void;

        private function createDirectVipBuyController():void;

        public function hideDirectVipPurchaseWindow():void;

        public function rememberPageDuringVipPurchase(k:int):void;

        public function forgetPageDuringVipPurchase():void;

        public function doNotCloseAfterVipPurchase():void;

        private function initBundleDiscounts():void;

        private function sendGetBundleDiscountRuleset():void;

        public function sendGetProductOffer(k:int):void;

        private function onBundleDiscountRulesetMessageEvent(k:BundleDiscountRulesetMessageEvent):void;

        private function onLimitedEditionSoldOut(k:LimitedEditionSoldOutEvent):void;

        private function onProductOffer(k:ProductOfferEvent):void;

        private function onBuildersClubSubscriptionStatus(k:BuildersClubSubscriptionStatusMessageEvent):void;

        private function onBuildersClubFurniCount(k:BuildersClubFurniCountMessageEvent):void;

        private function refreshBuilderStatus():void;

        public function get bundleDiscountEnabled():Boolean;

        public function get bundleDiscountRuleset():BundleDiscountRuleset;

        public function get multiplePurchaseEnabled():Boolean;

        public function get newAdditionsPageOpenDisabled():Boolean;

        public function showVipBenefits():void;

        public function get currentPage():ICatalogPage;

        public function openRentConfirmationWindow(k:IFurnitureData, _arg_2:Boolean, _arg_3:int=-1, _arg_4:int=-1, _arg_5:Boolean=false):void;

        public function get roomSession():IRoomSession;

        public function get linkPattern():String;

        public function linkReceived(k:String):void;

        public function get inventory():IHabboTabletInventory;

        public function toggleBuilderCatalog():void;

        public function get catalogType():String;

        public function getCatalogNavigator(k:String):ICatalogNavigator;

        public function get currentCatalogNavigator():ICatalogNavigator;

        public function get builderFurniLimit():int;

        public function get builderFurniCount():int;

        public function get builderMaxFurniLimit():int;

        public function get builderSecondsLeft():Number;

        public function get isDoorModeOverriddenInCurrentRoom():Boolean;

        public function getRecycler():IRecycler;

        public function getPublicMarketPlaceOffers(k:int, _arg_2:int, _arg_3:String, _arg_4:int):void;

        public function getOwnMarketPlaceOffers():void;

        public function buyMarketPlaceOffer(k:int):void;

        public function redeemSoldMarketPlaceOffers():void;

        public function redeemExpiredMarketPlaceOffer(k:int):void;

        public function getMarketplaceItemStats(k:int, _arg_2:int):void;

        public function get purse():Purse;

        public function get utils():TabletCatalogUtils;

        public function get furnitureData():Vector.<IFurnitureData>;


    }
}//package com.sulake.habbo.tablet.catalog

