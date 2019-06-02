//com.sulake.habbo.tablet.catalog.TabletCatalogUtils

package com.sulake.habbo.tablet.catalog{
    public class TabletCatalogUtils {

        private var _catalog:HabboTabletCatalog;
        private var _disposed:Boolean;
        private var _bundleDiscountFlatPriceSteps:Array;
        private var _bundleDiscountHighestFlatPriceStep:int;

        public function TabletCatalogUtils(k:HabboTabletCatalog);

        public function dispose():void;

        public function get disposed():Boolean;

        public function calculateBundlePrice(k:Boolean, _arg_2:int, _arg_3:int):int;

        public function getDiscountItemsCount(k:int):int;

        private function getBasicBundleDiscountSize(k:int):int;

        private function getBonusBundleDiscountSize(k:int):int;

        private function getThresholdBundleDiscountSize(k:int):int;

        public function get bundleDiscountFlatPriceSteps():Array;

        public function get bundleDiscountHighestFlatPriceStep():int;

        public function resolveBundleDiscountFlatPriceSteps():void;

        public function getFreeItemCount(k:Number, _arg_2:int):int;


    }
}//package com.sulake.habbo.tablet.catalog

