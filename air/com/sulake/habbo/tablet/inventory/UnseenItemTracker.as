//com.sulake.habbo.tablet.inventory.UnseenItemTracker

package com.sulake.habbo.tablet.inventory{
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import flash.utils.Dictionary;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.communication.messages.incoming.notifications.UnseenItemsEvent;

    public class UnseenItemTracker implements IUnseenItemTracker {

        private var _communication:IHabboCommunicationManager;
        private var _inventory:HabboTabletInventory;
        private var _unseenItems:Dictionary;
        private var _events:IEventDispatcher;

        public function UnseenItemTracker(k:IHabboCommunicationManager, _arg_2:IEventDispatcher, _arg_3:HabboTabletInventory);

        public function dispose():void;

        public function resetCategory(k:int):Boolean;

        public function resetItems(k:int, _arg_2:Array):Boolean;

        public function resetCategoryIfEmpty(k:int):Boolean;

        public function isUnseen(k:int, _arg_2:int):Boolean;

        public function removeUnseen(k:int, _arg_2:int):Boolean;

        public function getIds(k:int):Array;

        public function getCount(k:int):int;

        private function onUnseenItems(k:UnseenItemsEvent):void;

        private function sendUpdateEvent():void;

        private function addItems(k:int, _arg_2:Array):void;

        private function sendResetCategoryMessage(k:int):void;

        private function sendResetItemsMessage(k:int, _arg_2:Array):void;


    }
}//package com.sulake.habbo.tablet.inventory

