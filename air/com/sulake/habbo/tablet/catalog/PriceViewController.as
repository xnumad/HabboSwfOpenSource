//com.sulake.habbo.tablet.catalog.PriceViewController

package com.sulake.habbo.tablet.catalog{
    import feathers.controls.LayoutGroup;
    import feathers.controls.NumericStepper;
    import feathers.controls.Label;
    import feathers.controls.Button;
    import feathers.controls.ImageLoader;
    import feathers.core.FeathersControl;
    import starling.events.Event;

    public class PriceViewController {

        private var _catalog:HabboTabletCatalog;
        private var _purchaseHandler:IPurchaseHandler;
        private var _view:LayoutGroup;
        private var _rightContainer:LayoutGroup;
        private var _stepper:NumericStepper;
        private var _priceTitle:Label;
        private var _priceLabel:Label;
        private var _bonusView:BonusItemView;
        private var _buyButton:Button;
        private var _selectedOffer:IPurchasableOffer;
        private var _hcNeededView:HCNeededView;
        private var _currencyIcon:ImageLoader;

        public function PriceViewController(k:HabboTabletCatalog, _arg_2:IPurchaseHandler=null);

        public function dispose():void;

        public function get view():FeathersControl;

        private function onBuyButtonTriggered(k:Event):void;

        private function onStepperChange(k:Event):void;

        private function updateView():void;

        public function isViewLoaded():Boolean;

        public function update(k:IPurchasableOffer):void;


    }
}//package com.sulake.habbo.tablet.catalog

