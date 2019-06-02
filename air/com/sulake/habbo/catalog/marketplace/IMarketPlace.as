//com.sulake.habbo.catalog.marketplace.IMarketPlace

package com.sulake.habbo.catalog.marketplace{
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.utils.Map;

    public /*dynamic*/ interface IMarketPlace {

        function get windowManager():IHabboWindowManager;
        function get localization():IHabboLocalizationManager;
        function registerVisualization(k:IMarketPlaceVisualization=null):void;
        function onOffers(k:IMessageEvent):void;
        function onOwnOffers(k:IMessageEvent):void;
        function onBuyResult(k:IMessageEvent):void;
        function onCancelResult(k:IMessageEvent):void;
        function requestOffersByName(k:String):void;
        function requestOffersByPrice(k:int):void;
        function requestOffers(k:int, _arg_2:int, _arg_3:String, _arg_4:int):void;
        function refreshOffers():void;
        function requestOwnItems():void;
        function requestItemStats(k:int, _arg_2:int):void;
        function buyOffer(k:int):void;
        function redeemExpiredOffer(k:int):void;
        function redeemSoldOffers():void;
        function latestOffers():Map;
        function latestOwnOffers():Map;
        function totalItemsFound():int;
        function set itemStats(k:MarketplaceItemStats):void;
        function get itemStats():MarketplaceItemStats;
        function get creditsWaiting():int;
        function get averagePricePeriod():int;
        function set averagePricePeriod(k:int):void;
        function getNameLocalizationKey(k:IMarketPlaceOfferData):String;
        function getDescriptionLocalizationKey(k:IMarketPlaceOfferData):String;
        function isAccountSafetyLocked():Boolean;

    }
}//package com.sulake.habbo.catalog.marketplace

