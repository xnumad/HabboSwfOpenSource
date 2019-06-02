//com.sulake.habbo.tablet.inventory.events.InventoryEvent

package com.sulake.habbo.tablet.inventory.events{
    import flash.events.Event;

    public class InventoryEvent extends Event {

        public static const OPEN_REQUEST:String;
        public static const CLOSE_REQUEST:String;
        public static const TRADING_STARTED:String;
        public static const TRADING_ENDED:String;

        public function InventoryEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false);

    }
}//package com.sulake.habbo.tablet.inventory.events

