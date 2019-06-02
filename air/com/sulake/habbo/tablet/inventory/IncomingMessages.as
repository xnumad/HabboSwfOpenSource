//com.sulake.habbo.tablet.inventory.IncomingMessages

package com.sulake.habbo.tablet.inventory{
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import __AS3__.vec.Vector;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.pets.PetInventoryEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.pets.PetAddedToInventoryEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.pets.PetRemovedFromInventoryEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.bots.BotInventoryEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.bots.BotRemovedFromInventoryEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.bots.BotAddedToInventoryEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradeOpenFailedEvent;

    [SecureSWF(rename="true")]
    public class IncomingMessages {

        private var _inventory:HabboTabletInventory;
        private var _com:IHabboCommunicationManager;
        private var _petMsgFragments:Vector.<Map>;
        private var _furniMsgFragments:Vector.<Map>;
        private var _rentedFurniMsgFragments:Vector.<Map>;

        public function IncomingMessages(k:HabboTabletInventory);

        public function dispose():void;

        public function onFurniList(k:FurniListEvent):void;

        public function onFurnitureAddOrUpdate(k:IMessageEvent):void;

        public function onFurniListRemove(k:IMessageEvent):void;

        public function onFurniListInvalidate(k:IMessageEvent):void;

        public function onPostItPlaced(k:IMessageEvent):void;

        private function onRoomLeft(k:IMessageEvent):void;

        private function addMessageFragment(k:Map, _arg_2:int, _arg_3:int, _arg_4:Vector.<Map>):Map;

        private function onPets(k:PetInventoryEvent):void;

        private function onPetAdded(k:PetAddedToInventoryEvent):void;

        private function onPetRemoved(k:PetRemovedFromInventoryEvent):void;

        private function onBots(k:BotInventoryEvent):void;

        private function onBotRemoved(k:BotRemovedFromInventoryEvent):void;

        private function onBotAdded(k:BotAddedToInventoryEvent):void;

        private function onTradingOpen(k:IMessageEvent):void;

        private function onTradingItemList(k:IMessageEvent):void;

        private function isFurniExternalImage(k:int):Boolean;

        private function onTradingEvent(k:IMessageEvent):void;

        private function onTradingOpenFailed(k:TradeOpenFailedEvent):void;

        private function onTradingNotAllowed(k:IMessageEvent):void;


    }
}//package com.sulake.habbo.tablet.inventory

