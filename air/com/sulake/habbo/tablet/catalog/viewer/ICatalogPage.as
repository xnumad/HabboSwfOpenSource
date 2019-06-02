//com.sulake.habbo.tablet.catalog.viewer.ICatalogPage

package com.sulake.habbo.tablet.catalog.viewer{
    import flash.events.Event;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.tablet.catalog.IPurchasableOffer;

    public /*dynamic*/ interface ICatalogPage {

        function dispose():void;
        function init():void;
        function closed():void;
        function dispatchWidgetEvent(k:Event):Boolean;
        function get viewer():ICatalogViewer;
        function get pageId():int;
        function get offers():Vector.<IPurchasableOffer>;
        function get localization():IPageLocalization;
        function get layoutCode():String;
        function get hasLinks():Boolean;
        function get links():Array;
        function selectOffer(k:int):void;
        function replaceOffers(k:Vector.<IPurchasableOffer>, _arg_2:Boolean=false):void;
        function updateLimitedItemsLeft(k:int, _arg_2:int):void;
        function get acceptSeasonCurrencyAsCredits():Boolean;
        function get allowDragging():Boolean;
        function set searchPageId(k:int):void;
        function get mode():int;
        function get isBuilderPage():Boolean;

    }
}//package com.sulake.habbo.tablet.catalog.viewer

