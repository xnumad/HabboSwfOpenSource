package com.sulake.habbo.friendbar.groupforums
{
    import com.sulake.core.window.components.IScrollableListWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_3372;
    import com.sulake.habbo.communication.messages.parser.groupforums.GuildForumThread;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_2814;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;

    public class MessageListView 
    {
        private static const _Str_13580:int = -1;
        private static const _Str_13727:int = 20;
        public static const _Str_16051:RegExp = new RegExp("\\\\?(?:(?:\\*([^*]+)\\*)|(?:_([^_]+)_)|(?:@\\S+))");
        public static const _Str_13696:RegExp = new RegExp("^>(?: ?|$)");
        private static const _Str_16110:uint = 4291611852;

        private var _controller:GroupForumController;
        private var _mainView:GroupForumView;
        private var _list:IScrollableListWindow;
        private var _listItem:IWindowContainer;
        private var _forumData:_Str_3372;
        private var _threadData:GuildForumThread;
        private var _messagesListData:MessagesListData;
        private var _adding:Boolean = true;

        public function MessageListView(k:GroupForumView, _arg_2:IScrollableListWindow, _arg_3:_Str_3372, _arg_4:GuildForumThread, _arg_5:MessagesListData)
        {
            this._mainView = k;
            this._controller = this._mainView.controller;
            this._list = _arg_2;
            this._listItem = (this._controller.windowManager.buildFromXML(XML(new HabboFriendBarCom.groupforum_message_list_item_xml())) as IWindowContainer);
            this._forumData = _arg_3;
            this._threadData = _arg_4;
            this._messagesListData = _arg_5;
        }

        private static function _Str_26463(k:int):Array
        {
            switch (k)
            {
                case ForumModerationState._Str_5466:
                    return [4293519840, 4292335567];
                case ForumModerationState._Str_4415:
                    return [0xFFFFC6BA, 0xFFFFDFD2];
                case _Str_13580:
                    return [0xFFFFF4D9, 4291227641];
                case ForumModerationState._Str_8046:
                case ForumModerationState._Str_6076:
                default:
                    return [0xFFFFFFFF, 4291227641];
            }
        }

        private static function _Str_19323(k:ITextWindow, _arg_2:String):void
        {
            var _local_7:String;
            var _local_8:int;
            var _local_9:*;
            var _local_3:IWindowContainer = IWindowContainer(k.parent);
            _local_3.removeChild(k);
            var _local_4:Array = _arg_2.split("\r");
            var _local_5:StringBuffer = new StringBuffer();
            var _local_6:int;
            for each (_local_7 in _local_4)
            {
                _local_8 = 0;
                _local_9 = _Str_13696.exec(_local_7);
                if (_local_9 != null)
                {
                    _local_8 = 1;
                    _local_7 = _local_7.substr(_local_9[0].length);
                }
                if (_local_8 != _local_6)
                {
                    _Str_13482(_local_3, k, _local_5, _local_6);
                    _local_6 = _local_8;
                }
                else
                {
                    if (_local_5.length > 0)
                    {
                        _local_5.add("\r");
                    }
                }
                _Str_8248(_local_5, _local_7);
            }
            _Str_13482(_local_3, k, _local_5, _local_6);
        }

        private static function _Str_8248(k:StringBuffer, _arg_2:String):void
        {
            var _local_3:*;
            var _local_4:Number;
            var _local_5:String;
            _loop_1:
            while (true)
            {
                _local_3 = _Str_16051.exec(_arg_2);
                if (!_local_3)
                {
                    break;
                }
                if (_local_3.index > 0)
                {
                    k._Str_15932(_arg_2.substr(0, _local_3.index));
                }
                _local_4 = _local_3[0].length;
                switch (_arg_2.charAt(_local_3.index))
                {
                    case "*":
                        k.add(" <b>");
                        _Str_8248(k, _arg_2.substr((_local_3.index + 1), (_local_4 - 2)));
                        k.add("</b> ");
                        break;
                    case "_":
                        k.add(" <i>");
                        _Str_8248(k, _arg_2.substr((_local_3.index + 1), (_local_4 - 2)));
                        k.add("</i> ");
                        break;
                    case "@":
                        if (((_local_3.index == 0) || ((_local_3.index > 0) && (_arg_2.substr((_local_3.index - 1), 1) == " "))))
                        {
                            _local_5 = _arg_2.substr((_local_3.index + 1), (_local_4 - 1));
                            k.add("<u>")._Str_15932(_local_5).add("</u>");
                            break;
                        }
                        k.add("@");
                    default:
                        k.add(_arg_2.charAt((_local_3.index + 1)));
                        _arg_2 = _arg_2.substr((_local_3.index + 2));
                        continue _loop_1;
                }
                _arg_2 = _arg_2.substr((_local_3.index + _local_4));
            }
            k._Str_15932(_arg_2);
        }

        private static function _Str_13482(k:IWindowContainer, _arg_2:ITextWindow, _arg_3:StringBuffer, _arg_4:int):void
        {
            var _local_5:String = _arg_3.toString();
            var _local_6:ITextWindow = ITextWindow(_arg_2.clone());
            k.addChild(_local_6);
            _local_6.htmlText = _local_5;
            if (_arg_4 > 0)
            {
                _local_6.x = (_local_6.x + (_arg_4 * _Str_13727));
                _local_6.width = (_local_6.width - ((_arg_4 + 1) * _Str_13727));
                _local_6.color = _Str_16110;
                _local_6.background = true;
            }
            _arg_3.reset();
        }


        public function update():void
        {
            var _local_2:_Str_2814;
            var _local_3:Boolean;
            if (this._list.numListItems > 0)
            {
                this._list.destroyListItems();
            }
            this._list.invalidate();
            var k:int = this._controller._Str_16072(this._messagesListData.threadId);
            this._adding = true;
            this._list.autoArrangeItems = false;
            for each (_local_2 in this._messagesListData.messages)
            {
                _local_3 = (_local_2.messageIndex > k);
                this._list.addListItem(this._Str_6850(_local_2, _local_3));
            }
            this._adding = false;
            this._Str_18220();
        }

        public function _Str_18220():void
        {
            if (this._adding)
            {
                return;
            }
            var k:Number = this._list.scrollableWindow.width;
            this._Str_19591();
            if (this._list.scrollableWindow.width != k)
            {
                this._Str_19591();
            }
        }

        private function _Str_19591():void
        {
            var _local_2:IWindowContainer;
            var _local_3:IWindowContainer;
            var _local_4:IWindowContainer;
            var _local_5:int;
            var _local_6:int;
            var _local_7:ITextWindow;
            this._list.autoArrangeItems = false;
            var k:int;
            while (k < this._list.numListItems)
            {
                _local_2 = IWindowContainer(this._list.getListItemAt(k));
                _local_3 = (_local_2.findChildByName("texts_container") as IWindowContainer);
                _local_4 = IWindowContainer(_local_2.findChildByName("message_text_container"));
                _local_2.width = (this._list.scrollableWindow.width - 2);
                _local_5 = 2;
                _local_6 = 0;
                while (_local_6 < _local_4.numChildren)
                {
                    _local_7 = ITextWindow(_local_4.getChildAt(_local_6));
                    _local_7.y = _local_5;
                    _local_5 = _local_7.bottom;
                    _local_6++;
                }
                _local_4.height = _local_5;
                _local_2.height = (_local_3.height + _local_4.bottom);
                k++;
            }
            this._list.autoArrangeItems = true;
        }

        private function _Str_6850(k:_Str_2814, _arg_2:Boolean=false):IWindowContainer
        {
            var _local_3:IWindowContainer = (this._listItem.clone() as IWindowContainer);
            _local_3.name = ("message_" + k.messageId);
            var _local_4:int = k.state;
            var _local_5:Boolean = this._forumData._Str_7246;
            var _local_6:Boolean = this._forumData._Str_7449;
            var _local_7:IWindowContainer = (_local_3.findChildByName("texts_container") as IWindowContainer);
            _local_7.id = k.messageId;
            _local_7.findChildByName("date").caption = this._mainView._Str_11823(k._Str_6238);
            _local_7.findChildByName("reply_num").caption = ("#" + (k.messageIndex + 1));
            var _local_8:ITextWindow = (_local_3.findChildByName("message_text") as ITextWindow);
            if (_arg_2)
            {
                _local_4 = _Str_13580;
            }
            if (((_local_4 == ForumModerationState._Str_4415) && (!(_local_6))))
            {
                _local_8.text = this._Str_13405(k);
            }
            else
            {
                if (((_local_4 > ForumModerationState._Str_6076) && (!(_local_5))))
                {
                    _local_8.text = this._Str_13405(k);
                }
                else
                {
                    _Str_19323(_local_8, k._Str_3460);
                }
            }
            var _local_9:IWindowContainer = (_local_3.findChildByName("msg_container") as IWindowContainer);
            var _local_10:Array = _Str_26463(_local_4);
            _local_9.color = _local_10[0];
            var _local_11:IWindowContainer = (_local_3.findChildByName("avatar_image") as IWindowContainer);
            var _local_12:Array = _Str_26463(_local_4);
            _local_11.color = _local_12[1];
            _local_11.id = k._Str_18036;
            _local_11.removeEventListener(WindowMouseEvent.CLICK, this._Str_19785);
            _local_11.addEventListener(WindowMouseEvent.CLICK, this._Str_19785);
            _Str_2483(IWidgetWindow(_local_11.findChildByName("avatar_widget")).widget).figure = k._Str_18957;
            _local_11.findChildByName("author").caption = k._Str_6415;
            _local_11.findChildByName("author_post_count").caption = ((k._Str_17584 + " ") + this._controller.localizationManager.getLocalization("messageboard.messages", "posts"));
            this._Str_15972(_local_3, k, _local_4);
            return _local_3;
        }

        public function _Str_16935(k:_Str_2814):void
        {
            var _local_2:int = k.messageId;
            var _local_3:IWindowContainer = (this._list.getListItemByName(("message_" + _local_2)) as IWindowContainer);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:int = this._list.getListItemIndex(_local_3);
            this._adding = true;
            this._list.autoArrangeItems = false;
            this._list.removeListItemAt(_local_4);
            this._list.addListItemAt(this._Str_6850(k), _local_4);
            this._adding = false;
            this._Str_18220();
        }

        private function _Str_15972(k:IWindowContainer, _arg_2:_Str_2814, _arg_3:int):void
        {
            var _local_4:IRegionWindow;
            var _local_9:IStaticBitmapWrapperWindow;
            var _local_5:Boolean = this._forumData._Str_7246;
            var _local_6:Boolean = this._forumData._Str_7449;
            var _local_7:Boolean = this._forumData._Str_21331;
            var _local_8:Boolean = this._forumData._Str_20636;
            _local_4 = (k.findChildByName("delete_message") as IRegionWindow);
            _local_4.removeEventListener(WindowMouseEvent.CLICK, this._Str_10493);
            _local_4.removeEventListener(WindowMouseEvent.CLICK, this._Str_7727);
            if (_local_5)
            {
                _local_4.id = _arg_2.messageId;
                _local_9 = (_local_4.getChildByName("icon") as IStaticBitmapWrapperWindow);
                switch (_arg_3)
                {
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
                    case ForumModerationState._Str_8046:
                    case ForumModerationState._Str_6076:
                    default:
                        _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_10493);
                        _local_9.assetUri = "forum_forum_hide";
                }
            }
            else
            {
                _local_4.visible = false;
            }
            _local_4 = (k.findChildByName("report_message") as IRegionWindow);
            if (_local_7)
            {
                _local_4.id = _arg_2.messageId;
                _local_4.removeEventListener(WindowMouseEvent.CLICK, this._Str_9877);
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_9877);
            }
            else
            {
                _local_4.visible = false;
            }
            _local_4 = (k.findChildByName("reply_message") as IRegionWindow);
            if (_local_8)
            {
                _local_4.id = _arg_2.messageId;
                _local_4.removeEventListener(WindowMouseEvent.CLICK, this._Str_20759);
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_20759);
            }
            else
            {
                _local_4.visible = false;
            }
        }

        private function _Str_13405(k:_Str_2814):String
        {
            switch (k.state)
            {
                case ForumModerationState._Str_5466:
                    return this._controller.localizationManager.getLocalizationWithParams("groupforum.view.message_hidden_by_admin", "", "admin_name", k._Str_6110);
                case ForumModerationState._Str_4415:
                    return this._controller.localizationManager.getLocalizationWithParams("groupforum.view.message_hidden_by_staff", "", "admin_name", k._Str_6110);
                default:
                    return null;
            }
        }

        public function _Str_23852(k:int, _arg_2:Boolean=false):void
        {
            var _local_3:IWindowContainer;
            if (!_arg_2)
            {
                _local_3 = (this._list.getListItemByName(("message_" + k)) as IWindowContainer);
            }
            else
            {
                _local_3 = (this._list.getListItemAt((k - 1)) as IWindowContainer);
            }
            if (_local_3 != null)
            {
                this._list.scrollV = (_local_3.bottom / this._list.maxScrollV);
            }
        }

        private function _Str_9877(k:WindowMouseEvent):void
        {
            this._controller._Str_11424(this._forumData, this._threadData.threadId, int(k.target.id));
        }

        private function _Str_7727(k:WindowMouseEvent):void
        {
            this._controller._Str_25066(this._forumData, this._threadData.threadId, int(k.target.id));
        }

        private function _Str_10493(k:WindowMouseEvent):void
        {
            this._controller._Str_24225(this._forumData, this._threadData.threadId, int(k.target.id));
        }

        private function _Str_19785(k:WindowMouseEvent):void
        {
            this._controller._Str_23450(int(k.target.id));
        }

        private function _Str_20759(k:WindowMouseEvent):void
        {
            var _local_2:int = int(k.target.id);
            var _local_3:_Str_2814 = this._messagesListData._Str_22993[_local_2];
            if (_local_3 == null)
            {
                return;
            }
            this._mainView._Str_21538(this._threadData, _local_3);
        }
    }
}
