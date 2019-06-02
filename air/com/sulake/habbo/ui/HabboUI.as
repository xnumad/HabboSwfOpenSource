//com.sulake.habbo.ui.HabboUI

package com.sulake.habbo.ui{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.room.IRoomObjectFactory;
    import com.sulake.core.runtime.ICoreConfiguration;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.tablet.navigator.IHabboTabletNavigator;
    import com.sulake.habbo.tablet.inventory.IHabboTabletInventory;
    import com.sulake.habbo.tablet.catalog.IHabboTabletCatalog;
    import com.sulake.habbo.notification.MessageDisplay;
    import com.sulake.habbo.messenger.HabboTabletMessenger;
    import com.sulake.habbo.avatareditor.HabboTabletAvatarEditor;
    import com.sulake.habbo.accounts.AccountSelector;
    import com.sulake.habbo.friends.FriendList;
    import com.sulake.habbo.toolbar.Toolbar;
    import com.sulake.habbo.localimage.LocalImageLoader;
    import starling.display.DisplayObject;
    import com.sulake.habbo.widgets.TradingRequestController;
    import com.sulake.habbo.profile.avatar.AvatarProfileCtrl;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.utils.IFileProxy;
    import __AS3__.vec.Vector;
    import com.sulake.core.runtime.ComponentDependency;
    import flash.events.Event;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.habbo.tablet.navigator.NavigatorEvent;
    import com.sulake.habbo.tablet.inventory.events.InventoryEvent;
    import com.sulake.habbo.tablet.catalog.event.CatalogEvent;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.core.communication.messages.IMessageEvent;
    import flash.utils.Dictionary;
    import com.sulake.habbo.session.IUserDataManager;

    public class HabboUI extends Component implements IHabboUI {

        private static const LANDING_VIEW_IMAGE:String;

        private var _incoming:IncomingMessages;
        private var _roomEngine:IRoomEngine;
        private var _roomSessionManager:IRoomSessionManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _avatarRenderManager:IAvatarRenderManager;
        private var _localization:IHabboLocalizationManager;
        private var _roomObjectFactory:IRoomObjectFactory;
        private var _config:ICoreConfiguration;
        private var _communication:IHabboCommunicationManager;
        private var _navigator:IHabboTabletNavigator;
        private var _inventory:IHabboTabletInventory;
        private var _catalog:IHabboTabletCatalog;
        private var _messageDisplay:MessageDisplay;
        private var _mainViewManager:MainViewManager;
        private var _desktop:RoomDesktop;
        private var _messenger:HabboTabletMessenger;
        private var _avatarEditor:HabboTabletAvatarEditor;
        private var _accountSelector:AccountSelector;
        private var _friendList:FriendList;
        private var _toolbar:Toolbar;
        private var _hotelView:LocalImageLoader;
        private var _currentPopup:DisplayObject;
        private var _tradingRequests:TradingRequestController;
        private var _profileCtrl:AvatarProfileCtrl;
        private var _inited:Boolean;
        private var _avatarsReady:Boolean;
        private var _disconnectedReason:int;
        private var _authOk:Boolean;
        private var _confOk:Boolean;
        private var _roomEngineOk:Boolean;

        public function HabboUI(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null);

        private static function get fileProxy():IFileProxy;


        override public function dispose():void;

        override protected function get dependencies():Vector.<ComponentDependency>{
        }
        override protected function initComponent():void;

        private function onConfigurationComplete(k:Event):void;

        private function onAvatarRendererReady(k:Event):void;

        function onAuthOk():void;

        private function checkInit():void;

        private function roomSessionStateEventHandler(k:RoomSessionEvent):void;

        private function roomSessionEventHandler(k:RoomSessionEvent):void;

        private function roomSessionDialogEventHandler(k:RoomSessionEvent):void;

        private function roomEventHandler(k:RoomEngineEvent):void;

        private function roomObjectEventHandler(k:RoomEngineObjectEvent):void;

        private function navigatorEventHandler(k:NavigatorEvent):void;

        private function inventoryEventHandler(k:InventoryEvent):void;

        private function catalogEventHandler(k:CatalogEvent):void;

        public function showMainViewState(k:int):void;

        private function createDesktop(k:IRoomSession):RoomDesktop;

        private function disposeDesktop():void;

        private function get messageDisplay():MessageDisplay;

        public function get disconnectedReason():int;

        public function set visible(k:Boolean):void;

        public function get desktop():RoomDesktop;

        public function get communication():IHabboCommunicationManager;

        public function disconnected(k:int):void;

        public function get roomEngine():IRoomEngine;

        public function get roomSessionManager():IRoomSessionManager;

        public function get navigator():IHabboTabletNavigator;

        public function get inventory():IHabboTabletInventory;

        public function get catalog():IHabboTabletCatalog;

        public function get messenger():HabboTabletMessenger;

        public function get localization():IHabboLocalizationManager;

        public function get sessionDataManager():ISessionDataManager;

        public function get avatarEditor():HabboTabletAvatarEditor;

        public function get friendList():FriendList;

        function onFollowFriendFailed(k:IMessageEvent):void;

        private function getFollowFriendErrorText(k:int):String;

        public function get friends():Dictionary;

        public function showAccounts(k:int=-1):void;

        public function showFriends():void;

        public function getUserDataManager():IUserDataManager;

        function get avatarProfileCtrl():AvatarProfileCtrl;

        public function showAvatarProfile(k:int, _arg_2:String):void;

        public function hideCurrentPopup(k:Boolean):void;

        public function showToolbar(k:String):void;

        public function get toolbar():IToolbar;

        public function hideToolbar():void;

        public function showHotelView():void;

        public function hideHotelView():void;

        public function toggleDebugOverlay():void;

        public function get avatarRenderManager():IAvatarRenderManager;

        public function clearFileCache():void;


    }
}//package com.sulake.habbo.ui

