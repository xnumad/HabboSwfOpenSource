package com.sulake.habbo.friendlist
{
    import com.sulake.core.window.components.IContainerButtonWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.friendlist.domain._Str_2591;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.friendlist.domain.Friend;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.habbo.utils._Str_3521;
    import com.sulake.core.window.IWindow;
    import flash.display.BitmapData;
    import com.sulake.core.utils.ErrorReportStorage;
    import flash.geom.Point;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.friendlist._Str_4348;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import com.sulake.habbo.utils.HabboWebTools;
    import flash.utils.Dictionary;
    import flash.utils.getTimer;
    import com.sulake.core.window.components.ITextWindow;

    public class FriendsView implements _Str_6180, _Str_6567 
    {
        public static const BG:String = "bg";
        private static const _Str_20579:int = 14;
        public static const _Str_13372:int = 60000;

        private var _friendList:HabboFriendList;
        private var _minimailButton:IContainerButtonWindow;
        private var _homeButton:IContainerButtonWindow;
        private var _inviteButton:IContainerButtonWindow;
        private var _removeButton:IContainerButtonWindow;
        private var _list:IItemListWindow;
        private var _relationshipStatusSelector:_Str_9231;


        public function init(k:HabboFriendList):void
        {
            this._friendList = k;
        }

        public function _Str_14366():int
        {
            return this._friendList.categories._Str_5401(true);
        }

        public function _Str_15797(k:IWindowContainer):void
        {
            this._minimailButton = this._Str_14329("open_minimail", this._Str_24605, k);
            this._homeButton = this._Str_14329("open_homepage", this._Str_25436, k);
            this._inviteButton = this._Str_14329("room_invite", this._Str_25558, k);
            this._removeButton = this._Str_14329("remove_friend", this._Str_23409, k);
            this._Str_4295();
        }

        public function _Str_13719(k:IItemListWindow):void
        {
            this._list = k;
            this._Str_3836();
        }

        public function _Str_14179(k:int):void
        {
            if (this._relationshipStatusSelector)
            {
                this._relationshipStatusSelector._Str_17733();
            }
        }

        public function _Str_9276():void
        {
            this._friendList.tabs._Str_4403(_Str_2777._Str_4113)._Str_9276(true);
        }

        public function _Str_3836():void
        {
            var _local_2:_Str_2591;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:Boolean;
            if (this._list == null)
            {
                return;
            }
            if (!this._relationshipStatusSelector)
            {
                this._relationshipStatusSelector = new _Str_9231(this._friendList);
            }
            this._relationshipStatusSelector._Str_17733();
            this._list.autoArrangeItems = false;
            var k:int;
            for each (_local_2 in this._friendList.categories._Str_17858())
            {
                this._Str_2966(true, k, _local_2, null);
                k++;
                if (_local_2.open)
                {
                    _local_3 = _local_2._Str_23845();
                    _local_4 = _local_2._Str_25646();
                    _local_5 = _local_3;
                    while (_local_5 < _local_4)
                    {
                        this._Str_2966(true, k, _local_2, _local_2.friends[_local_5]);
                        k++;
                        _local_5++;
                    }
                }
            }
            while (true)
            {
                _local_6 = this._Str_2966(false, k, null, null);
                if (_local_6)
                {
                    break;
                }
                k++;
            }
            this._list.autoArrangeItems = true;
            this._Str_4295();
        }

        public function _Str_18123():void
        {
            if (this._relationshipStatusSelector)
            {
                this._relationshipStatusSelector._Str_17733();
            }
        }

        private function _Str_14329(k:String, _arg_2:Function, _arg_3:IWindowContainer):IContainerButtonWindow
        {
            var _local_4:IContainerButtonWindow = IContainerButtonWindow(_arg_3.findChildByName(("button_" + k)));
            _local_4.procedure = _arg_2;
            var _local_5:IBitmapWrapperWindow = IBitmapWrapperWindow(_local_4.findChildByName("icon"));
            _local_5.bitmap = this._friendList._Str_3122(k);
            _local_5.width = _local_5.bitmap.width;
            _local_5.height = _local_5.bitmap.height;
            return _local_4;
        }

        private function _Str_2966(k:Boolean, _arg_2:int, _arg_3:_Str_2591, _arg_4:Friend):Boolean
        {
            var _local_5:* = ((_arg_2 % 2) == 1);
            var _local_6:IWindowContainer = (this._list.getListItemAt(_arg_2) as IWindowContainer);
            if (_local_6 == null)
            {
                if (!k)
                {
                    return true;
                }
                _local_6 = IWindowContainer(this._friendList.getXmlWindow("friend_entry"));
                _local_6.findChildByName("user_info_region").procedure = this._Str_3746;
                this._list.addListItem(_local_6);
            }
            Util._Str_2930(_local_6);
            if (!k)
            {
                _local_6.height = 0;
                _local_6.visible = false;
                return false;
            }
            _local_6.height = 20;
            _local_6.visible = true;
            _local_6.color = this._friendList._Str_4930._Str_9273(_Str_2777._Str_4113, _local_5);
            if (_arg_4 == null)
            {
                _arg_3.view = _local_6;
                this._Str_12989(_arg_3, _local_5);
            }
            else
            {
                _arg_4.view = _local_6;
                this._Str_22942(_arg_3, _arg_4, _local_5);
            }
            return false;
        }

        public function _Str_12989(k:_Str_2591, _arg_2:Boolean):void
        {
            if (this._list == null)
            {
                return;
            }
            var _local_3:IWindowContainer = k.view;
            _local_3.tags.splice(0, _local_3.tags.length);
            _local_3.tags.push(k.id);
            this._friendList._Str_6498(_local_3, "caption", true, (((k.name + " (") + k.friends.length) + ")"));
            this._Str_19990(_local_3, "arrow_down_black", k.open, k.id, 6);
            this._Str_19990(_local_3, "arrow_right_black", (!(k.open)), k.id, 9);
            _local_3.procedure = this._Str_20246;
            _local_3.visible = false;
            this._Str_22394(k, _arg_2);
            _local_3.height = Math.max(Util._Str_2647(_local_3), 20);
            _local_3.visible = true;
        }

        private function _Str_22942(k:_Str_2591, _arg_2:Friend, _arg_3:Boolean=false):void
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return;
            }
            var _local_4:IWindowContainer = _arg_2.view;
            if (_local_4 == null)
            {
                return;
            }
            _local_4.id = _arg_2.id;
            _local_4.procedure = this._Str_23153;
            _local_4.visible = true;
            if (_arg_2.selected)
            {
                _local_4.color = this._friendList._Str_4930._Str_22500();
            }
            else
            {
                if (_arg_3)
                {
                    _local_4.color = this._friendList._Str_4930._Str_9273(_Str_2777._Str_4113, true);
                }
            }
            ILabelWindow(_arg_2.view.findChildByName("name")).textColor = this._friendList._Str_4930._Str_25579(_arg_2.selected);
            var _local_5:String = _arg_2.name;
            if (((!(_arg_2.realName == null)) && (!(_arg_2.realName == ""))))
            {
                _local_5 = (((_local_5 + " (") + _arg_2.realName) + ")");
            }
            this._friendList._Str_6498(_local_4, "name", true, _local_5);
            var _local_6:Boolean = ((this._friendList._Str_21131()) && ((_arg_2._Str_9624) || (_arg_2.pocketHabboUser)));
            this._friendList.refreshButton(_local_4, "start_chat", ((_arg_2.online) || (_local_6)), this._Str_18658, _arg_2.id);
            this._friendList.refreshButton(_local_4, "follow_friend", _arg_2._Str_4501, this._Str_23763, _arg_2.id);
            this._friendList._Str_25274(_local_4, "relationship_status", _arg_2._Str_10060, this._Str_24109, _arg_2.id);
            this._Str_16823(_local_4, _arg_2);
            _local_4.findChildByName("user_info_region").visible = true;
            _local_4.findChildByName("user_info_region").id = _arg_2.id;
            _Str_3521._Str_3927(false, _local_4);
        }

        private function _Str_19990(k:IWindowContainer, _arg_2:String, _arg_3:Boolean, _arg_4:int, _arg_5:int):void
        {
            var _local_6:ILabelWindow;
            var _local_7:IWindow;
            this._friendList.refreshButton(k, _arg_2, _arg_3, this._Str_20246, _arg_4);
            if (_arg_3)
            {
                _local_6 = ILabelWindow(k.findChildByName("caption"));
                _local_7 = k.findChildByName(_arg_2);
                _local_7.x = (_local_6.textWidth + _arg_5);
            }
        }

        private function _Str_16823(k:IWindowContainer, _arg_2:Friend):void
        {
            var _local_4:BitmapData;
            if (!k)
            {
                ErrorReportStorage.addDebugData("FriendsView", "refreshFigure: e is null!");
            }
            if (!_arg_2)
            {
                ErrorReportStorage.addDebugData("FriendsView", "refreshFigure: f is null!");
            }
            var _local_3:IBitmapWrapperWindow = (k.getChildByName(HabboFriendList.FACE) as IBitmapWrapperWindow);
            if (!_local_3)
            {
                ErrorReportStorage.addDebugData("FriendsView", "refreshFigure: child is null!");
            }
            if (!this._friendList)
            {
                ErrorReportStorage.addDebugData("FriendsView", "refreshFigure: _friendList is null!");
            }
            if (((_arg_2.figure == null) || (_arg_2.figure == "")))
            {
                _local_3.visible = false;
            }
            else
            {
                if (_arg_2.face == null)
                {
                    if (_arg_2._Str_19416())
                    {
                        _arg_2.face = this._friendList._Str_17617(_arg_2.figure);
                    }
                    else
                    {
                        _arg_2.face = this._friendList.getAvatarFaceBitmap(_arg_2.figure);
                    }
                }
                if (_local_3.bitmap == null)
                {
                    _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height);
                }
                if (_local_3.tags[0] != _arg_2.figure)
                {
                    _local_3.tags.splice(0, _local_3.tags.length);
                    _local_3.tags.push(_arg_2.figure);
                    _local_3.bitmap.fillRect(_local_3.bitmap.rect, 0);
                    _local_4 = _arg_2.face;
                    if (_local_4)
                    {
                        _local_3.bitmap.copyPixels(_local_4, _local_4.rect, new Point(0, 0), null, null, true);
                    }
                }
                else
                {
                    Logger.log(("Figure unchanged: " + _local_3.tags[0]));
                }
                _local_3.visible = true;
            }
        }

        private function getBgColor(k:Boolean):uint
        {
            return this._friendList._Str_4930._Str_9273(_Str_2777._Str_4113, k);
        }

        private function _Str_4295():void
        {
            var k:Array = this._friendList.categories._Str_8217();
            this._Str_6130(this._minimailButton, this._Str_23891(k));
            this._Str_6130(this._homeButton, this._Str_25087(k));
            this._Str_6130(this._inviteButton, this._Str_25613(k));
            this._Str_6130(this._removeButton, this._Str_22478(k));
        }

        private function _Str_6130(k:IContainerButtonWindow, _arg_2:Boolean):void
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

        private function _Str_23891(k:Array):Boolean
        {
            return (this._friendList._Str_17007()) || (k.length == 1);
        }

        private function _Str_25087(k:Array):Boolean
        {
            return k.length == 1;
        }

        private function _Str_25613(k:Array):Boolean
        {
            var _local_2:Friend;
            if (k.length < 1)
            {
                return false;
            }
            for each (_local_2 in k)
            {
                if (_local_2.online)
                {
                    return true;
                }
            }
            return true;
        }

        private function _Str_22478(k:Array):Boolean
        {
            return k.length > 0;
        }

        private function _Str_20246(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log(((("Category clicked: " + _arg_2.name) + ", ") + _arg_2.tags[0]));
            if (_arg_2.tags.length == 0)
            {
                _arg_2 = _arg_2.parent;
            }
            Logger.log(((("Category id: " + _arg_2.name) + ", ") + _arg_2.tags[0]));
            var _local_3:int = _arg_2.tags[0];
            Logger.log(("Cat id: " + _local_3));
            var _local_4:_Str_2591 = this._friendList.categories._Str_5067(_local_3);
            _local_4._Str_22255((!(_local_4.open)));
            this._Str_3836();
            this._friendList.view.refresh("Cat open/closed");
        }

        private function _Str_23153(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:Friend;
            if (_arg_2 == null)
            {
                return;
            }
            if (_arg_2.id == 0)
            {
                _arg_2 = _arg_2.parent;
                if (_arg_2 == null)
                {
                    return;
                }
            }
            if (((k.type == WindowMouseEvent.CLICK) || (k.type == WindowMouseEvent.DOUBLE_CLICK)))
            {
                _local_3 = this._friendList.categories._Str_13534(_arg_2.id);
                _local_3.selected = ((!(_local_3 == null)) && (!(_local_3.selected)));
                this._Str_4295();
                this._Str_3836();
                if ((((k.type == WindowMouseEvent.DOUBLE_CLICK) && (!(_local_3 == null))) && (_local_3.online)))
                {
                    this._friendList.messenger.startConversation(_local_3.id);
                }
            }
        }

        private function _Str_18658(k:WindowEvent, _arg_2:IWindow):void
        {
            this._friendList.view._Str_3476(k, "${friendlist.tip.im}");
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log(((("chat clicked: " + _arg_2.name) + ", ") + _arg_2.id));
            this._friendList.messenger.startConversation(_arg_2.id);
        }

        private function _Str_23763(k:WindowEvent, _arg_2:IWindow):void
        {
            this._friendList.view._Str_3476(k, "${friendlist.tip.follow}");
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._friendList.send(new _Str_4348(_arg_2.id));
            this._friendList.send(new EventLogMessageComposer("Navigation", "Friend List", "go.friendlist"));
        }

        private function _Str_24109(k:WindowEvent, _arg_2:IWindow):void
        {
            if (_arg_2 == null)
            {
                return;
            }
            if (_arg_2.id == 0)
            {
                _arg_2 = _arg_2.parent;
                if (_arg_2 == null)
                {
                    return;
                }
            }
            this._friendList.view._Str_3476(k, "${friendlist.tip.relationship}");
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._relationshipStatusSelector._Str_9566 = _arg_2.id;
                this._relationshipStatusSelector._Str_24722(_arg_2, this._friendList.view.mainWindow);
            }
        }

        private function _Str_3746(k:WindowEvent, _arg_2:IWindow):void
        {
            this._friendList.view._Str_3476(k, "${infostand.profile.link.tooltip}");
            if (k.type == WindowMouseEvent.OVER)
            {
                _Str_3521._Str_3927(true, IWindowContainer(_arg_2));
            }
            else
            {
                if (k.type == WindowMouseEvent.OUT)
                {
                    _Str_3521._Str_3927(false, IWindowContainer(_arg_2));
                }
                else
                {
                    if (k.type == WindowMouseEvent.CLICK)
                    {
                        this._friendList.trackGoogle("extendedProfile", "friendList_friendsView");
                        this._friendList.send(new _Str_2553(_arg_2.parent.id));
                    }
                }
            }
        }

        private function _Str_24605(k:WindowEvent, _arg_2:IWindow):void
        {
            this._friendList.view._Str_3476(k, "${friendlist.tip.compose}");
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            var _local_3:Array = this._friendList.categories._Str_8217();
            if (_local_3.length == 0)
            {
                Logger.log("No friend found when minimail clicked");
                if (this._friendList._Str_17007())
                {
                    HabboWebTools.openMinimail("#mail/inbox/");
                }
                return;
            }
            var _local_4:Dictionary = new Dictionary();
            var _local_5:Array = new Array();
            var _local_6:int;
            while (((_local_6 < _local_3.length) && (_local_6 < 50)))
            {
                _local_5.push(_local_3[_local_6].id);
                _local_6++;
            }
            _local_4["recipientid"] = _local_5.join(",");
            _local_4["random"] = ("" + Math.round((Math.random() * 100000000)));
            var _local_7:WindowMouseEvent = (k as WindowMouseEvent);
            if (this._friendList._Str_17007())
            {
                HabboWebTools.openMinimail((((("#mail/compose/" + _local_4["recipientid"]) + "/") + _local_4["random"]) + "/"));
            }
            else
            {
                this._friendList._Str_12559("link.format.mail.compose", _local_4, _local_7.stageX, _local_7.stageY);
            }
        }

        private function _Str_25436(k:WindowEvent, _arg_2:IWindow):void
        {
            this._friendList.view._Str_3476(k, "${friendlist.tip.home}");
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            var _local_3:Friend = this._friendList.categories._Str_23393();
            if (_local_3 == null)
            {
                Logger.log("No friend found when home clicked");
                return;
            }
            var _local_4:Dictionary = new Dictionary();
            _local_4["ID"] = ("" + _local_3.id);
            _local_4["username"] = _local_3.name;
            var _local_5:WindowMouseEvent = (k as WindowMouseEvent);
            this._friendList._Str_12559("link.format.userpage", _local_4, _local_5.stageX, _local_5.stageY);
        }

        private function _Str_25558(k:WindowEvent, _arg_2:IWindow):void
        {
            this._friendList.view._Str_3476(k, "${friendlist.tip.invite}");
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if ((getTimer() - this._friendList._Str_23875) < _Str_13372)
            {
                this._friendList.simpleAlert("${friendlist.invite.frequentalert.title}", "${friendlist.invite.frequentalert.text}");
                return;
            }
            new _Str_11876(this._friendList).show();
        }

        private function _Str_23409(k:WindowEvent, _arg_2:IWindow):void
        {
            this._friendList.view._Str_3476(k, "${friendlist.tip.remove}");
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            new _Str_12478(this._friendList).show();
        }

        private function _Str_22394(k:_Str_2591, _arg_2:Boolean):void
        {
            var _local_3:IWindowContainer = IWindowContainer(k.view.findChildByName("pager"));
            if (((k._Str_11426() < 2) || (!(k.open))))
            {
                Logger.log(((("PAGER NOT VISIBLE: " + k.open) + ", ") + k._Str_11426()));
                _local_3.visible = false;
                return;
            }
            _local_3.visible = true;
            Util._Str_2930(_local_3);
            var _local_4:int;
            while (_local_4 < k._Str_11426())
            {
                this._Str_22539(_local_3, _local_4, k.pageIndex, _arg_2);
                _local_4++;
            }
            Util._Str_7173(_local_3, _local_3.width, 15);
            _local_3.height = Util._Str_2647(_local_3);
        }

        private function _Str_22539(k:IWindowContainer, _arg_2:int, _arg_3:int, _arg_4:Boolean):void
        {
            var _local_5:String = ("page." + _arg_2);
            var _local_6:ITextWindow = ITextWindow(k.getChildByName(_local_5));
            if (_local_6 == null)
            {
                _local_6 = ITextWindow(this._friendList.getXmlWindow("pagelink"));
                _local_6.name = _local_5;
                k.addChild(_local_6);
            }
            _local_6.underline = (!(_arg_2 == _arg_3));
            _local_6.text = ((("" + ((_arg_2 * _Str_2591._Str_3331) + 1)) + "-") + ("" + ((_arg_2 + 1) * _Str_2591._Str_3331)));
            _local_6.id = _arg_2;
            _local_6.procedure = this._Str_23254;
            _local_6.width = (_local_6.textWidth + 5);
            _local_6.color = this._friendList._Str_4930._Str_9273(_Str_2777._Str_4113, _arg_4);
            _local_6.visible = true;
        }

        private function _Str_23254(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            var _local_3:ITextWindow = ITextWindow(_arg_2);
            var _local_4:int = _local_3.parent.parent.tags[0];
            var _local_5:int = _local_3.id;
            Logger.log(((("Page link clicked: " + _local_4) + ", ") + _local_5));
            var _local_6:_Str_2591 = this._friendList.categories._Str_5067(_local_4);
            _local_6.pageIndex = _local_5;
            this._Str_3836();
        }
    }
}


