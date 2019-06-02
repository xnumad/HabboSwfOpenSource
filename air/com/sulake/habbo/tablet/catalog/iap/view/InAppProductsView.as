//com.sulake.habbo.tablet.catalog.iap.view.InAppProductsView

package com.sulake.habbo.tablet.catalog.iap.view{
    import com.sulake.habbo.tablet.catalog.HabboTabletCatalog;
    import com.sulake.habbo.tablet.catalog.iap.InAppPurchaser;
    import feathers.controls.LayoutGroup;
    import __AS3__.vec.Vector;
    import feathers.controls.List;
    import feathers.controls.TextInput;
    import feathers.controls.Label;
    import feathers.core.FeathersControl;
    import starling.events.Event;
    import starling.events.TouchEvent;
    import starling.display.DisplayObject;

    public class InAppProductsView {

        private static const BUTTON_DIMENSION:int;

        private var _catalog:HabboTabletCatalog;
        private var _iapPurchaser:InAppPurchaser;
        private var _view:LayoutGroup;
        private var _detailsView:InAppProductDetailsView;
        private var _productIds:Vector.<String>;
        private var _list:List;
        private var _voucherInput:TextInput;
        private var _importantMessage:Label;
        private var _deliveringGoodsView:InAppDeliveringGoodsView;

        public function InAppProductsView(k:HabboTabletCatalog, _arg_2:InAppPurchaser, _arg_3:Vector.<String>);

        public function dispose():void;

        public function get view():FeathersControl;

        public function showDeliveringGoods():void;

        public function hideDeliveringGoods():void;

        private function createView():void;

        private function onVoucherInputEnterKey(k:Event):void;

        private function onImportantMessageTouch(k:TouchEvent):void;

        private function productButtonFactory():InAppProductButton;

        private function onListSelectionChange(k:Event):void;

        private function calloutText(k:DisplayObject, _arg_2:String):void;


    }
}//package com.sulake.habbo.tablet.catalog.iap.view

