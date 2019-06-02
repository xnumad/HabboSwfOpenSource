//com.sulake.habbo.tablet.navigator.NavigatorViewController

package com.sulake.habbo.tablet.navigator{
    import feathers.controls.LayoutGroup;
    import com.sulake.habbo.tablet.navigator.settings.RoomSettings;
    import feathers.controls.TabBar;
    import feathers.controls.List;
    import feathers.controls.Button;
    import feathers.controls.TextInput;
    import feathers.controls.Label;
    import feathers.controls.ImageLoader;
    import feathers.data.ListCollection;
    import feathers.controls.Alert;
    import com.sulake.core.utils.IFileProxy;
    import starling.display.DisplayObject;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
    import starling.textures.Texture;
    import starling.events.Event;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;

    public class NavigatorViewController {

        private static const ICON_IMAGE:String;
        private static const TEASER_IMAGE:String;
        private static const TOP_MARGIN:int;
        private static const LEFT_MARGIN:int;

        private var _listWidth:int;
        private var _navigator:HabboTabletNavigator;
        private var _view:LayoutGroup;
        private var _roomSettings:RoomSettings;
        private var _tabBar:TabBar;
        private var _subSelector:SubSelector;
        private var _roomList:List;
        private var _closeButton:Button;
        private var _closeSearch:Button;
        private var _createRoomBtn:Button;
        private var _searchField:TextInput;
        private var _roomDetails:RoomDetailsView;
        private var _loadingLabel:Label;
        private var _leftContainer:LayoutGroup;
        private var _iconImage:ImageLoader;
        private var _teaserImage:ImageLoader;
        private var _myTabContent:ListCollection;
        private var _popularTabContent:ListCollection;
        private var _categoriesTabContent:ListCollection;
        private var _categoriesInitialized:Boolean;
        private var _storedTabIndex:int;
        private var _isSearchMode:Boolean;
        private var _isFormattingSubSelector:Boolean;
        private var _pendingRoomSelectionId:int;
        private var _cantConnectAlert:Alert;

        public function NavigatorViewController(k:HabboTabletNavigator);

        private static function get fileProxy():IFileProxy;

        private static function createTabItem(k:String, _arg_2:ListCollection, _arg_3:int):Object;

        private static function getVisitorCountSlot(k:int):DisplayObject;

        private static function getDoorModeIcon(k:GuestRoomData):Texture;


        public function dispose():void;

        private function disposeRoomFilters(k:ListCollection):void;

        public function get roomDetails():RoomDetailsView;

        public function get view():DisplayObject;

        private function addRoomList():void;

        private function onCreateRoomButton(k:Event):void;

        private function onSearchFieldEnter(k:Event):void;

        private function onCloseSearch(k:Event):void;

        private function onCloseButton(k:Event):void;

        private function onListChanged(k:Event):void;

        private function onTabBarChanged(k:Event):void;

        private function showCreateRoomButton(k:Boolean):void;

        private function onSubSelectorChanged(k:Event):void;

        private function updateSubSelectorToSubIndex():void;

        public function initRoomFilters():void;

        public function reload():void;

        public function updateView():void;

        private function selectPendingRoomId():void;

        public function showDoorbellRinging():void;

        public function showCantConnect(reason:int, parameter:String=null):void{
        }
        public function isViewLoaded():Boolean;

        public function hideRoomSettings():void;

        public function showRoomSettings(k:RoomSettingsData):void;

        public function onFlatControllers(k:int, _arg_2:Array):void;

        public function onBannedUsersFromRoom(k:int, _arg_2:Array):void;

        public function showRoomSettingsError(k:int, _arg_2:int):void;

        public function roomSettingsSaved(k:int):void;

        public function roomSettingsSaveError(k:int, _arg_2:int):void;


    }
}//package com.sulake.habbo.tablet.navigator

