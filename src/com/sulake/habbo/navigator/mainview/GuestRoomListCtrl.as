package com.sulake.habbo.navigator.mainview
{
    import com.sulake.habbo.navigator.IViewCtrl;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.navigator.RoomPopupCtrl;
    import com.sulake.core.window.components.IScrollbarWindow;
    import com.sulake.habbo.navigator.UserCountRenderer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.habbo.navigator.Util;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
    import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import flash.geom.Point;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
    import com.sulake.core.window.*;
    import com.sulake.core.window.components.*;
    import com.sulake.core.window.events.*;
    import com.sulake.habbo.navigator.*;

    public class GuestRoomListCtrl implements IViewCtrl 
    {
        protected var _navigator:HabboNavigator;
        private var _content:IWindowContainer;
        private var _list:IItemListWindow;
        private var _roomPopupCtrl:RoomPopupCtrl;
        private var _scrollV:IScrollbarWindow;
        protected var _userCountRenderer:UserCountRenderer;
        private var _lastHilite:IWindowContainer;
        private var _lastMouseX:int;
        private var _fastHorizontalMove:Boolean;
        private var _entryWidthAdjustment:int;
        private var _showRoomNumbers:Boolean;

        public function GuestRoomListCtrl(k:HabboNavigator, _arg_2:int, _arg_3:Boolean):void
        {
            this._navigator = k;
            this._entryWidthAdjustment = _arg_2;
            this._showRoomNumbers = _arg_3;
            this._roomPopupCtrl = new RoomPopupCtrl(this._navigator, 5, -5);
            this._userCountRenderer = new UserCountRenderer(this._navigator);
        }

        public function dispose():void
        {
            if (this._roomPopupCtrl)
            {
                this._roomPopupCtrl.dispose();
                this._roomPopupCtrl = null;
            }
            if (this._userCountRenderer)
            {
                this._userCountRenderer.dispose();
                this._userCountRenderer = null;
            }
        }

        public function set content(k:IWindowContainer):void
        {
            this._content = k;
            this._list = ((this._content) ? IItemListWindow(this._content.findChildByName("item_list")) : null);
            this._scrollV = ((this._content) ? IScrollbarWindow(this._content.findChildByName("scroller")) : null);
            if (((k == null) && (this._roomPopupCtrl)))
            {
                this._roomPopupCtrl._Str_17240();
            }
        }

        public function get content():IWindowContainer
        {
            return this._content;
        }

        public function refresh():void
        {
            var _local_4:Boolean;
            var k:Array = this.getRooms();
            var _local_2:int = this.getVisibleEntryCount();
            this._list.autoArrangeItems = false;
            var _local_3:int;
            while (true)
            {
                if (_local_3 < k.length)
                {
                    this.refreshEntry(true, _local_3, k[_local_3]);
                }
                else
                {
                    _local_4 = this.refreshEntry(false, _local_3, null);
                    if (_local_4)
                    {
                        break;
                    }
                }
                _local_3++;
            }
            this._list.autoArrangeItems = true;
            if (((!(this._scrollV == null)) && (!(this.getVisibleEntryCount() == _local_2))))
            {
                this._scrollV.scrollV = 0;
            }
            if (this._content.findChildByName("no_rooms_found"))
            {
                this._content.findChildByName("no_rooms_found").visible = (k.length < 1);
            }
        }

        private function getVisibleEntryCount():int
        {
            var k:int;
            var _local_2:int;
            while (_local_2 < this._list.numListItems)
            {
                if (this._list.getListItemAt(_local_2).visible)
                {
                    k++;
                }
                _local_2++;
            }
            return k;
        }

        protected function getListEntry(k:int):IWindowContainer
        {
            var _local_3:int;
            var _local_2:IWindowContainer = IWindowContainer(this._navigator.getXmlWindow("grs_guest_room_details_phase_one"));
            _local_2.background = true;
            _local_2.addEventListener(WindowMouseEvent.MOVE, this.onMouseMove);
            _local_2.addEventListener(WindowMouseEvent.OVER, this.onMouseOver);
            _local_2.addEventListener(WindowMouseEvent.OUT, this.onMouseOut);
            _local_2.addEventListener(WindowMouseEvent.CLICK, this.onMouseClick);
            _local_2.setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, true);
            _local_2.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRETCH, true);
            _local_2.color = this.getBgColor(k);
            _local_2.tags.push(k);
            if (this._showRoomNumbers)
            {
                _local_3 = 20;
                _local_2.findChildByName("roomname").x = (_local_2.findChildByName("roomname").x + _local_3);
                _local_2.findChildByName("roomname").width = (_local_2.findChildByName("roomname").width - _local_3);
            }
            return _local_2;
        }

        protected function getBgColor(k:int):uint
        {
            return ((k % 2) != 0) ? 0xFFFFFFFF : 4292797682;
        }

        private function refreshEntry(k:Boolean, _arg_2:int, _arg_3:GuestRoomData):Boolean
        {
            var _local_4:IWindowContainer = IWindowContainer(this._list.getListItemAt(_arg_2));
            var _local_5:Boolean;
            if (_local_4 == null)
            {
                if (!k)
                {
                    return true;
                }
                _local_4 = this.getListEntry(_arg_2);
                this._list.addListItem(_local_4);
                _local_5 = true;
            }
            Util._Str_2930(_local_4);
            if (k)
            {
                this.refreshEntryDetails(_local_4, _arg_3);
                _local_4.visible = true;
                _local_4.height = 17;
            }
            else
            {
                _local_4.height = 0;
                _local_4.visible = false;
            }
            if (_local_5)
            {
                _local_4.width = (_local_4.width + this._entryWidthAdjustment);
                MainViewCtrl._Str_24055(this, _local_4);
            }
            return false;
        }

        protected function refreshEntryDetails(k:IWindowContainer, _arg_2:GuestRoomData):void
        {
            k.visible = true;
            Util._Str_2930(k);
            this.refreshFavouriteIcon(k, _arg_2);
            var _local_3:String = ((((_arg_2.doorMode == RoomSettingsFlatInfo.DOORMODE_CLOSED) || (_arg_2.doorMode == RoomSettingsFlatInfo.DOORMODE_PASSWORD)) || (_arg_2.doorMode == RoomSettingsFlatInfo.DOORMODE_INVISIBLE)) ? "group_base_icon" : "group_base_icon_no_doormode");
            this._navigator.refreshButton(k, _local_3, (_arg_2.habboGroupId > 0), null, 0, "group_base_icon");
            this._navigator.refreshButton(k, "home", this.isHome(_arg_2), null, 0);
            this._navigator.refreshButton(k, "doormode_doorbell_small", (_arg_2.doorMode == RoomSettingsFlatInfo.DOORMODE_CLOSED), null, 0);
            this._navigator.refreshButton(k, "doormode_password_small", (_arg_2.doorMode == RoomSettingsFlatInfo.DOORMODE_PASSWORD), null, 0);
            this._navigator.refreshButton(k, "doormode_invisible_small", (_arg_2.doorMode == RoomSettingsFlatInfo.DOORMODE_INVISIBLE), null, 0);
            if (this._showRoomNumbers)
            {
                k.findChildByName("room_number").visible = true;
                k.findChildByName("room_number").caption = ((k.tags[0] + 2) + ".");
            }
            this.refreshRoomName(k, _arg_2);
            this._userCountRenderer.refreshUserCount(_arg_2.maxUserCount, k, _arg_2.userCount, "${navigator.usercounttooltip.users}", 308, 2);
            k.name = ((("guestroom_" + _arg_2.ownerName) + "_") + _arg_2.roomName);
        }

        private function refreshRoomName(k:IWindowContainer, _arg_2:GuestRoomData):void
        {
            var _local_3:ITextWindow = ITextWindow(k.getChildByName("roomname"));
            _local_3.visible = true;
            var _local_4:Boolean = (((k.findChildByName("home").visible) || (k.findChildByName("favourite").visible)) || (k.findChildByName("make_favourite").visible));
            Util._Str_21212(_local_3, _arg_2.roomName, ((_local_4) ? (_local_3.width - 20) : _local_3.width));
        }

        protected function onMouseMove(k:WindowEvent):void
        {
            this.checkFastHorizontalMove(k);
        }

        protected function onMouseOver(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            if (((this._roomPopupCtrl.visible) && (this._fastHorizontalMove)))
            {
                return;
            }
            this.hilite(IWindowContainer(_local_2));
            var _local_3:int = _local_2.tags[0];
            var _local_4:GuestRoomData = this.getRoomAt(_local_3);
            if (_local_4 == null)
            {
                return;
            }
            this._roomPopupCtrl.room = _local_4;
            this._roomPopupCtrl._Str_8168(_local_2);
        }

        public function getRooms():Array
        {
            return ((((this._navigator == null) || (this._navigator.data == null)) || (this._navigator.data.guestRoomSearchResults == null)) || (this._navigator.data.guestRoomSearchResults.rooms == null)) ? (new Array()) : this._navigator.data.guestRoomSearchResults.rooms;
        }

        private function getRoomAt(k:int):GuestRoomData
        {
            return this.getRooms()[k];
        }

        protected function onMouseOut(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            if (Util._Str_21690(_local_2))
            {
                return;
            }
            var _local_3:int = _local_2.tags[0];
            _local_2.color = this.getBgColor(_local_3);
            this._roomPopupCtrl._Str_17240();
        }

        protected function onMouseClick(k:WindowEvent):void
        {
            var _local_5:Point;
            var _local_2:IWindow = k.target;
            var _local_3:int = _local_2.tags[0];
            var _local_4:GuestRoomData = this.getRoomAt(_local_3);
            if (_local_4 == null)
            {
                return;
            }
            if (_local_4.ownerName != this._navigator.sessionData.userName)
            {
                if (_local_4.habboGroupId != 0)
                {
                    this._navigator.goToPrivateRoom(_local_4.flatId);
                    return;
                }
                _local_5 = new Point((k as WindowMouseEvent).stageX, (k as WindowMouseEvent).stageY);
                switch (_local_4.doorMode)
                {
                    case RoomSettingsFlatInfo.DOORMODE_PASSWORD:
                        this._navigator.passwordInput.show(_local_4, _local_5);
                        return;
                    case RoomSettingsFlatInfo.DOORMODE_CLOSED:
                        this._navigator.doorbell.show(_local_4, _local_5);
                        return;
                }
            }
            this.beforeEnterRoom(_local_3);
            this._navigator.goToRoom(_local_4.flatId, true, "", _local_3);
            this._roomPopupCtrl._Str_14696();
        }

        public function beforeEnterRoom(k:int):void
        {
        }

        private function refreshFavouriteIcon(k:IWindowContainer, _arg_2:GuestRoomData):void
        {
            var _local_3:Boolean = this._navigator.data._Str_20543(_arg_2.flatId);
            var _local_4:Boolean = this.isHome(_arg_2);
            this.refreshRegion(k, "make_favourite", ((!(_local_3)) && (!(_local_4))), this.onAddFavouriteClick);
            this.refreshRegion(k, "favourite", ((_local_3) && (!(_local_4))), this.onRemoveFavouriteClick);
        }

        private function isHome(k:GuestRoomData):Boolean
        {
            return k.flatId == this._navigator.data.homeRoomId;
        }

        private function refreshRegion(k:IWindowContainer, _arg_2:String, _arg_3:Boolean, _arg_4:Function):void
        {
            var _local_5:IRegionWindow = (k.findChildByName(_arg_2) as IRegionWindow);
            if (!_local_5)
            {
                return;
            }
            if (!_arg_3)
            {
                _local_5.visible = false;
                if (_local_5.hasEventListener(WindowMouseEvent.CLICK))
                {
                    _local_5.removeEventListener(WindowMouseEvent.CLICK, _arg_4);
                }
            }
            else
            {
                _local_5.addEventListener(WindowMouseEvent.CLICK, _arg_4);
                _local_5.visible = true;
                this._navigator.refreshButton(_local_5, _arg_2, _arg_3, null, 0);
            }
        }

        private function onRemoveFavouriteClick(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = k.target;
            if (((_local_2 == null) || (_local_2.parent == null)))
            {
                return;
            }
            var _local_3:GuestRoomData = this.getRoomAt(_local_2.parent.tags[0]);
            if (_local_3 == null)
            {
                return;
            }
            this._navigator.send(new DeleteFavouriteRoomMessageComposer(_local_3.flatId));
        }

        private function onAddFavouriteClick(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = k.target;
            if (((_local_2 == null) || (_local_2.parent == null)))
            {
                return;
            }
            var _local_3:GuestRoomData = this.getRoomAt(int(_local_2.parent.tags[0]));
            if (_local_3 == null)
            {
                return;
            }
            this._navigator.send(new AddFavouriteRoomMessageComposer(_local_3.flatId));
        }

        private function hilite(k:IWindowContainer):void
        {
            var _local_2:int;
            if (((!(this._lastHilite == null)) && (!(this._lastHilite.disposed))))
            {
                _local_2 = this._lastHilite.tags[0];
                this._lastHilite.color = this.getBgColor(_local_2);
            }
            this._lastHilite = k;
            k.color = 4288861930;
        }

        private function checkFastHorizontalMove(k:WindowEvent):void
        {
            var _local_2:WindowMouseEvent = WindowMouseEvent(k);
            var _local_3:int = Math.abs((this._lastMouseX - _local_2.stageX));
            this._lastMouseX = _local_2.stageX;
            this._fastHorizontalMove = (_local_3 > 2);
        }

        public function get roomPopupCtrl():RoomPopupCtrl
        {
            return this._roomPopupCtrl;
        }

        public function get navigator():HabboNavigator
        {
            return this._navigator;
        }
    }
}
