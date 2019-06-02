//com.sulake.habbo.tablet.inventory.items.GroupItem

package com.sulake.habbo.tablet.inventory.items{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.tablet.inventory.furni.FurniModel;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.IStuffData;
    import flash.display.BitmapData;
    import com.sulake.habbo.room.IRoomContentLoaderUrl;

    public class GroupItem implements IGetImageListener {

        private var _model:FurniModel;
        private var _type:int;
        private var _items:Map;
        private var _roomEngine:IRoomEngine;
        private var _locked:Boolean;
        private var _selected:Boolean;
        private var _furniCategory:int;
        private var _stuffData:IStuffData;
        private var _extra:Number;
        private var _iconCallbackId:int;
        private var _iconImage:BitmapData;
        private var _showRecyclable:Boolean;
        private var _holdImageInit:Boolean;
        private var _hasUnseenItems:Boolean;
        private var _alignment:String;
        private var _name:String;
        private var _description:String;
        private var _waitingSongInfoId:int;

        public function GroupItem(k:FurniModel, _arg_2:int, _arg_3:int, _arg_4:IRoomEngine, _arg_5:Boolean, _arg_6:IStuffData, _arg_7:Number, _arg_8:Boolean, _arg_9:String);

        public function dispose():void;

        public function get thumbUrl():IRoomContentLoaderUrl;

        public function get isLocked():Boolean;

        public function set isLocked(k:Boolean):void;

        public function get isSelected():Boolean;

        public function set isSelected(k:Boolean):void;

        public function get type():int;

        public function get furniCategory():int;

        public function get stuffData():IStuffData;

        public function get extra():Number;

        public function set showRecyclable(k:Boolean):void;

        public function get hasUnseenItems():Boolean;

        public function set hasUnseenItems(k:Boolean):void;

        public function get alignment():String;

        public function get isWallItem():Boolean;

        public function get flatId():int;

        public function get isGroupable():Boolean;

        public function get isRented():Boolean;

        public function get name():String;

        public function get description():String;

        public function push(k:FurnitureItem, _arg_2:Boolean=false):void;

        public function unshift(k:FurnitureItem):void;

        public function pop():FurnitureItem;

        public function peek():FurnitureItem;

        public function getAt(k:int):FurnitureItem;

        public function getOneForTrade():FurnitureItem;

        public function getOneForRecycle():FurnitureItem;

        public function getOneForSelling():FurnitureItem;

        public function getFurniIds():Array;

        public function addLockTo(k:int):Boolean;

        public function updateLocks(k:Array):Boolean;

        public function removeLockFrom(k:int):Boolean;

        public function removeAllLocks():Boolean;

        public function getTotalCount():int;

        public function getRecyclableCount():int;

        public function getTradeableCount():int;

        public function remove(k:int):FurnitureItem;

        public function getItem(k:int):FurnitureItem;

        public function replaceItem(k:int, _arg_2:FurnitureItem):void;

        public function getUnlockedCount():int;

        public function updateAllThumbDataVisuals():void;

        public function imageReady(k:int, _arg_2:BitmapData):void;

        public function imageFailed(k:int):void;

        private function updateRentStateVisual():void;

        private function updateItemCountVisual():void;

        private function updateBackgroundVisual():void;

        private function updateSelectionVisual():void;

        private function updateRecycleStatusVisual():void;

        private function updateItemImageVisual():void;

        private function getFurniItemName():String;

        private function getFurniItemDesc():String;

        private function getSongInfo(k:FurnitureItem):void;


    }
}//package com.sulake.habbo.tablet.inventory.items

