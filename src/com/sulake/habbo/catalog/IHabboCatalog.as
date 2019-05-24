package com.sulake.habbo.catalog
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.navigator.IHabboNavigator;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import flash.display.BitmapData;
    import com.sulake.habbo.catalog.purse.IPurse;
    import com.sulake.habbo.catalog.recycler.IRecycler;
    import com.sulake.habbo.catalog.marketplace.IMarketPlace;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.catalog.navigation.ICatalogNavigator;
    import com.sulake.habbo.catalog.offers.IOfferExtension;
    import com.sulake.habbo.catalog.offers.IOfferCenter;

    public interface IHabboCatalog extends IUnknown 
    {
        function redeemVoucher(_arg_1:String):void;
        function loadCatalogPage(_arg_1:int, _arg_2:int, _arg_3:String):void;
        function getRecyclerStatus():void;
        function getRecyclerPrizes():void;
        function sendRecycleItems(_arg_1:Array):void;
        function get assets():IAssetLibrary;
        function get windowManager():IHabboWindowManager;
        function get events():IEventDispatcher;
        function get localization():IHabboLocalizationManager;
        function get connection():IConnection;
        function get navigator():IHabboNavigator;
        function get videoOffers():IVideoOfferManager;
        function toggleCatalog(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=true):void;
        function openCatalog():void;
        function openCatalogPage(_arg_1:String, _arg_2:String=null):void;
        function openRoomAdCatalogPageInExtendedMode(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:Date, _arg_6:int):void;
        function openCatalogPageById(_arg_1:int, _arg_2:int, _arg_3:String):void;
        function openCatalogPageByOfferId(_arg_1:int, _arg_2:String):void;
        function openInventoryCategory(_arg_1:String):void;
        function openCreditsHabblet():void;
        function setupInventoryForRecycler(_arg_1:Boolean):void;
        function requestInventoryFurniToRecycler():int;
        function returnInventoryFurniFromRecycler(_arg_1:int):Boolean;
        function get privateRoomSessionActive():Boolean;
        function get tradingActive():Boolean;
        function getProductData(_arg_1:String):IProductData;
        function getFurnitureData(_arg_1:int, _arg_2:String):IFurnitureData;
        function getPixelEffectIcon(_arg_1:int):BitmapData;
        function getSubscriptionProductIcon(_arg_1:int):BitmapData;
        function getPurse():IPurse;
        function getRecycler():IRecycler;
        function getMarketPlace():IMarketPlace;
        function getPublicMarketPlaceOffers(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int):void;
        function getOwnMarketPlaceOffers():void;
        function buyMarketPlaceOffer(_arg_1:int):void;
        function redeemSoldMarketPlaceOffers():void;
        function redeemExpiredMarketPlaceOffer(_arg_1:int):void;
        function getMarketplaceItemStats(_arg_1:int, _arg_2:int):void;
        function showNotEnoughCreditsAlert():void;
        function getHabboClubOffers(_arg_1:int):void;
        function _Str_17905(_arg_1:int):void;
        function openClubCenter():void;
        function _Str_10922(_arg_1:int=1):Boolean;
        function set giftReceiver(_arg_1:String):void;
        function buySnowWarTokensOffer():void; //Added Snowstorm Client
        function get imageGalleryHost():String;
        function showVipBenefits():void;
        function displayProductIcon(_arg_1:String, _arg_2:int, _arg_3:IBitmapWrapperWindow):void;
        function openRentConfirmationWindow(_arg_1:IFurnitureData, _arg_2:Boolean, _arg_3:int=-1, _arg_4:int=-1, _arg_5:Boolean=false):void;
        function get buildersClubEnabled():Boolean;
        function toggleToBuildersClub():void;
        function get catalogType():String;
        function getCatalogNavigator(_arg_1:String):ICatalogNavigator;
        function get isDoorModeOverriddenInCurrentRoom():Boolean;
        function _Str_17606(_arg_1:IOfferExtension):IOfferCenter;
    }
}
