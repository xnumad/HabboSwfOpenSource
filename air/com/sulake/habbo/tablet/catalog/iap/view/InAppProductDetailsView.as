//com.sulake.habbo.tablet.catalog.iap.view.InAppProductDetailsView

package com.sulake.habbo.tablet.catalog.iap.view{
    import com.sulake.habbo.tablet.catalog.iap.InAppPurchaser;
    import feathers.controls.LayoutGroup;
    import feathers.controls.Button;
    import feathers.controls.ImageLoader;
    import feathers.controls.Label;
    import com.adobe.ane.productStore.Product;
    import com.sulake.core.utils.IFileProxy;
    import feathers.core.FeathersControl;
    import starling.events.Event;
    import com.sulake.habbo.tablet.catalog.iap.InAppPurchaseEvent;

    public class InAppProductDetailsView {

        private static const CREDIT_TEASER_SOURCE:String;

        private var _iapView:InAppProductsView;
        private var _iapPurchaser:InAppPurchaser;
        private var _view:LayoutGroup;
        private var _purchaseBtn:Button;
        private var _purchaseTeaser:ImageLoader;
        private var _teaserTitle:Label;
        private var _teaserDescription:Label;
        private var _p:Product;

        public function InAppProductDetailsView(k:InAppProductsView, _arg_2:InAppPurchaser);

        private static function get fileProxy():IFileProxy;


        public function dispose():void;

        public function get view():FeathersControl;

        public function populateData(k:Product):void;

        private function onStartAlphaTween():void;

        private function createView():void;

        private function onRemovedFromStage(k:Event):void;

        private function onPurchaseBtn(k:Event):void;

        private function onPurchaseValidationOk(k:InAppPurchaseEvent):void;

        private function onPurchaseValidationFail(k:InAppPurchaseEvent):void;

        private function onPurchaseFail(k:InAppPurchaseEvent):void;

        private function onPurchaseCanceled(k:InAppPurchaseEvent):void;

        private function showAlert(title:String, desc:String):void{
        }

    }
}//package com.sulake.habbo.tablet.catalog.iap.view

