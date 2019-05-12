package com.sulake.habbo.friendlist
{
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_3696;
    import com.sulake.habbo.friendlist.domain.AvatarSearchResults;
    import com.sulake.habbo.utils._Str_3521;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import flash.ui.Keyboard;
    import com.sulake.habbo.communication.messages.outgoing.friendlist._Str_11941;
    import com.sulake.core.window.events.*;

    public class SearchView implements _Str_6180, _Str_7814 
    {
        private var _friendList:HabboFriendList;
        private var _searchStr:ITextFieldWindow;
        private var _list:IItemListWindow;


        public function init(k:HabboFriendList):void
        {
            this._friendList = k;
        }

        public function _Str_14366():int
        {
            if (this._friendList._Str_4227.friends == null)
            {
                return 0;
            }
            return this._friendList._Str_4227.friends.length + this._friendList._Str_4227.others.length;
        }

        public function _Str_13719(k:IItemListWindow):void
        {
            this._list = k;
        }

        public function _Str_15797(k:IWindowContainer):void
        {
            this._searchStr = ITextFieldWindow(k.findChildByName("search_str"));
            this._searchStr.procedure = this._Str_24321;
            this._searchStr.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN, this._Str_23556);
            k.findChildByName("search_but").procedure = this._Str_17805;
            this._friendList.refreshButton(k, "search", true, null, 0);
        }

        public function _Str_14179(k:int):void
        {
        }

        public function _Str_3836():void
        {
            var _local_3:Boolean;
            var _local_4:_Str_3696;
            var _local_5:_Str_3696;
            var _local_6:Boolean;
            this._list.autoArrangeItems = false;
            var k:AvatarSearchResults = this._friendList._Str_4227;
            var _local_2:int;
            while (true)
            {
                _local_3 = this._friendList._Str_21131();
                if (_local_2 == 0)
                {
                    this._Str_2966(true, _local_2, null, null, this._Str_22898(), false, false, 0);
                }
                else
                {
                    if (_local_2 <= k.friends.length)
                    {
                        _local_4 = k.friends[(_local_2 - 1)];
                        this._Str_2966(true, _local_2, _local_4._Str_17102, _local_4._Str_8751, null, ((_local_4._Str_25717) || (_local_3)), false, _local_4._Str_3251);
                    }
                    else
                    {
                        if (_local_2 == (k.friends.length + 1))
                        {
                            this._Str_2966(true, _local_2, null, null, this._Str_25692(), false, false, 0);
                        }
                        else
                        {
                            if (_local_2 <= ((k.friends.length + k.others.length) + 1))
                            {
                                _local_5 = k.others[((_local_2 - 2) - k.friends.length)];
                                this._Str_2966(true, _local_2, _local_5._Str_17102, _local_5._Str_8751, null, false, ((!(_local_5._Str_3251 == this._friendList._Str_3251)) && (!(this._friendList._Str_4227.isRequestFriend(_local_5._Str_3251)))), _local_5._Str_3251);
                            }
                            else
                            {
                                _local_6 = this._Str_2966(false, _local_2, null, null, null, false, false, 0);
                                if (_local_6)
                                {
                                    break;
                                }
                            }
                        }
                    }
                }
                _local_2++;
            }
            this._Str_6988();
            this._list.autoArrangeItems = true;
        }

        private function _Str_6988():void
        {
            var k:int;
            while (k < this._list.numListItems)
            {
                this._list.getListItemAt(k).color = this._friendList._Str_4930._Str_9273(_Str_2777._Str_5722, ((k % 2) == 1));
                k++;
            }
        }

        public function _Str_24265(k:String):void
        {
            this._searchStr.text = k;
        }

        public function focus():void
        {
            this._searchStr.focus();
        }

        private function _Str_22898():String
        {
            if (this._friendList._Str_4227.friends.length == 0)
            {
                return "${friendlist.search.nofriendsfound}";
            }
            this._friendList.registerParameter("friendlist.search.friendscaption", "cnt", ("" + this._friendList._Str_4227.friends.length));
            return "${friendlist.search.friendscaption}";
        }

        private function _Str_25692():String
        {
            if (this._friendList._Str_4227.others.length == 0)
            {
                return "${friendlist.search.noothersfound}";
            }
            this._friendList.registerParameter("friendlist.search.otherscaption", "cnt", ("" + this._friendList._Str_4227.others.length));
            return "${friendlist.search.otherscaption}";
        }

        private function _Str_2966(k:Boolean, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:Boolean, _arg_7:Boolean, _arg_8:int):Boolean
        {
            var _local_9:IWindowContainer = (this._list.getListItemAt(_arg_2) as IWindowContainer);
            if (_local_9 == null)
            {
                if (!k)
                {
                    return true;
                }
                _local_9 = IWindowContainer(this._friendList.getXmlWindow("search_entry"));
                _local_9.findChildByName("bg_region").procedure = this._Str_23827;
                this._list.addListItem(_local_9);
            }
            if (k)
            {
                _local_9.height = 20;
                _local_9.visible = true;
            }
            else
            {
                _local_9.height = 0;
                _local_9.visible = false;
            }
            _local_9.id = _arg_8;
            _local_9.findChildByName("bg_region").id = _arg_8;
            this._Str_16823(_local_9, _arg_3, (_arg_8 < 0));
            this._friendList._Str_6498(_local_9, "name", (!(_arg_4 == null)), _arg_4);
            this._friendList._Str_6498(_local_9, "caption", (!(_arg_5 == null)), _arg_5);
            this._friendList.refreshButton(_local_9, "start_chat", _arg_6, this._Str_18658, _arg_8);
            this._friendList.refreshButton(_local_9, "ask_for_friend", _arg_7, this._Str_25796, _arg_8);
            _Str_3521._Str_3927(false, _local_9);
            _local_9.findChildByName("user_info_region").visible = (_arg_8 > 0);
            return false;
        }

        private function _Str_16823(k:IWindowContainer, _arg_2:String, _arg_3:Boolean=false):void
        {
            var _local_4:IBitmapWrapperWindow = (k.getChildByName(HabboFriendList.FACE) as IBitmapWrapperWindow);
            if (((_arg_2 == null) || (_arg_2 == "")))
            {
                _local_4.visible = false;
            }
            else
            {
                if (_arg_3)
                {
                    _local_4.bitmap = this._friendList._Str_17617(_arg_2);
                }
                else
                {
                    _local_4.bitmap = this._friendList.getAvatarFaceBitmap(_arg_2);
                }
                _local_4.width = _local_4.bitmap.width;
                _local_4.height = _local_4.bitmap.height;
                _local_4.visible = true;
            }
        }

        private function _Str_23827(k:WindowEvent, _arg_2:IWindow):void
        {
            if (_arg_2.id < 1)
            {
                return;
            }
            this._friendList.view._Str_3476(k, "${infostand.profile.link.tooltip}");
            if (k.type == WindowMouseEvent.OVER)
            {
                _Str_3521._Str_3927(true, IWindowContainer(_arg_2.parent));
            }
            else
            {
                if (k.type == WindowMouseEvent.OUT)
                {
                    _Str_3521._Str_3927(false, IWindowContainer(_arg_2.parent));
                }
                else
                {
                    if (k.type == WindowMouseEvent.CLICK)
                    {
                        this._friendList.trackGoogle("extendedProfile", "friendList_friendsSearch");
                        this._friendList.send(new _Str_2553(_arg_2.id));
                    }
                }
            }
        }

        private function _Str_17805(k:WindowEvent, _arg_2:IWindow):void
        {
            this._friendList.view._Str_3476(k, "${friendlist.tip.search}");
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log(("Search clicked: " + _arg_2.name));
            this._Str_21962();
        }

        private function _Str_25796(k:WindowEvent, _arg_2:IWindow):void
        {
            this._friendList.view._Str_3476(k, "${friendlist.tip.addfriend}");
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log(("Ask for friend clicked: " + _arg_2.id));
            var _local_3:_Str_3696 = this._friendList._Str_4227._Str_21135(_arg_2.id);
            if (_local_3 == null)
            {
                Logger.log(("No search result found with id: " + _arg_2.id));
                return;
            }
            Logger.log(("Search result found: " + _local_3._Str_8751));
            var _local_4:Boolean = this._friendList._Str_14642(_local_3._Str_3251, _local_3._Str_8751);
            if (!_local_4)
            {
                this._friendList._Str_18624();
            }
            else
            {
                this._friendList._Str_23469(_local_3._Str_8751);
                this._Str_2966(true, this._Str_22578(_local_3._Str_3251), _local_3._Str_17102, _local_3._Str_8751, null, false, false, _local_3._Str_3251);
            }
        }

        private function _Str_22578(k:int):int
        {
            var _local_2:int;
            while (_local_2 < this._list.numListItems)
            {
                if (this._list.getListItemAt(_local_2).id == k)
                {
                    return _local_2;
                }
                _local_2++;
            }
            return -1;
        }

        private function _Str_18658(k:WindowEvent, _arg_2:IWindow):void
        {
            this._friendList.view._Str_3476(k, "${friendlist.tip.im}");
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            var _local_3:_Str_3696 = this._friendList._Str_4227._Str_21135(_arg_2.id);
            if (_local_3 == null)
            {
                Logger.log(("No search result found with id: " + _arg_2.id));
                return;
            }
            this._friendList.messenger.startConversation(_local_3._Str_3251);
        }

        private function _Str_24321(k:WindowEvent, _arg_2:IWindow):void
        {
            this._friendList.view._Str_3476(k, "${friendlist.tip.searchstr}");
        }

        private function _Str_23556(k:WindowKeyboardEvent):void
        {
            var _local_3:Keyboard;
            var _local_4:int;
            var _local_5:String;
            var _local_2:IWindow = IWindow(k.target);
            Logger.log(((((("Test key event " + k) + ", ") + k.type) + " ") + _local_2.name));
            if (k.charCode == Keyboard.ENTER)
            {
                this._Str_21962();
            }
            else
            {
                _local_4 = 25;
                _local_5 = this._searchStr.text;
                if (_local_5.length > _local_4)
                {
                    this._searchStr.text = _local_5.substring(0, _local_4);
                }
            }
        }

        private function _Str_21962():void
        {
            var k:String = this._searchStr.text;
            Logger.log(("Search avatar: " + k));
            if (k == "")
            {
                Logger.log("No text...");
                return;
            }
            this._friendList.send(new _Str_11941(k));
        }
    }
}


