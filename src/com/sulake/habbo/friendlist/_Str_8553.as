package com.sulake.habbo.friendlist
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.friendlist.domain._Str_2740;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.friendlist.events._Str_3797;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IItemListWindow;

    public class _Str_8553 
    {
        private var _habboFriendList:HabboFriendList;
        private var _content:IWindowContainer;

        public function _Str_8553(k:HabboFriendList)
        {
            this._habboFriendList = k;
        }

        public function prepare(k:IWindowContainer):void
        {
            this._content = k;
            this.refresh("prepare");
        }

        public function refresh(k:String):void
        {
            var _local_3:_Str_2740;
            var _local_4:IWindowContainer;
            var _local_5:int;
            Logger.log(("TABS: REFRESH: " + k));
            this._content.width = this._habboFriendList.tabs._Str_7233;
            this._content.findChildByName("bg").width = this._habboFriendList.tabs._Str_7233;
            var _local_2:int = 1;
            for each (_local_3 in this._habboFriendList.tabs._Str_22082())
            {
                _local_4 = (this._content.getChildByName(("flt_" + _local_3.id)) as IWindowContainer);
                if (!this._Str_25093(_local_3.id))
                {
                    _local_4.visible = false;
                }
                else
                {
                    _local_4.visible = true;
                    _local_4.width = this._habboFriendList.tabs._Str_7233;
                    _local_4.y = _local_2;
                    _local_5 = this._Str_11540(_local_3, _local_4);
                    this._Str_25248(_local_3, _local_4);
                    _local_4.height = (_local_5 + ((_local_3.selected) ? this._habboFriendList.tabs._Str_12266 : 0));
                    _local_2 = (_local_2 + _local_4.height);
                }
            }
            this._content.height = (_local_2 + 1);
            this._content.findChildByName("bg").height = this._content.height;
            Logger.log("TABS: REFRESH END");
        }

        private function _Str_25093(k:int):Boolean
        {
            if (k != _Str_2777._Str_3798)
            {
                return true;
            }
            return this._habboFriendList.friendRequests.requests.length > 0;
        }

        private function _Str_25248(k:_Str_2740, _arg_2:IWindowContainer):void
        {
            if (k.selected)
            {
                if (k.view == null)
                {
                    k.view = (this._Str_22949(k) as IWindowContainer);
                }
                this._Str_24172(k.view);
                this._Str_16245(k.view);
                _arg_2.addChild(k.view);
            }
            else
            {
                if (k.view != null)
                {
                    _arg_2.removeChild(k.view);
                }
            }
        }

        private function _Str_11540(k:_Str_2740, _arg_2:IWindowContainer):int
        {
            var _local_3:IWindowContainer = (_arg_2.getChildByName("header") as IWindowContainer);
            _local_3.width = this._habboFriendList.tabs._Str_7233;
            this._Str_19729(_local_3, k._Str_14035, "hdr_hilite");
            this._Str_19729(_local_3, (!(k._Str_14035)), k._Str_22380);
            var _local_4:Boolean = ((k.id == _Str_2777._Str_4113) && (!(k._Str_14035)));
            Logger.log(((((("TAB " + k.id) + ", ") + k.name) + ", ") + _local_4));
            this._Str_13548(_local_3, "arrow_down_black", ((k.selected) && (_local_4)), 12);
            this._Str_13548(_local_3, "arrow_right_black", ((!(k.selected)) && (_local_4)), 15);
            this._Str_13548(_local_3, "arrow_down_white", ((k.selected) && (!(_local_4))), 12);
            this._Str_13548(_local_3, "arrow_right_white", ((!(k.selected)) && (!(_local_4))), 15);
            this._Str_23790(k, _local_3);
            return _local_3.height;
        }

        private function _Str_19729(k:IWindowContainer, _arg_2:Boolean, _arg_3:String):void
        {
            Logger.log(((("REFRESHING BG IMAGE: " + _arg_2) + ", ") + _arg_3));
            var _local_4:IBitmapWrapperWindow = (k.getChildByName(_arg_3) as IBitmapWrapperWindow);
            if (!_arg_2)
            {
                if (_local_4 != null)
                {
                    _local_4.visible = false;
                }
            }
            else
            {
                if (_local_4.bitmap == null)
                {
                    _local_4.bitmap = this._habboFriendList._Str_3122(_arg_3);
                    _local_4.height = _local_4.bitmap.height;
                    k.height = _local_4.bitmap.height;
                    _local_4.procedure = this._Str_16089;
                }
                _local_4.width = this._habboFriendList.tabs._Str_7233;
                _local_4.visible = true;
            }
        }

        private function _Str_13548(k:IWindowContainer, _arg_2:String, _arg_3:Boolean, _arg_4:int):void
        {
            var _local_5:ITextWindow;
            var _local_6:IWindow;
            this._habboFriendList.refreshButton(k, _arg_2, _arg_3, null, 0);
            if (_arg_3)
            {
                _local_5 = ITextWindow(k.findChildByName("caption_text"));
                _local_6 = IWindow(k.findChildByName(_arg_2));
                _local_6.x = (_local_5.textWidth + _arg_4);
            }
        }

        private function _Str_23790(k:_Str_2740, _arg_2:IWindowContainer):void
        {
            var _local_3:ITextWindow = (_arg_2.findChildByName("caption_text") as ITextWindow);
            _local_3.text = (((k.name + " (") + k._Str_4621._Str_14366()) + ")");
            _local_3.textColor = this._habboFriendList._Str_4930._Str_24837(k._Str_14035, k.id);
        }

        private function _Str_16089(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:_Str_2740;
            this._habboFriendList.view._Str_3476(k, (("${friendlist.tip.tab." + _arg_2.id) + "}"));
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log("TAB CLICKED!");
            var _local_3:_Str_2740 = this._habboFriendList.tabs._Str_4403(_arg_2.id);
            for each (_local_4 in this._habboFriendList.tabs._Str_22082())
            {
                _local_4._Str_4621._Str_14179(_local_3.id);
            }
            this._habboFriendList.tabs._Str_16257(_local_3);
            this._habboFriendList.view.refresh("tabClick");
            if (_local_3.selected)
            {
                switch (_local_3.id)
                {
                    case _Str_2777._Str_4113:
                        this._habboFriendList._Str_9727(_Str_3797.HABBO_FRIENDLIST_TRACKING_EVENT_FRIENDS);
                        break;
                    case _Str_2777._Str_5722:
                        this._habboFriendList._Str_9727(_Str_3797.HABBO_FRIENDLIST_TRACKING_EVENT_SEARCH);
                        break;
                    case _Str_2777._Str_3798:
                        this._habboFriendList._Str_9727(_Str_3797.HABBO_FRIENDLIST_TRACKING_EVENT_REQUEST);
                        break;
                }
            }
            else
            {
                this._habboFriendList._Str_9727(_Str_3797.HABBO_FRIENDLIST_TRACKING_EVENT_MINIMZED);
            }
        }

        private function _Str_22949(k:_Str_2740):IWindow
        {
            var _local_2:IWindowContainer = IWindowContainer(this._habboFriendList.getXmlWindow("tab_content"));
            _local_2.background = true;
            _local_2.color = this._habboFriendList._Str_4930._Str_19241(k.id);
            _local_2.addChild(this._Str_23114(k));
            var _local_3:IItemListWindow = IItemListWindow(_local_2.findChildByName("list_content"));
            _local_3.color = this._habboFriendList._Str_4930._Str_19241(k.id);
            k._Str_4621._Str_13719(_local_3);
            return _local_2;
        }

        private function _Str_24172(k:IWindowContainer):void
        {
            var _local_2:IWindowContainer = (k.getChildByName("footer") as IWindowContainer);
            var _local_3:IWindowContainer = (k.getChildByName("list") as IWindowContainer);
            var _local_4:IWindow = (_local_3.getChildByName("scroller") as IWindow);
            var _local_5:IItemListWindow = IItemListWindow(_local_3.getChildByName("list_content"));
            var _local_6:IWindow = _local_3.parent;
            var _local_7:int = this._habboFriendList.tabs._Str_7233;
            var _local_8:int = this._habboFriendList.tabs._Str_12266;
            _local_6.height = Math.max(0, _local_8);
            _local_6.width = _local_7;
            var _local_9:int = Math.max(((_local_8 - _local_3.y) - _local_2.height), 0);
            _local_3.height = _local_9;
            _local_4.height = _local_9;
            _local_5.height = _local_9;
            _local_3.width = _local_7;
            _local_5.width = _local_7;
            _local_4.x = (_local_7 - 27);
            _local_2.y = (_local_8 - _local_2.height);
            _local_2.width = _local_7;
        }

        private function _Str_16245(k:IWindowContainer):void
        {
            var _local_2:IWindowContainer = (k.getChildByName("list") as IWindowContainer);
            var _local_3:IWindow = (_local_2.getChildByName("scroller") as IWindow);
            var _local_4:IItemListWindow = IItemListWindow(_local_2.getChildByName("list_content"));
            var _local_5:* = (_local_4.visibleRegion.height > _local_4.height);
            var _local_6:int = 22;
            var _local_7:int = (this._habboFriendList.tabs._Str_7233 - 10);
            var _local_8:int = (_local_7 - _local_6);
            var _local_9:int = ((_local_5) ? _local_8 : _local_7);
            _local_3.visible = _local_5;
            _local_4.width = _local_9;
            this.change(_local_4, _local_9);
        }

        private function change(k:IItemListWindow, _arg_2:int):void
        {
            var _local_4:IWindow;
            var _local_3:int;
            while (_local_3 < k.numListItems)
            {
                _local_4 = k.getListItemAt(_local_3);
                _local_4.width = _arg_2;
                _local_3++;
            }
        }

        private function _Str_23114(k:_Str_2740):IWindow
        {
            var _local_2:IWindowContainer = IWindowContainer(this._habboFriendList.getXmlWindow(k._Str_24165));
            k._Str_4621._Str_15797(_local_2);
            return _local_2;
        }
    }
}


