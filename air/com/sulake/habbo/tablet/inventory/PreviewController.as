//com.sulake.habbo.tablet.inventory.PreviewController

package com.sulake.habbo.tablet.inventory{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import feathers.controls.LayoutGroup;
    import com.sulake.habbo.tablet.inventory.items.GroupItem;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
    import com.sulake.habbo.communication.messages.parser.inventory.bots.BotData;
    import feathers.controls.Label;
    import feathers.controls.ImageLoader;
    import feathers.controls.Button;
    import com.sulake.habbo.room.ImageResult;
    import feathers.core.FeathersControl;
    import flash.display.BitmapData;
    import starling.events.Event;

    public class PreviewController implements IGetImageListener, IAvatarImageListener {

        private static const BG_IMAGE:String;

        private var _disposed:Boolean;
        private var _inventory:HabboTabletInventory;
        private var _view:LayoutGroup;
        private var _groupItem:GroupItem;
        private var _petData:PetData;
        private var _botData:BotData;
        private var _name:Label;
        private var _description:Label;
        private var _extra:Label;
        private var _bgImage:ImageLoader;
        private var _itemImage:ImageLoader;
        private var _placeButton:Button;
        private var _imageResult:ImageResult;
        private var _buttonGroup:LayoutGroup;
        private var _extendButton:Button;
        private var _buyOutButton:Button;
        private var _gotoRoomButton:Button;
        private var _tradeButton:Button;
        private var _isTrading:Boolean;

        public function PreviewController(k:HabboTabletInventory);

        public function dispose():void;

        public function isViewLoaded():Boolean;

        public function get view():FeathersControl;

        private function createButtons():void;

        public function setImage(k:BitmapData):void;

        private function updateButtons():void;

        public function onPlaceButton(k:Event):void;

        public function onExtendButton(k:Event):void;

        public function onBuyOutButton(k:Event):void;

        public function onGotoRoomButton(k:Event):void;

        public function onTradeButton(k:Event):void;

        private function showAlert(k:String, _arg_2:String):void;

        private function resetData():void;

        public function updateFurni(k:GroupItem, _arg_2:Boolean=false):void;

        public function updatePet(k:PetData):void;

        public function updateBot(k:BotData):void;

        private function getFurniImage(k:GroupItem):BitmapData;

        private function getPetImage(k:PetData):BitmapData;

        private function getBotImage(k:BotData):BitmapData;

        public function imageReady(k:int, _arg_2:BitmapData):void;

        public function imageFailed(k:int):void;

        public function avatarImageReady(k:String):void;

        public function get disposed():Boolean;

        public function updateRentedItem():void;


    }
}//package com.sulake.habbo.tablet.inventory

