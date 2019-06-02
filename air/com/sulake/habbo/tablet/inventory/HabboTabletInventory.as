//com.sulake.habbo.tablet.inventory.HabboTabletInventory

package com.sulake.habbo.tablet.inventory{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.tablet.catalog.IHabboTabletCatalog;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import __AS3__.vec.Vector;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;
    import com.sulake.habbo.tablet.inventory.furni.FurniModel;
    import com.sulake.habbo.tablet.inventory.pets.PetsModel;
    import com.sulake.habbo.tablet.inventory.bots.BotsModel;
    import com.sulake.habbo.tablet.inventory.trading.TradingModel;
    import starling.display.DisplayObject;
    import com.sulake.habbo.tablet.inventory.items.IFurnitureItem;
    import com.sulake.habbo.tablet.inventory.items.GroupItem;
    import com.sulake.habbo.session.furniture.IFurnitureData;

    public class HabboTabletInventory extends Component implements IHabboTabletInventory {

        private var _communication:IHabboCommunicationManager;
        private var _incomingMessages:IncomingMessages;
        private var _sessionDataManager:ISessionDataManager;
        private var _localization:IHabboLocalizationManager;
        private var _inventories:Map;
        private var _roomEngine:IRoomEngine;
        private var _catalog:IHabboTabletCatalog;
        private var _roomSession:IRoomSession;
        private var _initedInventoryCategories:Array;
        private var _avatarRenderer:IAvatarRenderManager;
        private var _isInitialized:Boolean;
        private var _unseenItemTracker:UnseenItemTracker;
        private var _viewController:InventoryViewController;

        public function HabboTabletInventory(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null);

        public function get isInitialized():Boolean;

        public function get unseenItemTracker():IUnseenItemTracker;

        override protected function get dependencies():Vector.<ComponentDependency>{
        }
        override protected function initComponent():void;

        override public function dispose():void;

        private function roomSessionEventHandler(k:RoomSessionEvent):void;

        private function roomSessionChatEventHandler(k:RoomSessionChatEvent):void;

        public function get communication():IHabboCommunicationManager;

        public function get roomEngine():IRoomEngine;

        public function get avatarRenderer():IAvatarRenderManager;

        public function get sessionDataManager():ISessionDataManager;

        public function getModel(k:String):IInventoryModel;

        public function get furniModel():FurniModel;

        public function get rentablesModel():FurniModel;

        public function get petsModel():PetsModel;

        public function get botsModel():BotsModel;

        public function get tradingModel():TradingModel;

        public function get roomSession():IRoomSession;

        public function get hasRoomSession():Boolean;

        public function getSubCategoryViewId():String;

        public function setupTrading(k:int, _arg_2:int):void;

        public function closeTrading():void;

        private function init():void;

        public function closeView():void;

        public function setInventoryCategoryInit(k:String, _arg_2:Boolean=true):void;

        public function isInventoryCategoryInit(k:String):Boolean;

        public function checkCategoryInitilization(k:String):Boolean;

        public function requestInventoryCategoryInit(k:String):void;

        public function get localization():IHabboLocalizationManager;

        public function updateUnseenItemCounts():void;

        public function removeUnseenFurniCounter(k:int):Boolean;

        public function get botsMax():int;

        public function get view():DisplayObject;

        public function isViewLoaded():Boolean;

        public function updateView():void;

        public function get viewController():InventoryViewController;

        public function amountOfFurnitureItems(k:int):int;

        public function getFurnitureItem(k:int):IFurnitureItem;

        public function gotoRoom(k:GroupItem):void;

        public function extendRentPeriod(k:GroupItem):void;

        public function buyRentedItem(k:GroupItem):void;

        public function getFurnitureData(k:int, _arg_2:String):IFurnitureData;

        public function getFurnitureDataByName(k:String, _arg_2:String, _arg_3:int=0):IFurnitureData;

        public function acceptTradingRequest(k:int):void;


    }
}//package com.sulake.habbo.tablet.inventory

