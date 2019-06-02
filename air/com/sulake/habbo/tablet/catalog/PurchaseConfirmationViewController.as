//com.sulake.habbo.tablet.catalog.PurchaseConfirmationViewController

package com.sulake.habbo.tablet.catalog{
    import feathers.controls.LayoutGroup;
    import feathers.controls.Label;
    import feathers.controls.ScrollContainer;
    import feathers.controls.Button;
    import feathers.controls.ImageLoader;
    import starling.display.DisplayObject;
    import feathers.controls.Alert;
    import starling.textures.Texture;
    import starling.events.Event;

    public class PurchaseConfirmationViewController {

        private static const WIDTH:int;

        private var _catalog:HabboTabletCatalog;
        private var _offer:IPurchasableOffer;
        private var _pageId:int;
        private var _extraParameter:String;
        private var _quantity:int;
        private var _freeItems:int;
        private var _view:LayoutGroup;
        private var _title:Label;
        private var _priceContainer:ScrollContainer;
        private var _cancelButton:Button;
        private var _okButton:Button;
        private var _image:ImageLoader;
        private var _modalOverlay:DisplayObject;
        private var _completed:Boolean;
        private var _alert:Alert;

        public function PurchaseConfirmationViewController(k:HabboTabletCatalog);

        public function dispose():void;

        public function show(k:IPurchasableOffer, _arg_2:int, _arg_3:int, _arg_4:Texture, _arg_5:String=""):void;

        public function getOverlay():DisplayObject;

        private function disposeView():void;

        private function onCancelButton(k:Event):void;

        private function onOkButton(k:Event):void;

        public function completed(k:Boolean, _arg_2:int=-1):void;

        private function onAlerClosed(k:Event):void;


    }
}//package com.sulake.habbo.tablet.catalog

