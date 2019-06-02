//com.sulake.habbo.ui.RoomDesktop

package com.sulake.habbo.ui{
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.room.IRoomObjectFactory;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import starling.core.Starling;
    import away3d.containers.View3D;
    import starling.display.Sprite;
    import feathers.controls.LayoutGroup;
    import com.sulake.room.renderer.IRoomRenderingCanvas;
    import com.sulake.habbo.chat.Chat;
    import com.sulake.habbo.actionModeSelector.ActionModeSelector;
    import com.sulake.habbo.selector.ObjectSelector;
    import com.sulake.habbo.modifier.ObjectModifier;
    import com.sulake.habbo.furni.stickie.StickieCtrl;
    import com.sulake.habbo.widgets.Doorbell;
    import flash.events.IEventDispatcher;
    import com.sulake.room.events.RoomContentLoadedEvent;
    import starling.display.DisplayObjectContainer;
    import __AS3__.vec.Vector;
    import com.sulake.room.object.IRoomObject;
    import flash.geom.Point;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.habbo.room.events.RoomEngineObjectInsertInitializedEvent;
    import flash.events.Event;

    public class RoomDesktop implements IRoomDesktopGPU {

        private var _ui:HabboUI;
        private var _roomEngine:IRoomEngine;
        private var _sessionDataManager:ISessionDataManager;
        private var _roomSessionManager:IRoomSessionManager;
        private var _avatarRenderManager:IAvatarRenderManager;
        private var _localization:IHabboLocalizationManager;
        private var _roomObjectFactory:IRoomObjectFactory;
        private var _connection:IConnection;
        private var _assets:IAssetLibrary;
        private var _session:IRoomSession;
        private var _events:EventDispatcherWrapper;
        private var _loadingComplete:Boolean;
        private var _pendingResources:Array;
        private var _starling:Starling;
        private var _view3D:View3D;
        private var _desktopContainer:Sprite;
        private var _roomUIContainer:LayoutGroup;
        private var _roomCanvas:IRoomRenderingCanvas;
        private var _chat:Chat;
        private var _actionModeSelector:ActionModeSelector;
        private var _objectSelector:ObjectSelector;
        private var _objectModifier:ObjectModifier;
        private var _stickieCtrl:StickieCtrl;
        private var _doorbell:Doorbell;

        public function RoomDesktop(k:HabboUI, _arg_2:Starling, _arg_3:View3D, _arg_4:IRoomSession, _arg_5:IAssetLibrary);

        public function get roomSession():IRoomSession;

        public function get sessionDataManager():ISessionDataManager;

        public function get events():IEventDispatcher;

        public function get roomEngine():IRoomEngine;

        public function get roomSessionManager():IRoomSessionManager;

        public function get habboUI():IHabboUI;

        public function get avatarRenderManager():IAvatarRenderManager;

        public function get localization():IHabboLocalizationManager;

        public function get session():IRoomSession;

        public function get connection():IConnection;

        public function set connection(k:IConnection):void;

        public function set sessionDataManager(k:ISessionDataManager):void;

        public function set roomSessionManager(k:IRoomSessionManager):void;

        public function set avatarRenderManager(k:IAvatarRenderManager):void;

        public function set localization(k:IHabboLocalizationManager):void;

        public function set roomObjectFactory(k:IRoomObjectFactory):void;

        public function set visible(k:Boolean):void;

        public function set roomEngine(k:IRoomEngine):void;

        private function initView3DCamera():void;

        public function dispose():void;

        public function init():void;

        private function onRoomContentLoaded(k:RoomContentLoadedEvent):void;

        private function checkInterrupts():Boolean;

        public function createRoomView(k:int=1):void;

        public function get container():DisplayObjectContainer;

        public function setRoomViewColor(k:uint, _arg_2:int):void;

        public function setRoomBackgroundColor(k:int, _arg_2:int, _arg_3:int):void;

        public function showObjectSelector(k:Vector.<IRoomObject>, _arg_2:Point):void;

        public function hideObjectSelector():void;

        public function showAvatarProfileForUserIndex(k:int):void;

        public function showChatHistory():void;

        public function roomObjectEventHandler(k:RoomEngineObjectEvent):void;

        public function onRoomObjectInsertInitialized(k:RoomEngineObjectInsertInitializedEvent):void;

        private function onRoomObjectEvent(k:Event):void;

        private function getStickieCtrl():StickieCtrl;

        public function modifyObjectInRoom(k:IRoomObject):void;

        private function showObjectModifier(k:IRoomObject, _arg_2:String=null):void;

        public function hideObjectModifier():void;

        public function get roomCanvas():IRoomRenderingCanvas;

        public function get chat():Chat;


    }
}//package com.sulake.habbo.ui

