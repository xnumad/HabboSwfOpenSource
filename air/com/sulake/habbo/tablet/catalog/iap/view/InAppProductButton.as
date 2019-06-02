//com.sulake.habbo.tablet.catalog.iap.view.InAppProductButton

package com.sulake.habbo.tablet.catalog.iap.view{
    import feathers.controls.renderers.LayoutGroupListItemRenderer;
    import feathers.controls.renderers.IListItemRenderer;
    import feathers.controls.Button;
    import feathers.controls.Label;
    import com.sulake.feathers.controls.RotatingRays;
    import starling.extensions.PDParticleSystem;
    import feathers.controls.ImageLoader;
    import com.sulake.core.utils.IFileProxy;
    import starling.events.Event;

    public class InAppProductButton extends LayoutGroupListItemRenderer implements IListItemRenderer {

        private var _button:Button;
        private var _nameLabel:Label;
        private var _priceLabel:Label;
        private var _bg:RotatingRays;
        private var _particles:PDParticleSystem;
        private var _productImage:ImageLoader;

        public function InAppProductButton();

        private static function get fileProxy():IFileProxy;


        override public function dispose():void;

        override protected function initialize():void;

        private function onAddedToStage(k:Event):void;

        private function onRemovedFromStage(k:Event):void;

        private function onTriggered(k:Event):void;

        override protected function draw():void;

        override protected function commitData():void;

        override public function set isSelected(k:Boolean):void;


    }
}//package com.sulake.habbo.tablet.catalog.iap.view

