package com.sulake.habbo.session
{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.freeflowchat.IHabboFreeFlowChat;
    import com.sulake.habbo.configuration.enum.HabboComponentFlags;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.runtime.ComponentDependency;
	import com.sulake.habbo.ui.widget.infobuspolls.RoomPollHandler;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.iid.IIDHabboFreeFlowChat;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_4196;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.handler.RoomSessionHandler;
    import com.sulake.habbo.session.handler.RoomChatHandler;
    import com.sulake.habbo.session.handler.RoomUsersHandler;
    import com.sulake.habbo.session.handler.RoomPermissionsHandler;
    import com.sulake.habbo.session.handler.AvatarEffectsHandler;
    import com.sulake.habbo.session.handler.RoomDataHandler;
    import com.sulake.habbo.session.handler.PresentHandler;
    import com.sulake.habbo.session.handler.GenericErrorHandler;
    import com.sulake.habbo.session.handler.PollHandler;
    import com.sulake.habbo.session.handler.WordQuizHandler;
    import com.sulake.habbo.session.handler.RoomDimmerPresetsHandler;
    import com.sulake.habbo.session.handler.PetPackageHandler;
    import flash.display.DisplayObject;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.events.Event;
    import com.sulake.room.utils.Vector3d;
    import flash.geom.Point;
    import com.sulake.habbo.communication.messages.outgoing._Str_549._Str_9845;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.session.handler.BaseHandler;
    import com.sulake.iid.*;

    public class RoomSessionManager extends Component implements IRoomSessionManager, IRoomHandlerListener 
    {
        public static const SETUP_WITHOUT_COMMUNICATION:uint = 2;
        public static const _Str_16758:uint = 3;
        public static const _Str_17871:uint = 4;

        private var _communication:IHabboCommunicationManager = null;
        private var _handlers:Array = null;
        private var _roomEngineReady:Boolean = false;
        private var _sessions:Map = null;
        private var _pendingSessionRequest:RoomSession;
        private var _sessionStarting:Boolean = false;
        private var _habboTracking:IHabboTracking;
        private var _roomEngine:IRoomEngine;
        private var _freeFlowChat:IHabboFreeFlowChat;
        private var _gotVisualisations:Boolean;
        private var _roomViewerMode:Boolean;
        private var _pendingResources:Array;
        private var _viewerSession:RoomSession;

        public function RoomSessionManager(k:IContext, _arg_2:uint=0)
        {
            super(k, _arg_2);
            this._roomViewerMode = (!((_arg_2 & HabboComponentFlags._Str_14905) == 0));
            this._handlers = [];
            this._sessions = new Map();
        }

        public function get _Str_3961():Boolean
        {
            return (allRequiredDependenciesInjected) && (this._roomEngineReady);
        }

        public function get _Str_22809():Boolean
        {
            return this._sessionStarting;
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communication = k;
            }, ((flags & SETUP_WITHOUT_COMMUNICATION) == 0)), new ComponentDependency(new IIDHabboTracking(), function (k:IHabboTracking):void
            {
                _habboTracking = k;
            }, ((flags & _Str_16758) == 0)), new ComponentDependency(new IIDHabboFreeFlowChat(), function (k:IHabboFreeFlowChat):void
            {
                _freeFlowChat = k;
            }, false), new ComponentDependency(new IIDHabboConfigurationManager(), null), new ComponentDependency(new IIDRoomEngine(), function (k:IRoomEngine):void
            {
                _roomEngine = k;
            }, ((flags & _Str_17871) == 0), [{
                "type":RoomEngineEvent.ENGINE_INITIALIZED,
                "callback":this.onRoomEngineInitialized
            }])]));
        }

        override protected function initComponent():void
        {
            this.createHandlers();
            if (((this._roomViewerMode) && (!(this._communication == null))))
            {
                this._communication.addHabboConnectionMessageEvent(new _Str_4196(this.onRoomVisualizationSettings));
            }
            this.executePendingSessionRequest();
        }

        override public function dispose():void
        {
            var k:String;
            var _local_2:RoomSession;
            var _local_3:int;
            var _local_4:IDisposable;
            if (disposed)
            {
                return;
            }
            if (this._sessions)
            {
                while (this._sessions.length > 0)
                {
                    k = (this._sessions.getKey(0) as String);
                    _local_2 = (this._sessions.remove(k) as RoomSession);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                }
                this._sessions.dispose();
                this._sessions = null;
            }
            if (this._handlers)
            {
                _local_3 = 0;
                while (_local_3 < this._handlers.length)
                {
                    _local_4 = (this._handlers[_local_3] as IDisposable);
                    if (_local_4)
                    {
                        _local_4.dispose();
                    }
                    _local_3++;
                }
                this._handlers = null;
            }
            super.dispose();
        }

        private function onRoomEngineInitialized(k:RoomEngineEvent):void
        {
            this._roomEngineReady = true;
            this.executePendingSessionRequest();
        }

        private function createHandlers():void
        {
            var k:IConnection;
            if (this._communication)
            {
                k = this._communication.connection;
                this._handlers.push(new RoomSessionHandler(k, this));
                this._handlers.push(new RoomChatHandler(k, this));
                this._handlers.push(new RoomUsersHandler(k, this));
                this._handlers.push(new RoomPermissionsHandler(k, this));
                this._handlers.push(new AvatarEffectsHandler(k, this));
                this._handlers.push(new RoomDataHandler(k, this));
                this._handlers.push(new PresentHandler(k, this));
                this._handlers.push(new GenericErrorHandler(k, this));
                this._handlers.push(new PollHandler(k, this));
                this._handlers.push(new WordQuizHandler(k, this));
                this._handlers.push(new RoomDimmerPresetsHandler(k, this));
                this._handlers.push(new PetPackageHandler(k, this));
				this._handlers.push(new RoomPollHandler(k, this));
            }
        }

        private function executePendingSessionRequest():void
        {
            if (((this._Str_3961) && (!(this._pendingSessionRequest == null))))
            {
                this.createSession(this._pendingSessionRequest);
                this._pendingSessionRequest = null;
            }
        }

        private function onRoomVisualizationSettings(k:_Str_4196):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:DisplayObject;
            var _local_9:IRoomGeometry;
            if (((this._gotVisualisations) || (!(this._roomViewerMode))))
            {
                return;
            }
            this._gotVisualisations = true;
            var _local_2:IRoomSession = this.getSession(0);
            if (_local_2 != null)
            {
                _local_3 = 1;
                _local_4 = 2;
                _local_5 = 2;
                _local_6 = 0x0400;
                _local_7 = 0x0300;
                _local_8 = this._roomEngine.createRoomCanvas(_local_2.roomId, _local_3, _local_6, _local_7, 64);
                if (_local_8 != null)
                {
                    context.displayObjectContainer.addChild(_local_8);
                    context.displayObjectContainer.addEventListener(Event.RESIZE, this.onResize);
                    this._roomEngine.setRoomCanvasMask(_local_2.roomId, _local_3, true);
                    _local_9 = this._roomEngine.getRoomCanvasGeometry(_local_2.roomId, _local_3);
                    if (_local_9 != null)
                    {
                        _local_9.adjustLocation(new Vector3d(_local_4, _local_5, 0), 30);
                    }
                    this._roomEngine.setRoomCanvasScreenOffset(_local_2.roomId, _local_3, new Point(0, -400));
                }
                if (((!(this._freeFlowChat == null)) && (this._freeFlowChat.displayObject)))
                {
                    context.displayObjectContainer.addChild(this._freeFlowChat.displayObject);
                }
            }
        }

        private function onResize(k:Event):void
        {
            if (!this._roomViewerMode)
            {
                return;
            }
            var _local_2:IRoomSession = this.getSession(0);
            if (_local_2 == null)
            {
                return;
            }
            this._roomEngine.modifyRoomCanvas(_local_2.roomId, 1, context.displayObjectContainer.width, context.displayObjectContainer.height);
        }

        public function _Str_10094(k:int, _arg_2:String="", _arg_3:String=""):Boolean
        {
            var _local_4:RoomSession = new RoomSession();
            _local_4.roomId = k;
            _local_4._Str_18062 = _arg_2;
            _local_4._Str_17752 = _arg_3;
            _local_4.habboTracking = this._habboTracking;
            return this.createSession(_local_4);
        }

        public function _Str_21545(k:int, _arg_2:int):Boolean
        {
            var _local_3:RoomSession = new RoomSession();
            _local_3.roomId = 1;
            _local_3._Str_18062 = "";
            _local_3.habboTracking = this._habboTracking;
            _local_3._Str_21443 = new _Str_9845(k, _arg_2);
            return this.createSession(_local_3);
        }

        private function createSession(k:RoomSession):Boolean
        {
            if (!this._Str_3961)
            {
                this._pendingSessionRequest = k;
                return false;
            }
            var _local_2:String = this.getRoomIdentifier(k.roomId);
            this._sessionStarting = true;
            if (this._sessions.getValue(_local_2) != null)
            {
                this._Str_7613(k.roomId, false);
            }
            k.connection = ((this._communication) ? this._communication.connection : null);
            this._sessions.add(_local_2, k);
            events.dispatchEvent(new RoomSessionEvent(RoomSessionEvent.CREATED, k));
            if (this._roomViewerMode)
            {
                this._roomEngine.events.addEventListener("RCLE_SUCCESS", this.onRoomContentLoaded);
                this._pendingResources = new Array();
                this._viewerSession = k;
                if (this._pendingResources.length == 0)
                {
                    this._Str_12778(k);
                }
            }
            return true;
        }

        private function onRoomContentLoaded(k:Event):void
        {
            if (((this._pendingResources == null) || (this._pendingResources.length == 0)))
            {
                return;
            }
            var _local_2:int = this._pendingResources.indexOf(k["contentType"]);
            if (_local_2 != -1)
            {
                this._pendingResources.splice(_local_2, 1);
            }
            if (this._pendingResources.length == 0)
            {
                this._Str_12778(this._viewerSession);
            }
        }

        public function _Str_12778(k:IRoomSession):Boolean
        {
            if (k.state == RoomSessionEvent.STARTED)
            {
                return false;
            }
            if (k.isGameSession)
            {
                return true;
            }
            if (k.start())
            {
                this._sessionStarting = false;
                events.dispatchEvent(new RoomSessionEvent(RoomSessionEvent.STARTED, k));
                this.updateHandlers(k);
            }
            else
            {
                this._Str_7613(k.roomId);
                this._sessionStarting = false;
                return false;
            }
            return true;
        }

        public function _Str_24970():void
        {
            var k:RoomSession = new RoomSession();
            k.roomId = 1;
            k.habboTracking = this._habboTracking;
            k.isGameSession = true;
            k.connection = this._communication.connection;
            this._sessions.add(this.getRoomIdentifier(k.roomId), k);
            events.dispatchEvent(new RoomSessionEvent(RoomSessionEvent.CREATED, k));
        }

        public function _Str_22920():void
        {
            var k:String = this.getRoomIdentifier(1);
            var _local_2:RoomSession = this._sessions.getValue(k);
            if (((_local_2) && (_local_2.isGameSession)))
            {
                this._Str_7613(1, false);
            }
        }

        public function sessionUpdate(k:int, _arg_2:String):void
        {
            var _local_3:IRoomSession = this.getSession(k);
            if (_local_3 != null)
            {
                switch (_arg_2)
                {
                    case RoomSessionHandler.RS_CONNECTED:
                        return;
                    case RoomSessionHandler.RS_READY:
                        return;
                    case RoomSessionHandler.RS_DISCONNECTED:
                        this._Str_7613(k);
                        return;
                }
            }
        }

        public function sessionReinitialize(k:int, _arg_2:int):void
        {
            var _local_5:RoomSession;
            var _local_3:String = this.getRoomIdentifier(k);
            var _local_4:RoomSession = (this._sessions.remove(_local_3) as RoomSession);
            if (_local_4 != null)
            {
                _local_4.reset(_arg_2);
                _local_3 = this.getRoomIdentifier(_arg_2);
                _local_5 = this._sessions.remove(_local_3);
                if (_local_5 != null)
                {
                }
                this._sessions.add(_local_3, _local_4);
                this.updateHandlers(_local_4);
            }
        }

        public function getSession(k:int):IRoomSession
        {
            var _local_2:String = this.getRoomIdentifier(k);
            return this._sessions.getValue(_local_2) as IRoomSession;
        }

        public function _Str_7613(k:int, _arg_2:Boolean=true):void
        {
            var _local_3:String = this.getRoomIdentifier(k);
            var _local_4:RoomSession = (this._sessions.remove(_local_3) as RoomSession);
            if (_local_4 != null)
            {
                events.dispatchEvent(new RoomSessionEvent(RoomSessionEvent.ENDED, _local_4, _arg_2));
                _local_4.dispose();
            }
        }

        private function updateHandlers(k:IRoomSession):void
        {
            var _local_2:int;
            var _local_3:BaseHandler;
            if (((!(k == null)) && (!(this._handlers == null))))
            {
                _local_2 = 0;
                while (_local_2 < this._handlers.length)
                {
                    _local_3 = (this._handlers[_local_2] as BaseHandler);
                    if (_local_3 != null)
                    {
                        _local_3._xxxRoomId = k.roomId;
                    }
                    _local_2++;
                }
            }
        }

        private function getRoomIdentifier(k:int):String
        {
            return "hard_coded_room_id";
        }
    }
}
