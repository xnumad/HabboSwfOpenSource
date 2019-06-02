//com.sulake.habbo.tablet.catalog.iap.InAppPurchasesViewController

package com.sulake.habbo.tablet.catalog.iap{
    import com.sulake.habbo.tablet.catalog.CatalogViewController;
    import feathers.controls.ScrollContainer;
    import com.sulake.habbo.tablet.catalog.iap.view.InAppProductsView;
    import com.sulake.habbo.tablet.catalog.iap.view.LoadingView;
    import __AS3__.vec.Vector;
    import feathers.core.FeathersControl;
    import starling.events.Event;
    import starling.display.DisplayObject;
    import flash.events.Event;

    public class InAppPurchasesViewController {

        private var _controller:CatalogViewController;
        private var _inAppPurchaser:InAppPurchaser;
        private var _view:ScrollContainer;
        private var _closeCallback:Function;
        private var _productsView:InAppProductsView;
        private var _loadingView:LoadingView;
        private var _productIds:Vector.<String>;

        public function InAppPurchasesViewController(k:CatalogViewController, _arg_2:Function);

        public function dispose():void;

        public function get view():FeathersControl;

        private function onAddedToStage(k:Event):void;

        private function onRemovedFromStage(k:Event):void;

        private function updateViewContent():void;

        private function showLoadingView():void;

        private function showProductsView():void;

        private function setupInAppPurchaser():void;

        private function setupIapProductIds():void;

        private function setupProducts():void;

        private function get productsView():DisplayObject;

        private function get loadingView():DisplayObject;

        private function onIapIdsReady(k:Event):void;

        private function onProductsReady(k:Event):void;

        private function onPocketHabboSessionCreated(k:Event):void;


    }
}//package com.sulake.habbo.tablet.catalog.iap

