//com.sulake.habbo.toolbar.extension.inventory.InventoryPeek

package com.sulake.habbo.toolbar.extension.inventory{
    import com.sulake.habbo.toolbar.Toolbar;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.tablet.inventory.IHabboTabletInventory;
    import feathers.controls.LayoutGroup;
    import feathers.controls.Button;
    import feathers.controls.Label;
    import feathers.controls.ImageLoader;
    import starling.display.DisplayObject;
    import starling.events.Event;

    public class InventoryPeek {

        private static const BUTTON_DIMENSION_ORIG:int;
        private static var BUTTON_DIMENSION:int;

        private var _toolbar:Toolbar;
        private var _roomEngine:IRoomEngine;
        private var _inventory:IHabboTabletInventory;
        private var _view:LayoutGroup;
        private var _closeBtn:Button;
        private var _itemButton:Button;
        private var _amountLabel:Label;
        private var _imageLoader:ImageLoader;
        private var _objectTypeId:int;
        private var _objectCategory:int;
        private var _extraData:String;
        private var _isDisposed:Boolean;

        public function InventoryPeek(k:Toolbar, _arg_2:IRoomEngine, _arg_3:IHabboTabletInventory);

        public function dispose():void;

        public function get disposed():Boolean;

        public function get view():DisplayObject;

        public function peek(k:int, _arg_2:int, _arg_3:String):Boolean;

        private function updateAmount(k:int):void;

        private function updateImage(k:int, _arg_2:int, _arg_3:String):void;

        private function getItemsLeftCount(k:int):int;

        private function onItemTriggered(k:Event):void;

        private function onCloseBtn(k:Event):void;

        private function createView():void;


    }
}//package com.sulake.habbo.toolbar.extension.inventory

