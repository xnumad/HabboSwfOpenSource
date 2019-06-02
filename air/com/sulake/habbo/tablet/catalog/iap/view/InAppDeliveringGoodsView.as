//com.sulake.habbo.tablet.catalog.iap.view.InAppDeliveringGoodsView

package com.sulake.habbo.tablet.catalog.iap.view{
    import feathers.controls.LayoutGroup;
    import starling.display.MovieClip;
    import feathers.core.FeathersControl;
    import starling.events.Event;

    public class InAppDeliveringGoodsView {

        private var _view:LayoutGroup;
        private var _loadingAnim:MovieClip;
        private var _isDisposed:Boolean;

        public function InAppDeliveringGoodsView();

        public function dispose():void;

        public function get disposed():Boolean;

        public function get view():FeathersControl;

        private function onAddedToStage(k:Event):void;

        private function onRemovedFromStage(k:Event):void;

        private function stopAnimation():void;

        private function createView():void;


    }
}//package com.sulake.habbo.tablet.catalog.iap.view

