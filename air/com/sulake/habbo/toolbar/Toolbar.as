//com.sulake.habbo.toolbar.Toolbar

package com.sulake.habbo.toolbar{
    import com.sulake.habbo.ui.IToolbar;
    import flash.utils.Dictionary;
    import com.sulake.habbo.ui.HabboUI;
    import feathers.controls.ScrollContainer;
    import feathers.controls.Callout;
    import com.sulake.habbo.toolbar.extension.inventory.InventoryPeek;
    import com.sulake.habbo.toolbar.extension.development.DevelopmentMenu;
    import feathers.core.FeathersControl;
    import starling.display.DisplayObject;
    import flash.events.Event;
    import starling.events.Event;

    public class Toolbar implements IToolbar {

        private static var MODE_CONTENT:Dictionary;
        public static const MODE_ROOM:String;
        public static const MODE_LANDING:String;

        private var _mode:String;
        private var _habboUI:HabboUI;
        private var _view:ScrollContainer;
        private var _items:Dictionary;
        private var _extensionView:Callout;
        private var _inventoryPeek:InventoryPeek;
        private var _developmentMenu:DevelopmentMenu;
        private var _disposed:Boolean;

        public function Toolbar(k:HabboUI);

        public function dispose():void;

        public function get disposed():Boolean;

        public function get view():FeathersControl;

        public function get habboUI():HabboUI;

        public function set mode(k:String):void;

        public function showNotification(k:String, _arg_2:Boolean):void;

        public function showInventoryPeekExtension(k:int, _arg_2:int, _arg_3:String):void;

        private function showExtension(k:DisplayObject, _arg_2:DisplayObject):void;

        public function hideExtension():void;

        private function get inventoryPeek():InventoryPeek;

        private function get developmentExtension():DevelopmentMenu;

        private function setItemsFromList(k:Array):void;

        private function createView():void;

        private function onNoMessengerMessages(k:Event):void;

        private function onNewMessengerMessages(k:Event):void;

        private function createItems():void;

        private function createItem(k:String, _arg_2:String, _arg_3:String, _arg_4:Function):void;

        private function createMeMenuItem(k:String, _arg_2:String, _arg_3:Function):void;

        private function onNavigatorButton(k:Event):void;

        private function onExitButton(k:Event):void;

        private function onAccountsButton(k:Event):void;

        private function onInventoryButton(k:Event):void;

        private function onCatalogButton(k:Event):void;

        private function onFriendsButton(k:Event):void;

        private function onMessengerButton(k:Event):void;

        private function onDevelopmentButton(k:Event):void;


    }
}//package com.sulake.habbo.toolbar

