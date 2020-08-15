package com.sulake.habbo.moderation
{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.communication.messages.incoming.moderation.IssueInfoMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.moderation.ModeratorInitMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.moderation.ModeratorToolPreferencesEvent;
    import com.sulake.habbo.communication.messages.incoming.moderation.IssuePickFailedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.moderation.IssueDeletedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.moderation.ModeratorUserInfoEvent;
    import com.sulake.habbo.communication.messages.incoming.moderation.ModeratorRoomInfoEvent;
    import com.sulake.habbo.communication.messages.incoming.moderation.CfhChatlogEvent;
    import com.sulake.habbo.communication.messages.incoming.moderation.UserChatlogEvent;
    import com.sulake.habbo.communication.messages.incoming.moderation.RoomChatlogEvent;
    import com.sulake.habbo.communication.messages.incoming.moderation.RoomVisitsEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.RoomEntryInfoMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.moderation.ModeratorActionResultMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.userclassification.UserClassificationMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.callforhelp.CfhSanctionMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.callforhelp.CfhTopicsInitEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.IssueInfoMessageParser;
    import com.sulake.habbo.communication.messages.parser.moderation.IssueMessageData;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorInitMessageParser;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorInitData;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorToolPreferencesMessageParser;
    import com.sulake.habbo.communication.messages.parser.moderation.IssuePickFailedMessageParser;
    import com.sulake.habbo.window.utils.IAlertDialog;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.IssueDeletedMessageParser;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorUserInfoMessageParser;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorRoomInfoMessageParser;
    import com.sulake.habbo.communication.messages.parser.moderation.CfhChatlogMessageParser;
    import flash.utils.Dictionary;
    import com.sulake.habbo.communication.messages.parser.moderation.RoomChatlogMessageParser;
    import com.sulake.habbo.communication.messages.parser.moderation.UserChatlogMessageParser;
    import com.sulake.habbo.communication.messages.parser.moderation.RoomVisitsMessageParser;
    import com.sulake.habbo.communication.messages.parser.userclassification.UserClassificationMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.userclassification.UserClassificationData;
    import com.sulake.habbo.communication.messages.parser.callforhelp.CfhSanctionMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.callforhelp.CallForHelpCategoryData;
    import com.sulake.habbo.communication.messages.parser.callforhelp.CfhTopicsInitMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorActionResultMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.moderator.GetModeratorUserInfoMessageComposer;
    import com.sulake.habbo.communication.messages.incoming.moderation.*;
    import com.sulake.habbo.communication.messages.parser.moderation.*;

    public class ModerationMessageHandler 
    {
        private var _moderationManager:ModerationManager;
        private var _userInfoListeners:Array;
        private var _roomVisitsListeners:Array;
        private var _userClassificationListener:Array;
        private var _chatlogListeners:Array;
        private var _roomInfoListeners:Array;
        private var _roomEnterListeners:Array;

        public function ModerationMessageHandler(k:ModerationManager)
        {
            this._userInfoListeners = new Array();
            this._roomVisitsListeners = new Array();
            this._userClassificationListener = new Array();
            this._chatlogListeners = new Array();
            this._roomInfoListeners = new Array();
            this._roomEnterListeners = new Array();
            super();
            this._moderationManager = k;
            var _local_2:IConnection = k.connection;
            _local_2.addMessageEvent(new IssueInfoMessageEvent(this.onIssueInfo));
            _local_2.addMessageEvent(new ModeratorInitMessageEvent(this.onModeratorInit));
            _local_2.addMessageEvent(new ModeratorToolPreferencesEvent(this.onModeratorToolPreferences));
            _local_2.addMessageEvent(new IssuePickFailedMessageEvent(this.onIssuePickFailed));
            _local_2.addMessageEvent(new IssueDeletedMessageEvent(this.onIssueDeleted));
            _local_2.addMessageEvent(new ModeratorUserInfoEvent(this.onUserInfo));
            _local_2.addMessageEvent(new ModeratorRoomInfoEvent(this.onRoomInfo));
            _local_2.addMessageEvent(new CfhChatlogEvent(this.onCfhChatlog));
            _local_2.addMessageEvent(new UserChatlogEvent(this.onUserChatlog));
            _local_2.addMessageEvent(new RoomChatlogEvent(this.onRoomChatlog));
            _local_2.addMessageEvent(new RoomVisitsEvent(this.onRoomVisits));
            _local_2.addMessageEvent(new RoomEntryInfoMessageEvent(this.onRoomEnter));
            _local_2.addMessageEvent(new CloseConnectionMessageEvent(this.onRoomExit));
            _local_2.addMessageEvent(new ModeratorActionResultMessageEvent(this.onModeratorActionResult));
            _local_2.addMessageEvent(new UserClassificationMessageEvent(this.onRoomUserClassification));
            _local_2.addMessageEvent(new CfhSanctionMessageEvent(this.onSanctions));
            _local_2.addMessageEvent(new CfhTopicsInitEvent(this.onCfhTopics));
        }

        private function onIssueInfo(k:IssueInfoMessageEvent):void
        {
            if (((k == null) || (this._moderationManager == null)))
            {
                return;
            }
            var _local_2:IssueInfoMessageParser = k.getParser();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IssueMessageData = _local_2._Str_22192;
            this._moderationManager.issueManager.playSound(_local_3);
            this._moderationManager.issueManager.addModActionView(_local_3);
        }

        private function onModeratorInit(k:ModeratorInitMessageEvent):void
        {
            var _local_6:IssueMessageData;
            if (((k == null) || (this._moderationManager == null)))
            {
                return;
            }
            var _local_2:ModeratorInitMessageParser = k.getParser();
            if (((_local_2 == null) || (_local_2.data == null)))
            {
                return;
            }
            var _local_3:ModeratorInitData = _local_2.data;
            var _local_4:Array = _local_3.issues;
            var _local_5:Array = _local_3._Str_15690;
            for each (_local_6 in _local_4)
            {
                this._moderationManager.issueManager.addModActionView(_local_6);
            }
            this._moderationManager.issueManager._Str_19194();
            this._moderationManager.initMsg = _local_3;
            this._moderationManager.startPanel.show();
        }

        private function onModeratorToolPreferences(k:ModeratorToolPreferencesEvent):void
        {
            var _local_2:ModeratorToolPreferencesMessageParser;
            if (((this._moderationManager) && (this._moderationManager.issueManager)))
            {
                _local_2 = k.getParser();
                this._moderationManager.issueManager.setToolPreferences(_local_2._Str_17736, _local_2._Str_18137, _local_2._Str_17903, _local_2._Str_4971);
            }
        }

        private function onIssuePickFailed(event:IssuePickFailedMessageEvent):void
        {
            var parser:IssuePickFailedMessageParser = event.getParser();
            if (parser == null)
            {
                return;
            }
            var alert:Boolean = true;
            var issues:Array = parser.issues;
            var retryEnabled:Boolean = parser.retryEnabled;
            var retryCount:int = parser.retryCount;
            var pickedAlready:Boolean = this._moderationManager.issueManager.issuePickFailed(issues);
            if (pickedAlready)
            {
                if (retryEnabled)
                {
                    if (retryCount < 10)
                    {
                        alert = false;
                        this._moderationManager.issueManager.autoPick("pick failed retry", retryEnabled, retryCount);
                    }
                }
            }
            if (alert)
            {
                this._moderationManager.windowManager.alert("Error", "Issue picking failed", 0, function (k:IAlertDialog, _arg_2:WindowEvent):void
                {
                    k.dispose();
                });
            }
        }

        private function onIssueDeleted(k:IssueDeletedMessageEvent):void
        {
            if (((k == null) || (this._moderationManager == null)))
            {
                return;
            }
            var _local_2:IssueDeletedMessageParser = k.getParser();
            if (_local_2 == null)
            {
                return;
            }
            this._moderationManager.issueManager.removeIssue(_local_2._Str_2869);
        }

        private function onUserInfo(k:ModeratorUserInfoEvent):void
        {
            var _local_3:IUserInfoListener;
            var _local_2:ModeratorUserInfoMessageParser = k.getParser();
            Logger.log(((("GOT USER INFO: " + _local_2.data.userId) + ", ") + _local_2.data._Str_16987));
            for each (_local_3 in this._userInfoListeners)
            {
                _local_3.onUserInfo(_local_2.data);
            }
        }

        private function onRoomInfo(k:ModeratorRoomInfoEvent):void
        {
            var _local_3:RoomToolCtrl;
            var _local_2:ModeratorRoomInfoMessageParser = k.getParser();
            for each (_local_3 in this._roomInfoListeners)
            {
                _local_3.onRoomInfo(_local_2.data);
            }
        }

        private function onCfhChatlog(k:CfhChatlogEvent):void
        {
            var _local_2:CfhChatlogMessageParser = k.getParser();
            var _local_3:Array = new Array();
            _local_3.push(_local_2.data._Str_17106);
            var _local_4:Dictionary = new Dictionary();
            _local_4[_local_2.data._Str_23592] = 0;
            _local_4[_local_2.data.reportedUserId] = 1;
            this.onChatlog(("Call For Help Evidence #" + _local_2.data._Str_20325), WindowTracker._Str_15411, _local_2.data.callId, _local_3, _local_4);
        }

        private function onRoomChatlog(k:RoomChatlogEvent):void
        {
            var _local_2:RoomChatlogMessageParser = k.getParser();
            var _local_3:Array = new Array();
            _local_3.push(_local_2.data);
            var _local_4:Dictionary = new Dictionary();
            this.onChatlog(("Room Chatlog: " + _local_2.data.roomName), WindowTracker._Str_10414, _local_2.data.roomId, _local_3, _local_4);
        }

        private function onUserChatlog(k:UserChatlogEvent):void
        {
            var _local_2:UserChatlogMessageParser = k.getParser();
            var _local_3:Dictionary = new Dictionary();
            _local_3[_local_2.data.userId] = 0;
            this.onChatlog(("User Chatlog: " + _local_2.data.userName), WindowTracker._Str_15435, _local_2.data.userId, _local_2.data.rooms, _local_3);
        }

        private function onChatlog(k:String, _arg_2:int, _arg_3:int, _arg_4:Array, _arg_5:Dictionary):void
        {
            var _local_7:IChatLogListener;
            var _local_6:Array = this._chatlogListeners.concat();
            for each (_local_7 in _local_6)
            {
                _local_7.onChatlog(k, _arg_2, _arg_3, _arg_4, _arg_5);
            }
        }

        private function onRoomVisits(k:RoomVisitsEvent):void
        {
            var _local_3:RoomVisitsCtrl;
            var _local_2:RoomVisitsMessageParser = k.getParser();
            var _local_4:Array = this._roomVisitsListeners.concat();
            for each (_local_3 in _local_4)
            {
                _local_3.onRoomVisits(_local_2.data);
            }
        }

        private function onRoomUserClassification(k:UserClassificationMessageEvent):void
        {
            var _local_3:UserClassificationCtrl;
            var _local_8:int;
            var _local_9:UserClassificationCtrl;
            var _local_10:Array;
            var _local_2:UserClassificationMessageParser = (k as UserClassificationMessageEvent).getParser();
            var _local_4:Map = _local_2.classifiedUsernameMap;
            var _local_5:Map = _local_2.classifiedUserTypeMap;
            var _local_6:int = 1;
            var _local_7:Array = new Array();
            for each (_local_8 in _local_4.getKeys())
            {
                _local_7.push(new UserClassificationData(_local_8, _local_4[_local_8], _local_5[_local_8]));
            }
            _local_9 = new UserClassificationCtrl(this._moderationManager, _local_6);
            _local_9.show();
            _local_10 = this._userClassificationListener.concat();
            for each (_local_3 in _local_10)
            {
                _local_3._Str_22627(_local_6, _local_7);
            }
        }

        private function onSanctions(k:CfhSanctionMessageEvent):void
        {
            var _local_2:CfhSanctionMessageParser = k.getParser();
            Logger.log(("Got sanction data..." + [_local_2._Str_2869, _local_2.accountId, _local_2._Str_21198]));
            this._moderationManager.issueManager.updateSanctionData(_local_2._Str_2869, _local_2.accountId, _local_2._Str_21198);
        }

        private function onCfhTopics(k:CfhTopicsInitEvent):void
        {
            var _local_3:Vector.<CallForHelpCategoryData>;
            var _local_2:CfhTopicsInitMessageParser = k.getParser();
            _local_3 = _local_2.callForHelpCategories;
            this._moderationManager.cfhTopics = _local_3;
        }

        private function onRoomEnter(k:RoomEntryInfoMessageEvent):void
        {
            var _local_3:RoomToolCtrl;
            var _local_2:RoomEntryInfoMessageParser = k.getParser();
            this._moderationManager.currentFlatId = _local_2.guestRoomId;
            this._moderationManager.startPanel._Str_25175(_local_2);
            for each (_local_3 in this._roomEnterListeners)
            {
                _local_3.onRoomChange();
            }
        }

        private function onRoomExit(k:CloseConnectionMessageEvent):void
        {
            var _local_2:RoomToolCtrl;
            this._moderationManager.currentFlatId = 0;
            this._moderationManager.startPanel._Str_25510();
            for each (_local_2 in this._roomEnterListeners)
            {
                _local_2.onRoomChange();
            }
        }

        private function onModeratorActionResult(k:ModeratorActionResultMessageEvent):void
        {
            var _local_2:ModeratorActionResultMessageParser = k.getParser();
            Logger.log(((("GOT MOD ACTION RESULT: " + _local_2.userId) + ", ") + _local_2.success));
            if (_local_2.success)
            {
                this._moderationManager.connection.send(new GetModeratorUserInfoMessageComposer(_local_2.userId));
            }
            else
            {
                this._moderationManager.windowManager.alert("Alert", ("Moderation action failed. " + "If you tried to ban a user, please check if the user is already banned."), 0, this.onAlertClose);
            }
        }

        public function addUserInfoListener(k:IUserInfoListener):void
        {
            this._userInfoListeners.push(k);
        }

        public function removeUserInfoListener(k:IUserInfoListener):void
        {
            var _local_3:IUserInfoListener;
            var _local_2:Array = new Array();
            for each (_local_3 in this._userInfoListeners)
            {
                if (_local_3 != k)
                {
                    _local_2.push(_local_3);
                }
            }
            this._userInfoListeners = _local_2;
        }

        public function addRoomInfoListener(k:RoomToolCtrl):void
        {
            this._roomInfoListeners.push(k);
        }

        public function removeRoomInfoListener(k:RoomToolCtrl):void
        {
            var _local_3:RoomToolCtrl;
            var _local_2:Array = new Array();
            for each (_local_3 in this._roomInfoListeners)
            {
                if (_local_3 != k)
                {
                    _local_2.push(_local_3);
                }
            }
            this._roomInfoListeners = _local_2;
        }

        public function addRoomEnterListener(k:RoomToolCtrl):void
        {
            this._roomEnterListeners.push(k);
        }

        public function removeRoomEnterListener(k:RoomToolCtrl):void
        {
            var _local_3:RoomToolCtrl;
            var _local_2:Array = new Array();
            for each (_local_3 in this._roomEnterListeners)
            {
                if (_local_3 != k)
                {
                    _local_2.push(_local_3);
                }
            }
            this._roomEnterListeners = _local_2;
        }

        public function addRoomVisitsListener(k:RoomVisitsCtrl):void
        {
            this._roomVisitsListeners.push(k);
        }

        public function removeRoomVisitsListener(k:RoomVisitsCtrl):void
        {
            var _local_3:RoomVisitsCtrl;
            var _local_2:Array = new Array();
            for each (_local_3 in this._roomVisitsListeners)
            {
                if (_local_3 != k)
                {
                    _local_2.push(_local_3);
                }
            }
            this._roomVisitsListeners = _local_2;
        }

        public function addChatlogListener(k:IChatLogListener):void
        {
            this._chatlogListeners.push(k);
        }

        public function removeChatlogListener(k:IChatLogListener):void
        {
            var _local_3:IChatLogListener;
            var _local_2:Array = new Array();
            for each (_local_3 in this._chatlogListeners)
            {
                if (_local_3 != k)
                {
                    _local_2.push(_local_3);
                }
            }
            this._chatlogListeners = _local_2;
        }

        public function addUserClassificationListener(k:UserClassificationCtrl):void
        {
            this._userClassificationListener.push(k);
        }

        public function removeUserClassificationListener(k:UserClassificationCtrl):void
        {
            var _local_3:UserClassificationCtrl;
            var _local_2:Array = new Array();
            for each (_local_3 in this._userClassificationListener)
            {
                if (_local_3 != k)
                {
                    _local_2.push(_local_3);
                }
            }
            this._userClassificationListener = _local_2;
        }

        private function onAlertClose(k:IAlertDialog, _arg_2:WindowEvent):void
        {
            k.dispose();
        }
    }
}
