//com.sulake.habbo.widgets.TradingRequestController

package com.sulake.habbo.widgets{
    import com.sulake.habbo.ui.HabboUI;
    import com.sulake.habbo.tablet.inventory.IHabboTabletInventory;
    import feathers.controls.Alert;
    import starling.events.Event;

    public class TradingRequestController {

        private var _habboUI:HabboUI;
        private var _inventory:IHabboTabletInventory;
        private var _requestAlert:Alert;
        private var _userId:int;

        public function TradingRequestController(k:HabboUI, _arg_2:IHabboTabletInventory);

        public function dispose():void;

        public function handleRequest(k:int, _arg_2:String):void;

        private function onCancelTrade(k:Event):void;

        private function onOpenTrade(k:Event):void;


    }
}//package com.sulake.habbo.widgets

