package com.sulake.habbo.messenger
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.widgets.IIlluminaInputHandler;
    import flash.utils.Dictionary;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IWidgetWindow;
    import flash.utils.Timer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.window.widgets.IIlluminaInputWidget;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendlist.IFriend;
    import com.sulake.habbo.window.widgets.IAvatarImageWidget;
    import com.sulake.habbo.window.widgets.IBadgeImageWidget;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.core.window.components.IRegionWindow;
    import flash.events.TimerEvent;
    import com.sulake.habbo.messenger.events.NewMessageEvent;
    import com.sulake.habbo.window.widgets.IIlluminaChatBubbleWidget;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.VisitUserMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.GetExtendedProfileMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.GetHabboGroupDetailsMessageComposer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.SendMsgMessageComposer;

    public class MainView implements IDisposable, IIlluminaInputHandler
    {
        private static const HIDDEN:String = "HIDDEN";
        private static const NO_CONVERSATION:int = -1;
        private static const NOTIFICATION_ICON_WIDTH:int = 55;
        private static const CHAT_ITEM_RENDER_BUNDLE_SIZE:int = 5;
        private static const SCROLL_TRIGGER_HEIGHT:int = 150;
        private static const ERROR_MESSAGES:Dictionary = new Dictionary();

        private var _messenger:HabboMessenger;
        private var _frame:IWindowContainer;
        private var _conversationList:IItemListWindow;
        private var _avatarList:IWindowContainer;
        private var _avatarListPosition:int;
        private var _avatarListLastNotShown:Boolean;
        private var _chatEntries:Dictionary;
        private var _currentConversationId:int = -1;
        private var _avatarTemplate:IWindowContainer;
        private var _chatMessageTemplate:IWidgetWindow;
        private var _chatNotificationTemplate:IWindowContainer;
        private var _chatInvitationTemplate:IWindowContainer;
        private var _chatInfoTemplate:IWindowContainer;
        private var _populatingList:Boolean;
        private var _moderationInfoShown:Boolean = false;
        private var _pendingMessages:Array;
        private var _batchUpdatingTimer:Timer;

        {
            ERROR_MESSAGES[3] = "${messenger.error.receivermuted}";
            ERROR_MESSAGES[4] = "${messenger.error.sendermuted}";
            ERROR_MESSAGES[5] = "${messenger.error.offline}";
            ERROR_MESSAGES[6] = "${messenger.error.notfriend}";
            ERROR_MESSAGES[7] = "${messenger.error.busy}";
            ERROR_MESSAGES[8] = "${messenger.error.receiverhasnochat}";
            ERROR_MESSAGES[9] = "${messenger.error.senderhasnochat}";
            ERROR_MESSAGES[10] = "${messenger.error.offline_failed}";
        }

        public function MainView(k:HabboMessenger)
        {
            this._chatEntries = new Dictionary();
            super();
            this._messenger = k;
            this._frame = (this._messenger.getXmlWindow("messenger") as IWindowContainer);
            this._frame.visible = false;
            this._frame.procedure = this.messengerWindowProcedure;
            IStaticBitmapWrapperWindow(this._frame.findChildByName("header_button_image")).assetUri = "messenger_minimize_button";
            this._avatarList = (this._frame.findChildByName("avatar_list") as IWindowContainer);
            this._avatarTemplate = (this._avatarList.getChildAt(0) as IWindowContainer);
            this._avatarList.removeChild(this._avatarTemplate);
            this._avatarListPosition = 0;
            this._conversationList = (this._frame.findChildByName("conversation") as IItemListWindow);
            this._chatMessageTemplate = (this._conversationList.getListItemByName("msg_normal") as IWidgetWindow);
            this._chatNotificationTemplate = (this._conversationList.getListItemByName("msg_notification") as IWindowContainer);
            this._chatInvitationTemplate = (this._conversationList.getListItemByName("msg_invitation") as IWindowContainer);
            this._chatInfoTemplate = (this._conversationList.getListItemByName("msg_info") as IWindowContainer);
            this._conversationList.removeListItems();
            IIlluminaInputWidget(IWidgetWindow(this._frame.findChildByName("input_widget")).widget).submitHandler = this;
            this._pendingMessages = new Array();
        }

        private static function avatarVisible(k:IWindow):Boolean
        {
            return (!(k == null)) && (k.tags.indexOf(HIDDEN) < 0);
        }

        private static function setAvatarVisibilityTag(k:IWindow, _arg_2:Boolean):void
        {
            if (k == null)
            {
                return;
            }
            var _local_3:Boolean = avatarVisible(k);
            if (((_local_3) && (!(_arg_2))))
            {
                k.tags.push(HIDDEN);
            }
            else
            {
                if (((!(_local_3)) && (_arg_2)))
                {
                    k.tags.splice(k.tags.indexOf(HIDDEN), 1);
                }
            }
        }


        public function dispose():void
        {
            if (!this.disposed)
            {
                this._conversationList = null;
                this._avatarList = null;
                if (this._frame != null)
                {
                    this._frame.dispose();
                    this._frame = null;
                }
                if (this._chatMessageTemplate != null)
                {
                    this._chatMessageTemplate.dispose();
                    this._chatMessageTemplate = null;
                }
                if (this._chatNotificationTemplate != null)
                {
                    this._chatNotificationTemplate.dispose();
                    this._chatNotificationTemplate = null;
                }
                if (this._chatInvitationTemplate != null)
                {
                    this._chatInvitationTemplate.dispose();
                    this._chatInvitationTemplate = null;
                }
                if (this._chatInfoTemplate != null)
                {
                    this._chatInfoTemplate.dispose();
                    this._chatInfoTemplate = null;
                }
                if (this._avatarTemplate != null)
                {
                    this._avatarTemplate.dispose();
                    this._avatarTemplate = null;
                }
                if (this._batchUpdatingTimer)
                {
                    if (this._batchUpdatingTimer.running)
                    {
                        this._batchUpdatingTimer.stop();
                    }
                    this._batchUpdatingTimer = null;
                }
                this._chatEntries = null;
                this._messenger = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._messenger == null;
        }

        public function get isOpen():Boolean
        {
            return (!(this._frame == null)) && (this._frame.visible);
        }

        public function toggle():void
        {
            if (this.isOpen)
            {
                this.hide();
            }
            else
            {
                this.show();
            }
        }

        public function show(k:Boolean=false):void
        {
            if (((k) || (this.visibleAvatarCount > 0)))
            {
                this._frame.visible = true;
                this._frame.activate();
            }
        }

        public function hide():void
        {
            this._frame.visible = false;
        }

        public function startConversation(k:int, _arg_2:Boolean=true):void
        {
            var _local_3:IFriend;
            var _local_4:IWindowContainer;
            var _local_5:IWidgetWindow;
            var _local_6:IWidgetWindow;
            var _local_7:IAvatarImageWidget;
            var _local_8:IBadgeImageWidget;
            if (!(k in this._chatEntries))
            {
                this._chatEntries[k] = [];
                if (!this._moderationInfoShown)
                {
                    this.recordNotificationMessage(k, "${messenger.moderationinfo}");
                    this._moderationInfoShown = true;
                }
                _local_3 = this._messenger.getFriend(k);
                if (!_local_3)
                {
                    ErrorReportStorage.addDebugData("Messenger Mainview", ("User got start conversation request from nonexistent friend, id: " + k));
                    return;
                }
                if (!_local_3.online)
                {
                    this.recordNotificationMessage(k, "${messenger.notification.persisted_messages}");
                }
                _local_4 = (this._avatarTemplate.clone() as IWindowContainer);
                setAvatarVisibilityTag(_local_4, true);
                _local_4.blend = 0;
                _local_4.id = k;
                if (k < 0)
                {
                    _local_4.name = String(k);
                }
                _local_5 = (_local_4.findChildByName("avatar_image") as IWidgetWindow);
                _local_6 = (_local_4.findChildByName("group_badge_image") as IWidgetWindow);
                if (_local_3.id > 0)
                {
                    _local_7 = (_local_5.widget as IAvatarImageWidget);
                    if (_local_3 != null)
                    {
                        _local_7.figure = _local_3.figure;
                    }
                    _local_6.visible = false;
                    _local_5.visible = true;
                }
                else
                {
                    _local_8 = (_local_6.widget as IBadgeImageWidget);
                    _local_8.badgeId = _local_3.figure;
                    _local_8.groupId = _local_3.id;
                    _local_6.visible = true;
                    _local_5.visible = false;
                }
                IRegionWindow(_local_4.findChildByName("avatar_click_region")).toolTipCaption = _local_3.name;
                this._avatarList.addChild(_local_4);
                this.refreshAvatarList();
            }
            if (((_arg_2) || (!(this.isOpen))))
            {
                this.selectConversation(k);
            }
            this.refreshChatCount();
        }

        public function addConsoleMessage(k:int, _arg_2:String, _arg_3:int, _arg_4:String):void
        {
            this.recordChatMessage(k, _arg_2, true, _arg_3, _arg_4);
        }

        public function addRoomInvite(k:int, _arg_2:String):void
        {
            this.recordInvitationMessage(k, ((this._messenger.getText("messenger.invitation") + " ") + _arg_2), true);
        }

        public function setFollowingAllowed(k:int, _arg_2:Boolean):void
        {
            if (k == this._currentConversationId)
            {
                this.refreshButtons();
            }
        }

        public function onInstantMessageError(k:int, _arg_2:int, _arg_3:String):void
        {
            var _local_4:String;
            var _local_5:RegExp;
            if ((_arg_2 in ERROR_MESSAGES))
            {
                if (_arg_3.length > 0)
                {
                    _local_4 = ERROR_MESSAGES[_arg_2];
                    _local_5 = /[${}]/g;
                    _local_4 = _local_4.replace(_local_5, "");
                    this.recordNotificationMessage(k, ((this._messenger.getText(_local_4) + ": ") + _arg_3));
                }
                else
                {
                    this.recordNotificationMessage(k, ERROR_MESSAGES[_arg_2]);
                }
            }
        }

        public function setOnlineStatus(k:int, _arg_2:Boolean):void
        {
            if ((k in this._chatEntries))
            {
                this.recordInfoMessage(k, ((_arg_2) ? "${messenger.notification.online}" : "${messenger.notification.offline}"));
            }
        }

        private function selectConversation(k:int):void
        {
            this._currentConversationId = k;
            setAvatarVisibilityTag(this.getAvatarWrapper(k), true);
            this.setChatIndicatorVisibility(k, false);
            this.refreshConversationList();
            this.refreshAvatarList();
            var _local_2:IFriend = this._messenger.getFriend(this._currentConversationId);
            var _local_3:String = ((_local_2 != null) ? _local_2.name : "");
            this._frame.findChildByName("separator_label").visible = ((this._currentConversationId < 0) || (!(_local_2 == null)));
            this._messenger.localization.registerParameter("messenger.window.separator", "friend_name", _local_3);
            this._messenger.localization.registerParameter("messenger.window.input.default", "friend_name", _local_3);
            this._frame.invalidate();
        }

        public function hideConversation(k:int):void
        {
            var _local_2:IWindow = this.getAvatarWrapper(k);
            if (_local_2 != null)
            {
                setAvatarVisibilityTag(_local_2, false);
            }
            if (this.visibleAvatarCount == 0)
            {
                this.selectConversation(NO_CONVERSATION);
                this.hide();
            }
            else
            {
                for each (_local_2 in this._avatarList.iterator)
                {
                    if (avatarVisible(_local_2))
                    {
                        this._avatarListPosition = 0;
                        this.selectConversation(_local_2.id);
                        break;
                    }
                }
            }
            this.refreshChatCount();
        }

        private function refreshChatCount():void
        {
            this._messenger.localization.registerParameter("messenger.window.title", "open_chat_count", this.visibleAvatarCount.toString());
            this._messenger.conversationCountUpdated(this.visibleAvatarCount);
        }

        private function recordChatMessage(k:int, _arg_2:String, _arg_3:Boolean, _arg_4:int, _arg_5:String=null):void
        {
            if (_arg_3)
            {
                this.recordChatEntry(k, new ChatEntry(ChatEntry.TYPE_OTHER_CHAT, k, _arg_2, _arg_4, _arg_5), true);
            }
            else
            {
                this.recordChatEntry(k, new ChatEntry(ChatEntry.TYPE_OWN_CHAT, 0, _arg_2, _arg_4));
            }
        }

        private function recordNotificationMessage(k:int, _arg_2:String):void
        {
            this.recordChatEntry(k, new ChatEntry(ChatEntry.TYPE_NOTIFICATION, 0, _arg_2, 0));
        }

        private function recordInfoMessage(k:int, _arg_2:String, _arg_3:Boolean=false):void
        {
            this.recordChatEntry(k, new ChatEntry(ChatEntry.TYPE_INFO, 0, _arg_2, 0), _arg_3);
        }

        private function recordInvitationMessage(k:int, _arg_2:String, _arg_3:Boolean=false):void
        {
            this.recordChatEntry(k, new ChatEntry(ChatEntry.TYPE_INVITATION, 0, _arg_2, 0), _arg_3);
        }

        private function recordChatEntry(k:int, _arg_2:ChatEntry, _arg_3:Boolean=false):void
        {
            var _local_6:ChatEntry;
            var _local_7:Boolean;
            var _local_8:String;
            var _local_9:String;
            if (this._messenger == null)
            {
                return;
            }
            if (!this._messenger.hasfriendsListInitialized)
            {
                this._pendingMessages.push(new ChatQueueEntry(k, _arg_2, _arg_3));
                if (((!(this._batchUpdatingTimer)) || ((this._batchUpdatingTimer) && (!(this._batchUpdatingTimer.running)))))
                {
                    this._batchUpdatingTimer = new Timer(12000);
                    this._batchUpdatingTimer.addEventListener(TimerEvent.TIMER, this.batchMessageUpdate);
                    this._batchUpdatingTimer.start();
                }
                return;
            }
            if (!(k in this._chatEntries))
            {
                this.startConversation(k, false);
            }
            var _local_4:Array = this._chatEntries[k];
            if (_local_4.length > 0)
            {
                _local_6 = _local_4[(_local_4.length - 1)];
                if (k > 0)
                {
                    if (((_arg_2.type == _local_6.type) && ((_arg_2.type == ChatEntry.TYPE_OWN_CHAT) || (_arg_2.type == ChatEntry.TYPE_OTHER_CHAT))))
                    {
                        _local_4.pop();
                        _arg_2._Str_19910(_local_6.message);
                        if (k == this._currentConversationId)
                        {
                            this._conversationList.removeListItemAt((this._conversationList.numListItems - 1));
                        }
                    }
                }
                else
                {
                    _local_7 = false;
                    if (_arg_2.type == ChatEntry.TYPE_OTHER_CHAT)
                    {
                        if (((_local_6.extraData == null) || (_arg_2.extraData == null)))
                        {
                            _local_7 = false;
                        }
                        else
                        {
                            _local_8 = _local_6.extraData.split("/")[0];
                            _local_9 = _arg_2.extraData.split("/")[0];
                            _local_7 = (_local_8 == _local_9);
                        }
                    }
                    if (((_arg_2.type == _local_6.type) && ((_arg_2.type == ChatEntry.TYPE_OWN_CHAT) || (_local_7))))
                    {
                        _local_4.pop();
                        _arg_2._Str_19910(_local_6.message);
                        if (k == this._currentConversationId)
                        {
                            this._conversationList.removeListItemAt((this._conversationList.numListItems - 1));
                        }
                    }
                }
            }
            _local_4.push(_arg_2);
            var _local_5:IWindowContainer = this.getAvatarWrapper(k);
            if (_local_5 != null)
            {
                setAvatarVisibilityTag(_local_5, true);
                this.refreshAvatarList();
            }
            if (k == this._currentConversationId)
            {
                this.appendChatEntry(_arg_2);
            }
            else
            {
                if (_arg_3)
                {
                    this.setChatIndicatorVisibility(k, true);
                }
                if (this.visibleAvatarCount == 1)
                {
                    this.selectConversation(k);
                }
            }
            this.refreshChatCount();
        }

        private function batchMessageUpdate(k:TimerEvent):void
        {
            var _local_2:int;
            var _local_3:ChatQueueEntry;
            if (this._messenger == null)
            {
                return;
            }
            if (this._messenger.hasfriendsListInitialized)
            {
                if (this._pendingMessages.length > 0)
                {
                    _local_2 = -1;
                    for each (_local_3 in this._pendingMessages)
                    {
                        _local_2 = _local_3._Str_20358;
                        this.recordChatEntry(_local_3._Str_20358, _local_3._Str_24552, _local_3._Str_24452);
                    }
                    this.refreshConversationList();
                    this.refreshAvatarList();
                    this._messenger.events.dispatchEvent(new NewMessageEvent(true, _local_2));
                }
                this._pendingMessages = new Array();
                this._batchUpdatingTimer.stop();
            }
        }

        private function getAvatarWrapper(k:int):IWindowContainer
        {
            return this._avatarList.getChildByID(k) as IWindowContainer;
        }

        private function setChatIndicatorVisibility(k:int, _arg_2:Boolean):void
        {
            var _local_3:IWindowContainer = this.getAvatarWrapper(k);
            if (_local_3 != null)
            {
                _local_3.findChildByName("chat_indicator").visible = _arg_2;
            }
        }

        private function createChatItem(k:ChatEntry):IWindow
        {
            var _local_2:IWidgetWindow;
            var _local_3:IIlluminaChatBubbleWidget;
            var _local_4:IWindowContainer;
            var _local_5:IWindow;
            var _local_6:IWindowContainer;
            var _local_7:IWindowContainer;
            var _local_8:IFriend;
            var _local_9:IWindowContainer;
            var _local_10:Boolean;
            switch (k.type)
            {
                case ChatEntry.TYPE_INFO:
                    _local_4 = (this._chatInfoTemplate.clone() as IWindowContainer);
                    _local_5 = _local_4.findChildByName("content");
                    _local_5.limits.minWidth = this.conversationItemWidth;
                    _local_5.limits.maxWidth = this.conversationItemWidth;
                    _local_5.caption = k.message;
                    return _local_4;
                case ChatEntry.TYPE_NOTIFICATION:
                    _local_6 = (this._chatNotificationTemplate.clone() as IWindowContainer);
                    _local_6.findChildByName("content").width = (this.conversationItemWidth - NOTIFICATION_ICON_WIDTH);
                    _local_6.findChildByName("content").caption = k.message;
                    return _local_6;
                case ChatEntry.TYPE_INVITATION:
                    _local_7 = (this._chatInvitationTemplate.clone() as IWindowContainer);
                    _local_7.findChildByName("content").width = (this.conversationItemWidth - NOTIFICATION_ICON_WIDTH);
                    _local_7.findChildByName("content").caption = k.message;
                    return _local_7;
                case ChatEntry.TYPE_OTHER_CHAT:
                    _local_2 = (this._chatMessageTemplate.clone() as IWidgetWindow);
                    _local_2.width = this.conversationItemWidth;
                    _local_3 = (_local_2.widget as IIlluminaChatBubbleWidget);
                    _local_3.message = k.message;
                    _local_3.timeStamp = k._Str_22172();
                    _local_3.flipped = true;
                    for each (_local_9 in this._avatarList.iterator)
                    {
                        _local_10 = ((!(_local_9 == null)) && (_local_9.id == this._currentConversationId));
                        if ((((!(_local_10)) && (!(_local_9 == null))) && (this._currentConversationId < 0)))
                        {
                            _local_10 = (Number(_local_9.name) == this._currentConversationId);
                        }
                        if (_local_10)
                        {
                            if (this._currentConversationId > 0)
                            {
                                _local_3.figure = IAvatarImageWidget(IWidgetWindow(_local_9.getChildByName("avatar_image")).widget).figure;
                                _local_3.userName = IRegionWindow(_local_9.findChildByName("avatar_click_region")).toolTipCaption;
                                _local_3.userId = _local_9.id;
                            }
                            else
                            {
                                _local_3.userId = k.extraData.split("/")[2];
                                _local_3.figure = k.extraData.split("/")[1];
                                _local_3.userName = k.extraData.split("/")[0];
                            }
                            break;
                        }
                    }
                    return _local_2;
                case ChatEntry.TYPE_OWN_CHAT:
                    _local_2 = (this._chatMessageTemplate.clone() as IWidgetWindow);
                    _local_2.width = this.conversationItemWidth;
                    _local_3 = (_local_2.widget as IIlluminaChatBubbleWidget);
                    _local_3.message = k.message;
                    _local_3.timeStamp = k._Str_22172();
                    _local_3.flipped = false;
                    _local_3.figure = this._messenger.sessionDataManager.figure;
                    _local_3.userName = this._messenger.sessionDataManager.userName;
                    _local_8 = this._messenger.getFriend(this._currentConversationId);
                    if ((((!(_local_8 == null)) && (!(_local_8.online))) && ((_local_8.persistedMessageUser) || (_local_8.pocketHabboUser))))
                    {
                        _local_3.friendOnlineStatus = false;
                    }
                    return _local_2;
            }
            return null;
        }

        private function appendChatEntry(k:ChatEntry, _arg_2:Boolean=true):void
        {
            this._conversationList.addListItem(this.createChatItem(k));
            if (_arg_2)
            {
                this._conversationList.scrollV = 1;
                this._conversationList.arrangeListItems();
            }
        }

        private function adjustListItemWidths():void
        {
            var _local_2:IWindow;
            var _local_3:IWindow;
            var k:int;
            while (k < this._conversationList.numListItems)
            {
                _local_2 = this._conversationList.getListItemAt(k);
                switch (_local_2.name)
                {
                    case "msg_normal":
                        break;
                    case "msg_notification":
                        IWindowContainer(_local_2).findChildByName("content").width = (this.conversationItemWidth - NOTIFICATION_ICON_WIDTH);
                        break;
                    case "msg_info":
                        _local_3 = IWindowContainer(_local_2).findChildByName("content");
                        _local_3.limits.minWidth = this.conversationItemWidth;
                        _local_3.limits.maxWidth = this.conversationItemWidth;
                        break;
                }
                _local_2.width = this.conversationItemWidth;
                k++;
            }
            this._conversationList.arrangeListItems();
            this._frame.invalidate();
        }

        private function get conversationItemWidth():int
        {
            return this._frame.width - 27;
        }

        private function refreshButtons():void
        {
            IItemListWindow(this._frame.findChildByName("button_strip")).arrangeListItems();
        }

        private function refreshConversationList():void
        {
            this._populatingList = true;
            this._conversationList.destroyListItems();
            var k:Array = this._chatEntries[this._currentConversationId];
            if (k == null)
            {
                return;
            }
            var _local_2:int = k.length;
            var _local_3:int = Math.max(0, (_local_2 - CHAT_ITEM_RENDER_BUNDLE_SIZE));
            while (_local_3 < _local_2)
            {
                this.appendChatEntry(k[_local_3]);
                _local_3++;
            }
            this._conversationList.scrollV = 1;
            this._conversationList.arrangeListItems();
            this._populatingList = false;
        }

        private function addMissingChatEntries():void
        {
            if (-(this._conversationList.scrollableRegion.y) > SCROLL_TRIGGER_HEIGHT)
            {
                return;
            }
            this._populatingList = true;
            var k:Number = this._conversationList.scrollV;
            var _local_2:int = this._conversationList.scrollableRegion.height;
            var _local_3:Array = this._chatEntries[this._currentConversationId];
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:int = (_local_3.length - this._conversationList.numListItems);
            var _local_5:int;
            var _local_6:int = Math.max(0, (_local_4 - CHAT_ITEM_RENDER_BUNDLE_SIZE));
            while (_local_6 < _local_4)
            {
                this._conversationList.addListItemAt(this.createChatItem(_local_3[_local_6]), _local_5);
                _local_5++;
                _local_6++;
            }
            this._conversationList.arrangeListItems();
            this._conversationList.scrollV = (1 - ((_local_2 * (1 - k)) / this._conversationList.scrollableRegion.height));
            this._populatingList = false;
        }

        private function refreshAvatarList():void
        {
            var _local_3:IWindow;
            var _local_4:Boolean;
            var _local_5:Boolean;
            var k:int;
            var _local_2:int;
            this._avatarListLastNotShown = false;
            for each (_local_3 in this._avatarList.iterator)
            {
                _local_4 = (_local_3.id == this._currentConversationId);
                if (((!(_local_4)) && (_local_3.name.length > 0)))
                {
                    _local_4 = (Number(_local_3.name) == this._currentConversationId);
                }
                if (_local_4)
                {
                    setAvatarVisibilityTag(_local_3, true);
                }
                _local_5 = avatarVisible(_local_3);
                if ((((_local_2 < this._avatarListPosition) || (!(_local_5))) || (this._avatarListLastNotShown)))
                {
                    _local_3.visible = false;
                }
                else
                {
                    if ((k + _local_3.width) > this._avatarList.width)
                    {
                        _local_3.visible = false;
                        this._avatarListLastNotShown = true;
                    }
                    else
                    {
                        _local_3.visible = true;
                        _local_3.blend = ((_local_4) ? 1 : 0);
                        _local_3.x = k;
                        k = (k + _local_3.width);
                    }
                }
                if (_local_5)
                {
                    _local_2++;
                }
            }
            this._frame.findChildByName("avatars_scroll_left").visible = (this._avatarListPosition > 0);
            this._frame.findChildByName("avatars_scroll_right").visible = this._avatarListLastNotShown;
        }

        private function get visibleAvatarCount():int
        {
            var _local_2:IWindow;
            var k:int;
            for each (_local_2 in this._avatarList.iterator)
            {
                if (avatarVisible(_local_2))
                {
                    k++;
                }
            }
            return k;
        }

        private function messengerWindowProcedure(k:WindowEvent, _arg_2:IWindow):void
        {
            switch (k.type)
            {
                case WindowEvent.WINDOW_EVENT_RESIZE:
                    if (_arg_2 == this._frame)
                    {
                        this.adjustListItemWidths();
                        this.refreshAvatarList();
                    }
                    return;
                case WindowEvent.WINDOW_EVENT_RELOCATED:
                    if (((_arg_2.name == "_CONTAINER") && (!(this._populatingList))))
                    {
                        this.addMissingChatEntries();
                    }
                    return;
                case WindowMouseEvent.CLICK:
                    switch (_arg_2.name)
                    {
                        case "avatar_click_region":
                            this.selectConversation(_arg_2.parent.id);
                            break;
                        case "avatars_scroll_left":
                            if (this._avatarListPosition > 0)
                            {
                                this._avatarListPosition--;
                                this.refreshAvatarList();
                            }
                            break;
                        case "avatars_scroll_right":
                            if (this._avatarListLastNotShown)
                            {
                                this._avatarListPosition++;
                                this.refreshAvatarList();
                            }
                            break;
                        case "close_conversation_button":
                            this.hideConversation(this._currentConversationId);
                            break;
                        case "follow_button":
                            this._messenger.send(new VisitUserMessageComposer(this._currentConversationId));
                            this._messenger.send(new EventLogMessageComposer("Navigation", "IM", "go.im"));
                            break;
                        case "profile_button":
                            if (this._currentConversationId > 0)
                            {
                                this._messenger.send(new GetExtendedProfileMessageComposer(this._currentConversationId));
                                this._messenger.trackGoogle("extendedProfile", "messenger_conversation");
                            }
                            else
                            {
                                this._messenger.send(new GetHabboGroupDetailsMessageComposer(Math.abs(this._currentConversationId), true));
                                this._messenger.trackGoogle("extendedProfile", "messenger_conversation");
                            }
                            break;
                        case "report_button":
                            this._messenger.reportUser(this._currentConversationId);
                            break;
                        case "header_button_close":
                            this.hide();
                            break;
                    }
                    return;
            }
        }

        public function onInput(k:IWidgetWindow, _arg_2:String):void
        {
            this._messenger.send(new SendMsgMessageComposer(this._currentConversationId, _arg_2));
            IIlluminaInputWidget(k.widget).message = "";
            var _local_3:Array = this._chatEntries[this._currentConversationId];
            if (((_local_3.length == 0) || ((_local_3.length == 1) && (ChatEntry(_local_3[0]).type == ChatEntry.TYPE_NOTIFICATION))))
            {
                this._messenger.playSendSound();
            }
            this.recordChatMessage(this._currentConversationId, this.escapeExternalKeys(_arg_2), false, 0);
        }

        private function escapeExternalKeys(k:String):String
        {
            if (k.search("\\${") == 0)
            {
                return " " + k;
            }
            return k;
        }
    }
}
