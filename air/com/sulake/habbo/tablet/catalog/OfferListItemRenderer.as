//com.sulake.habbo.tablet.catalog.OfferListItemRenderer

package com.sulake.habbo.tablet.catalog{
    import feathers.controls.renderers.LayoutGroupListItemRenderer;
    import flash.geom.Point;
    import feathers.controls.Button;
    import feathers.controls.ImageLoader;
    import com.sulake.core.utils.IFileProxy;
    import starling.events.Event;
    import feathers.controls.List;
    import starling.events.TouchEvent;

    public class OfferListItemRenderer extends LayoutGroupListItemRenderer {

        private static const HELPER_POINT:Point;
        private static const OFFER_ICON_BUNDLE:String;

        private var _catalog:HabboTabletCatalog;
        private var _touchID:int;
        private var _iconSize:Number;
        private var _button:Button;
        private var _icon:OfferIconImageLoader;
        private var _hcBadge:ImageLoader;
        private var _padding:Number = 0;
        private var _isScrolling:Boolean;

        public function OfferListItemRenderer();

        private static function get fileProxy():IFileProxy;


        public function get padding():Number;

        public function set padding(k:Number):void;

        public function set catalog(k:HabboTabletCatalog):void;

        override protected function initialize():void;

        private function iconFailedHandler(k:Event):void;

        private function iconCompleteHandler(k:Event):void;

        private function get offerData():IPurchasableOffer;

        override public function set owner(k:List):void;

        override public function set isSelected(k:Boolean):void;

        private function touchHandler(k:TouchEvent):void;

        override protected function commitData():void;

        override protected function preLayout():void;

        override protected function postLayout():void;

        private function centerIcon():void;

        protected function owner_scrollHandler(k:Event):void;


    }
}//package com.sulake.habbo.tablet.catalog

