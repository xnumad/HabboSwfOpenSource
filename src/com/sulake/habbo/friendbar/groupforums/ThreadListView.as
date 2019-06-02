package com.sulake.habbo.friendbar.groupforums
{
    import com.sulake.core.window.components.IScrollableListWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_3372;
    import com.sulake.habbo.communication.messages.parser.groupforums.GuildForumThread;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.IItemListWindow;

    public class ThreadListView 
    {
        private var _controller:GroupForumController;
        private var _mainView:GroupForumView;
        private var _list:IScrollableListWindow;
        private var _listItem:IWindowContainer;
        private var _forumData:_Str_3372;
        private var _threadsListData:ThreadsListData;

        public function ThreadListView(k:GroupForumView, _arg_2:IScrollableListWindow, _arg_3:_Str_3372, _arg_4:ThreadsListData)
        {
            this._mainView = k;
            this._controller = this._mainView.controller;
            this._list = _arg_2;
            this._listItem = (this._controller.windowManager.buildFromXML(XML(new HabboFriendBarCom.groupforum_thread_list_item_xml())) as IWindowContainer);
            this._forumData = _arg_3;
            this._threadsListData = _arg_4;
        }

        private static function _Str_26453(k:int, _arg_2:int):uint
        {
            switch (k)
            {
                case ForumModerationState._Str_5466:
                    return 4289374890;
                case ForumModerationState._Str_4415:
                    return 0xFFFFB0A5;
                case ForumModerationState._Str_8046:
                case ForumModerationState._Str_6076:
                default:
                    return ((_arg_2 + 1) % 2) ? 4293852927 : 4289914618;
            }
        }


        public function update():void
        {
            var k:int;
            var _local_2:IWindowContainer;
            var _local_3:GuildForumThread;
            this._list.invalidate();
            k = 0;
            while (k < this._threadsListData.size)
            {
                _local_3 = this._threadsListData._Str_8372[k];
                _local_2 = (this._listItem.clone() as IWindowContainer);
                _local_2.name = ("thread_" + _local_3.threadId);
                this._Str_10311(_local_2, _local_3, k);
                this._list.addListItem(_local_2);
                k++;
            }
            this._Str_11755();
        }

        private function _Str_10311(k:IWindowContainer, _arg_2:GuildForumThread, _arg_3:int):void
        {
            var _local_5:IWindow;
            var _local_13:String;
            var _local_4:IWindowContainer = (k as IWindowContainer);
            var _local_6:int = _arg_2.state;
            var _local_7:Boolean = this._forumData._Str_7246;
            var _local_8:Boolean = this._forumData._Str_7449;
            var _local_9:Boolean = _arg_2.isPinned;
            var _local_10:Boolean = _arg_2.isLocked;
            var _local_11:int = ((_arg_2.totalMessages - this._controller._Str_16072(_arg_2.threadId)) - 1);
            _local_5 = _local_4.findChildByName("texts_container");
            if (_local_5 != null)
            {
                _local_5.id = _arg_2.threadId;
                _local_5.color = _Str_26453(_local_6, _arg_3);
            }
            var _local_12:ITextWindow = (_local_4.findChildByName("header") as ITextWindow);
            if (_local_12 != null)
            {
                _local_12.bold = (_local_11 > 0);
                _local_13 = _arg_2.header;
                if (_arg_2.header == "")
                {
                    _local_13 = "(No Subject)";
                }
                if ((((_local_6 > ForumModerationState._Str_6076) && (!(_local_7))) && (!(_local_8))))
                {
                    _local_13 = this._Str_13405(_arg_2);
                }
                _local_12.text = _local_13;
            }
            _local_5 = _local_4.findChildByName("header_region");
            if (_local_5 != null)
            {
                _local_5.id = _arg_2.threadId;
                _local_5.removeEventListener(WindowMouseEvent.CLICK, this._Str_15365);
                _local_5.addEventListener(WindowMouseEvent.CLICK, this._Str_15365);
            }
            _local_5 = _local_4.findChildByName("details");
            if (_local_5 != null)
            {
                _local_5.caption = this._controller.localizationManager.getLocalizationWithParams("groupforum.view.thread_details", "", "thread_author_id", _arg_2.authorId, "thread_author_name", _arg_2.authorName, "last_author_id", _arg_2.lastUserId, "last_author_name", _arg_2.lastUserName, "creation_time", this._mainView._Str_11823(_arg_2.creationTime), "update_time", this._mainView._Str_11823(_arg_2.lastCommentTime));
            }
            _local_5 = _local_4.findChildByName("unread_texts_container");
            if (_local_5 != null)
            {
                _local_5.id = _arg_2.threadId;
                _local_5.color = _Str_26453(_local_6, _arg_3);
            }
            _local_5 = _local_4.findChildByName("unread_region");
            if (_local_5 != null)
            {
                _local_5.id = _arg_2.threadId;
                _local_5.removeEventListener(WindowMouseEvent.CLICK, this._Str_15365);
                _local_5.addEventListener(WindowMouseEvent.CLICK, this._Str_15365);
            }
            _local_12 = (_local_4.findChildByName("messages1") as ITextWindow);
            if (_local_12 != null)
            {
                _local_12.bold = (_local_11 > 0);
                _local_12.text = this._controller.localizationManager.getLocalizationWithParams("groupforum.view.thread_details1", "", "total_messages", _arg_2.totalMessages, "new_messages", _local_11);
            }
            _local_12 = (_local_4.findChildByName("messages2") as ITextWindow);
            if (_local_12 != null)
            {
                _local_12.bold = (_local_11 > 0);
                _local_12.text = this._controller.localizationManager.getLocalizationWithParams("groupforum.view.thread_details2", "", "total_messages", _arg_2.totalMessages, "new_messages", _local_11);
            }
            _local_5 = _local_4.findChildByName("button_container");
            if (_local_5 != null)
            {
                _local_5.id = _arg_2.threadId;
                _local_5.color = _Str_26453(_local_6, _arg_3);
                this._Str_15972((_local_5 as IWindowContainer), _arg_2, _local_6);
                _local_5.color = _Str_26453(_local_6, _arg_3);
            }
            _local_5 = _local_4.findChildByName("left_button_container");
            if (_local_5 != null)
            {
                _local_5.id = _arg_2.threadId;
                _local_5.color = _Str_26453(_local_6, _arg_3);
                this._Str_23179((_local_5 as IWindowContainer), _arg_2, _local_10, _local_9);
                _local_5.color = _Str_26453(_local_6, _arg_3);
            }
        }

        public function _Str_11755():void
        {
            var k:int;
            while (k < this._list.numListItems)
            {
                this._list.getListItemAt(k).width = (this._list.scrollableWindow.width - 2);
                k++;
            }
        }

        private function _Str_15972(k:IWindowContainer, _arg_2:GuildForumThread, _arg_3:int):void
        {
            var _local_4:IRegionWindow;
            var _local_9:IStaticBitmapWrapperWindow;
            var _local_5:Boolean = this._forumData._Str_7246;
            var _local_6:Boolean = this._forumData._Str_7449;
            var _local_7:Boolean = this._forumData._Str_21331;
            var _local_8:IItemListWindow = (k.findChildByName("mod_buttons") as IItemListWindow);
            _local_4 = (_local_8.getListItemAt(0) as IRegionWindow);
            if (_local_4 != null)
            {
                _local_4.removeEventListener(WindowMouseEvent.CLICK, this._Str_10493);
                _local_4.removeEventListener(WindowMouseEvent.CLICK, this._Str_7727);
                if (((_local_5) || (_local_6)))
                {
                    _local_4.id = _arg_2.threadId;
                    _local_9 = (_local_4.getChildByName("icon") as IStaticBitmapWrapperWindow);
                    switch (_arg_3)
                    {
                        case ForumModerationState._Str_8046:
                        case ForumModerationState._Str_6076:
                            _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_10493);
                            _local_9.assetUri = "forum_forum_hide";
                            break;
                        case ForumModerationState._Str_5466:
                            _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_7727);
                            _local_9.assetUri = "forum_forum_unhide";
                            break;
                        case ForumModerationState._Str_4415:
                            if (_local_6)
                            {
                                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_7727);
                                _local_9.assetUri = "forum_forum_unhide";
                            }
                            else
                            {
                                _local_4.visible = false;
                            }
                            break;
                    }
                }
                else
                {
                    _local_4.visible = false;
                }
            }
            _local_4 = (_local_8.getListItemAt(1) as IRegionWindow);
            if (_local_4 != null)
            {
                _local_4.removeEventListener(WindowMouseEvent.CLICK, this._Str_9877);
                if ((((_local_5) || (_local_6)) || (_local_7)))
                {
                    _local_4.id = _arg_2.threadId;
                    _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_9877);
                }
                else
                {
                    _local_4.visible = false;
                }
            }
        }

        private function _Str_23179(k:IWindowContainer, _arg_2:GuildForumThread, _arg_3:Boolean, _arg_4:Boolean):void
        {
            var _local_10:IStaticBitmapWrapperWindow;
            var _local_11:IStaticBitmapWrapperWindow;
            var _local_5:Boolean = this._forumData._Str_7246;
            var _local_6:Boolean = this._forumData._Str_7449;
            var _local_7:IItemListWindow = (k.findChildByName("info_buttons") as IItemListWindow);
            var _local_8:IRegionWindow = (_local_7.getListItemByName("thread_lock") as IRegionWindow);
            if (_local_8 != null)
            {
                _local_8.removeEventListener(WindowMouseEvent.CLICK, this._Str_21587);
                _local_10 = (_local_8.getChildByName("icon") as IStaticBitmapWrapperWindow);
                if (((_local_5) || (_local_6)))
                {
                    _local_8.id = _arg_2.threadId;
                    _local_8.addEventListener(WindowMouseEvent.CLICK, this._Str_21587);
                    if (_arg_3)
                    {
                        _local_10.assetUri = "forum_forum_locked";
                    }
                    else
                    {
                        _local_10.assetUri = "forum_forum_unlocked";
                    }
                    _local_8.visible = true;
                }
                else
                {
                    if (_arg_3)
                    {
                        _local_10.assetUri = "forum_forum_locked";
                    }
                    _local_8.visible = _arg_3;
                    _local_8.disable();
                }
            }
            var _local_9:IRegionWindow = (_local_7.getListItemByName("thread_pin") as IRegionWindow);
            if (_local_9 != null)
            {
                _local_9.removeEventListener(WindowMouseEvent.CLICK, this._Str_22040);
                _local_11 = (_local_9.getChildByName("icon") as IStaticBitmapWrapperWindow);
                if (((_local_5) || (_local_6)))
                {
                    _local_9.id = _arg_2.threadId;
                    _local_9.addEventListener(WindowMouseEvent.CLICK, this._Str_22040);
                    if (_arg_4)
                    {
                        _local_11.assetUri = "forum_forum_pinned";
                    }
                    else
                    {
                        _local_11.assetUri = "forum_forum_unpinned";
                    }
                    _local_9.visible = true;
                }
                else
                {
                    if (_arg_4)
                    {
                        _local_11.assetUri = "forum_forum_pinned";
                    }
                    _local_9.visible = _arg_4;
                    _local_9.disable();
                }
            }
        }

        private function _Str_13405(k:GuildForumThread):String
        {
            var _local_2:String;
            switch (k.state)
            {
                case ForumModerationState._Str_8046:
                    break;
                case ForumModerationState._Str_6076:
                    break;
                case ForumModerationState._Str_5466:
                    _local_2 = this._controller.localizationManager.getLocalizationWithParams("groupforum.view.thread_hidden_by_admin", "", "admin_name", k.adminName);
                    break;
                case ForumModerationState._Str_4415:
                    _local_2 = this._controller.localizationManager.getLocalizationWithParams("groupforum.view.thread_hidden_by_staff", "", "admin_name", k.adminName);
                    break;
            }
            return _local_2;
        }

        public function _Str_16935(k:GuildForumThread):void
        {
            var _local_2:int = k.threadId;
            var _local_3:IWindowContainer = (this._list.getListItemByName(("thread_" + _local_2)) as IWindowContainer);
            var _local_4:int = this._list.getListItemIndex(_local_3);
            if (_local_3 != null)
            {
                this._Str_10311(_local_3, k, _local_4);
            }
        }

        private function _Str_21587(k:WindowMouseEvent):void
        {
            var _local_2:int = k.target.id;
            var _local_3:GuildForumThread = this._threadsListData._Str_6700[_local_2];
            if (_local_3 == null)
            {
                return;
            }
            this._controller._Str_24793(this._forumData, _local_2, (!(_local_3.isLocked)), _local_3.isPinned);
        }

        private function _Str_22040(k:WindowMouseEvent):void
        {
            var _local_2:int = k.target.id;
            var _local_3:GuildForumThread = this._threadsListData._Str_6700[_local_2];
            if (_local_3 == null)
            {
                return;
            }
            this._controller._Str_22439(this._forumData, _local_2, _local_3.isLocked, (!(_local_3.isPinned)));
        }

        private function _Str_9877(k:WindowMouseEvent):void
        {
            this._controller._Str_10138(this._forumData, int(k.target.id));
        }

        private function _Str_10493(k:WindowMouseEvent):void
        {
            this._controller._Str_24351(this._forumData, int(k.target.id));
        }

        private function _Str_7727(k:WindowMouseEvent):void
        {
            this._controller._Str_24798(this._forumData, int(k.target.id));
        }

        private function _Str_15365(k:WindowMouseEvent):void
        {
            var _local_4:int;
            var _local_2:int = int(k.target.id);
            var _local_3:GuildForumThread = this._threadsListData._Str_6700[_local_2];
            if (_local_3)
            {
                _local_4 = Math.min((this._controller._Str_16072(_local_2) + 1), (_local_3.totalMessages - 1));
                this._controller._Str_20033(this._forumData.groupId, _local_2, _local_4);
            }
        }
    }
}
