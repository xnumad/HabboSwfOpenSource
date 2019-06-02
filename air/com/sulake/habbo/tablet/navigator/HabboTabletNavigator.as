//com.sulake.habbo.tablet.navigator.HabboTabletNavigator

package com.sulake.habbo.tablet.navigator{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.configuration.IHabboConfigurationManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.communication.connection.IConnection;
    import __AS3__.vec.Vector;
    import com.sulake.core.runtime.ComponentDependency;
    import flash.events.Event;
    import starling.display.DisplayObject;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;

    public class HabboTabletNavigator extends Component implements IHabboTabletNavigator {

        private var _communicationManager:IHabboCommunicationManager;
        private var _configuration:IHabboConfigurationManager;
        private var _roomSessionManager:IRoomSessionManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _localizationManager:IHabboLocalizationManager;
        private var _incomingMessages:IncomingMessages;
        private var _data:NavigatorData;
        private var _mainViewController:NavigatorViewController;

        public function HabboTabletNavigator(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null);

        override public function dispose():void;

        public function get connection():IConnection;

        public function get data():NavigatorData;

        override protected function get dependencies():Vector.<ComponentDependency>;

        private function onSessionDataManager(k:ISessionDataManager):void;

        private function onConfigurationManager(k:IHabboConfigurationManager):void;

        private function onConfigurationComplete(k:Event):void;

        private function setCommunicationManager(k:IHabboCommunicationManager):void;

        private function setRoomSessionManager(k:IRoomSessionManager):void;

        public function get roomSessionManager():IRoomSessionManager;

        private function setLocalizationManager(k:IHabboLocalizationManager):void;

        public function get localizations():IHabboLocalizationManager;

        public function get sessionDataManager():ISessionDataManager;

        override protected function initComponent():void;

        public function get view():DisplayObject;

        public function goToRoom(k:int, _arg_2:String=""):void;

        public function send(k:IMessageComposer):void;

        public function searchResultReceived():void;

        public function startSearch(k:String):void;

        public function doorbellRinging():void;

        public function deleteRoom(k:int):void;

        public function doorbellAnswered():void;

        public function doorbellNoAnswer():void;

        public function requestViewClosing():void;

        public function requestViewOpening():void;

        public function requestClubPurchaseView():void;

        public function setCategories(k:Array):void;

        public function exitRoom():void;

        public function showRoomFullAlert():void;

        public function showCantConnect(k:int, _arg_2:String=null):void;

        public function isViewLoaded():Boolean;

        public function updateView():void;

        public function onRoomSettingsData(k:RoomSettingsData):void;

        public function onRoomSettingsError(k:int, _arg_2:int):void;

        public function onRoomSettingsSaved(k:int):void;

        public function onRoomSettingsSaveError(k:int, _arg_2:int):void;

        public function requestRoomCreation():void;

        public function onFlatControllers(k:int, _arg_2:Array):void;

        public function onBannedUsersFromRoom(k:int, _arg_2:Array):void;

        public function onCreateRoom():void;

        public function goToHomeRoom():Boolean;


    }
}//package com.sulake.habbo.tablet.navigator

