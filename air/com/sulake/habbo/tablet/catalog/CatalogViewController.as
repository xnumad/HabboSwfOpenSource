//com.sulake.habbo.tablet.catalog.CatalogViewController

package com.sulake.habbo.tablet.catalog{
    import com.sulake.habbo.tablet.catalog.iap.InAppPurchasesViewController;
    import feathers.controls.LayoutGroup;
    import com.sulake.feathers.controls.Accordion;
    import feathers.controls.TextInput;
    import feathers.controls.Alert;
    import starling.display.DisplayObject;
    import feathers.core.FeathersControl;
    import starling.events.Event;
    import com.sulake.habbo.tablet.catalog.viewer.IPageLocalization;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.session.furniture.IFurnitureData;

    public class CatalogViewController {

        private static const VIEW_STATE_MAIN:int;
        private static const VIEW_STATE_IAP:int;
        private static const TOP_MARGIN:int;
        private static const SIDE_MARGIN:int;
        private static const BOTTOM_MARGIN:int;

        private var _catalog:HabboTabletCatalog;
        private var _purseViewController:PurseViewController;
        private var _pageViewController:CatalogPageViewController;
        private var _inAppPurchasesCtrl:InAppPurchasesViewController;
        private var _mainView:LayoutGroup;
        private var _view:LayoutGroup;
        private var _mainContainer:LayoutGroup;
        private var _nodeNavigator:Accordion;
        private var _leftContainer:LayoutGroup;
        private var _searchField:TextInput;
        private var _catalogType:String;
        private var _notEnoughCreditsAlert:Alert;
        private var _viewState:int;
        private var _rentConfirmation:RentConfirmationViewController;

        public function CatalogViewController(k:HabboTabletCatalog);

        public function dispose():void;

        public function get catalog():HabboTabletCatalog;

        public function isViewLoaded():Boolean;

        public function get view():DisplayObject;

        public function get purseView():FeathersControl;

        private function get inAppPurchasesCtrl():InAppPurchasesViewController;

        private function createView():void;

        private function createMainView():void;

        public function update():void;

        private function onSearchFieldClear(k:Event):void;

        private function onSearchFieldEnter(k:Event):void;

        private function populateSearch(k:String):void;

        private function onNodeNavigatorItemSelected(k:Event):void;

        public function updatePurse():void;

        public function showCatalogPage(k:int, _arg_2:String, _arg_3:IPageLocalization, _arg_4:Vector.<IPurchasableOffer>, _arg_5:int, _arg_6:Boolean):void;

        private function onCloseButton(k:Event):void;

        public function showMainView():void;

        public function showInAppPurchases():void;

        public function showNotEnoughCredits(k:Boolean, _arg_2:Boolean, _arg_3:int):void;

        private function onAlertClosed(k:Event):void;

        private function onGetMoreCoinsTouch(k:Event):void;

        public function showRentConfirmation(k:IFurnitureData, _arg_2:Boolean, _arg_3:int, _arg_4:int, _arg_5:Boolean):void;

        public function get pageViewController():CatalogPageViewController;

        public function purchaseCompleted(k:Boolean, _arg_2:int=-1):void;


    }
}//package com.sulake.habbo.tablet.catalog

