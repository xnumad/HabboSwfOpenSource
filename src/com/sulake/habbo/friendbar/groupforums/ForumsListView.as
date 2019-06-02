package com.sulake.habbo.friendbar.groupforums
{
    import com.sulake.core.window.components.IScrollableListWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_2807;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.habbo.window.enum._Str_4387;

    public class ForumsListView 
    {
        private var _controller:GroupForumController;
        private var _mainView:GroupForumView;
        private var _list:IScrollableListWindow;
        private var _listItem:IWindowContainer;
        private var _forums:Array;

        public function ForumsListView(k:GroupForumView, _arg_2:IScrollableListWindow, _arg_3:Array)
        {
            this._mainView = k;
            this._controller = this._mainView.controller;
            this._list = _arg_2;
            this._listItem = (this._controller.windowManager.buildFromXML(XML(new HabboFriendBarCom.groupforum_forum_list_item_xml())) as IWindowContainer);
            this._forums = _arg_3;
        }

        public function update():void
        {
            var k:int;
            var _local_2:IWindowContainer;
            var _local_3:_Str_2807;
            this._list.invalidate();
            k = 0;
            while (k < this._forums.length)
            {
                _local_3 = this._forums[k];
                _local_2 = (this._listItem.clone() as IWindowContainer);
                _local_2.name = ("forum_" + _local_3.groupId);
                this._Str_10311(_local_2, _local_3, k);
                this._list.addListItem(_local_2);
                k++;
            }
            this._Str_11755();
        }

        private function _Str_10311(k:IWindowContainer, _arg_2:_Str_2807, _arg_3:int):void
        {
            var _local_4:IWindowContainer = (k as IWindowContainer);
            _local_4.color = (((_arg_3 + 1) % 2) ? 4293852927 : 4289914618);
            var _local_5:int = _arg_2._Str_18237;
            var _local_6:IWindow = _local_4.findChildByName("texts_container");
            _local_6.id = _arg_2.groupId;
            var _local_7:ITextWindow = (_local_4.findChildByName("header") as ITextWindow);
            _local_7.bold = (_local_5 > 0);
            _local_7.text = _arg_2.name;
            _local_6 = _local_4.findChildByName("header_region");
            _local_6.id = _arg_2.groupId;
            _local_6.removeEventListener(WindowMouseEvent.CLICK, this._Str_13188);
            _local_6.addEventListener(WindowMouseEvent.CLICK, this._Str_13188);
            _local_6 = _local_4.findChildByName("details");
            _local_6.caption = this._controller.localizationManager.getLocalizationWithParams("groupforum.view.forum_details", "", "rating", _arg_2._Str_25067, "last_author_id", _arg_2._Str_8317, "last_author_name", _arg_2._Str_9601, "update_time", this._mainView._Str_11823(_arg_2._Str_8950));
            _local_6 = _local_4.findChildByName("unread_texts_container");
            _local_6.id = _arg_2.groupId;
            _local_6 = _local_4.findChildByName("unread_region");
            _local_6.id = _arg_2.groupId;
            _local_6.removeEventListener(WindowMouseEvent.CLICK, this._Str_13188);
            _local_6.addEventListener(WindowMouseEvent.CLICK, this._Str_13188);
            _local_7 = (_local_4.findChildByName("messages1") as ITextWindow);
            _local_7.bold = (_local_5 > 0);
            _local_7.text = this._controller.localizationManager.getLocalizationWithParams("groupforum.view.thread_details1", "", "total_messages", _arg_2._Str_8598, "new_messages", _local_5);
            _local_7 = (_local_4.findChildByName("messages2") as ITextWindow);
            _local_7.bold = (_local_5 > 0);
            _local_7.text = this._controller.localizationManager.getLocalizationWithParams("groupforum.view.thread_details2", "", "total_messages", _arg_2._Str_8598, "new_messages", _local_5);
            var _local_8:IWidgetWindow = IWidgetWindow(_local_4.findChildByName("group_icon"));
            var _local_9:_Str_2402 = (_local_8.widget as _Str_2402);
            _local_9.badgeId = _arg_2.icon;
            _local_9.groupId = _arg_2.groupId;
            _local_9.type = _Str_4387.GROUP;
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

        private function _Str_13188(k:WindowMouseEvent):void
        {
            this._controller._Str_13647(int(k.target.id));
        }
    }
}



