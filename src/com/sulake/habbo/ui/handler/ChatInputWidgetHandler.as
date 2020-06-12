package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.chatinput.RoomChatInputWidget;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChatTypingMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChatMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChatSelectAvatarMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRequestWidgetMessage;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.localization.ICoreLocalizationManager;
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.room.events.RoomZoomEvent;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import flash.ui.Mouse;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;
    import com.sulake.habbo.ui.widget.events.HideRoomWidgetEvent;
    import com.sulake.habbo.friendbar.events.FriendBarResizeEvent;
    import flash.events.Event;
    import com.sulake.habbo.ui.widget.events._Str_6300;

    public class ChatInputWidgetHandler implements IRoomWidgetHandler 
    {
        private var _isDisposed:Boolean = false;
        private var _mouseToggle:Boolean = true;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _widget:RoomChatInputWidget;


        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function set widget(k:RoomChatInputWidget):void
        {
            this._widget = k;
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.CHAT_INPUT_WIDGET;
        }

        public function dispose():void
        {
            this._isDisposed = true;
            this._container = null;
            this._widget = null;
        }

        public function getWidgetMessages():Array
        {
            var k:Array = [];
            k.push(RoomWidgetChatTypingMessage.RWCTM_TYPING_STATUS);
            k.push(RoomWidgetChatMessage.RWCM_MESSAGE_CHAT);
            k.push(RoomWidgetChatSelectAvatarMessage.RWCSAM_MESSAGE_SELECT_AVATAR);
            return k;
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:Array;
            var _local_3:int;
            var _local_4:int;
            var _local_5:RoomWidgetChatTypingMessage;
            var _local_6:RoomWidgetChatSelectAvatarMessage;
            var _local_7:RoomWidgetChatMessage;
            var _local_8:String;
            var _local_9:RoomWidgetRequestWidgetMessage;
            var _local_10:Array;
            var _local_11:int;
            var _local_12:String;
            var commandArgument:String;
            var _local_14:int;
            var _local_15:RoomUserData;
            var _local_16:String;
            var _local_17:GuestRoomData;
            var userToKick:RoomUserData;
            var userToMute:RoomUserData;
            var userToAlert:RoomUserData;
            var _local_21:HabboToolbarEvent;
            var _local_22:Date;
            var _local_23:String;
            var _local_24:RoomUserData;
            switch (k.type)
            {
                case RoomWidgetChatTypingMessage.RWCTM_TYPING_STATUS:
                    _local_5 = (k as RoomWidgetChatTypingMessage);
                    if (_local_5 != null)
                    {
                        this._container.roomSession.sendChatTypingMessage(_local_5.isTyping);
                    }
                    break;
                case RoomWidgetChatMessage.RWCM_MESSAGE_CHAT:
                    if (((!(this._container == null)) && (!(this._container.roomSession == null))))
                    {
                        _local_7 = (k as RoomWidgetChatMessage);
                        if (_local_7 != null)
                        {
                            if (_local_7.text == "")
                            {
                                return null;
                            }
                            _local_8 = _local_7.text;
                            _local_9 = null;
                            _local_10 = _local_7.text.split(" ");
                            if (_local_10.length > 0)
                            {
                                _local_12 = _local_10[0];
                                commandArgument = "";
                                if (_local_10.length > 1)
                                {
                                    commandArgument = _local_10[1];
                                }
                                if (((_local_12.charAt(0) == ":") && (commandArgument == "x")))
                                {
                                    _local_14 = this._container.roomEngine.getSelectedAvatarId();
                                    if (_local_14 > -1)
                                    {
                                        _local_15 = this._container.roomSession.userDataManager.getUserDataByIndex(_local_14);
                                        if (_local_15 != null)
                                        {
                                            commandArgument = _local_15.name;
                                            _local_8 = _local_7.text.replace(" x", (" " + _local_15.name));
                                        }
                                    }
                                }
                                switch (_local_12.toLowerCase())
                                {
                                    case ":d":
                                    case ";d":
                                        if (this._container.sessionDataManager.clubLevel == HabboClubLevelEnum.VIP)
                                        {
                                            this._container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum.LAUGH.ordinal);
                                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "chat", "laugh");
                                        }
                                        break;
                                    case "o/":
                                    case "_o/":
                                        this._container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum.WAVE.ordinal);
                                        return null;
                                    case ":kiss":
                                        if (this._container.sessionDataManager.clubLevel == HabboClubLevelEnum.VIP)
                                        {
                                            this._container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum.BLOW.ordinal);
                                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "chat", "blow");
                                            return null;
                                        }
                                        break;
                                    case ":jump":
                                        if (this._container.sessionDataManager.clubLevel == HabboClubLevelEnum.VIP)
                                        {
                                            this._container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum.JUMP.ordinal);
                                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "chat", "jump");
                                            return null;
                                        }
                                        break;
                                    case ":idle":
                                        this._container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum.IDLE.ordinal);
                                        HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "chat", "idle");
                                        return null;
                                    case "_b":
                                        this._container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum.RESPECT.ordinal);
                                        HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "chat", "respect");
                                        return null;
                                    case ":sign":
                                        this._container.roomSession.sendSignMessage(int(commandArgument));
                                        HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "chat", "sign", null, int(commandArgument));
                                        return null;
                                    case ":chooser":
                                        if ((((this._container.sessionDataManager.clubLevel >= HabboClubLevelEnum.CLUB) || (this._container.sessionDataManager.hasSecurity(SecurityLevelEnum.PARTNER))) || (this._container.sessionDataManager.isAmbassador)))
                                        {
                                            _local_9 = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.RWRWM_USER_CHOOSER);
                                            this._container.processWidgetMessage(_local_9);
                                        }
                                        return null;
                                    case ":furni":
                                        if (((((this._container.sessionDataManager.clubLevel >= HabboClubLevelEnum.CLUB) && (this._container.roomSession.roomControllerLevel >= RoomControllerLevel.GUEST)) || (this._container.sessionDataManager.hasSecurity(SecurityLevelEnum.PARTNER))) || (this._container.sessionDataManager.isAmbassador)))
                                        {
                                            _local_9 = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.RWRWM_FURNI_CHOOSER);
                                            this._container.processWidgetMessage(_local_9);
                                        }
                                        return null;
                                    case ":pickall":
                                        this._container.sessionDataManager.pickAllFurniture(this._container.roomSession.roomId);
                                        return null;
                                    case ":pickallbc":
                                        this._container.sessionDataManager.pickAllBuilderFurniture(this._container.roomSession.roomId);
                                        return null;
                                    case ":ejectall":
                                        this._container.sessionDataManager.ejectAllFurniture(this._container.roomSession.roomId, _local_8);
                                        return null;
                                    case ":ejectpets":
                                        this._container.sessionDataManager.ejectPets(this._container.roomSession.roomId);
                                        return null;
                                    case ":moonwalk":
                                        this._container.sessionDataManager.sendSpecialCommandMessage(":moonwalk");
                                        return null;
                                    case ":habnam":
                                        this._container.sessionDataManager.sendSpecialCommandMessage(":habnam");
                                        return null;
                                    case ":yyxxabxa":
                                        this._container.sessionDataManager.sendSpecialCommandMessage(":yyxxabxa");
                                        return null;
                                    case ":mutepets":
                                        this._container.sessionDataManager.sendSpecialCommandMessage(":mutepets");
                                        return null;
                                    case ":mpgame":
                                        this._container.sessionDataManager.sendSpecialCommandMessage(_local_8);
                                        return null;
                                    case ":news":
                                        if (this._container.config.getBoolean("client.news.embed.enabled"))
                                        {
                                            HabboWebTools.openNews();
                                            return null;
                                        }
                                        break;
                                    case ":mail":
                                        if (this._container.config.getBoolean("client.minimail.embed.enabled"))
                                        {
                                            HabboWebTools.openMinimail("#mail/inbox/");
                                            return null;
                                        }
                                        break;
                                    case ":crashme":
                                        break;
                                    case ":tgl":
                                        break;
                                    case ":li":
                                        break;
                                    case ":2":
                                    case ":kick":
                                        if (this._container.roomSession.roomControllerLevel >= RoomControllerLevel.GUEST)
                                        {
                                            userToKick = this._container.roomSession.userDataManager.getUserDataByName(commandArgument);
                                            if (userToKick)
                                            {
                                                this._container.roomSession.kickUser(userToKick.id);
                                            }
                                        }
                                        return null;
                                    case ":shutup":
                                    case ":mute":
                                        if (this._container.roomSession.roomControllerLevel >= RoomControllerLevel.GUEST)
                                        {
                                            userToMute = this._container.roomSession.userDataManager.getUserDataByName(commandArgument);
                                            if (userToMute)
                                            {
                                                this._container.roomSession.muteUser(userToMute.id, 2);
                                            }
                                        }
                                        return null;
                                    case ":floor":
                                    case ":bcfloor":
                                        if (this._container.roomSession.roomControllerLevel >= RoomControllerLevel.ROOM_OWNER)
                                        {
                                            this._container.windowManager.displayFloorPlanEditor();
                                        }
                                        return null;
                                    case ":lang":
                                        (this._container.localization as ICoreLocalizationManager).activateLocalizationDefinition(commandArgument);
                                        return null;
                                    case ":uc":
                                        if (this._container.sessionDataManager.hasSecurity(SecurityLevelEnum.EMPLOYEE))
                                        {
                                            if (commandArgument == "hotel")
                                            {
                                                this._container.roomSession.sendPeerUsersClassificationMessage(_local_10[2]);
                                            }
                                            else
                                            {
                                                this._container.roomSession.sendRoomUsersClassificationMessage(commandArgument);
                                            }
                                        }
                                        return null;
                                    case ":anew":
                                        if (((this._container.sessionDataManager.isAmbassador) || (this._container.sessionDataManager.hasSecurity(SecurityLevelEnum.EMPLOYEE))))
                                        {
                                            this._container.roomSession.sendRoomUsersClassificationMessage("new");
                                        }
                                        return null;
                                    case ":avisit":
                                        if (((this._container.sessionDataManager.isAmbassador) || (this._container.sessionDataManager.hasSecurity(SecurityLevelEnum.EMPLOYEE))))
                                        {
                                            if ("group" == commandArgument)
                                            {
                                                (this._container.roomEngine as Component).context.createLinkEvent("navigator/goto/predefined_group_lobby");
                                            }
                                            else
                                            {
                                                (this._container.roomEngine as Component).context.createLinkEvent("navigator/goto/predefined_noob_lobby");
                                            }
                                        }
                                        return null;
                                    case ":aalert":
                                        if (((this._container.sessionDataManager.isAmbassador) || (this._container.sessionDataManager.hasSecurity(SecurityLevelEnum.EMPLOYEE))))
                                        {
                                            userToAlert = this._container.roomSession.userDataManager.getUserDataByName(commandArgument);
                                            if (userToAlert)
                                            {
                                                this._container.roomSession.ambassadorAlert(userToAlert.id);
                                            }
                                        }
                                        return null;
                                    case ":visit":
                                        if (this._container.sessionDataManager.clubLevel >= HabboClubLevelEnum.CLUB)
                                        {
                                            this._container.roomSession.sendVisitUserMessage(commandArgument);
                                        }
                                        return null;
                                    case ":roomid":
                                        if (this._container.sessionDataManager.hasSecurity(SecurityLevelEnum.EMPLOYEE))
                                        {
											if (commandArgument != null && commandArgument != "")
											{
												this._container.roomSession.sendVisitFlatMessage(parseInt(commandArgument));
											}
                                        }
                                        return null;
                                    case ":link":
                                        break;
                                    case ":zoom":
                                        this._container.roomEngine.events.dispatchEvent(new RoomZoomEvent(this._container.roomEngine.activeRoomId, Number(commandArgument)));
                                        return null;
                                    case ":cam":
                                    case ":camera":
                                        if (this._container.sessionDataManager.isPerkAllowed(PerkEnum.CAMERA))
                                        {
                                            _local_21 = new HabboToolbarEvent(HabboToolbarEvent.HTE_ICON_CAMERA);
                                            _local_21._Str_4856 = HabboToolbarEvent.CHATCAMERACOMMAND;
                                            this._container.toolbar.events.dispatchEvent(_local_21);
                                        }
                                        return null;
                                    case ":q":
                                        break;
                                    case ":screenshot":
                                        _local_17 = this._container.navigator.enteredGuestRoomData;
                                        if (_local_17)
                                        {
                                            _local_16 = _local_17.roomName;
                                        }
                                        if (((_local_16 == null) || (_local_16.length == 0)))
                                        {
                                            _local_22 = new Date();
                                            _local_23 = (([_local_22.getFullYear(), _local_22.getMonth(), _local_22.getDate()].join("-") + " ") + [_local_22.getHours(), _local_22.getMinutes(), _local_22.getSeconds()].join("."));
                                            _local_16 = ("Habbo " + _local_23);
                                        }
                                        this._container.roomEngine.createScreenShot(this._container.roomSession.roomId, this._container.getFirstCanvasId(), (_local_16 + ".png"));
                                        return null;
                                    case ":iddqd":
                                        this._container.roomEngine.events.dispatchEvent(new RoomZoomEvent(this._container.roomEngine.activeRoomId, -1, true));
                                        return null;
                                    case ":hidemouse":
                                        if (this._mouseToggle)
                                        {
                                            Mouse.hide();
                                            this._container.roomEngine.setTileCursorState(this._container.roomEngine.activeRoomId, 0);
                                        }
                                        else
                                        {
                                            Mouse.show();
                                            this._container.roomEngine.setTileCursorState(this._container.roomEngine.activeRoomId, 1);
                                        }
                                        this._container.roomEngine.toggleTileCursorVisibility(this._container.roomEngine.activeRoomId, (!(this._mouseToggle)));
                                        this._mouseToggle = (!(this._mouseToggle));
                                        return null;
									case ":modtools":
										this._container.moderation.setVisible(true);
										return null;
									case ":csmm":
                                        if (this._container.sessionDataManager.hasSecurity(SecurityLevelEnum.EMPLOYEE))
                                        {
                                            this._container.gameManager._SafeStr_7624();
                                            return null;
                                        }
                                        break;
                                }
                            }
                            _local_11 = _local_7.styleId;
                            if (((!(this._container == null)) && (!(this._container.roomSession == null))))
                            {
                                if (this._container.freeFlowChat != null)
                                {
                                    if (((!(this._container.freeFlowChat.preferedChatStyle == _local_7.styleId)) && (!(_local_7.styleId == -1))))
                                    {
                                        this._container.freeFlowChat.preferedChatStyle = _local_7.styleId;
                                    }
                                    _local_11 = this._container.freeFlowChat.preferedChatStyle;
                                }
                                switch (_local_7.chatType)
                                {
                                    case RoomWidgetChatMessage.CHAT_TYPE_SPEAK:
                                        this._container.roomSession.sendChatMessage(_local_8, _local_11);
                                        break;
                                    case RoomWidgetChatMessage.CHAT_TYPE_SHOUT:
                                        this._container.roomSession.sendShoutMessage(_local_8, _local_11);
                                        break;
                                    case RoomWidgetChatMessage.CHAT_TYPE_WHISPER:
                                        this._container.roomSession.sendWhisperMessage(_local_7._Str_23716, _local_8, _local_11);
                                        break;
                                }
                            }
                        }
                    }
                    break;
                case RoomWidgetChatSelectAvatarMessage.RWCSAM_MESSAGE_SELECT_AVATAR:
                    _local_6 = (k as RoomWidgetChatSelectAvatarMessage);
                    if (_local_6 != null)
                    {
                        this._container.roomEngine.selectAvatar(_local_6.roomId, _local_6.objectId);
                        _local_24 = this._container.roomSession.userDataManager.getUserDataByIndex(_local_6.objectId);
                        if (_local_24 != null)
                        {
                            this._container.moderation.userSelected(_local_24.id, _local_6.userName, _local_24.figure, _local_24.sex);
                        }
                    }
                    break;
            }
            return null;
        }

        public function getProcessedEvents():Array
        {
            return [RoomSessionChatEvent.RSCE_FLOOD_EVENT, HideRoomWidgetEvent.HRWE_HIDE_ROOM_WIDGET, FriendBarResizeEvent.FBE_BAR_RESIZE_EVENT];
        }

        public function update():void
        {
        }

        public function processEvent(k:Event):void
        {
            var _local_3:RoomSessionChatEvent;
            var _local_4:int;
            var _local_5:FriendBarResizeEvent;
            var _local_2:Event;
            if (((this._container == null) || (this._container.events == null)))
            {
                return;
            }
            switch (k.type)
            {
                case RoomSessionChatEvent.RSCE_FLOOD_EVENT:
                    _local_3 = (k as RoomSessionChatEvent);
                    _local_4 = parseInt(_local_3.text);
                    _local_2 = new _Str_6300(_local_4);
                    break;
                case HideRoomWidgetEvent.HRWE_HIDE_ROOM_WIDGET:
                    this._Str_22488((k as HideRoomWidgetEvent));
                    return;
                case FriendBarResizeEvent.FBE_BAR_RESIZE_EVENT:
                    _local_5 = (k as FriendBarResizeEvent);
                    this._widget._Str_24485();
                    break;
            }
            if ((((!(this._container == null)) && (!(this._container.events == null))) && (!(_local_2 == null))))
            {
                this._container.events.dispatchEvent(_local_2);
            }
        }

        private function _Str_22488(k:HideRoomWidgetEvent):void
        {
            if (((k) && (k.widgetType == this.type)))
            {
                this._widget.hide();
            }
        }
    }
}
