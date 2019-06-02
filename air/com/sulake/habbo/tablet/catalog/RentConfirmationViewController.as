//com.sulake.habbo.tablet.catalog.RentConfirmationViewController

package com.sulake.habbo.tablet.catalog{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.communication.messages.incoming.room.furniture.FurniRentOrBuyoutOfferMessageEvent;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import feathers.controls.LayoutGroup;
    import feathers.controls.ImageLoader;
    import com.sulake.habbo.room.IRoomEngine;
    import starling.events.Event;
    import flash.display.BitmapData;

    public class RentConfirmationViewController implements IDisposable, IGetImageListener {

        private static const MODE_INFOSTAND:int;
        private static const MODE_INVENTORY:int;
        private static const MODE_CATALOGUE:int;

        private var _disposed:Boolean;
        private var _offerMessageEvent:FurniRentOrBuyoutOfferMessageEvent;
        private var _isBuyout:Boolean;
        private var _id:int;
        private var _catalog:HabboTabletCatalog;
        private var _furniData:IFurnitureData;
        private var _mode:int;
        private var _roomInstanceId:int;
        private var _stripId:int;
        private var _view:LayoutGroup;
        private var _image:ImageLoader;

        public function RentConfirmationViewController(k:HabboTabletCatalog);

        private function onFurniRentOrBuyoutOffer(k:FurniRentOrBuyoutOfferMessageEvent):void;

        public function dispose():void;

        public function get disposed():Boolean;

        public function show(k:IFurnitureData, _arg_2:Boolean, _arg_3:int=-1, _arg_4:int=-1, _arg_5:Boolean=false):void;

        private function get roomEngine():IRoomEngine;

        private function disposeView():void;

        private function onCancelButton(k:Event):void;

        private function onOkButton(k:Event):void;

        public function imageReady(k:int, _arg_2:BitmapData):void;

        public function imageFailed(k:int):void;


    }
}//package com.sulake.habbo.tablet.catalog

