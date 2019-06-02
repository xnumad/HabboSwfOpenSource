//com.sulake.habbo.tablet.inventory.events.HabboUnseenItemsUpdatedEvent

package com.sulake.habbo.tablet.inventory.events{
    import flash.events.Event;
    import flash.utils.Dictionary;

    public class HabboUnseenItemsUpdatedEvent extends Event {

        public static const UPDATE:String;

        private var _inventoryCount:int;
        private var _categoryCount:Dictionary;

        public function HabboUnseenItemsUpdatedEvent(k:Boolean=false, _arg_2:Boolean=false);

        public function setCategoryCount(k:int, _arg_2:int):void;

        public function getCategoryCount(k:int):int;

        public function set inventoryCount(k:int):void;

        public function get inventoryCount():int;


    }
}//package com.sulake.habbo.tablet.inventory.events

