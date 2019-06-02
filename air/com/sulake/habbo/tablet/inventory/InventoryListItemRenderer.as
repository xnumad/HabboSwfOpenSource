//com.sulake.habbo.tablet.inventory.InventoryListItemRenderer

package com.sulake.habbo.tablet.inventory{
    import feathers.controls.renderers.LayoutGroupListItemRenderer;
    import feathers.controls.renderers.IListItemRenderer;
    import flash.geom.Point;
    import feathers.controls.Button;
    import feathers.controls.LayoutGroup;
    import feathers.controls.Label;
    import starling.events.Event;
    import com.sulake.habbo.tablet.inventory.items.GroupItem;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
    import com.sulake.habbo.communication.messages.parser.inventory.bots.BotData;
    import com.sulake.habbo.tablet.inventory.trading.EmptyTradeItem;
    import feathers.controls.List;
    import starling.events.TouchEvent;

    public class InventoryListItemRenderer extends LayoutGroupListItemRenderer implements IListItemRenderer {

        private static const HELPER_POINT:Point;

        private var _inventory:HabboTabletInventory;
        private var _touchID:int;
        private var _iconSize:Number;
        private var _button:Button;
        private var _icon:IconImageLoader;
        private var _counter:LayoutGroup;
        private var _padding:Number = 0;
        private var _isScrolling:Boolean;
        private var _amountLabel:Label;

        public function InventoryListItemRenderer();

        public function get padding():Number;

        public function set padding(k:Number):void;

        public function set inventory(k:HabboTabletInventory):void;

        override protected function initialize():void;

        private function iconCompleteHandler(k:Event):void;

        private function get groupItem():GroupItem;

        private function get petData():PetData;

        private function get botData():BotData;

        private function get emptyTradeItem():EmptyTradeItem;

        private function createAmountSlot(k:int):LayoutGroup;

        override public function set owner(k:List):void;

        override public function set isSelected(k:Boolean):void;

        private function touchHandler(k:TouchEvent):void;

        override protected function commitData():void;

        private function updateGroupItemCount(k:int):void;

        override protected function preLayout():void;

        override protected function postLayout():void;

        private function centerIcon():void;

        private function positionCounter():void;

        protected function owner_scrollHandler(k:Event):void;


    }
}//package com.sulake.habbo.tablet.inventory

