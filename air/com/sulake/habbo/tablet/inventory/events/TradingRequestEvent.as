//com.sulake.habbo.tablet.inventory.events.TradingRequestEvent

package com.sulake.habbo.tablet.inventory.events{
    public class TradingRequestEvent extends InventoryEvent {

        public static const TRADING_REQUEST:String;

        private var _userId:int;
        private var _userName:String;

        public function TradingRequestEvent(k:String, _arg_2:int, _arg_3:String, _arg_4:Boolean=false, _arg_5:Boolean=false);

        public function get userName():String;

        public function get userId():int;


    }
}//package com.sulake.habbo.tablet.inventory.events

