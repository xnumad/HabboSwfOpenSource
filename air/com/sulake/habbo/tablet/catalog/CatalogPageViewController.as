//com.sulake.habbo.tablet.catalog.CatalogPageViewController

package com.sulake.habbo.tablet.catalog{
    import com.sulake.habbo.room.IGetImageListener;
    import feathers.controls.LayoutGroup;
    import feathers.controls.List;
    import feathers.controls.ImageLoader;
    import feathers.controls.Label;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.habbo.tablet.catalog.viewer.IPageLocalization;
    import feathers.core.FeathersControl;
    import starling.events.TouchEvent;
    import feathers.controls.renderers.IListItemRenderer;
    import starling.events.Event;
    import flash.display.BitmapData;
    import __AS3__.vec.Vector;

    public class CatalogPageViewController implements IGetImageListener, IPurchaseHandler {

        private static const BG_IMAGE:String;

        private var _catalog:HabboTabletCatalog;
        private var _view:LayoutGroup;
        private var _list:List;
        private var _previewContainer:LayoutGroup;
        private var _previewImage:ImageLoader;
        private var _offerTitle:Label;
        private var _offerDescription:Label;
        private var _imageResult:ImageResult;
        private var _infoIcon:ImageLoader;
        private var _bgImage:ImageLoader;
        private var _selectedOffer:IPurchasableOffer;
        private var _priceViewController:PriceViewController;
        private var _confirmationViewController:PurchaseConfirmationViewController;
        private var _currentPageId:int;
        private var _currentPageLocalization:IPageLocalization;

        public function CatalogPageViewController(k:HabboTabletCatalog);

        public function dispose():void;

        public function isViewLoaded():Boolean;

        public function get view():FeathersControl;

        private function onInfoEvent(k:TouchEvent):void;

        private function showPageInfo():void;

        private function createListRenderer():IListItemRenderer;

        private function onListChange(k:Event):void;

        public function showOffer(k:IPurchasableOffer):void;

        private function setImage(k:BitmapData):void;

        public function purchase(k:IPurchasableOffer, _arg_2:int):void;

        public function update(k:int, _arg_2:String, _arg_3:IPageLocalization, _arg_4:Vector.<IPurchasableOffer>, _arg_5:int, _arg_6:Boolean):void;

        private function getFurniImage(k:IPurchasableOffer):BitmapData;

        public function imageReady(k:int, _arg_2:BitmapData):void;

        public function imageFailed(k:int):void;

        public function get confirmationViewController():PurchaseConfirmationViewController;


    }
}//package com.sulake.habbo.tablet.catalog

