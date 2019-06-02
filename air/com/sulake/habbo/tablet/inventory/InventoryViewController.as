//com.sulake.habbo.tablet.inventory.InventoryViewController

package com.sulake.habbo.tablet.inventory{
    import feathers.controls.LayoutGroup;
    import feathers.controls.TabBar;
    import feathers.controls.List;
    import com.sulake.habbo.tablet.inventory.trading.TradingViewController;
    import feathers.controls.TextInput;
    import feathers.core.FeathersControl;
    import starling.display.DisplayObject;
    import feathers.controls.renderers.IListItemRenderer;
    import starling.events.Event;

    public class InventoryViewController {

        private static const VIEW_STATE_UNDEFINED:int;
        private static const VIEW_STATE_NORMAL:int;
        private static const VIEW_STATE_TRADING:int;
        private static const TOP_MARGIN:int;
        private static const LEFT_MARGIN:int;
        private static const TAB_FURNI:int;
        private static const TAB_RENTABLES:int;
        private static const TAB_PETS:int;
        private static const TAB_BOTS:int;

        private var _inventory:HabboTabletInventory;
        private var _view:LayoutGroup;
        private var _leftContainer:LayoutGroup;
        private var _tabBar:TabBar;
        private var _list:List;
        private var _previewController:PreviewController;
        private var _tradingViewController:TradingViewController;
        private var _searchField:TextInput;
        private var _viewState:int;
        private var _preview:FeathersControl;
        private var _tradingView:FeathersControl;

        public function InventoryViewController(k:HabboTabletInventory);

        private static function createTabItem(k:String, _arg_2:int, _arg_3:String):Object;


        public function get view():DisplayObject;

        private function createListRenderer():IListItemRenderer;

        public function dispose():void;

        private function onTabBarChanged(k:Event):void;

        private function onCloseButton(k:Event):void;

        public function isViewLoaded():Boolean;

        private function updateToSelectedTab():void;

        private function onSearchFieldClear(k:Event):void;

        private function onSearchFieldEnter(k:Event):void;

        private function populateSearch(k:String):void;

        private function populateFurni():void;

        private function populateRentables():void;

        private function populatePets():void;

        private function populateBots():void;

        public function update():void;

        public function updateTrading():void;

        private function updateState():void;

        private function showPreview(k:Boolean):void;

        private function showTradingView(k:Boolean):void;

        private function onListChanged(k:Event):void;

        public function updateTradingChat(k:String):void;

        public function showTradeOpenFailAlert(k:String, _arg_2:int):void;


    }
}//package com.sulake.habbo.tablet.inventory

