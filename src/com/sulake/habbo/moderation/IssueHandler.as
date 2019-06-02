package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_2484;
    import com.sulake.core.window.components.IFrameWindow;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.callforhelp.CallForHelpCategoryData;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import flash.utils.getTimer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_7268;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_11384;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.communication.messages.incoming.callforhelp._Str_3509;

    public class IssueHandler implements ITrackedWindow, IIssueHandler, IUpdateReceiver 
    {
        private static const _Str_18250:int = 27;
        private static const _Str_13006:int = 28;
        private static const _Str_12881:int = 1;
        private static const _Str_18676:int = 3;

        private var _moderationManager:ModerationManager;
        private var _issueBundle:IssueBundle;
        private var _selectedIssue:_Str_2484;
        private var _window:IFrameWindow;
        private var _cfhCategories:Vector.<CallForHelpCategoryData>;
        private var _topicIdByDropdownIdx:Array;
        private var _topicDropdown:IDropMenuWindow;
        private var _callerUserInfo:UserInfoCtrl;
        private var _reportedUserInfo:UserInfoCtrl;
        private var _disposed:Boolean;
        private var _sexualTalkTopicItemIndex:int;
        private var _chatLogCtrl:ChatlogCtrl;
        private var _chatFrame:IWindowContainer;
        private var _chatList:IItemListWindow;
        private var _actionCount:int = 0;
        private var _lastWindowX:int;
        private var _lastWindowY:int;
        private var _lastWindowWidth:int;
        private var _lastWindowHeight:int;
        private var _lastWindowPreferencesMessageSentAt:uint;
        private var _issueItemPrototype:IWindowContainer;
        private var _messageItemPrototype:ITextFieldWindow;

        public function IssueHandler(k:ModerationManager, _arg_2:IssueBundle, _arg_3:Vector.<CallForHelpCategoryData>, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:int)
        {
            this._lastWindowPreferencesMessageSentAt = getTimer();
            super();
            this._moderationManager = k;
            this._issueBundle = _arg_2;
            this._cfhCategories = _arg_3;
            this._lastWindowX = _arg_4;
            this._lastWindowY = _arg_5;
            this._lastWindowWidth = _arg_6;
            this._lastWindowHeight = _arg_7;
        }

        public function getType():int
        {
            return WindowTracker._Str_18611;
        }

        public function getId():String
        {
            return "" + this._issueBundle.id;
        }

        public function _Str_2259():IFrameWindow
        {
            return this._window;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._callerUserInfo != null)
            {
                this._callerUserInfo.dispose();
                this._callerUserInfo = null;
            }
            if (this._reportedUserInfo != null)
            {
                this._reportedUserInfo.dispose();
                this._reportedUserInfo = null;
            }
            if (this._chatLogCtrl != null)
            {
                this._chatLogCtrl.dispose();
                this._chatLogCtrl = null;
            }
            if (this._issueItemPrototype)
            {
                this._issueItemPrototype.dispose();
                this._issueItemPrototype = null;
            }
            if (this._messageItemPrototype)
            {
                this._messageItemPrototype.dispose();
                this._messageItemPrototype = null;
            }
            this._moderationManager.removeUpdateReceiver(this);
            this._moderationManager = null;
            this._issueBundle = null;
        }

        public function show():void
        {
            var _local_6:IItemListWindow;
            var _local_7:IWindow;
            if (this._window != null)
            {
                return;
            }
            if (((this._moderationManager.windowManager == null) || (this._moderationManager.assets == null)))
            {
                return;
            }
            this._window = (this._moderationManager.getXmlWindow("issue_handler") as IFrameWindow);
            if (this._window == null)
            {
                return;
            }
            var k:IItemListWindow = (this._window.findChildByName("issues_item_list") as IItemListWindow);
            this._issueItemPrototype = (k.getListItemAt(0) as IWindowContainer);
            k.removeListItems();
            var _local_2:IItemListWindow = (this._window.findChildByName("msg_item_list") as IItemListWindow);
            this._messageItemPrototype = (_local_2.getListItemAt(0) as ITextFieldWindow);
            _local_2.removeListItems();
            var _local_3:IWindow = this._window.findChildByTag("close");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            }
            _local_3 = this._window.findChildByName("issue_cont");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowEvent.WINDOW_EVENT_RELOCATED, this._Str_20739);
                _local_3.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_20739);
                this._moderationManager.registerUpdateReceiver(this, 1000);
            }
            this._lastWindowPreferencesMessageSentAt = getTimer();
            this._Str_3931("close_useless", this._Str_23692);
            this._Str_3931("close_sanction", this._Str_23381);
            this._Str_3931("close_resolved", this._Str_23537);
            this._Str_3931("release", this._Str_15257);
            _local_3 = this._window.findChildByName("move_to_player_support");
            if (_local_3 != null)
            {
                _local_3.disable();
            }
            this._moderationManager.issueManager._Str_16247(this._issueBundle.id, -1);
            this._Str_17163();
            this._selectedIssue = this._issueBundle._Str_5216();
            this._callerUserInfo = new UserInfoCtrl(this._window, this._moderationManager, this._selectedIssue, this);
            this._reportedUserInfo = new UserInfoCtrl(this._window, this._moderationManager, this._selectedIssue, this);
            this._callerUserInfo.load(IWindowContainer(this._window.findChildByName("caller_user_info")), this._selectedIssue._Str_19929);
            if (((this._selectedIssue._Str_2712 == _Str_18676) && (this._selectedIssue._Str_7437 == _Str_13006)))
            {
                this._topicDropdown.selection = this._sexualTalkTopicItemIndex;
                this._moderationManager.issueManager._Str_16247(this._issueBundle.id, _Str_12881);
            }
            var _local_4:IWindowContainer = IWindowContainer(this._window.findChildByName("reported_user_info"));
            if (this._issueBundle._Str_2662 > 0)
            {
                this._reportedUserInfo.load(_local_4, this._issueBundle._Str_2662);
            }
            else
            {
                _local_6 = IItemListWindow(this._window.findChildByName("issue_cont"));
                _local_7 = this._window.findChildByName("reported_user_info_caption");
                _local_6.removeListItem(_local_7);
                _local_6.removeListItem(_local_4);
            }
            var _local_5:ICheckBoxWindow = (this._window.findChildByName("handle_next_checkbox") as ICheckBoxWindow);
            if (_local_5 != null)
            {
                _local_5.select();
            }
            this._chatFrame = IWindowContainer(this._window.findChildByName("chat_cont"));
            this._chatList = IItemListWindow(this._chatFrame.findChildByName("evidence_list"));
            this._chatLogCtrl = new ChatlogCtrl(new _Str_7268(this._selectedIssue._Str_2869), this._moderationManager, WindowTracker._Str_15411, this._selectedIssue._Str_2869, this._selectedIssue, this._chatFrame, this._chatList, true);
            this._chatLogCtrl.show();
            Logger.log(("HARASSER: " + this._issueBundle._Str_2662));
            this._Str_21213();
            this._Str_21255();
        }

        private function _Str_10331():void
        {
            this._lastWindowX = this._window.x;
            this._lastWindowY = this._window.y;
            this._lastWindowWidth = this._window.width;
            this._lastWindowHeight = this._window.height;
            this._moderationManager.issueManager._Str_21909(this._lastWindowX, this._lastWindowY, this._lastWindowWidth, this._lastWindowHeight);
            this._moderationManager.connection.send(new _Str_11384(this._lastWindowX, this._lastWindowY, this._lastWindowWidth, this._lastWindowHeight));
        }

        private function _Str_25789():Boolean
        {
            if (this._lastWindowX != this._window.x)
            {
                return true;
            }
            if (this._lastWindowY != this._window.y)
            {
                return true;
            }
            if (this._lastWindowWidth != this._window.width)
            {
                return true;
            }
            if (this._lastWindowHeight != this._window.height)
            {
                return true;
            }
            return false;
        }

        public function update(k:uint):void
        {
            var _local_2:uint = getTimer();
            if (((this._Str_25789()) && ((_local_2 - this._lastWindowPreferencesMessageSentAt) > 5000)))
            {
                this._Str_10331();
            }
        }

        private function _Str_20739(k:WindowEvent):void
        {
            var _local_2:IItemListWindow = (k.window as IItemListWindow);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IItemListWindow = (_local_2.getListItemByName("issues_item_list") as IItemListWindow);
            var _local_4:IItemListWindow = (_local_2.getListItemByName("msg_item_list") as IItemListWindow);
            if (((_local_3 == null) || (_local_4 == null)))
            {
                return;
            }
            var _local_5:int = ((((_local_2.height - _local_2.visibleRegion.height) + _local_3.height) + _local_4.height) * 0.5);
            _local_2.autoArrangeItems = false;
            _local_3.height = _local_5;
            _local_4.height = _local_5;
            _local_2.autoArrangeItems = true;
        }

        private function _Str_21213():void
        {
            var _local_4:IWindowContainer;
            var _local_9:_Str_2484;
            var _local_11:IWindowContainer;
            var _local_12:IWindow;
            var _local_13:String;
            if (this._window == null)
            {
                return;
            }
            var k:IItemListWindow = (this._window.findChildByName("issues_item_list") as IItemListWindow);
            if (k == null)
            {
                return;
            }
            var _local_2:Array = this._issueBundle.issues;
            var _local_3:int;
            var _local_5:int = k.numListItems;
            var _local_6:int = _local_2.length;
            if (_local_5 < _local_6)
            {
                _local_4 = (this._issueItemPrototype.clone() as IWindowContainer);
                k.addListItem(_local_4);
                _local_3 = 1;
                while (_local_3 < (_local_6 - _local_5))
                {
                    _local_11 = (_local_4.clone() as IWindowContainer);
                    if (_local_11 == null)
                    {
                        return;
                    }
                    k.addListItem(_local_11);
                    _local_3++;
                }
            }
            else
            {
                if (_local_5 > _local_6)
                {
                    _local_3 = 0;
                    while (_local_3 < (_local_5 - _local_6))
                    {
                        _local_12 = k.removeListItemAt(0);
                        _local_12.dispose();
                        _local_3++;
                    }
                }
            }
            var _local_7:_Str_2484 = this._issueBundle._Str_5216();
            var _local_8:int = ((_local_7 == null) ? 0 : _local_7._Str_2869);
            var _local_10:int = getTimer();
            _local_3 = 0;
            for each (_local_9 in _local_2)
            {
                _local_4 = (k.getListItemAt(_local_3) as IWindowContainer);
                if (_local_4 == null)
                {
                    return;
                }
                _local_4.background = ((_local_3++ % 2) == 0);
                _local_4.id = _local_9._Str_2869;
                _local_4.removeEventListener(WindowMouseEvent.CLICK, this._Str_20796);
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_20796);
                this._Str_4180(_local_4.findChildByName("reporter"), _local_9._Str_19615);
                this._Str_4180(_local_4.findChildByName("type"), IssueCategoryNames._Str_21676(_local_9._Str_2712));
                this._Str_4180(_local_4.findChildByName("category"), IssueCategoryNames._Str_21569(_local_9._Str_7437));
                this._Str_4180(_local_4.findChildByName("time_open"), _local_9._Str_15885(_local_10));
                _local_13 = (((_local_9._Str_2869 == _local_8) && (_local_6 > 1)) ? "Volter Bold" : "Volter");
                (_local_4.findChildByName("category") as ITextWindow).fontFace = _local_13;
            }
        }

        private function _Str_21255():void
        {
            var _local_4:ITextFieldWindow;
            var _local_7:_Str_2484;
            var _local_8:ITextWindow;
            var _local_9:IWindow;
            if (this._window == null)
            {
                return;
            }
            var k:IItemListWindow = (this._window.findChildByName("msg_item_list") as IItemListWindow);
            if (k == null)
            {
                return;
            }
            var _local_2:Array = this._issueBundle.issues;
            var _local_3:int;
            var _local_5:int = k.numListItems;
            var _local_6:int = _local_2.length;
            if (_local_5 < _local_6)
            {
                _local_4 = (this._messageItemPrototype.clone() as ITextFieldWindow);
                _local_4.selectable = true;
                _local_4.editable = false;
                k.addListItem(_local_4);
                _local_3 = 1;
                while (_local_3 < (_local_6 - _local_5))
                {
                    _local_8 = (_local_4.clone() as ITextWindow);
                    if (_local_8 == null)
                    {
                        return;
                    }
                    k.addListItem(_local_8);
                    _local_3++;
                }
            }
            else
            {
                if (_local_5 > _local_6)
                {
                    _local_3 = 0;
                    while (_local_3 < (_local_5 - _local_6))
                    {
                        _local_9 = k.removeListItemAt(0);
                        _local_9.dispose();
                        _local_3++;
                    }
                }
            }
            _local_3 = 0;
            for each (_local_7 in _local_2)
            {
                _local_4 = (k.getListItemAt(_local_3) as ITextFieldWindow);
                if (_local_4 == null)
                {
                    return;
                }
                _local_4.width = k.width;
                _local_4.background = ((_local_3++ % 2) == 0);
                _local_4.caption = ((_local_7._Str_19615 + ": ") + _local_7.message);
                _local_4.height = (_local_4.textHeight + 10);
            }
        }

        private function _Str_4180(k:IWindow, _arg_2:String):void
        {
            if (k != null)
            {
                k.caption = _arg_2;
            }
        }

        private function _Str_17163():void
        {
            var _local_5:CallForHelpCategoryData;
            var _local_6:_Str_3509;
            this._topicDropdown = (this._window.findChildByName("cfh_topics") as IDropMenuWindow);
            var k:int = -1;
            var _local_2:int = this._issueBundle._Str_5216()._Str_7437;
            if (_local_2 == _Str_18250)
            {
                this._topicDropdown.disable();
                return;
            }
            this._topicIdByDropdownIdx = [];
            var _local_3:Array = [];
            var _local_4:int;
            for each (_local_5 in this._cfhCategories)
            {
                for each (_local_6 in _local_5._Str_14841)
                {
                    _local_3[_local_4] = (("${help.cfh.topic." + _local_6.id) + "}");
                    this._topicIdByDropdownIdx[_local_4] = _local_6.id;
                    if (_local_6.id == _Str_12881)
                    {
                        this._sexualTalkTopicItemIndex = _local_4;
                    }
                    if (_local_6.id == _local_2)
                    {
                        k = _local_4;
                    }
                    _local_4++;
                }
            }
            this._topicDropdown.populate(_local_3);
            if (k >= 0)
            {
                this._topicDropdown.selection = k;
            }
            this._topicDropdown.addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_17950);
        }

        private function _Str_17950(k:WindowEvent):void
        {
            var _local_2:int = this._topicDropdown.selection;
            var _local_3:int = this._topicIdByDropdownIdx[_local_2];
            this._moderationManager.issueManager._Str_16247(this._issueBundle.id, _local_3);
        }

        private function _Str_3931(k:String, _arg_2:Function):void
        {
            this._window.findChildByName(k).addEventListener(WindowMouseEvent.CLICK, _arg_2);
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            if ((((!(this._moderationManager == null)) && (!(this._moderationManager.issueManager == null))) && (!(this._issueBundle == null))))
            {
                this._moderationManager.issueManager._Str_17098(this._issueBundle.id);
                this._Str_3066("closeWindow");
            }
            this.dispose();
        }

        private function _Str_23692(k:WindowMouseEvent):void
        {
            Logger.log("Close useless clicked");
            this._Str_3066("closeUseless");
            this._moderationManager.trackGoogle("actionCountUseless", this._actionCount);
            this._moderationManager.issueManager._Str_21923(this._issueBundle.id, IssueManager._Str_17442);
            this._Str_13345();
            this.dispose();
        }

        private function _Str_23537(k:WindowMouseEvent):void
        {
            Logger.log("Close resolved clicked");
            this._Str_3066("closeResolved");
            this._moderationManager.trackGoogle("actionCountResolved", this._actionCount);
            this._moderationManager.issueManager._Str_21923(this._issueBundle.id, IssueManager._Str_18516);
            this._Str_13345();
            this.dispose();
        }

        private function _Str_23381(k:WindowMouseEvent):void
        {
            Logger.log("Close with default sanction clicked");
            this._Str_3066("closeSanction");
            this._moderationManager.trackGoogle("actionCountSanction", this._actionCount);
            var _local_2:int = -1;
            var _local_3:int = this._topicDropdown.selection;
            if (_local_3 >= 0)
            {
                _local_2 = this._topicIdByDropdownIdx[_local_3];
            }
            if (((_local_2 <= 0) && (this._issueBundle._Str_5216()._Str_7437 == _Str_13006)))
            {
                this._moderationManager.windowManager.alert("Topic missing", "You need to select the topic first.", 0, null);
            }
            else
            {
                this._moderationManager.issueManager._Str_23846(this._issueBundle.id, _local_2);
                this._Str_13345();
                this.dispose();
            }
        }

        private function _Str_15257(k:WindowMouseEvent):void
        {
            Logger.log("Release clicked");
            this._Str_3066("release");
            this._moderationManager.issueManager._Str_17732(this._issueBundle.id);
            this._Str_13345();
            this.dispose();
        }

        private function _Str_20796(k:WindowMouseEvent):void
        {
            var _local_2:_Str_2484;
            var _local_3:int;
            for each (_local_2 in this._issueBundle.issues)
            {
                if (_local_2._Str_2869 == k.window.id)
                {
                    this._selectedIssue = _local_2;
                    _local_3 = _local_2._Str_19929;
                    if (_local_3 != 0)
                    {
                        if (this._callerUserInfo != null)
                        {
                            this._callerUserInfo.dispose();
                        }
                        this._callerUserInfo = new UserInfoCtrl(this._window, this._moderationManager, _local_2, this);
                        this._callerUserInfo.load(IWindowContainer(this._window.findChildByName("caller_user_info")), _local_3);
                        this._moderationManager.connection.send(new _Str_7268(_local_2._Str_2869));
                        this._chatLogCtrl._Str_25842(_local_2._Str_2869);
                        this._moderationManager.moderationMessageHandler._Str_20295(this._chatLogCtrl);
                    }
                    break;
                }
            }
        }

        public function _Str_21978():void
        {
            this._Str_21213();
            this._Str_21255();
        }

        public function _Str_13994(k:int, _arg_2:String):void
        {
            if (((((this._window == null) || (this._moderationManager == null)) || (this._moderationManager.issueManager == null)) || (this._issueBundle == null)))
            {
                return;
            }
            if (k != this._issueBundle._Str_2662)
            {
                return;
            }
            var _local_3:ITextWindow = (this._window.findChildByName("sanction_label") as ITextWindow);
            if (_local_3 != null)
            {
                _local_3.caption = _arg_2;
            }
        }

        private function _Str_13345():void
        {
            if ((((this._window == null) || (this._moderationManager == null)) || (this._moderationManager.issueManager == null)))
            {
                return;
            }
            var k:ICheckBoxWindow = (this._window.findChildByName("handle_next_checkbox") as ICheckBoxWindow);
            if (((!(k == null)) && (k._Str_2365)))
            {
                this._moderationManager.issueManager._Str_15446("issue handler pick next");
            }
        }

        internal function get _Str_22269():UserInfoCtrl
        {
            return this._callerUserInfo;
        }

        internal function get _Str_25718():UserInfoCtrl
        {
            return this._reportedUserInfo;
        }

        internal function _Str_3066(k:String):void
        {
            if (((this._moderationManager == null) || (this._moderationManager.disposed)))
            {
                return;
            }
            this._actionCount++;
            this._moderationManager.trackGoogle(("issueHandler_" + k));
        }
    }
}
