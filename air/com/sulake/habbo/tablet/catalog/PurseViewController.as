//com.sulake.habbo.tablet.catalog.PurseViewController

package com.sulake.habbo.tablet.catalog{
    import feathers.controls.LayoutGroup;
    import feathers.controls.Label;
    import feathers.controls.ImageLoader;
    import feathers.core.FeathersControl;
    import starling.events.TouchEvent;

    public class PurseViewController {

        private var _catalog:HabboTabletCatalog;
        private var _view:LayoutGroup;
        private var _creditsLabel:Label;
        private var _ducketsLabel:Label;
        private var _clubDaysLabel:Label;
        private var _getMore:ImageLoader;

        public function PurseViewController(k:HabboTabletCatalog);

        private static function createItem(k:Label, _arg_2:String):LayoutGroup;


        public function dispose():void;

        public function isViewLoaded():Boolean;

        public function get view():FeathersControl;

        public function update():void;

        private function onGetMore(k:TouchEvent):void;


    }
}//package com.sulake.habbo.tablet.catalog

