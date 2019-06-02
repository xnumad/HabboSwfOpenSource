//com.sulake.habbo.tablet.inventory.bots.BotsModel

package com.sulake.habbo.tablet.inventory.bots{
    import com.sulake.habbo.tablet.inventory.IInventoryModel;
    import com.sulake.habbo.tablet.inventory.HabboTabletInventory;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.room.IRoomEngine;
    import feathers.data.ListCollection;
    import com.sulake.habbo.communication.messages.parser.inventory.bots.BotData;
    import com.sulake.core.utils.Map;
    import flash.events.Event;
    import com.sulake.habbo.session.IRoomSession;

    public class BotsModel implements IInventoryModel {

        private var _controller:HabboTabletInventory;
        private var _communication:IHabboCommunicationManager;
        private var _roomEngine:IRoomEngine;
        private var _collection:ListCollection;
        private var _isPlacing:Boolean;
        private var _disposed:Boolean;

        public function BotsModel(k:HabboTabletInventory, _arg_2:IHabboCommunicationManager, _arg_3:IRoomEngine);

        public function get disposed():Boolean;

        public function dispose():void;

        public function requestInventory():void;

        public function get collection():ListCollection;

        public function addItem(k:BotData):void;

        public function updateItems(k:Map):void;

        public function removeItem(k:int):void;

        public function requestInitialization():void;

        public function placeItemToRoom(k:int, _arg_2:Boolean=false):int;

        private function getItemById(k:int):BotData;

        public function onObjectPlaced(k:Event):void;

        public function get roomSession():IRoomSession;

        public function resetUnseenItems():void;

        public function isUnseen(k:int):Boolean;


    }
}//package com.sulake.habbo.tablet.inventory.bots

