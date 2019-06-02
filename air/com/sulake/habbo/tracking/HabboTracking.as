//com.sulake.habbo.tracking.HabboTracking

package com.sulake.habbo.tracking{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.ISessionDataManager;
    import flash.utils.Timer;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import flash.events.Event;
    import com.sulake.core.runtime.events.ErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications.HabboAchievementNotificationMessageEvent;
    import com.sulake.habbo.catalog.navigation.events.CatalogPageOpenedEvent;
    import com.sulake.habbo.advertisement.events.AdEvent;
    import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import flash.events.TimerEvent;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.core.communication.messages.IMessageComposer;

    public class HabboTracking extends Component implements IHabboTracking, IUpdateReceiver {

        private static const ERROR_DATA_FLAG_COUNT:uint;
        private static var _instance:HabboTracking;

        private var _communication:IHabboCommunicationManager;
        private var _errorContextFlags:Array;
        private var _crashed:Boolean;
        private var _messageEvents:Vector.<IMessageEvent>;
        private var _performanceTracker:PerformanceTracker;
        private var _framerateTracker:FramerateTracker;
        private var _latencyTracker:LatencyTracker;
        private var _lagWarningLogger:LagWarningLogger;
        private var _toolbarClickTracker:ToolbarClickTracker;
        private var _roomEngine:IRoomEngine;
        private var _sessionDataManager:ISessionDataManager;
        private var _anyRoomsVisited:Boolean;
        private var _currentTime:int;
        private var _invalidTimeCount:int;
        private var _timeLeapCount:int;
        private var _fpsTrackingTimer:Timer;
        private var _fpsTrackingCount:int;
        private var _fpsTrackingRoomId:int;

        public function HabboTracking(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null);

        public static function getInstance():HabboTracking;


        override protected function get dependencies():Vector.<ComponentDependency>{
        }
        override protected function initComponent():void;

        private function addMessageEvent(k:IMessageEvent):void;

        override public function dispose():void;

        private function setErrorContextFlag(k:uint, _arg_2:uint):void;

        private function onHotelViewEvent(k:Event):void;

        private function onConnectionEvent(k:Event):void;

        private function onWindowTrackingEvent(k:Event):void;

        private function onError(k:ErrorEvent):void;

        private function storeErrorDetails(k:ErrorEvent):void;

        private function onNavigatorTrackingEvent(k:Event):void;

        private function onRoomSettingsTrackingEvent(k:Event):void;

        private function onInventoryTrackingEvent(k:Event):void;

        private function onAchievementNotification(k:HabboAchievementNotificationMessageEvent):void;

        private function onCatalogPageOpened(k:CatalogPageOpenedEvent):void;

        private function onCatalogTrackingEvent(k:Event):void;

        private function onFriendlistTrackingEvent(k:Event):void;

        private function onHelpTrackingEvent(k:Event):void;

        private function onAuthOK(k:IMessageEvent):void;

        private function onCreditBalance(k:IMessageEvent):void;

        private function onUserBadges(k:IMessageEvent):void;

        private function onUserObject(k:IMessageEvent):void;

        private function onActivityPoints(k:IMessageEvent):void;

        private function onRoomEnter(k:IMessageEvent):void;

        private function onConfigurationComplete(k:Event):void;

        private function onRoomAdLoad(k:AdEvent):void;

        private function onRoomAdClick(k:RoomObjectRoomAdEvent):void;

        private function getAliasFromAdTechUrl(k:String):String;

        private function onRoomAction(k:RoomEngineEvent):void;

        private function onRoomActionTimerEvent(k:TimerEvent):void;

        private function onToolbarClick(k:HabboToolbarEvent):void;

        private function onZoomToggle(k:HabboToolbarEvent):void;

        public function legacyTrackGoogle(k:String, _arg_2:String, _arg_3:Array=null):void;

        public function trackComufyScalar(k:String, _arg_2:String):void;

        public function trackComufyMultiVal(k:String, _arg_2:Array, _arg_3:String):void;

        public function trackGoogle(k:String, _arg_2:String, _arg_3:int=-1):void;

        public function trackLoginStep(k:String, _arg_2:String=null):void;

        public function trackEventLog(k:String, _arg_2:String, _arg_3:String, _arg_4:String="", _arg_5:int=0):void;

        public function trackTalentTrackOpen(k:String, _arg_2:String):void;

        public function logError(k:String):void;

        public function chatLagDetected(k:int):void;

        public function update(k:uint):void;

        public function get communication():IHabboCommunicationManager;

        public function send(k:IMessageComposer):void;


    }
}//package com.sulake.habbo.tracking

