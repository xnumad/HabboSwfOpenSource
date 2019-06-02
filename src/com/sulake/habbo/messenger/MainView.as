package com.sulake.habbo.messenger
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.widgets._Str_5480;
    import flash.utils.Dictionary;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IWidgetWindow;
    import flash.utils.Timer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.window.widgets._Str_2789;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendlist.IFriend;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.core.window.components.IRegionWindow;
    import flash.events.TimerEvent;
    import com.sulake.habbo.messenger.events.NewMessageEvent;
    import com.sulake.habbo.window.widgets._Str_3904;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.friendlist._Str_4348;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2863;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.friendlist._Str_10962;

    public class MainView implements IDisposable, _Str_5480 
    {
        private static const HIDDEN:String = "HIDDEN";
        private static const _Str_18940:int = -1;
        private static const _Str_11283:int = 55;
        private static const _Str_13145:int = 5;
        private static const _Str_18765:int = 150;
        private static const _Str_4550:Dictionary = new Dictionary();

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
            _Str_4550[3] = "${messenger.error.receivermuted}";
            _Str_4550[4] = "${messenger.error.sendermuted}";
            _Str_4550[5] = "${messenger.error.offline}";
            _Str_4550[6] = "${messenger.error.notfriend}";
            _Str_4550[7] = "${messenger.error.busy}";
            _Str_4550[8] = "${messenger.error.receiverhasnochat}";
            _Str_4550[9] = "${messenger.error.senderhasnochat}";
            _Str_4550[10] = "${messenger.error.offline_failed}";
        }

        public function MainView(k:HabboMessenger)
        {
            this._chatEntries = new Dictionary();
            super();
            this._messenger = k;
            this._frame = (this._messenger.getXmlWindow("messenger") as IWindowContainer);
            this._frame.visible = false;
            this._frame.procedure = this._Str_22468;
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
            _Str_2789(IWidgetWindow(this._frame.findChildByName("input_widget")).widget)._Str_8859 = this;
            this._pendingMessages = new Array();
        }

        private static function _Str_6745(k:IWindow):Boolean
        {
            return (!(k == null)) && (k.tags.indexOf(HIDDEN) < 0);
        }

        private static function _Str_5616(k:IWindow, _arg_2:Boolean):void
        {
            if (k == null)
            {
                return;
            }
            var _local_3:Boolean = _Str_6745(k);
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
            if (((k) || (this._Str_9747 > 0)))
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
            var _local_7:_Str_2483;
            var _local_8:_Str_2402;
            if (!(k in this._chatEntries))
            {
                this._chatEntries[k] = [];
                if (!this._moderationInfoShown)
                {
                    this._Str_14230(k, "${messenger.moderationinfo}");
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
                    this._Str_14230(k, "${messenger.notification.persisted_messages}");
                }
                _local_4 = (this._avatarTemplate.clone() as IWindowContainer);
                _Str_5616(_local_4, true);
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
                    _local_7 = (_local_5.widget as _Str_2483);
                    if (_local_3 != null)
                    {
                        _local_7.figure = _local_3.figure;
                    }
                    _local_6.visible = false;
                    _local_5.visible = true;
                }
                else
                {
                    _local_8 = (_local_6.widget as _Str_2402);
                    _local_8.badgeId = _local_3.figure;
                    _local_8.groupId = _local_3.id;
                    _local_6.visible = true;
                    _local_5.visible = false;
                }
                IRegionWindow(_local_4.findChildByName("avatar_click_region"))._Str_2613 = _local_3.name;
                this._avatarList.addChild(_local_4);
                this._Str_7204();
            }
            if (((_arg_2) || (!(this.isOpen))))
            {
                this._Str_11644(k);
            }
            this._Str_16374();
        }

        public function _Str_24983(k:int, _arg_2:String, _arg_3:int, _arg_4:String):void
        {
            this._Str_21468(k, _arg_2, true, _arg_3, _arg_4);
        }

        public function _Str_24937(k:int, _arg_2:String):void
        {
            this._Str_25852(k, ((this._messenger.getText("messenger.invitation") + " ") + _arg_2), true);
        }

        public function _Str_14047(k:int, _arg_2:Boolean):void
        {
            if (k == this._currentConversationId)
            {
                this._Str_4295();
            }
        }

        public function _Str_17683(k:int, _arg_2:int, _arg_3:String):void
        {
            var _local_4:String;
            var _local_5:RegExp;
            if ((_arg_2 in _Str_4550))
            {
                if (_arg_3.length > 0)
                {
                    _local_4 = _Str_4550[_arg_2];
                    _local_5 = /[${}]/g;
                    _local_4 = _local_4.replace(_local_5, "");
                    this._Str_14230(k, ((this._messenger.getText(_local_4) + ": ") + _arg_3));
                }
                else
                {
                    this._Str_14230(k, _Str_4550[_arg_2]);
                }
            }
        }

        public function _Str_10473(k:int, _arg_2:Boolean):void
        {
            if ((k in this._chatEntries))
            {
                this._Str_24402(k, ((_arg_2) ? "${messenger.notification.online}" : "${messenger.notification.offline}"));
            }
        }

        private function _Str_11644(k:int):void
        {
            this._currentConversationId = k;
            _Str_5616(this._Str_12553(k), true);
            this._Str_20231(k, false);
            this._Str_21370();
            this._Str_7204();
            var _local_2:IFriend = this._messenger.getFriend(this._currentConversationId);
            var _local_3:String = ((_local_2 != null) ? _local_2.name : "");
            this._frame.findChildByName("separator_label").visible = ((this._currentConversationId < 0) || (!(_local_2 == null)));
            this._messenger.localization.registerParameter("messenger.window.separator", "friend_name", _local_3);
            this._messenger.localization.registerParameter("messenger.window.input.default", "friend_name", _local_3);
            this._frame.invalidate();
        }

        public function _Str_20614(k:int):void
        {
            var _local_2:IWindow = this._Str_12553(k);
            if (_local_2 != null)
            {
                _Str_5616(_local_2, false);
            }
            if (this._Str_9747 == 0)
            {
                this._Str_11644(_Str_18940);
                this.hide();
            }
            else
            {
                for each (_local_2 in this._avatarList.iterator)
                {
                    if (_Str_6745(_local_2))
                    {
                        this._avatarListPosition = 0;
                        this._Str_11644(_local_2.id);
                        break;
                    }
                }
            }
            this._Str_16374();
        }

        private function _Str_16374():void
        {
            this._messenger.localization.registerParameter("messenger.window.title", "open_chat_count", this._Str_9747.toString());
            this._messenger._Str_23234(this._Str_9747);
        }

        private function _Str_21468(k:int, _arg_2:String, _arg_3:Boolean, _arg_4:int, _arg_5:String=null):void
        {
            if (_arg_3)
            {
                this._Str_8645(k, new ChatEntry(ChatEntry._Str_8431, k, _arg_2, _arg_4, _arg_5), true);
            }
            else
            {
                this._Str_8645(k, new ChatEntry(ChatEntry._Str_9544, 0, _arg_2, _arg_4));
            }
        }

        private function _Str_14230(k:int, _arg_2:String):void
        {
            this._Str_8645(k, new ChatEntry(ChatEntry._Str_10130, 0, _arg_2, 0));
        }

        private function _Str_24402(k:int, _arg_2:String, _arg_3:Boolean=false):void
        {
            this._Str_8645(k, new ChatEntry(ChatEntry._Str_12682, 0, _arg_2, 0), _arg_3);
        }

        private function _Str_25852(k:int, _arg_2:String, _arg_3:Boolean=false):void
        {
            this._Str_8645(k, new ChatEntry(ChatEntry._Str_15691, 0, _arg_2, 0), _arg_3);
        }

        private function _Str_8645(k:int, _arg_2:ChatEntry, _arg_3:Boolean=false):void
        {
            var _local_6:ChatEntry;
            var _local_7:Boolean;
            var _local_8:String;
            var _local_9:String;
            if (this._messenger == null)
            {
                return;
            }
            if (!this._messenger._Str_7577)
            {
                this._pendingMessages.push(new ChatQueueEntry(k, _arg_2, _arg_3));
                if (((!(this._batchUpdatingTimer)) || ((this._batchUpdatingTimer) && (!(this._batchUpdatingTimer.running)))))
                {
                    this._batchUpdatingTimer = new Timer(12000);
                    this._batchUpdatingTimer.addEventListener(TimerEvent.TIMER, this._Str_25635);
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
                    if (((_arg_2.type == _local_6.type) && ((_arg_2.type == ChatEntry._Str_9544) || (_arg_2.type == ChatEntry._Str_8431))))
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
                    if (_arg_2.type == ChatEntry._Str_8431)
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
                    if (((_arg_2.type == _local_6.type) && ((_arg_2.type == ChatEntry._Str_9544) || (_local_7))))
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
            var _local_5:IWindowContainer = this._Str_12553(k);
            if (_local_5 != null)
            {
                _Str_5616(_local_5, true);
                this._Str_7204();
            }
            if (k == this._currentConversationId)
            {
                this._Str_20919(_arg_2);
            }
            else
            {
                if (_arg_3)
                {
                    this._Str_20231(k, true);
                }
                if (this._Str_9747 == 1)
                {
                    this._Str_11644(k);
                }
            }
            this._Str_16374();
        }

        private function _Str_25635(k:TimerEvent):void
        {
            var _local_2:int;
            var _local_3:ChatQueueEntry;
            if (this._messenger == null)
            {
                return;
            }
            if (this._messenger._Str_7577)
            {
                if (this._pendingMessages.length > 0)
                {
                    _local_2 = -1;
                    for each (_local_3 in this._pendingMessages)
                    {
                        _local_2 = _local_3._Str_20358;
                        this._Str_8645(_local_3._Str_20358, _local_3._Str_24552, _local_3._Str_24452);
                    }
                    this._Str_21370();
                    this._Str_7204();
                    this._messenger.events.dispatchEvent(new NewMessageEvent(true, _local_2));
                }
                this._pendingMessages = new Array();
                this._batchUpdatingTimer.stop();
            }
        }

        private function _Str_12553(k:int):IWindowContainer
        {
            return this._avatarList.getChildByID(k) as IWindowContainer;
        }

        private function _Str_20231(k:int, _arg_2:Boolean):void
        {
            var _local_3:IWindowContainer = this._Str_12553(k);
            if (_local_3 != null)
            {
                _local_3.findChildByName("chat_indicator").visible = _arg_2;
            }
        }

        private function _Str_20924(k:ChatEntry):IWindow
        {
            var _local_2:IWidgetWindow;
            var _local_3:_Str_3904;
            var _local_4:IWindowContainer;
            var _local_5:IWindow;
            var _local_6:IWindowContainer;
            var _local_7:IWindowContainer;
            var _local_8:IFriend;
            var _local_9:IWindowContainer;
            var _local_10:Boolean;
            switch (k.type)
            {
                case ChatEntry._Str_12682:
                    _local_4 = (this._chatInfoTemplate.clone() as IWindowContainer);
                    _local_5 = _local_4.findChildByName("content");
                    _local_5.limits.minWidth = this._Str_5428;
                    _local_5.limits.maxWidth = this._Str_5428;
                    _local_5.caption = k.message;
                    return _local_4;
                case ChatEntry._Str_10130:
                    _local_6 = (this._chatNotificationTemplate.clone() as IWindowContainer);
                    _local_6.findChildByName("content").width = (this._Str_5428 - _Str_11283);
                    _local_6.findChildByName("content").caption = k.message;
                    return _local_6;
                case ChatEntry._Str_15691:
                    _local_7 = (this._chatInvitationTemplate.clone() as IWindowContainer);
                    _local_7.findChildByName("content").width = (this._Str_5428 - _Str_11283);
                    _local_7.findChildByName("content").caption = k.message;
                    return _local_7;
                case ChatEntry._Str_8431:
                    _local_2 = (this._chatMessageTemplate.clone() as IWidgetWindow);
                    _local_2.width = this._Str_5428;
                    _local_3 = (_local_2.widget as _Str_3904);
                    _local_3.message = k.message;
                    _local_3.timeStamp = k._Str_22172();
                    _local_3._Str_6764 = true;
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
                                _local_3.figure = _Str_2483(IWidgetWindow(_local_9.getChildByName("avatar_image")).widget).figure;
                                _local_3.userName = IRegionWindow(_local_9.findChildByName("avatar_click_region"))._Str_2613;
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
                case ChatEntry._Str_9544:
                    _local_2 = (this._chatMessageTemplate.clone() as IWidgetWindow);
                    _local_2.width = this._Str_5428;
                    _local_3 = (_local_2.widget as _Str_3904);
                    _local_3.message = k.message;
                    _local_3.timeStamp = k._Str_22172();
                    _local_3._Str_6764 = false;
                    _local_3.figure = this._messenger.sessionDataManager.figure;
                    _local_3.userName = this._messenger.sessionDataManager.userName;
                    _local_8 = this._messenger.getFriend(this._currentConversationId);
                    if ((((!(_local_8 == null)) && (!(_local_8.online))) && ((_local_8._Str_9624) || (_local_8.pocketHabboUser))))
                    {
                        _local_3._Str_21245 = false;
                    }
                    return _local_2;
            }
            return null;
        }

        private function _Str_20919(k:ChatEntry, _arg_2:Boolean=true):void
        {
            this._conversationList.addListItem(this._Str_20924(k));
            if (_arg_2)
            {
                this._conversationList.scrollV = 1;
                this._conversationList.arrangeListItems();
            }
        }

        private function _Str_22338():void
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
                        IWindowContainer(_local_2).findChildByName("content").width = (this._Str_5428 - _Str_11283);
                        break;
                    case "msg_info":
                        _local_3 = IWindowContainer(_local_2).findChildByName("content");
                        _local_3.limits.minWidth = this._Str_5428;
                        _local_3.limits.maxWidth = this._Str_5428;
                        break;
                }
                _local_2.width = this._Str_5428;
                k++;
            }
            this._conversationList.arrangeListItems();
            this._frame.invalidate();
        }

        private function get _Str_5428():int
        {
            return this._frame.width - 27;
        }

        private function _Str_4295():void
        {
            IItemListWindow(this._frame.findChildByName("button_strip")).arrangeListItems();
        }

        private function _Str_21370():void
        {
            this._populatingList = true;
            this._conversationList.destroyListItems();
            var k:Array = this._chatEntries[this._currentConversationId];
            if (k == null)
            {
                return;
            }
            var _local_2:int = k.length;
            var _local_3:int = Math.max(0, (_local_2 - _Str_13145));
            while (_local_3 < _local_2)
            {
                this._Str_20919(k[_local_3]);
                _local_3++;
            }
            this._conversationList.scrollV = 1;
            this._conversationList.arrangeListItems();
            this._populatingList = false;
        }

        private function _Str_25362():void
        {
            if (-(this._conversationList.visibleRegion.y) > _Str_18765)
            {
                return;
            }
            this._populatingList = true;
            var k:Number = this._conversationList.scrollV;
            var _local_2:int = this._conversationList.visibleRegion.height;
            var _local_3:Array = this._chatEntries[this._currentConversationId];
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:int = (_local_3.length - this._conversationList.numListItems);
            var _local_5:int;
            var _local_6:int = Math.max(0, (_local_4 - _Str_13145));
            while (_local_6 < _local_4)
            {
                this._conversationList.addListItemAt(this._Str_20924(_local_3[_local_6]), _local_5);
                _local_5++;
                _local_6++;
            }
            this._conversationList.arrangeListItems();
            this._conversationList.scrollV = (1 - ((_local_2 * (1 - k)) / this._conversationList.visibleRegion.height));
            this._populatingList = false;
        }

        private function _Str_7204():void
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
                    _Str_5616(_local_3, true);
                }
                _local_5 = _Str_6745(_local_3);
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

        private function get _Str_9747():int
        {
            var _local_2:IWindow;
            var k:int;
            for each (_local_2 in this._avatarList.iterator)
            {
                if (_Str_6745(_local_2))
                {
                    k++;
                }
            }
            return k;
        }

        private function _Str_22468(k:WindowEvent, _arg_2:IWindow):void
        {
            switch (k.type)
            {
                case WindowEvent.WINDOW_EVENT_RESIZE:
                    if (_arg_2 == this._frame)
                    {
                        this._Str_22338();
                        this._Str_7204();
                    }
                    return;
                case WindowEvent.WINDOW_EVENT_RELOCATED:
                    if (((_arg_2.name == "_CONTAINER") && (!(this._populatingList))))
                    {
                        this._Str_25362();
                    }
                    return;
                case WindowMouseEvent.CLICK:
                    switch (_arg_2.name)
                    {
                        case "avatar_click_region":
                            this._Str_11644(_arg_2.parent.id);
                            break;
                        case "avatars_scroll_left":
                            if (this._avatarListPosition > 0)
                            {
                                this._avatarListPosition--;
                                this._Str_7204();
                            }
                            break;
                        case "avatars_scroll_right":
                            if (this._avatarListLastNotShown)
                            {
                                this._avatarListPosition++;
                                this._Str_7204();
                            }
                            break;
                        case "close_conversation_button":
                            this._Str_20614(this._currentConversationId);
                            break;
                        case "follow_button":
                            this._messenger.send(new _Str_4348(this._currentConversationId));
                            this._messenger.send(new EventLogMessageComposer("Navigation", "IM", "go.im"));
                            break;
                        case "profile_button":
                            if (this._currentConversationId > 0)
                            {
                                this._messenger.send(new _Str_2553(this._currentConversationId));
                                this._messenger.trackGoogle("extendedProfile", "messenger_conversation");
                            }
                            else
                            {
                                this._messenger.send(new _Str_2863(Math.abs(this._currentConversationId), true));
                                this._messenger.trackGoogle("extendedProfile", "messenger_conversation");
                            }
                            break;
                        case "report_button":
                            this._messenger._Str_6694(this._currentConversationId);
                            break;
                        case "header_button_close":
                            this.hide();
                            break;
                    }
                    return;
            }
        }

        public function _Str_3055(k:IWidgetWindow, _arg_2:String):void
        {
            this._messenger.send(new _Str_10962(this._currentConversationId, _arg_2));
            _Str_2789(k.widget).message = "";
            var _local_3:Array = this._chatEntries[this._currentConversationId];
            if (((_local_3.length == 0) || ((_local_3.length == 1) && (ChatEntry(_local_3[0]).type == ChatEntry._Str_10130))))
            {
                this._messenger._Str_24965();
            }
            this._Str_21468(this._currentConversationId, this._Str_25699(_arg_2), false, 0);
        }

        private function _Str_25699(k:String):String
        {
            if (k.search("\\${") == 0)
            {
                return " " + k;
            }
            return k;
        }
    }
}
