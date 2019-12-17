package com.sulake.habbo.freeflowchat
{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.navigator.IHabboNavigator;
    import com.sulake.habbo.moderation.IHabboModeration;
    import com.sulake.habbo.ui.IRoomUI;
    import com.sulake.habbo.game.IHabboGameManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.freeflowchat.data.ChatEventHandler;
    import com.sulake.habbo.freeflowchat.data.RoomSessionEventHandler;
    import com.sulake.habbo.freeflowchat.history.ChatHistoryBuffer;
    import com.sulake.habbo.freeflowchat.viewer.simulation.ChatFlowStage;
    import com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryScrollView;
    import com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryTray;
    import com.sulake.habbo.freeflowchat.viewer.ChatFlowViewer;
    import com.sulake.habbo.freeflowchat.viewer.ChatBubbleFactory;
    import com.sulake.habbo.communication.messages.incoming.room.chat.RoomChatSettingsEvent;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.display.Sprite;
    import flash.geom.Rectangle;
    import flash.display.BitmapData;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboModeration;
    import com.sulake.iid.IIDHabboRoomUI;
    import com.sulake.iid.IIDHabboGameManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDHabboWindowManager;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.perk._Str_3277;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_2752;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2929;
	import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomChatSettingsParser;
    import com.sulake.habbo.communication.messages.incoming._Str_470._Str_3870;
    import flash.geom.Point;
    import com.sulake.habbo.freeflowchat.viewer.visualization.PooledChatBubble;
    import com.sulake.habbo.freeflowchat.data.ChatItem;
    import com.sulake.habbo.configuration.enum.HabboComponentFlags;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.utils.IVector3d;
    import flash.display.DisplayObject;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.ui.IRoomDesktop;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.session.IRoomSession;
    import flash.events.MouseEvent;
    import com.sulake.habbo.freeflowchat.style.IChatStyleLibrary;
    import com.sulake.habbo.communication.messages.outgoing._Str_370._Str_10312;
    import com.sulake.habbo.communication.messages.outgoing._Str_370._Str_12096;

    public class HabboFreeFlowChat extends Component implements IHabboFreeFlowChat 
    {
        private var _avatarRenderManager:IAvatarRenderManager;
        private var _roomSessionManager:IRoomSessionManager;
        private var _roomEngine:IRoomEngine;
        private var _navigator:IHabboNavigator;
        private var _moderation:IHabboModeration;
        private var _roomUI:IRoomUI;
        private var _gameManager:IHabboGameManager;
        private var _localizationManager:IHabboLocalizationManager;
        private var _toolbar:IHabboToolbar;
        private var _communication:IHabboCommunicationManager;
        private var _windowManager:IHabboWindowManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _chatEventHandler:ChatEventHandler;
        private var _roomEventHandler:RoomSessionEventHandler;
        private var _chatHistoryBuffer:ChatHistoryBuffer;
        private var _chatFlowStage:ChatFlowStage;
        private var _chatHistoryScrollView:ChatHistoryScrollView;
        private var _chatHistoryPulldown:ChatHistoryTray;
        private var _chatFlowViewer:ChatFlowViewer;
        private var _chatViewController:ChatViewController;
        private var _chatBubbleFactory:ChatBubbleFactory;
        private var _perkAllowed:Boolean = false;
        private var _isInRoom:Boolean = false;
        private var _roomChatSettings:RoomChatSettingsParser;
        private var _freeFlowDisabled:Boolean = false;
        private var _preferedChatStyle:int = 1;
        private var _roomChangeRecordedInHistory:Boolean = false;

        public function HabboFreeFlowChat(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
        }

        public static function _Str_21613():String
        {
            var k:Date = new Date();
            var _local_2:Number = k.getHours();
            var _local_3:Number = k.getMinutes();
            var _local_4:Number = k.getSeconds();
            var _local_5:String = ((_local_2 < 10) ? ("0" + _local_2) : _local_2.toString());
            _local_5 = ((_local_5 + ":") + ((_local_3 < 10) ? ("0" + _local_3) : _local_3.toString()));
            _local_5 = ((_local_5 + ":") + ((_local_4 < 10) ? ("0" + _local_4) : _local_4.toString()));
            return _local_5;
        }

        public static function _Str_18206(k:Rectangle, _arg_2:BitmapData):Sprite
        {
            var _local_8:Number;
            var _local_9:int;
            var _local_3:Sprite = new Sprite();
            var _local_4:Array = [k.left, k.right, _arg_2.width];
            var _local_5:Array = [k.top, k.bottom, _arg_2.height];
            _local_3.graphics.clear();
            var _local_6:Number = 0;
            var _local_7:int;
            while (_local_7 < 3)
            {
                _local_8 = 0;
                _local_9 = 0;
                while (_local_9 < 3)
                {
                    _local_3.graphics.beginBitmapFill(_arg_2);
                    _local_3.graphics.drawRect(_local_6, _local_8, (_local_4[_local_7] - _local_6), (_local_5[_local_9] - _local_8));
                    _local_3.graphics.endFill();
                    _local_8 = _local_5[_local_9];
                    _local_9++;
                }
                _local_6 = _local_4[_local_7];
                _local_7++;
            }
            _local_3.scale9Grid = k;
            return _local_3;
        }


        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }, false), new ComponentDependency(new IIDAvatarRenderManager(), function (k:IAvatarRenderManager):void
            {
                _avatarRenderManager = k;
            }, false), new ComponentDependency(new IIDHabboRoomSessionManager(), function (k:IRoomSessionManager):void
            {
                _roomSessionManager = k;
            }), new ComponentDependency(new IIDRoomEngine(), function (k:IRoomEngine):void
            {
                _roomEngine = k;
            }, false), new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communication = k;
            }), new ComponentDependency(new IIDHabboNavigator(), function (k:IHabboNavigator):void
            {
                _navigator = k;
            }, false), new ComponentDependency(new IIDHabboModeration(), function (k:IHabboModeration):void
            {
                _moderation = k;
            }, false), new ComponentDependency(new IIDHabboRoomUI(), function (k:IRoomUI):void
            {
                _roomUI = k;
            }, false), new ComponentDependency(new IIDHabboGameManager(), function (k:IHabboGameManager):void
            {
                _gameManager = k;
            }, false), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localizationManager = k;
            }, false), new ComponentDependency(new IIDHabboToolbar(), function (k:IHabboToolbar):void
            {
                _toolbar = k;
            }, false), new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }, false)]));
        }

        override protected function initComponent():void
        {
            this._communication.addHabboConnectionMessageEvent(new _Str_3277(this.onPerkAllowances));
            this._communication.addHabboConnectionMessageEvent(new _Str_2752(this.onCreditBalance));
            this._communication.addHabboConnectionMessageEvent(new _Str_2929(this._Str_25407));
            this._communication.addHabboConnectionMessageEvent(new RoomChatSettingsEvent(this._Str_25751));
            this._communication.addHabboConnectionMessageEvent(new _Str_3870(this._Str_10366));
        }

        private function onPerkAllowances(k:_Str_3277):void
        {
            var _local_2:Boolean = this._perkAllowed;
            this._perkAllowed = true;
            if (((!(_local_2)) && (this._perkAllowed)))
            {
                this._chatBubbleFactory = new ChatBubbleFactory(this);
                if (!this.isDisabledInPreferences)
                {
                    this._chatEventHandler = new ChatEventHandler(this);
                    this._roomEventHandler = new RoomSessionEventHandler(this);
                    this._chatHistoryBuffer = new ChatHistoryBuffer(this);
                }
                if (this._isInRoom)
                {
                    this._Str_15723();
                }
            }
            else
            {
                if (((_local_2) && (!(this._perkAllowed))))
                {
                    if (this._chatBubbleFactory)
                    {
                        this._chatBubbleFactory.dispose();
                        this._chatBubbleFactory = null;
                    }
                    if (this._chatEventHandler)
                    {
                        this._chatEventHandler.dispose();
                        this._chatEventHandler = null;
                    }
                    if (this._roomEventHandler)
                    {
                        this._roomEventHandler.dispose();
                        this._roomEventHandler = null;
                    }
                    if (this._chatHistoryBuffer)
                    {
                        this._chatHistoryBuffer.dispose();
                        this._chatHistoryBuffer = null;
                    }
                    this._Str_13202();
                }
            }
        }

        private function _Str_25407(k:_Str_2929):void
        {
            if (((this._chatHistoryBuffer) && (!(this._roomChangeRecordedInHistory))))
            {
                this._chatHistoryBuffer._Str_24587(k.getParser().data);
            }
            this._roomChangeRecordedInHistory = true;
            this._roomChatSettings = k.getParser()._Str_4965;
            if (this._chatFlowStage)
            {
                this._chatFlowStage._Str_18127();
            }
        }

        private function onCreditBalance(k:_Str_2752):void
        {
            this._roomChangeRecordedInHistory = false;
            this.clear();
        }

        private function _Str_25751(k:RoomChatSettingsEvent):void
        {
            this._roomChatSettings = k.getParser()._Str_4965;
            if (((this._isInRoom) && (this._chatFlowStage)))
            {
                this._chatFlowStage._Str_18127();
            }
        }

        private function _Str_10366(k:_Str_3870):void
        {
            this._freeFlowDisabled = k.getParser()._Str_25556;
            this._preferedChatStyle = k.getParser()._Str_6984;
        }

        public function _Str_19756():BitmapData
        {
            return BitmapData(assets.getAssetByName("room_change").content);
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return this._roomSessionManager;
        }

        public function get roomEngine():IRoomEngine
        {
            return this._roomEngine;
        }

        public function get avatarRenderManager():IAvatarRenderManager
        {
            return this._avatarRenderManager;
        }

        public function get _Str_3479():IHabboGameManager
        {
            return this._gameManager;
        }

        public function get localizations():IHabboLocalizationManager
        {
            return this._localizationManager;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._sessionDataManager;
        }

        public function _Str_15723():void
        {
            this._isInRoom = true;
            if (((((this._perkAllowed) && (this._chatBubbleFactory)) && (this._chatEventHandler)) && (this._roomEventHandler)))
            {
                this._chatFlowStage = new ChatFlowStage(this);
                this._chatFlowViewer = new ChatFlowViewer(this, this._chatFlowStage);
                this._chatHistoryScrollView = new ChatHistoryScrollView(this, this._chatHistoryBuffer);
                this._chatHistoryPulldown = new ChatHistoryTray(this, this._chatHistoryScrollView);
                this._chatViewController = new ChatViewController(this, this._chatFlowViewer, this._chatHistoryPulldown);
            }
        }

        public function _Str_13202():void
        {
            if (this._chatHistoryPulldown)
            {
                this._chatHistoryPulldown.dispose();
                this._chatHistoryPulldown = null;
            }
            if (this._chatHistoryScrollView)
            {
                this._chatHistoryScrollView.dispose();
                this._chatHistoryPulldown = null;
            }
            if (this._chatFlowViewer)
            {
                this._chatFlowViewer.dispose();
                this._chatFlowViewer = null;
            }
            if (this._chatFlowStage)
            {
                this._chatFlowStage.dispose();
                this._chatFlowStage = null;
            }
            if (this._chatViewController)
            {
                this._chatViewController.dispose();
                this._chatViewController = null;
            }
            this._isInRoom = false;
        }

        public function _Str_15063(chatItem:ChatItem):void
        {
            var insertPosition:Point;
            var chatBubble:PooledChatBubble;
            if (((((!(this._perkAllowed)) || (!(this._chatHistoryBuffer))) || (!(this._chatFlowStage))) || (this.isDisabledInPreferences)))
            {
                return;
            }
            this._chatHistoryBuffer._Str_15063(chatItem);
            try
            {
                chatBubble = this._chatBubbleFactory._Str_22521(chatItem);
            }
            catch(e:Error)
            {
                if (e.errorID == 2015)
                {
                    return;
                }
                throw (e);
            }
            insertPosition = this._chatFlowStage._Str_12872(chatBubble);
            this._chatFlowViewer._Str_12872(chatBubble, insertPosition);
        }

        public function _Str_21534(k:int, _arg_2:IVector3d):Point
        {
            var _local_8:Point;
            var _local_9:Point;
            if ((((this._roomEngine == null) || (this._chatFlowViewer == null)) || (this._chatFlowViewer._Str_5128.stage == null)))
            {
                return new Point(0, 0);
            }
            var _local_3:int = ((HabboComponentFlags._Str_4954(flags)) ? 1 : -1);
            var _local_4:IRoomGeometry = this.roomEngine.getRoomCanvasGeometry(k, _local_3);
            var _local_5:Number = this.roomEngine._Str_5151(k);
            var _local_6:Number = ((this._chatFlowViewer._Str_5128.stage.stageWidth * _local_5) / 2);
            var _local_7:Number = ((this._chatFlowViewer._Str_5128.stage.stageHeight * _local_5) / 2);
            if (((!(_local_4 == null)) && (!(_arg_2 == null))))
            {
                _local_8 = _local_4.getScreenPoint(_arg_2);
                if (_local_8 != null)
                {
                    _local_6 = (_local_6 + (_local_8.x * _local_5));
                    _local_7 = (_local_7 + (_local_8.y * _local_5));
                    _local_9 = this.roomEngine.getRoomCanvasScreenOffset(k);
                    if (_local_9 != null)
                    {
                        _local_6 = (_local_6 + _local_9.x);
                        _local_7 = (_local_7 + _local_9.y);
                    }
                }
            }
            return new Point(_local_6, _local_7);
        }

        public function get _Str_9270():ChatFlowViewer
        {
            return this._chatFlowViewer;
        }

        public function get _Str_5827():ChatBubbleFactory
        {
            return this._chatBubbleFactory;
        }

        public function get _Str_18503():ChatHistoryScrollView
        {
            return this._chatHistoryScrollView;
        }

        public function get displayObject():DisplayObject
        {
            if (this._chatViewController)
            {
                return this._chatViewController._Str_5128;
            }
            return null;
        }

        public function _Str_20784(k:int):void
        {
            this._roomEngine.mouseEventsDisabledLeftToX = k;
        }

        public function _Str_19178(k:ChatItem):void
        {
            this.selectAvatar(k.roomId, k.userId);
        }

        public function selectAvatar(k:int, _arg_2:int):void
        {
            var _local_5:RoomUserData;
            var _local_6:RoomUserData;
            if (this._roomUI == null)
            {
                return;
            }
            var _local_3:IRoomDesktop = this._roomUI.getDesktop("hard_coded_room_id");
            _local_3.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.RWROM_GET_OBJECT_INFO, _arg_2, RoomObjectCategoryEnum.CONST_100));
            this.roomEngine.selectAvatar(k, _arg_2);
            var _local_4:IRoomSession = this._roomSessionManager.getSession(k);
            if (_local_4)
            {
                _local_5 = _local_4.userDataManager.getUserDataByIndex(_arg_2);
                if (_local_5 != null)
                {
                    _local_6 = this._roomSessionManager.getSession(k).userDataManager.getUserDataByIndex(_arg_2);
                    if (((_local_6) && (this._moderation)))
                    {
                        this._moderation._Str_9380(_local_5._Str_2394, _local_6.name);
                    }
                }
            }
        }

        public function get _Str_7277():RoomChatSettingsParser
        {
            return this._roomChatSettings;
        }

        public function get _Str_22462():Boolean
        {
            if (this._roomChatSettings)
            {
                return this._roomChatSettings.mode == RoomChatSettingsParser._Str_12787;
            }
            return false;
        }

        public function _Str_21417(k:MouseEvent):Boolean
        {
            return (this._roomUI) ? this._roomUI._Str_21446(k) : false;
        }

        public function get chatStyleLibrary():IChatStyleLibrary
        {
            return (this._chatBubbleFactory) ? this._chatBubbleFactory.chatStyleLibrary : null;
        }

        public function get isDisabledInPreferences():Boolean
        {
            return this._freeFlowDisabled;
        }

        public function set isDisabledInPreferences(k:Boolean):void
        {
            this._freeFlowDisabled = k;
            this._communication.connection.send(new _Str_10312(this._freeFlowDisabled));
        }

        public function get _Str_6984():int
        {
            return this._preferedChatStyle;
        }

        public function set _Str_6984(k:int):void
        {
            this._preferedChatStyle = k;
            this._communication.connection.send(new _Str_12096(this._preferedChatStyle));
        }

        public function clear():void
        {
            if (this._chatFlowStage)
            {
                this._chatFlowStage.clear();
            }
        }

        public function toggleVisibility():void
        {
            if ((((this.isDisabledInPreferences) || (!(this._perkAllowed))) || (!(this._chatHistoryPulldown))))
            {
                return;
            }
            this._chatHistoryPulldown._Str_19537();
        }

        public function get toolbar():IHabboToolbar
        {
            return this._toolbar;
        }
    }
}
