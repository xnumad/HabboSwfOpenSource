//com.sulake.habbo.tablet.inventory.furni.FurniModel

package com.sulake.habbo.tablet.inventory.furni{
    import com.sulake.habbo.tablet.inventory.IInventoryModel;
    import com.sulake.habbo.tablet.inventory.HabboTabletInventory;
    import feathers.data.ListCollection;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import flash.utils.Dictionary;
    import com.sulake.habbo.tablet.inventory.items.FurnitureItem;
    import com.sulake.habbo.tablet.inventory.items.GroupItem;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.room.IStuffData;
    import __AS3__.vec.Vector;

    public class FurniModel implements IInventoryModel {

        private var _controller:HabboTabletInventory;
        private var _collection:ListCollection;
        private var _roomEngine:IRoomEngine;
        private var _communication:IHabboCommunicationManager;
        private var _itemIdInFurniPlacing:int;
        private var _isListInitialized:Boolean;
        private var _bottomAlignedFurniture:Array;
        private var _categorySelection:Dictionary;
        private var _category:String;
        private var _roomItemToSelect:FurnitureItem;
        private var _isInRoom:Boolean;
        private var _disposed:Boolean;

        public function FurniModel(k:HabboTabletInventory, _arg_2:IHabboCommunicationManager, _arg_3:IRoomEngine);

        public function get disposed():Boolean;

        public function get controller():HabboTabletInventory;

        public function get isTradingOpen():Boolean;

        public function get collection():ListCollection;

        public function set categorySelection(k:GroupItem):void;

        public function dispose():void;

        public function insertFurniture(k:Map):void;

        public function isListInited():Boolean;

        public function setListInitialized():void;

        public function createGroupItem(k:int, _arg_2:int, _arg_3:IStuffData, _arg_4:Number=NaN, _arg_5:Boolean=false):GroupItem;

        public function requestInitialization():void;

        public function updateItemLocks():void;

        public function addLockTo(k:int):void;

        public function removeLockFrom(k:int):void;

        public function showRecyclable(k:Boolean):void;

        public function clearFurniList():void;

        public function removeUnseenFurniCounter(k:int):Boolean;

        public function getItemWithStripId(k:int):GroupItem;

        public function addOrUpdateItem(k:FurnitureItem, _arg_2:Boolean):void;

        public function removeFurni(k:int):GroupItem;

        public function updatePostItCount(k:int, _arg_2:int):void;

        public function removeAllLocks():void;

        public function cancelFurniInMover():void;

        public function placeFurniToRoom(k:GroupItem):Boolean;

        public function subCategorySwitch(k:String):void;

        public function resetUnseenItems():void;

        public function updateUnseenItemsThumbs():void;

        private function addItemToTop(k:GroupItem):void;

        private function addItemToBottom(k:GroupItem):void;

        private function removeItem(k:GroupItem):void;

        private function moveItemToTop(k:GroupItem):void;

        private function getAllStripIds():Vector.<int>;

        public function getGroupItemByItemId(k:int):GroupItem;

        public function getGroupItemByItemTypeId(k:int):GroupItem;

        private function isUnseen(k:FurnitureItem):Boolean;

        private function addOrUpdateNonGroupableItem(k:FurnitureItem, _arg_2:Boolean):GroupItem;

        private function addOrUpdateGroupableItem(k:FurnitureItem, _arg_2:Boolean):GroupItem;

        private function requestSelectedFurniToMover(k:FurnitureItem):void;

        public function roomEntered():void;

        public function roomLeft():void;


    }
}//package com.sulake.habbo.tablet.inventory.furni

