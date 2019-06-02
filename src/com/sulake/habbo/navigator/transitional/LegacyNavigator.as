package com.sulake.habbo.navigator.transitional
{
    import com.sulake.habbo.navigator.IHabboTransitionalNavigator;
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
    import com.sulake.habbo.navigator.inroom.RoomEventViewCtrl;
    import com.sulake.habbo.navigator.roomsettings.RoomCreateViewCtrl;
    import com.sulake.habbo.navigator.GuestRoomPasswordInput;
    import com.sulake.habbo.navigator.GuestRoomDoorbell;
    import com.sulake.habbo.navigator.mainview.OfficialRoomEntryManager;
    import com.sulake.habbo.navigator.inroom.RoomInfoViewCtrl;
    import com.sulake.habbo.navigator.inroom.RoomEventInfoCtrl;
    import com.sulake.habbo.navigator.roomsettings.RoomFilterCtrl;
    import com.sulake.habbo.navigator.roomsettings.EnforceCategoryCtrl;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.navigator.domain.NavigatorData;
    import com.sulake.habbo.navigator.mainview.ITransitionalMainViewCtrl;
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;
    import com.sulake.habbo.tracking.IHabboTracking;
    import flash.events.IEventDispatcher;
    import flash.geom.Point;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.core.runtime.IID;
    import com.sulake.core.runtime.IUnknown;
    import flash.utils.Dictionary;

    public class LegacyNavigator implements IHabboTransitionalNavigator 
    {
        private var _newNavigator:HabboNewNavigator;
        private var _oldNavigator:HabboNavigator;
        private var _fakeMainViewCtrl:FakeMainViewCtrl;
        private var _roomSettingsCtrl:RoomSettingsCtrl;
        private var _roomInfoViewCtrl:RoomEventViewCtrl;
        private var _roomCreateViewCtrl:RoomCreateViewCtrl;
        private var _passwordInput:GuestRoomPasswordInput;
        private var _doorbell:GuestRoomDoorbell;
        private var _officialRoomEntryManager:OfficialRoomEntryManager;
        private var _roomEventViewCtrl:RoomInfoViewCtrl;
        private var _roomEventInfoCtrl:RoomEventInfoCtrl;
        private var _roomFilterCtrl:RoomFilterCtrl;
        private var _enforceCategoryCtrl:EnforceCategoryCtrl;

        public function LegacyNavigator(k:HabboNewNavigator, _arg_2:HabboNavigator)
        {
            this._newNavigator = k;
            this._oldNavigator = _arg_2;
            this._fakeMainViewCtrl = new FakeMainViewCtrl(this._newNavigator, this._oldNavigator);
            this._roomSettingsCtrl = new RoomSettingsCtrl(this);
            this._roomInfoViewCtrl = new RoomEventViewCtrl(this);
            this._roomCreateViewCtrl = new RoomCreateViewCtrl(this);
            this._passwordInput = new GuestRoomPasswordInput(this);
            this._doorbell = new GuestRoomDoorbell(this);
            this._officialRoomEntryManager = new OfficialRoomEntryManager(this);
            this._roomEventViewCtrl = new RoomInfoViewCtrl(this);
            this._roomEventInfoCtrl = new RoomEventInfoCtrl(this);
            this._roomFilterCtrl = new RoomFilterCtrl(this);
            this._enforceCategoryCtrl = new EnforceCategoryCtrl(this);
        }

        public function set _Str_22899(k:HabboNavigator):void
        {
            this._oldNavigator = k;
        }

        public function get assets():IAssetLibrary
        {
            return this._oldNavigator.assets;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._newNavigator.windowManager;
        }

        public function get data():NavigatorData
        {
            return this._oldNavigator.data;
        }

        public function get _Str_2813():ITransitionalMainViewCtrl
        {
            return this._fakeMainViewCtrl;
        }

        public function get tabs():Tabs
        {
            return this._oldNavigator.tabs;
        }

        public function get _Str_4012():RoomEventViewCtrl
        {
            return this._roomInfoViewCtrl;
        }

        public function get _Str_15114():RoomCreateViewCtrl
        {
            return this._roomCreateViewCtrl;
        }

        public function get communication():IHabboCommunicationManager
        {
            return this._oldNavigator.communication;
        }

        public function get _Str_3188():RoomSettingsCtrl
        {
            return this._roomSettingsCtrl;
        }

        public function get _Str_2627():ISessionDataManager
        {
            return this._oldNavigator._Str_2627;
        }

        public function get _Str_7174():GuestRoomPasswordInput
        {
            return this._oldNavigator._Str_7174;
        }

        public function get doorbell():GuestRoomDoorbell
        {
            return this._doorbell;
        }

        public function get _Str_6939():RoomInfoViewCtrl
        {
            return this._roomEventViewCtrl;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._oldNavigator.localization;
        }

        public function get _Str_7596():OfficialRoomEntryManager
        {
            return this._oldNavigator._Str_7596;
        }

        public function get toolbar():IHabboToolbar
        {
            return this._oldNavigator.toolbar;
        }

        public function get _Str_2602():IHabboHelp
        {
            return this._oldNavigator._Str_2602;
        }

        public function get _Str_5048():RoomEventInfoCtrl
        {
            return this._roomEventInfoCtrl;
        }

        public function get _Str_6472():RoomFilterCtrl
        {
            return this._roomFilterCtrl;
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return this._oldNavigator.roomSessionManager;
        }

        public function get _Str_17937():EnforceCategoryCtrl
        {
            return this._enforceCategoryCtrl;
        }

        public function send(k:IMessageComposer, _arg_2:Boolean=false):void
        {
            return this._oldNavigator.send(k, _arg_2);
        }

        public function getXmlWindow(k:String, _arg_2:uint=1):IWindow
        {
            return this._oldNavigator.getXmlWindow(k, _arg_2);
        }

        public function getText(k:String):String
        {
            return this._oldNavigator.getText(k);
        }

        public function registerParameter(k:String, _arg_2:String, _arg_3:String):String
        {
            return this._oldNavigator.registerParameter(k, _arg_2, _arg_3);
        }

        public function _Str_10781(k:String, _arg_2:String, _arg_3:Function, _arg_4:int=0, _arg_5:int=0, _arg_6:int=0):IBitmapWrapperWindow
        {
            return this._oldNavigator._Str_10781(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
        }

        public function refreshButton(k:IWindowContainer, _arg_2:String, _arg_3:Boolean, _arg_4:Function, _arg_5:int, _arg_6:String=null):void
        {
            return this._oldNavigator.refreshButton(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
        }

        public function _Str_3122(k:String, _arg_2:String="_png"):BitmapData
        {
            return this._oldNavigator._Str_3122(k, _arg_2);
        }

        public function openCatalogClubPage(k:String):void
        {
            return this._oldNavigator.openCatalogClubPage(k);
        }

        public function _Str_12506():void
        {
            return this._oldNavigator._Str_12506();
        }

        public function _Str_18427():void
        {
            return this._newNavigator._Str_3310("favorites");
        }

        public function _Str_16885():void
        {
            return this._newNavigator._Str_3310("history");
        }

        public function _Str_17131():void
        {
            return this._newNavigator._Str_3310("history_freq");
        }

        public function get tracking():IHabboTracking
        {
            return this._oldNavigator.tracking;
        }

        public function _Str_10330():void
        {
            this._roomCreateViewCtrl.hide();
        }

        public function _Str_24971(k:String, _arg_2:String=null):*
        {
            this._oldNavigator._Str_17932(k, true, _arg_2);
        }

        public function goToRoom(k:int, _arg_2:Boolean, _arg_3:String="", _arg_4:int=-1):void
        {
            this._oldNavigator.goToRoom(k, false, _arg_3, _arg_4);
        }

        public function isPerkAllowed(k:String):Boolean
        {
            return this._oldNavigator.isPerkAllowed(k);
        }

        public function trackGoogle(k:String, _arg_2:String, _arg_3:int=-1):void
        {
            return this._oldNavigator.trackGoogle(k, _arg_2, _arg_3);
        }

        public function getBoolean(k:String):Boolean
        {
            return this._oldNavigator.getBoolean(k);
        }

        public function getInteger(k:String, _arg_2:int):int
        {
            return this._oldNavigator.getInteger(k, _arg_2);
        }

        public function get events():IEventDispatcher
        {
            return this._newNavigator.events;
        }

        public function goToHomeRoom():Boolean
        {
            this._newNavigator.goToHomeRoom();
            return true;
        }

        public function performTagSearch(k:String):void
        {
            return this._newNavigator.performTagSearch(k);
        }

        public function performTextSearch(k:String):void
        {
            return this._newNavigator.performTextSearch(k);
        }

        public function performGuildBaseSearch():void
        {
            return this._newNavigator._Str_3310("groups");
        }

        public function performCompetitionRoomsSearch(k:int, _arg_2:int):void
        {
            return this._newNavigator._Str_3310("competition");
        }

        public function showOwnRooms():void
        {
            return this._newNavigator._Str_3310("myworld_view");
        }

        public function goToPrivateRoom(k:int):void
        {
            this._newNavigator.goToRoom(k);
        }

        public function hasRoomRightsButIsNotOwner(k:int):Boolean
        {
            return this._oldNavigator.hasRoomRightsButIsNotOwner(k);
        }

        public function removeRoomRights(k:int):void
        {
            return this._oldNavigator.removeRoomRights(k);
        }

        public function goToRoomNetwork(k:int, _arg_2:Boolean):void
        {
            return this.goToRoomNetwork(k, _arg_2);
        }

        public function startRoomCreation():void
        {
            return this._newNavigator.createRoom();
        }

        public function openNavigator(k:Point=null):void
        {
            return this._newNavigator.open();
        }

        public function closeNavigator():void
        {
            return this._newNavigator.close();
        }

        public function get homeRoomId():int
        {
            return this._oldNavigator.homeRoomId;
        }

        public function get enteredGuestRoomData():_Str_2370
        {
            return this._oldNavigator.enteredGuestRoomData;
        }

        public function showToolbarHover(k:Point):void
        {
        }

        public function hideToolbarHover(k:Boolean):void
        {
        }

        public function toggleRoomInfoVisibility():void
        {
            if (this._roomInfoViewCtrl)
            {
                this._roomInfoViewCtrl.toggle();
            }
        }

        public function canRateRoom():Boolean
        {
            return this._oldNavigator.canRateRoom();
        }

        public function queueInterface(k:IID, _arg_2:Function=null):IUnknown
        {
            return this._newNavigator.queueInterface(k, _arg_2);
        }

        public function release(k:IID):uint
        {
            return this._newNavigator.release(k);
        }

        public function dispose():void
        {
            this._roomSettingsCtrl.dispose();
            this._roomInfoViewCtrl.dispose();
            this._roomCreateViewCtrl.dispose();
            this._passwordInput.dispose();
            this._doorbell.dispose();
            this._officialRoomEntryManager.dispose();
            this._roomEventViewCtrl.dispose();
            this._roomEventInfoCtrl.dispose();
            this._roomFilterCtrl.dispose();
            this._enforceCategoryCtrl = null;
            this._oldNavigator = null;
            this._newNavigator = null;
        }

        public function get disposed():Boolean
        {
            return this._oldNavigator == null;
        }

        public function _Str_14281(k:String, _arg_2:String, _arg_3:Date, _arg_4:int):void
        {
            return this._oldNavigator._Str_14281(k, _arg_2, _arg_3, _arg_4);
        }

        public function getProperty(k:String, _arg_2:Dictionary=null):String
        {
            return this._oldNavigator.getProperty(k, _arg_2);
        }

        public function get isDoorModeOverriddenInCurrentRoom():Boolean
        {
            return this._oldNavigator.isDoorModeOverriddenInCurrentRoom;
        }

        public function _Str_4051(k:String, _arg_2:String, _arg_3:String="", _arg_4:int=0):void
        {
            return this._oldNavigator._Str_4051(k, _arg_2, _arg_3, _arg_4);
        }

        public function _Str_12281(k:int):Boolean
        {
            return this._oldNavigator._Str_12281(k);
        }

        public function _Str_8458(k:int):Boolean
        {
            return this._oldNavigator._Str_8458(k);
        }

        public function get _Str_8075():Array
        {
            return this._oldNavigator.data._Str_8075;
        }

        public function get _Str_26424():RoomSettingsCtrl
        {
            return this._oldNavigator._Str_3188;
        }
    }
}
