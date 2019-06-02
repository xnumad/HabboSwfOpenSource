//com.sulake.habbo.tablet.catalog.iap.view.LoadingView

package com.sulake.habbo.tablet.catalog.iap.view{
    import feathers.controls.LayoutGroup;
    import feathers.controls.Button;
    import com.sulake.habbo.tablet.catalog.CatalogViewController;
    import starling.display.MovieClip;
    import starling.events.Event;
    import feathers.core.FeathersControl;

    public class LoadingView {

        private var _view:LayoutGroup;
        private var _cancelButton:Button;
        private var _controller:CatalogViewController;
        private var _loadingAnim:MovieClip;

        public function LoadingView(k:CatalogViewController);

        public function dispose():void;

        private function onAddedToStage(k:Event):void;

        private function onRemovedFromStage(k:Event):void;

        public function get view():FeathersControl;

        private function onCancel(k:Event):void;


    }
}//package com.sulake.habbo.tablet.catalog.iap.view

