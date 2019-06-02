//com.sulake.habbo.tablet.catalog.iap.view.InAppPurchaseSuccessView

package com.sulake.habbo.tablet.catalog.iap.view{
    import feathers.controls.LayoutGroup;
    import feathers.controls.Button;
    import feathers.controls.Label;
    import com.sulake.feathers.controls.RotatingRays;
    import starling.extensions.PDParticleSystem;
    import feathers.controls.ImageLoader;
    import com.sulake.core.utils.IFileProxy;
    import com.adobe.ane.productStore.Product;
    import feathers.core.FeathersControl;
    import starling.events.Event;

    public class InAppPurchaseSuccessView {

        private static const BUTTON_DIMENSION:int;

        private var _view:LayoutGroup;
        private var _button:Button;
        private var _nameLabel:Label;
        private var _bg:RotatingRays;
        private var _particles:PDParticleSystem;
        private var _productImage:ImageLoader;

        public function InAppPurchaseSuccessView();

        private static function get fileProxy():IFileProxy;


        public function dispose():void;

        public function populateProduct(k:Product):void;

        public function get view():FeathersControl;

        private function createView():void;

        private function createProductButton():LayoutGroup;

        private function onAddedToStage(k:Event):void;

        private function onRemovedFromStage(k:Event):void;

        private function stopAnimations():void;

        private function onOkBtn(k:Event):void;


    }
}//package com.sulake.habbo.tablet.catalog.iap.view

