package com.sulake.habbo.help
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.help.CallForHelpReplyMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.help.CallForHelpResultMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.help.IssueCloseNotificationMessageEvent;
    import com.sulake.habbo.help.enum._Str_2849;
    import com.sulake.habbo.communication.messages.outgoing.help.CallForHelpFromSelfieMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.help.CallForHelpFromPhotoMessageComposer;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.habbo.window.widgets.IIlluminaInputWidget;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.habbo.help.cfh.registry.user.UserRegistryItem;
    import com.sulake.habbo.window.widgets.IAvatarImageWidget;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.outgoing.users.IgnoreUserIdMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.help.ChatReviewSessionCreateMessageComposer;
    import com.sulake.habbo.window.enum.HabboAlertDialogFlag;
    import com.sulake.habbo.communication.messages.outgoing.help.CallForHelpMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.help.CallForHelpFromIMMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.help.CallForHelpFromForumThreadMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.help.CallForHelpFromForumMessageMessageComposer;
    import com.sulake.habbo.window.utils.IAlertDialog;
    import com.sulake.habbo.communication.messages.parser.help.CallForHelpReplyMessageParser;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.CallForHelpResultMessageParser;
    import com.sulake.habbo.help.enum.CallForHelpResultEnum;
    import com.sulake.habbo.communication.messages.parser.help.IssueCloseNotificationMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.help.DeletePendingCallsForHelpMessageComposer;

    public class CallForHelpManager implements IDisposable 
    {
        private static const FIELD_MAX_CHARS:int = 253;
        private static const EMERGENCY_HELP_REQUEST:String = "emergency_help_request";

        private var _disposed:Boolean;
        private var _habboHelp:HabboHelp;
        private var _window:IWindowContainer;
        private var _chatReportController:ChatReportController;
        private var _reportedUserId:int = -1;
        private var _reportedUserName:String = "";
        private var _reportedRoomId:int = -1;
        private var _reportedRoomName:String;
        private var _reportedRoomDescription:String;
        private var _reportedGroupId:int = -1;
        private var _reportedThreadId:int = -1;
        private var _reportedMessageId:int = -1;
        private var _reportedExtraDataId:String;
        private var _reportedRoomObjectId:int = -1;
        private var _reportType:int;
        private var _incomingTopic:int;
        private var _topicIndex:int;
        private var _message:String;

        public function CallForHelpManager(k:HabboHelp)
        {
            this._habboHelp = k;
            this._chatReportController = new ChatReportController(this._habboHelp, this.onChatReportEvent);
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new CallForHelpReplyMessageEvent(this.onCallForHelpReply));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new CallForHelpResultMessageEvent(this.onCallForHelpResult));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new IssueCloseNotificationMessageEvent(this.onIssueClose));
        }

        private static function getCloseReasonKey(k:int):String
        {
            if (k == 1)
            {
                return "useless";
            }
            if (k == 2)
            {
                return "abusive";
            }
            return "resolved";
        }


        public function dispose():void
        {
            if (!this._disposed)
            {
                this.closeWindow();
                if (this._chatReportController)
                {
                    this._chatReportController.dispose();
                    this._chatReportController = null;
                }
                this._habboHelp = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get reportedUserId():int
        {
            return this._reportedUserId;
        }

        public function get reportedUserName():String
        {
            return this._reportedUserName;
        }

        public function get _Str_3469():int
        {
            return this._reportedRoomId;
        }

        public function get _Str_16366():String
        {
            return this._reportedRoomName;
        }

        public function get _Str_11455():String
        {
            return this._reportedExtraDataId;
        }

        public function get _Str_10658():int
        {
            return this._reportedRoomObjectId;
        }

        public function get _Str_11420():int
        {
            return this._reportedGroupId;
        }

        public function get _Str_10392():int
        {
            return this._reportedThreadId;
        }

        public function get _Str_16155():int
        {
            return this._reportedMessageId;
        }

        public function set reportedUserId(k:int):void
        {
            this._reportedUserId = k;
        }

        public function set reportedUserName(k:String):void
        {
            this._reportedUserName = k;
        }

        public function set _Str_3469(k:int):void
        {
            this._reportedRoomId = k;
        }

        public function set _Str_16366(k:String):void
        {
            this._reportedRoomName = k;
        }

        public function set _Str_11455(k:String):void
        {
            this._reportedExtraDataId = k;
        }

        public function set _Str_10658(k:int):void
        {
            this._reportedRoomObjectId = k;
        }

        public function set _Str_11420(k:int):void
        {
            this._reportedGroupId = k;
        }

        public function set _Str_10392(k:int):void
        {
            this._reportedThreadId = k;
        }

        public function set _Str_16155(k:int):void
        {
            this._reportedMessageId = k;
        }

        public function reportBully(k:int, _arg_2:int):void
        {
            if (this._habboHelp._Str_16486)
            {
                this._reportedUserId = k;
                this._reportedRoomId = _arg_2;
                this._habboHelp.queryForGuideReportingStatus(_Str_2849._Str_8260);
            }
            else
            {
                this.reportUser(k, HabboHelp.REPORT_TYPE_EMERGENCY, 123);
            }
        }

        public function reportUser(k:int, _arg_2:int, _arg_3:int):void
        {
            this._reportedUserId = k;
            this._reportedRoomId = -1;
            this._incomingTopic = _arg_3;
            this._habboHelp.queryForPendingCallsForHelp(_arg_2);
        }

        public function reportRoom(k:int, _arg_2:String, _arg_3:String):void
        {
            this._reportedRoomId = k;
            this._reportedRoomName = _arg_2;
            this._reportedRoomDescription = _arg_3;
            this._reportedUserId = -1;
            this._habboHelp.queryForPendingCallsForHelp(HabboHelp.REPORT_TYPE_ROOM);
        }

        public function reportThread(k:int, _arg_2:int):void
        {
            this._reportedGroupId = k;
            this._reportedThreadId = _arg_2;
            this._habboHelp.queryForPendingCallsForHelp(HabboHelp.REPORT_TYPE_THREAD);
        }

        public function reportMessage(k:int, _arg_2:int, _arg_3:int):void
        {
            this._reportedGroupId = k;
            this._reportedThreadId = _arg_2;
            this._reportedMessageId = _arg_3;
            this._habboHelp.queryForPendingCallsForHelp(HabboHelp.REPORT_TYPE_MESSAGE);
        }

        public function reportSelfie(k:String, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            this._habboHelp.sendMessage(new CallForHelpFromSelfieMessageComposer(k, _arg_3, _arg_4, _arg_2, _arg_5));
        }

        public function reportPhoto(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            this._habboHelp.setReportMessage(new CallForHelpFromPhotoMessageComposer(k, _arg_3, _arg_4, _arg_2, _arg_5));
            this._habboHelp.queryForPendingCallsForHelp(HabboHelp.REPORT_TYPE_PHOTO);
        }

        public function openEmergencyHelpRequest():void
        {
            this.reportUser(0, HabboHelp.REPORT_TYPE_EMERGENCY, -1);
        }

        private function showAbusiveNotice():void
        {
            this.closeWindow();
            this._window = (this._habboHelp.getXmlWindow("abusive_notice") as IWindowContainer);
            this._window.center();
            this._window.findChildByName("header_button_close").visible = false;
            this._window.procedure = this.onAbusiveNoticeEvent;
        }

        public function showEmergencyHelpRequest(k:int):void
        {
            var _local_5:ISelectableWindow;
            var _local_6:ISelectableWindow;
            this.closeWindow();
            this._reportType = k;
            if (this._reportType == HabboHelp.REPORT_TYPE_BULLY)
            {
                this._window = (this._habboHelp.getXmlWindow("bully_report") as IWindowContainer);
                this._window.procedure = this.onBullyReportEvent;
            }
            else
            {
                this._window = (this._habboHelp.getXmlWindow("emergency_help_request") as IWindowContainer);
                this._window.procedure = this.onEmergencyHelpRequestEvent;
                IIlluminaInputWidget(IWidgetWindow(this._window.findChildByName("help_message")).widget).maxChars = FIELD_MAX_CHARS;
            }
            this._window.center();
            var _local_2:IItemListWindow = (this._window.findChildByName("user_panel") as IItemListWindow);
            var _local_3:IItemListWindow = (this._window.findChildByName("room_panel") as IItemListWindow);
            var _local_4:ISelectorWindow = ISelectorWindow(this._window.findChildByName("topic_selector"));
            if (_local_4 != null)
            {
                _local_5 = _local_4.getSelectableByName(("" + this._incomingTopic));
                if (_local_5 != null)
                {
                    _local_4.setSelected(_local_5);
                }
                _local_6 = _local_4.getSelectableByName("123");
                if (((!(_local_6 == null)) && (this._habboHelp._Str_16486)))
                {
                    _local_6.visible = false;
                }
            }
            switch (this._reportType)
            {
                case HabboHelp.REPORT_TYPE_ROOM:
                    this.showPanels(false, true);
                    return;
                case HabboHelp.REPORT_TYPE_EMERGENCY:
                    this.showPanels(true, false);
                    return;
                case HabboHelp.REPORT_TYPE_IM:
                    this.showPanels(false, false);
                    return;
                case HabboHelp.REPORT_TYPE_THREAD:
                case HabboHelp.REPORT_TYPE_MESSAGE:
                    this.showPanels(false, false);
                    return;
                case HabboHelp.REPORT_TYPE_BULLY:
                    this.populateUserList();
                    return;
            }
        }

        private function showChatReportTool():void
        {
            this.closeWindow();
            this._chatReportController.show(this._habboHelp._Str_6240, this._reportedUserId, this._reportType);
        }

        private function showPanels(k:Boolean, _arg_2:Boolean):void
        {
            var _local_3:IItemListWindow = (this._window.findChildByName("user_panel") as IItemListWindow);
            var _local_4:IItemListWindow = (this._window.findChildByName("room_panel") as IItemListWindow);
            var _local_5:Boolean = ((k) || (_arg_2));
            this._window.findChildByName("submit_box_wide").visible = _local_5;
            this._window.findChildByName("submit_box_narrow").visible = (!(_local_5));
            this._window.findChildByName("separator").visible = _local_5;
            _local_4.visible = _arg_2;
            _local_3.visible = k;
            if (_arg_2)
            {
                _local_4.getListItemByName("room_name").caption = ((this._reportedRoomName != null) ? this._reportedRoomName : "");
                _local_4.getListItemByName("room_description").caption = ((this._reportedRoomDescription != null) ? this._reportedRoomDescription : "");
            }
            if (k)
            {
                this.populateUserList();
            }
            if (!_local_5)
            {
                this._window.width = 301;
            }
        }

        private function populateUserList():void
        {
            var _local_4:UserRegistryItem;
            var _local_5:IWindowContainer;
            var _local_6:Boolean;
            var k:IItemListWindow = (this._window.findChildByName("user_list") as IItemListWindow);
            var _local_2:IWindowContainer = (k.getListItemAt(0) as IWindowContainer);
            k.removeListItems();
            var _local_3:int;
            for each (_local_4 in this._habboHelp.userRegistry._Str_20328())
            {
                _local_5 = (_local_2.clone() as IWindowContainer);
                _local_6 = (_local_4.userId == this._reportedUserId);
                _local_5.name = _local_4.userId.toString();
                _local_5.blend = ((_local_6) ? 1 : 0);
                _local_5.procedure = this.onUserSelectEvent;
                _local_5.findChildByName("user_name").caption = _local_4.userName;
                _local_5.findChildByName("room_name").id = _local_4.roomId;
                if (_local_6)
                {
                    this._reportedRoomId = _local_4.roomId;
                }
                _local_5.findChildByName("room_name").caption = ((_local_4.roomName != "") ? this._habboHelp.localization.getLocalizationWithParams("help.emergency.main.step.two.room.name", "", "room_name", _local_4.roomName) : "");
                IAvatarImageWidget(IWidgetWindow(_local_5.findChildByName("user_avatar")).widget).figure = _local_4.figure;
                k.addListItemAt(_local_5, _local_3);
                if (_local_6)
                {
                    _local_3 = 1;
                }
            }
        }

        private function refreshUserList():void
        {
            var _local_3:IWindowContainer;
            var k:IItemListWindow = (this._window.findChildByName("user_list") as IItemListWindow);
            var _local_2:int;
            while (_local_2 < k.numListItems)
            {
                _local_3 = IWindowContainer(k.getListItemAt(_local_2));
                _local_3.blend = ((int(_local_3.name) == this._reportedUserId) ? 1 : 0);
                _local_2++;
            }
        }

        public function showPendingRequest(k:String):void
        {
            this.closeWindow();
            this._window = (this._habboHelp.getXmlWindow("pending_request") as IWindowContainer);
            this._window.findChildByName("request_message").caption = k;
            this._window.center();
            this._window.procedure = this.onPendingReuqestEvent;
        }

        private function closeWindow():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function onAbusiveNoticeEvent(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "close_button":
                        this.closeWindow();
                        return;
                }
            }
        }

        private function onEmergencyHelpRequestEvent(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "submit_button":
                        if (!this.saveEmergencyHelpRequestData())
                        {
                            return;
                        }
                        this.basicInfoDone();
                        return;
                    case "header_button_close":
                        this.closeWindow();
                        return;
                }
            }
        }

        private function onBullyReportEvent(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "submit_button":
                        if (this._reportedUserId > 0)
                        {
                            this._habboHelp.sendMessage(new IgnoreUserIdMessageComposer(this._reportedUserId));
                            this._habboHelp.sendMessage(new ChatReviewSessionCreateMessageComposer(this._reportedUserId, this._reportedRoomId));
                            this.closeWindow();
                        }
                        else
                        {
                            this._habboHelp.windowManager.alert("${generic.alert.title}", "${guide.bully.request.usermissing}", 0, null);
                        }
                        return;
                    case "header_button_close":
                        this.closeWindow();
                        return;
                }
            }
        }

        private function onChatReportEvent(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "submit_button":
                        if (this._chatReportController.collectSelectedEntries(this._reportType, -1).length == 0)
                        {
                            this._habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.chatmissing}", 0, null);
                            return;
                        }
                        this.submitCallForHelp();
                        this._chatReportController.closeWindow();
                        this.closeWindow();
                        return;
                    case "header_button_close":
                        this._chatReportController.closeWindow();
                        return;
                }
            }
        }

        private function onUserSelectEvent(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this.selectUserToReport((_arg_2 as IWindowContainer));
            }
        }

        private function selectUserToReport(k:IWindowContainer):void
        {
            if ((((this._window == null) || (!(this._window.name == EMERGENCY_HELP_REQUEST))) || (k == null)))
            {
                return;
            }
            var _local_2:int = int(k.name);
            if (this._reportedUserId == _local_2)
            {
                this._reportedUserId = 0;
                this._reportedRoomId = -1;
            }
            else
            {
                this._reportedUserId = _local_2;
                this._reportedRoomId = k.findChildByName("room_name").id;
            }
            this.refreshUserList();
        }

        private function basicInfoDone():void
        {
            var k:Boolean = this.isChatSelectionRequired();
            if (this._reportType == HabboHelp.REPORT_TYPE_IM)
            {
                if (!this._habboHelp.instantMessageRegistry._Str_23839(this._reportedUserId))
                {
                    this._habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.nochathistory}", 0, null);
                }
            }
            else
            {
                if ((((k) && (!(this._habboHelp.chatRegistry._Str_20222(this._habboHelp._Str_6240)))) && (this._habboHelp.chatRegistry._Str_20222(this._reportedUserId))))
                {
                    this._habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.nochathistory}", 0, null);
                    return;
                }
            }
            if (k)
            {
                this.showChatReportTool();
            }
            else
            {
                this.submitCallForHelp();
            }
        }

        private function isChatSelectionRequired():Boolean
        {
            if ((((this._reportType == HabboHelp.REPORT_TYPE_THREAD) || (this._reportType == HabboHelp.REPORT_TYPE_MESSAGE)) || (this._reportType == HabboHelp.REPORT_TYPE_ROOM)))
            {
                return false;
            }
            return ((this._reportedUserId <= 0) || (this._habboHelp.chatRegistry.getItemsByUser(this._reportedUserId).length > 0)) || (this._reportType == HabboHelp.REPORT_TYPE_IM);
        }

        private function saveEmergencyHelpRequestData(k:Boolean=true):Boolean
        {
            if (((this._window == null) || (!(this._window.name == EMERGENCY_HELP_REQUEST))))
            {
                return false;
            }
            this._message = IIlluminaInputWidget(IWidgetWindow(this._window.findChildByName("help_message")).widget).message;
            if (((this._message == null) || (this._message == "")))
            {
                this._habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.nomsg}", 0, null);
                return false;
            }
            if (this._message.length < this._habboHelp.getInteger("help.cfh.length.minimum", 15))
            {
                this._habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.msgtooshort}", 0, null);
                return false;
            }
            this._topicIndex = 0;
            var _local_2:ISelectableWindow = ISelectorWindow(this._window.findChildByName("topic_selector")).getSelected();
            if (_local_2 != null)
            {
                this._topicIndex = int(_local_2.name);
            }
            if (this._topicIndex == 0)
            {
                this._habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.notopic}", 0, null);
                return false;
            }
            if (((this._reportType == HabboHelp.REPORT_TYPE_MESSAGE) || (this._reportType == HabboHelp.REPORT_TYPE_THREAD)))
            {
                return true;
            }
            if ((((this._reportedUserId <= 0) && ((!(this._reportType == HabboHelp.REPORT_TYPE_MESSAGE)) && (this._reportType == HabboHelp.REPORT_TYPE_THREAD))) || ((this._reportType == HabboHelp.REPORT_TYPE_ROOM) && (!(this._habboHelp.getBoolean("room.report.enabled"))))))
            {
                this._habboHelp.windowManager.alert("${generic.alert.title}", "${guide.bully.request.usermissing}", 0, null);
                return false;
            }
            if (this._habboHelp.friendList.getFriend(this._reportedUserId) != null)
            {
                this._habboHelp.windowManager.confirm("${help.cfh.unfriend.confirm.title}", "${help.cfh.unfriend.confirm.message}", (HabboAlertDialogFlag.BUTTON_OK | HabboAlertDialogFlag.BUTTON_CANCEL), this.onFriendReportConfirmation);
                return false;
            }
            return true;
        }

        private function submitCallForHelp():void
        {
            var k:int;
            this.closeWindow();
            switch (this._reportType)
            {
                case HabboHelp.REPORT_TYPE_EMERGENCY:
                case HabboHelp.REPORT_TYPE_ROOM:
                    k = ((this._chatReportController._Str_3469 <= 0) ? this._reportedRoomId : this._chatReportController._Str_3469);
                    this._habboHelp.sendMessage(new CallForHelpMessageComposer(this._message, this._topicIndex, this._reportedUserId, k, this._chatReportController.collectSelectedEntries(this._reportType, -1)));
                    break;
                case HabboHelp.REPORT_TYPE_IM:
                    this._habboHelp.sendMessage(new CallForHelpFromIMMessageComposer(this._message, this._topicIndex, this._reportedUserId, this._chatReportController.collectSelectedEntries(HabboHelp.REPORT_TYPE_IM, -1)));
                    break;
                case HabboHelp.REPORT_TYPE_THREAD:
                    this._habboHelp.sendMessage(new CallForHelpFromForumThreadMessageComposer(this._reportedGroupId, this._reportedThreadId, this._topicIndex, this._message));
                    break;
                case HabboHelp.REPORT_TYPE_MESSAGE:
                    this._habboHelp.sendMessage(new CallForHelpFromForumMessageMessageComposer(this._reportedGroupId, this._reportedThreadId, this._reportedMessageId, this._topicIndex, this._message));
                    break;
            }
            this._habboHelp.ignoreAndUnfriendReportedUser();
        }

        private function onFriendReportConfirmation(k:IAlertDialog, _arg_2:WindowEvent):void
        {
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
            {
                this.basicInfoDone();
            }
            k.dispose();
        }

        private function onPendingReuqestEvent(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "keep_button":
                    case "header_button_close":
                        this.closeWindow();
                        return;
                    case "discard_button":
                        this.deletePendingCallsForHelp();
                        this.closeWindow();
                        return;
                }
            }
        }

        private function onCallForHelpReply(k:IMessageEvent):void
        {
            var _local_2:CallForHelpReplyMessageParser = CallForHelpReplyMessageEvent(k).getParser();
            this._habboHelp.windowManager.alert("${help.cfh.reply.title}", _local_2.message, 0, null);
        }

        private function onCallForHelpResult(k:IMessageEvent):void
        {
            var _local_2:CallForHelpResultMessageParser = CallForHelpResultMessageEvent(k).getParser();
            var _local_3:int = _local_2.resultType;
            var _local_4:String = _local_2._Str_3460;
            switch (_local_3)
            {
                case CallForHelpResultEnum.TOO_MANY_PENDING_CALLS_CODE:
                    this._habboHelp.queryForPendingCallsForHelp(HabboHelp.REPORT_TYPE_EMERGENCY);
                    return;
                case CallForHelpResultEnum.HAS_ABUSIVE_CALL_CODE:
                    this.showAbusiveNotice();
                    return;
                default:
                    if (_local_4 == "")
                    {
                        _local_4 = "${help.cfh.sent.text}";
                    }
                    this._habboHelp.windowManager.alert("${help.cfh.sent.title}", _local_4, 0, null);
            }
        }

        private function onIssueClose(k:IssueCloseNotificationMessageEvent):void
        {
            var _local_2:IssueCloseNotificationMessageParser = k.getParser();
            var _local_3:String = _local_2._Str_3460;
            if (_local_3 == "")
            {
                _local_3 = (("${help.cfh.closed." + getCloseReasonKey(_local_2._Str_25784)) + "}");
            }
            this._habboHelp.windowManager.alert("${mod.alert.title}", _local_3, 0, null);
        }

        private function deletePendingCallsForHelp():void
        {
            this._habboHelp.sendMessage(new DeletePendingCallsForHelpMessageComposer());
        }

        public function get chatReportController():ChatReportController
        {
            return this._chatReportController;
        }
    }
}
