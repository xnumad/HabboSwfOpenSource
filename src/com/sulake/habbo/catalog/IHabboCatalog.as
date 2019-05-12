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
        function _Str_8756(_arg_1:int, _arg_2:int, _arg_3:String):void;
        function _Str_20292():void;
        function _Str_16716():void;
        function _Str_21779(_arg_1:Array):void;
        function get assets():IAssetLibrary;
        function get windowManager():IHabboWindowManager;
        function get events():IEventDispatcher;
        function get localization():IHabboLocalizationManager;
        function get connection():IConnection;
        function get navigator():IHabboNavigator;
        function get _Str_12955():IVideoOfferManager;
        function toggleCatalog(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=true):void;
        function openCatalog():void;
        function openCatalogPage(_arg_1:String, _arg_2:String=null):void;
        function _Str_20241(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:Date, _arg_6:int):void;
        function _Str_9617(_arg_1:int, _arg_2:int, _arg_3:String):void;
        function _Str_10210(_arg_1:int, _arg_2:String):void;
        function _Str_22930(_arg_1:String):void;
        function openCreditsHabblet():void;
        function _Str_6903(_arg_1:Boolean):void;
        function _Str_21040():int;
        function _Str_11363(_arg_1:int):Boolean;
        function get _Str_18865():Boolean;
        function get _Str_11415():Boolean;
        function getProductData(_arg_1:String):IProductData;
        function _Str_3414(_arg_1:int, _arg_2:String):IFurnitureData;
        function getPixelEffectIcon(_arg_1:int):BitmapData;
        function getSubscriptionProductIcon(_arg_1:int):BitmapData;
        function getPurse():IPurse;
        function getRecycler():IRecycler;
        function getMarketPlace():IMarketPlace;
        function _Str_13179(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int):void;
        function _Str_21303():void;
        function _Str_20655(_arg_1:int):void;
        function _Str_20790():void;
        function _Str_20643(_arg_1:int):void;
        function _Str_19762(_arg_1:int, _arg_2:int):void;
        function _Str_7857():void;
        function _Str_12433(_arg_1:int):void;
        function _Str_17905(_arg_1:int):void;
        function openClubCenter():void;
        function _Str_10922(_arg_1:int=1):Boolean;
        function set _Str_17069(_arg_1:String):void;
        function _SafeStr_6513():void; //Added Snowstorm Client
        function get imageGalleryHost():String;
        function showVipBenefits():void;
        function _Str_13308(_arg_1:String, _arg_2:int, _arg_3:IBitmapWrapperWindow):void;
        function _Str_10356(_arg_1:IFurnitureData, _arg_2:Boolean, _arg_3:int=-1, _arg_4:int=-1, _arg_5:Boolean=false):void;
        function get _Str_11754():Boolean;
        function toggleToBuildersClub():void;
        function get catalogType():String;
        function _Str_6290(_arg_1:String):ICatalogNavigator;
        function get _Str_7781():Boolean;
        function _Str_17606(_arg_1:IOfferExtension):IOfferCenter;
    }
}
