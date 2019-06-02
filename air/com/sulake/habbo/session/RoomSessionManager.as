//com.sulake.habbo.session.RoomSessionManager

package com.sulake.habbo.session{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.freeflowchat.IHabboFreeFlowChat;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.core.runtime.IContext;
    import __AS3__.vec.Vector;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.RoomVisualizationSettingsEvent;
    import flash.events.Event;

    public class RoomSessionManager extends Component implements IRoomSessionManager, IRoomHandlerListener {

        public static const FLAG_ROOM_VIEWER_MODE:uint;
        public static const SETUP_WITHOUT_COMMUNICATION:uint;
        public static const SETUP_WITHOUT_TRACKING:uint;
        public static const SETUP_WITHOUT_ROOMENGINE:uint;
        private static const GC_IMMINENCE_THRESHOLD:Number;
        private static const ROOM_IDENTIFIER:String;

        private var _communication:IHabboCommunicationManager;
        private var _handlers:Array;
        private var _roomEngineReady:Boolean;
        private var _sessions:Map;
        private var _pendingSessionRequest:RoomSession;
        private var _sessionStarting:Boolean;
        private var _habboTracking:IHabboTracking;
        private var _roomEngine:IRoomEngine;
        private var _freeFlowChat:IHabboFreeFlowChat;
        private var _gotVisualisations:Boolean;
        private var _avatarRenderer:IAvatarRenderManager;
        private var _roomViewerMode:Boolean;
        private var _pendingResources:Array;
        private var _viewerSession:RoomSession;

        public function RoomSessionManager(k:IContext, _arg_2:uint=0);

        public function get initialized():Boolean;

        public function get sessionStarting():Boolean;

        override protected function get dependencies():Vector.<ComponentDependency>{
        }
        override protected function initComponent():void;

        override public function dispose():void;

        private function onRoomEngineInitialized(k:RoomEngineEvent):void;

        private function createHandlers():void;

        private function executePendingSessionRequest():void;

        private function onRoomVisualizationSettings(k:RoomVisualizationSettingsEvent):void;

        private function onResize(k:Event):void;

        public function gotoRoom(k:int, _arg_2:String="", _arg_3:String=""):Boolean;

        public function gotoRoomNetwork(k:int, _arg_2:int):Boolean;

        private function createSession(k:RoomSession):Boolean;

        private function onRoomContentLoaded(k:Event):void;

        public function startSession(k:IRoomSession):Boolean;

        public function startGameSession():void;

        public function disposeGameSession():void;

        public function sessionUpdate(k:int, _arg_2:String):void;

        public function sessionReinitialize(k:int, _arg_2:int):void;

        public function getSession(k:int):IRoomSession;

        public function disposeSession(k:int, _arg_2:Boolean=true):void;

        private function updateHandlers(k:IRoomSession):void;

        private function getRoomIdentifier(k:int):String;


    }
}//package com.sulake.habbo.session

