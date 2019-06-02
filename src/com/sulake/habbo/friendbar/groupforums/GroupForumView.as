package com.sulake.habbo.friendbar.groupforums
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.IScrollableListWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IContainerButtonWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_3372;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.habbo.window.enum._Str_4387;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_2807;
    import flash.events.MouseEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.communication.messages.parser.groupforums.GuildForumThread;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_2814;
    import com.sulake.habbo.utils.FriendlyTime;

    public class GroupForumView 
    {
        private static const _Str_17065:int = 100;

        private var _controller:GroupForumController;
        private var _forumsListView:ForumsListView;
        private var _threadListView:ThreadListView;
        private var _messageListView:MessageListView;
        private var _window:IFrameWindow;
        private var _listWindow:IScrollableListWindow;
        private var _showPrev:IWindow;
        private var _showNext:IWindow;
        private var _showFirst:IWindow;
        private var _showLast:IWindow;
        private var _txtElement:IWindow;
        private var _backButton:IContainerButtonWindow;
        private var _postButton:IContainerButtonWindow;
        private var _closeBtn:IWindow;
        private var _listHeader:IWindow;
        private var _myForumsLink:ITextWindow;
        private var _forumsListData:ForumsListData;
        private var _forumData:_Str_3372;
        private var _threadsListData:ThreadsListData;
        private var _messagesListData:MessagesListData;
        private var _currentPage:int = 1;
        private var _numOfPages:int = 1;
        private var _pageSize:int;

        public function GroupForumView(k:GroupForumController)
        {
            this._controller = k;
            this._pageSize = ThreadsListData._Str_3331;
        }

        private static function enable(k:IWindow, _arg_2:Boolean):void
        {
            if (_arg_2)
            {
                k.enable();
            }
            else
            {
                k.disable();
            }
        }

        internal static function _Str_14926(k:IFrameWindow, _arg_2:_Str_2807):IRegionWindow
        {
            var _local_3:IWindowContainer = (k.findChildByName("top_part") as IWindowContainer);
            var _local_4:IWidgetWindow = IWidgetWindow(_local_3.findChildByName("group_icon"));
            _local_4.visible = true;
            var _local_5:_Str_2402 = (_local_4.widget as _Str_2402);
            _local_5.badgeId = _arg_2.icon;
            _local_5.groupId = _arg_2.groupId;
            _local_5.type = _Str_4387.GROUP;
            var _local_6:IStaticBitmapWrapperWindow = (_local_3.findChildByName("header_icon") as IStaticBitmapWrapperWindow);
            if (_local_6 != null)
            {
                _local_6.visible = false;
            }
            var _local_7:ITextWindow = (_local_3.findChildByName("top_header_text") as ITextWindow);
            _local_7.text = _arg_2.name;
            var _local_8:ITextWindow = (_local_3.findChildByName("top_text") as ITextWindow);
            _local_8.text = _arg_2.description;
            return _local_3.findChildByName("top_click_area") as IRegionWindow;
        }


        public function dispose():void
        {
            if (this._controller)
            {
                this._controller._Str_24639();
            }
            if (this._window != null)
            {
                this._window.removeEventListener(MouseEvent.CLICK, this._Str_6266);
                this._window.dispose();
                this._window = null;
                this._controller = null;
            }
        }

        private function _Str_18407():void
        {
            var k:IWindow = this._window.findChildByName("settings_button");
            if (((!(this._forumData == null)) && (this._forumData._Str_25616)))
            {
                k.removeEventListener(WindowMouseEvent.CLICK, this._Str_19665);
                k.addEventListener(WindowMouseEvent.CLICK, this._Str_19665);
                k.visible = true;
            }
            else
            {
                k.visible = false;
            }
            var _local_2:ILabelWindow = (this._backButton.findChildByName("back_button_label") as ILabelWindow);
            if (this._threadListView != null)
            {
                this._backButton.visible = true;
                _local_2.text = this._controller.localizationManager.getLocalization("groupforum.view.mark_read");
            }
            else
            {
                if (this._messageListView != null)
                {
                    this._backButton.visible = true;
                    _local_2.text = this._controller.localizationManager.getLocalization("groupforum.view.back");
                }
                else
                {
                    if (this._forumsListView != null)
                    {
                        this._backButton.visible = true;
                        _local_2.text = this._controller.localizationManager.getLocalization("groupforum.view.mark_read");
                    }
                    else
                    {
                        this._backButton.visible = false;
                    }
                }
            }
            var _local_3:ILabelWindow = (this._postButton.findChildByName("post_button_label") as ILabelWindow);
            if (this._threadListView != null)
            {
                this._postButton.visible = true;
                _local_3.text = this._controller.localizationManager.getLocalization("groupforum.view.start_thread");
            }
            else
            {
                if (this._messageListView != null)
                {
                    this._postButton.visible = true;
                    _local_3.text = this._controller.localizationManager.getLocalization("groupforum.view.reply");
                }
                else
                {
                    this._postButton.visible = false;
                }
            }
            var _local_4:int = (this._currentPage + 1);
            this._txtElement.caption = ((_local_4 + " / ") + this._numOfPages);
            this._window.scaler.enable();
            this._window.scaler.visible = true;
            enable(this._showFirst, (this._currentPage > 0));
            enable(this._showPrev, (this._currentPage > 0));
            enable(this._showNext, (this._currentPage < (this._numOfPages - 1)));
            enable(this._showLast, (this._currentPage < (this._numOfPages - 1)));
            this._Str_7256(this._controller._Str_9052);
        }

        private function _Str_18232():void
        {
            if (this._window != null)
            {
                this._listWindow.destroyListItems();
                this._forumsListView = null;
                this._threadListView = null;
                this._messageListView = null;
            }
            else
            {
                this._window = (this._controller.windowManager.buildFromXML(XML(new HabboFriendBarCom.groupforum_main_view_xml())) as IFrameWindow);
                this._listWindow = (this._window.findChildByName("scrollable_message_list") as IScrollableListWindow);
                this._listWindow.scrollableWindow.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_25680, 100);
                this._window.center();
                this._window.y = _Str_17065;
                this._txtElement = this._window.findChildByName("page_info");
                this._showPrev = this._window.findChildByName("show_previous");
                this._showPrev.addEventListener(WindowMouseEvent.CLICK, this._Str_6266);
                this._showNext = this._window.findChildByName("show_next");
                this._showNext.addEventListener(WindowMouseEvent.CLICK, this._Str_6266);
                this._showLast = this._window.findChildByName("show_last");
                this._showLast.addEventListener(WindowMouseEvent.CLICK, this._Str_6266);
                this._showFirst = this._window.findChildByName("show_first");
                this._showFirst.addEventListener(WindowMouseEvent.CLICK, this._Str_6266);
                this._backButton = IContainerButtonWindow(this._window.findChildByName("back_button"));
                this._backButton.addEventListener(WindowMouseEvent.CLICK, this._Str_6266);
                this._postButton = IContainerButtonWindow(this._window.findChildByName("post_button"));
                this._postButton.addEventListener(WindowMouseEvent.CLICK, this._Str_6266);
                this._closeBtn = this._window.findChildByTag("close");
                this._closeBtn.addEventListener(WindowMouseEvent.CLICK, this._Str_6266);
                this._listHeader = this._window.findChildByName("list_header");
                this._myForumsLink = ITextWindow(IItemListWindow(this._window.findChildByName("shortcuts")).getListItemByName("my"));
            }
        }

        private function _Str_11501(k:String, _arg_2:String):void
        {
            var _local_3:ITextWindow = ITextWindow(this._window.findChildByName("status"));
            if (((_arg_2 == null) || (_arg_2.length == 0)))
            {
                _local_3.caption = "";
            }
            else
            {
                k = this._controller.localizationManager.getLocalization(("groupforum.view.error.operation_" + k));
                _local_3.text = this._controller.localizationManager.getLocalizationWithParams(("groupforum.view.error." + _arg_2), "", "operation", k);
            }
        }

        private function _Str_19665(k:WindowMouseEvent):void
        {
            this._window5();
        }

        private function _Str_4912(k:WindowMouseEvent):void
        {
            if (this._forumData != null)
            {
                this._controller.context.createLinkEvent(("group/" + this._forumData.groupId));
            }
        }

        public function _Str_12395(k:ForumsListData):void
        {
            this._Str_18232();
            this._forumsListData = k;
            this._forumData = null;
            this._threadsListData = null;
            this._messagesListData = null;
            this._numOfPages = this._Str_18295(this._forumsListData.totalAmount);
            this._currentPage = Math.ceil((this._forumsListData.startIndex / ThreadsListData._Str_3331));
            this._forumsListView = new ForumsListView(this, this._listWindow, this._forumsListData.forums);
            this._forumsListView.update();
            this._listHeader.caption = this._controller.localizationManager.getLocalization(("groupforum.view.forums_list." + this._forumsListData._Str_5154));
            var _local_2:IWindowContainer = (this._window.findChildByName("top_part") as IWindowContainer);
            var _local_3:IWidgetWindow = IWidgetWindow(_local_2.findChildByName("group_icon"));
            _local_3.visible = false;
            var _local_4:IStaticBitmapWrapperWindow = (_local_2.findChildByName("header_icon") as IStaticBitmapWrapperWindow);
            _local_4.visible = true;
            _local_4.assetUri = ("forum_forum_list" + this._forumsListData._Str_5154);
            var _local_5:ITextWindow = (_local_2.findChildByName("top_header_text") as ITextWindow);
            _local_5.text = this._controller.localizationManager.getLocalization(("groupforum.view.forums_header." + this._forumsListData._Str_5154));
            var _local_6:ITextWindow = (_local_2.findChildByName("top_text") as ITextWindow);
            _local_6.text = this._controller.localizationManager.getLocalization(("groupforum.view.forums_description." + this._forumsListData._Str_5154));
            var _local_7:IRegionWindow = (_local_2.findChildByName("top_click_area") as IRegionWindow);
            _local_7.removeEventListener(WindowMouseEvent.CLICK, this._Str_4912);
            _local_7.disable();
            this._Str_18407();
            var _local_8:ITextWindow = ITextWindow(this._window.findChildByName("status"));
            _local_8.text = this._controller.localizationManager.getLocalization("groupforum.view.forums_list.status");
        }

        public function get _Str_25944():Boolean
        {
            return !(this._forumsListView == null);
        }

        public function _Str_25219(k:ForumsListData, _arg_2:_Str_3372, _arg_3:ThreadsListData):void
        {
            this._Str_18232();
            this._forumsListData = k;
            this._forumData = _arg_2;
            this._threadsListData = _arg_3;
            this._messagesListData = null;
            this._numOfPages = this._Str_18295(this._threadsListData._Str_18760);
            this._currentPage = Math.ceil((this._threadsListData.startIndex / ThreadsListData._Str_3331));
            this._threadListView = new ThreadListView(this, this._listWindow, this._forumData, this._threadsListData);
            this._threadListView.update();
            this._listHeader.caption = this._controller.localizationManager.getLocalization("groupforum.view.all_threads");
            if (this._forumData._Str_23163)
            {
                this._postButton.enable();
                this._Str_11501("post_thread", null);
            }
            else
            {
                this._postButton.disable();
                this._Str_11501("post_thread", this._forumData._Str_22973);
            }
            var _local_4:IRegionWindow = GroupForumView._Str_14926(this._window, this._forumData);
            _local_4.removeEventListener(WindowMouseEvent.CLICK, this._Str_4912);
            _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_4912);
            _local_4.enable();
            this._Str_18407();
        }

        public function _Str_16120(k:GuildForumThread):void
        {
            if (this._threadListView != null)
            {
                this._threadListView._Str_16935(k);
            }
        }

        public function _Str_25031(k:_Str_2814):void
        {
            if (this._messageListView != null)
            {
                this._messageListView._Str_16935(k);
            }
        }

        public function _Str_24648(k:ForumsListData, _arg_2:_Str_3372, _arg_3:ThreadsListData, _arg_4:MessagesListData):void
        {
            this._Str_18232();
            this._forumsListData = k;
            this._forumData = _arg_2;
            this._threadsListData = _arg_3;
            this._messagesListData = _arg_4;
            var _local_5:int = _arg_4.threadId;
            var _local_6:GuildForumThread = this._threadsListData._Str_6700[_local_5];
            this._numOfPages = this._Str_18295(_arg_4._Str_8598);
            var _local_7:int = _arg_4.startIndex;
            this._currentPage = Math.ceil((_local_7 / ThreadsListData._Str_3331));
            this._listHeader.caption = _local_6.header;
            this._messageListView = new MessageListView(this, this._listWindow, this._forumData, _local_6, _arg_4);
            this._messageListView.update();
            if (((this._controller._Str_20049() > 0) && (this._controller._Str_25071() == _local_5)))
            {
                this._messageListView._Str_23852(this._controller._Str_20049(), true);
                this._controller._Str_23416();
            }
            if (this._forumData._Str_20636)
            {
                if (((this._forumData._Str_7246) || (!(_local_6.isLocked))))
                {
                    this._postButton.enable();
                    this._Str_11501("post_message", null);
                }
                else
                {
                    this._postButton.disable();
                    this._Str_11501("post_in_locked", this._forumData._Str_25440);
                }
            }
            else
            {
                this._postButton.disable();
                this._Str_11501("post_message", this._forumData._Str_23527);
            }
            var _local_8:IRegionWindow = GroupForumView._Str_14926(this._window, this._forumData);
            _local_8.removeEventListener(WindowMouseEvent.CLICK, this._Str_4912);
            _local_8.addEventListener(WindowMouseEvent.CLICK, this._Str_4912);
            _local_8.enable();
            this._Str_18407();
        }

        public function get controller():GroupForumController
        {
            return this._controller;
        }

        private function _Str_18295(k:int):int
        {
            return Math.ceil((k / this._pageSize));
        }

        private function _Str_25233():void
        {
            var k:int = (this._currentPage - 1);
            if (k >= 0)
            {
                this._Str_14886(k);
            }
        }

        private function _Str_25577():void
        {
            var k:int = (this._currentPage + 1);
            if (k <= this._numOfPages)
            {
                this._Str_14886(k);
            }
        }

        private function _Str_24217():void
        {
            if (this._currentPage == 0)
            {
                return;
            }
            this._Str_14886(0);
        }

        private function _Str_25297():void
        {
            if (this._currentPage >= this._numOfPages)
            {
                return;
            }
            this._Str_14886((this._numOfPages - 1));
        }

        private function _Str_14886(k:int):void
        {
            var _local_2:int = (k * this._pageSize);
            if (this._forumsListView != null)
            {
                this._controller._Str_12395(this._forumsListData._Str_5154, _local_2);
            }
            else
            {
                if (this._threadListView != null)
                {
                    this._controller._Str_14770(this._forumData.groupId, _local_2);
                }
                else
                {
                    if (this._messageListView != null)
                    {
                        this._controller._Str_17032(this._forumData.groupId, this._messagesListData.threadId, _local_2);
                    }
                }
            }
            this._currentPage = k;
        }

        public function _Str_11823(k:int):String
        {
            return FriendlyTime.format(this._controller.localizationManager, k, ".ago", 1);
        }

        private function _Str_25680(k:WindowEvent=null):void
        {
            if (this._forumsListView != null)
            {
                this._forumsListView._Str_11755();
            }
            if (this._threadListView != null)
            {
                this._threadListView._Str_11755();
            }
            if (this._messageListView != null)
            {
                this._messageListView._Str_18220();
            }
        }

        private function _Str_6266(k:WindowMouseEvent):void
        {
            switch (k.target.name)
            {
                case "back_button":
                    if (this._messageListView != null)
                    {
                        this._controller._Str_14770(this._forumData.groupId, this._threadsListData.startIndex);
                    }
                    else
                    {
                        if (this._threadListView != null)
                        {
                            this._controller._Str_13365(true);
                            if (this._forumsListData != null)
                            {
                                this._controller._Str_12395(this._forumsListData._Str_5154, this._forumsListData.startIndex);
                            }
                            else
                            {
                                this.dispose();
                            }
                        }
                        else
                        {
                            if (this._forumsListView != null)
                            {
                                this._controller._Str_23963();
                                this.dispose();
                            }
                        }
                    }
                    return;
                case "show_previous":
                    this._Str_25233();
                    return;
                case "show_next":
                    this._Str_25577();
                    return;
                case "show_last":
                    this._Str_25297();
                    return;
                case "show_first":
                    this._Str_24217();
                    return;
                case "header_button_close":
                    this._window.visible = false;
                    this.dispose();
                    return;
                case "post_button":
                    this._Str_21538(((this._messagesListData != null) ? this._threadsListData._Str_6700[this._messagesListData.threadId] : null));
                    return;
            }
        }

        public function _Str_21538(k:GuildForumThread, _arg_2:_Str_2814=null):void
        {
            if (this._controller._Str_10252 != null)
            {
                this._controller._Str_10252.focus(this._forumData, k, _arg_2);
            }
            else
            {
                this._controller._Str_10252 = new ComposeMessageView(this, (this._window.x + this._window.width), this._window.y, this._forumData, k, _arg_2);
            }
        }

        public function _window5():void
        {
            if (this._controller._Str_11338 != null)
            {
                this._controller._Str_11338.focus(this._forumData);
            }
            else
            {
                this._controller._Str_11338 = new GroupForumViewController(this, (this._window.x + this._window.width), this._window.y, this._forumData);
            }
        }

        public function _Str_7256(k:int):void
        {
            if (k > 0)
            {
                this._myForumsLink.htmlText = this._controller.localizationManager.getLocalizationWithParams("groupforum.view.shortcuts.my.unread", "", "unread_count", k);
            }
            else
            {
                this._myForumsLink.htmlText = this._controller.localizationManager.getLocalization("groupforum.view.shortcuts.my", "");
            }
        }
    }
}
