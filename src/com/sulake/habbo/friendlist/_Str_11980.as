package com.sulake.habbo.friendlist
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IContainerButtonWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.friendlist.domain.FriendRequest;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.utils._Str_3521;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.AcceptFriendMessageComposer;
    import com.sulake.habbo.friendlist.events._Str_2948;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.DeclineFriendMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;

    public class _Str_11980 implements _Str_6180, _Str_4097 
    {
        private static const NO_REQS_INFO:String = "no_reqs_info";

        private var _habboFriendList:HabboFriendList;
        private var _Str_1929:IItemListWindow;
        private var _Str_17060:IContainerButtonWindow;
        private var _Str_18246:IContainerButtonWindow;


        public function init(k:HabboFriendList):void
        {
            this._habboFriendList = k;
        }

        public function _Str_14366():int
        {
            return this._habboFriendList.friendRequests._Str_19367();
        }

        public function _Str_15797(k:IWindowContainer):void
        {
            this._Str_17060 = IContainerButtonWindow(k.findChildByName("accept_all_but"));
            this._Str_18246 = IContainerButtonWindow(k.findChildByName("reject_all_but"));
            this._Str_18246.procedure = this._Str_23039;
            this._Str_17060.procedure = this._Str_22777;
            this._Str_4295();
        }

        public function _Str_13719(k:IItemListWindow):void
        {
            var _local_2:FriendRequest;
            this._Str_1929 = k;
            for each (_local_2 in this._habboFriendList.friendRequests.requests)
            {
                this._Str_21250(_local_2);
                this._Str_6657(_local_2);
                k.addListItem(_local_2.view);
            }
            this._habboFriendList.friendRequests._Str_6988();
        }

        public function _Str_14179(k:int):void
        {
            if (this._Str_1929 == null)
            {
                return;
            }
            this._habboFriendList.friendRequests._Str_20199(true);
        }

        public function _Str_6988(k:FriendRequest, _arg_2:Boolean):void
        {
            if (this._Str_1929 == null)
            {
                return;
            }
            k.view.color = this._habboFriendList._Str_4930._Str_9273(_Str_2777._Str_3798, _arg_2);
            this._Str_20803(k.view, "reject");
            this._Str_20803(k.view, "accept");
        }

        public function _Str_6657(k:FriendRequest):void
        {
            if (this._Str_1929 == null)
            {
                return;
            }
            var _local_2:IWindowContainer = k.view;
            Util._Str_2930(_local_2);
            var _local_3:IWindow = _local_2.findChildByName("bg_region");
            _local_3.visible = true;
            _local_3.procedure = this._Str_6514;
            _local_3.id = k.requesterUserId;
            _local_2.findChildByName("user_info_region").visible = true;
            _Str_3521._Str_3927(false, _local_2);
            this._habboFriendList._Str_6498(_local_2, "requester_name_text", true, k.requesterName);
            if (k.state == FriendRequest._Str_5035)
            {
                this._habboFriendList._Str_17821(_local_2, "accept", true, this._Str_22888, k.requestId);
                this._habboFriendList._Str_17821(_local_2, "reject", true, this._Str_23925, k.requestId);
            }
            else
            {
                if (k.state == FriendRequest._Str_7320)
                {
                    this._habboFriendList._Str_6498(_local_2, "info_text", true, "${friendlist.request.accepted}");
                }
                else
                {
                    if (k.state == FriendRequest._Str_7073)
                    {
                        this._habboFriendList._Str_6498(_local_2, "info_text", true, "${friendlist.request.declined}");
                    }
                    else
                    {
                        if (k.state == FriendRequest._Str_15312)
                        {
                            this._habboFriendList._Str_6498(_local_2, "info_text", true, "${friendlist.request.failed}");
                        }
                    }
                }
            }
        }

        private function _Str_20803(k:IWindowContainer, _arg_2:String):void
        {
            var _local_3:IWindow = k.findChildByName(_arg_2);
            if (_local_3 != null)
            {
                _local_3.color = k.color;
            }
        }

        public function _Str_8472(k:FriendRequest):void
        {
            if (this._Str_1929 == null)
            {
                return;
            }
            this._Str_21250(k);
            this._Str_6657(k);
            this._Str_1929.addListItem(k.view);
            this._habboFriendList.friendRequests._Str_6988();
            this._Str_4295();
        }

        public function _Str_7667(k:FriendRequest):void
        {
            if (this._Str_1929 == null)
            {
                return;
            }
            this._Str_1929.removeListItem(k.view);
            this._Str_4295();
        }

        private function _Str_21250(k:FriendRequest):void
        {
            var _local_2:IWindowContainer = IWindowContainer(this._habboFriendList.getXmlWindow("friend_request_entry"));
            k.view = _local_2;
        }

        private function _Str_22888(k:WindowEvent, _arg_2:IWindow):void
        {
            this._habboFriendList.view._Str_3476(k, "${friendlist.tip.accept}");
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            var _local_3:int = _arg_2.id;
            Logger.log(("accept clicked: " + _local_3));
            this._Str_11273(_local_3);
        }

        public function _Str_11273(k:int):void
        {
            var _local_2:FriendRequest = this._habboFriendList.friendRequests._Str_19101(k);
            if (!_local_2)
            {
                return;
            }
            _local_2.state = FriendRequest._Str_7320;
            if (this._habboFriendList.categories._Str_5401(false) >= this._habboFriendList.friendRequests.limit)
            {
                this._habboFriendList._Str_18624();
                return;
            }
            var _local_3:AcceptFriendMessageComposer = new AcceptFriendMessageComposer();
            _local_3.addAcceptedRequest(_local_2.requestId);
            this._habboFriendList.send(_local_3);
            this._Str_6657(_local_2);
            this.refresh();
            if (((this._habboFriendList) && (this._habboFriendList.events)))
            {
                this._habboFriendList.events.dispatchEvent(new _Str_2948(_Str_2948.FRE_ACCEPTED, k));
            }
        }

        public function _Str_17684():void
        {
            var _local_2:FriendRequest;
            if ((this._habboFriendList.categories._Str_5401(false) + this._habboFriendList.friendRequests.requests.length) > this._habboFriendList.friendRequests.limit)
            {
                this._habboFriendList._Str_18624();
                return;
            }
            var k:AcceptFriendMessageComposer = new AcceptFriendMessageComposer();
            for each (_local_2 in this._habboFriendList.friendRequests.requests)
            {
                if (((!(_local_2.state == FriendRequest._Str_7320)) && (!(_local_2.state == FriendRequest._Str_7073))))
                {
                    k.addAcceptedRequest(_local_2.requestId);
                    _local_2.state = FriendRequest._Str_7320;
                    this._Str_6657(_local_2);
                    if (((this._habboFriendList) && (this._habboFriendList.events)))
                    {
                        this._habboFriendList.events.dispatchEvent(new _Str_2948(_Str_2948.FRE_ACCEPTED, _local_2.requestId));
                    }
                }
            }
            this._habboFriendList.send(k);
            this.refresh();
        }

        private function _Str_23925(k:WindowEvent, _arg_2:IWindow):void
        {
            this._habboFriendList.view._Str_3476(k, "${friendlist.tip.decline}");
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            var _local_3:int = _arg_2.id;
            Logger.log(("decline clicked: " + _local_3));
            this._Str_12175(_local_3);
        }

        public function _Str_12175(k:int):void
        {
            var _local_2:FriendRequest = this._habboFriendList.friendRequests._Str_19101(k);
            if (!_local_2)
            {
                return;
            }
            _local_2.state = FriendRequest._Str_7073;
            var _local_3:DeclineFriendMessageComposer = new DeclineFriendMessageComposer();
            _local_3.addDeclinedRequest(k);
            this._habboFriendList.send(_local_3);
            this._Str_6657(_local_2);
            this.refresh();
            if (((this._habboFriendList) && (this._habboFriendList.events)))
            {
                this._habboFriendList.events.dispatchEvent(new _Str_2948(_Str_2948.FRE_DECLINED, k));
            }
        }

        public function _Str_17225():void
        {
            var _local_2:FriendRequest;
            var k:DeclineFriendMessageComposer = new DeclineFriendMessageComposer();
            this._habboFriendList.send(k);
            for each (_local_2 in this._habboFriendList.friendRequests.requests)
            {
                if (((!(_local_2.state == FriendRequest._Str_7320)) && (!(_local_2.state == FriendRequest._Str_7073))))
                {
                    _local_2.state = FriendRequest._Str_7073;
                    this._Str_6657(_local_2);
                    if (((this._habboFriendList) && (this._habboFriendList.events)))
                    {
                        this._habboFriendList.events.dispatchEvent(new _Str_2948(_Str_2948.FRE_DECLINED, _local_2.requestId));
                    }
                }
            }
            this.refresh();
        }

        private function _Str_6514(k:WindowEvent, _arg_2:IWindow):void
        {
            this._habboFriendList.view._Str_3476(k, "${infostand.profile.link.tooltip}");
            _Str_3521._Str_6514(k, _arg_2);
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._habboFriendList.trackGoogle("extendedProfile", "friendList_friendRequests");
                this._habboFriendList.send(new _Str_2553(_arg_2.id));
            }
        }

        private function _Str_23039(k:WindowEvent, _arg_2:IWindow):void
        {
            this._habboFriendList.view._Str_3476(k, "${friendlist.tip.declineall}");
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log("Dismiss all clicked");
            this._Str_17225();
        }

        private function _Str_22777(k:WindowEvent, _arg_2:IWindow):void
        {
            this._habboFriendList.view._Str_3476(k, "${friendlist.tip.acceptall}");
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log("Accept all clicked");
            this._Str_17684();
        }

        private function refresh():void
        {
            this._Str_4295();
        }

        private function _Str_4295():void
        {
            var k:* = (this._habboFriendList.friendRequests._Str_19367() > 0);
            this._Str_6130(this._Str_17060, k);
            this._Str_6130(this._Str_18246, k);
        }

        private function _Str_6130(k:IContainerButtonWindow, _arg_2:Boolean):void
        {
            if (!k)
            {
                return;
            }
            if (_arg_2)
            {
                k.enable();
            }
            else
            {
                k.disable();
            }
        }
    }
}
