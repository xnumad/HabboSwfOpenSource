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
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_3560;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import flash.geom.Point;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_5262;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_4893;
    import com.sulake.core.window.*;
    import com.sulake.core.window.components.*;
    import com.sulake.core.window.events.*;
    import com.sulake.habbo.navigator.*;

    public class GuestRoomListCtrl implements IViewCtrl 
    {
        protected var _Str_2272:HabboNavigator;
        private var _content:IWindowContainer;
        private var _Str_1929:IItemListWindow;
        private var _Str_4871:RoomPopupCtrl;
        private var _Str_3375:IScrollbarWindow;
        protected var _Str_3220:UserCountRenderer;
        private var _Str_12349:IWindowContainer;
        private var _Str_22153:int;
        private var _Str_19895:Boolean;
        private var _Str_21859:int;
        private var _Str_16040:Boolean;

        public function GuestRoomListCtrl(k:HabboNavigator, _arg_2:int, _arg_3:Boolean):void
        {
            this._Str_2272 = k;
            this._Str_21859 = _arg_2;
            this._Str_16040 = _arg_3;
            this._Str_4871 = new RoomPopupCtrl(this._Str_2272, 5, -5);
            this._Str_3220 = new UserCountRenderer(this._Str_2272);
        }

        public function dispose():void
        {
            if (this._Str_4871)
            {
                this._Str_4871.dispose();
                this._Str_4871 = null;
            }
            if (this._Str_3220)
            {
                this._Str_3220.dispose();
                this._Str_3220 = null;
            }
        }

        public function set content(k:IWindowContainer):void
        {
            this._content = k;
            this._Str_1929 = ((this._content) ? IItemListWindow(this._content.findChildByName("item_list")) : null);
            this._Str_3375 = ((this._content) ? IScrollbarWindow(this._content.findChildByName("scroller")) : null);
            if (((k == null) && (this._Str_4871)))
            {
                this._Str_4871._Str_17240();
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
            var _local_2:int = this._Str_21927();
            this._Str_1929.autoArrangeItems = false;
            var _local_3:int;
            while (true)
            {
                if (_local_3 < k.length)
                {
                    this._Str_2966(true, _local_3, k[_local_3]);
                }
                else
                {
                    _local_4 = this._Str_2966(false, _local_3, null);
                    if (_local_4)
                    {
                        break;
                    }
                }
                _local_3++;
            }
            this._Str_1929.autoArrangeItems = true;
            if (((!(this._Str_3375 == null)) && (!(this._Str_21927() == _local_2))))
            {
                this._Str_3375.scrollV = 0;
            }
            if (this._content.findChildByName("no_rooms_found"))
            {
                this._content.findChildByName("no_rooms_found").visible = (k.length < 1);
            }
        }

        private function _Str_21927():int
        {
            var k:int;
            var _local_2:int;
            while (_local_2 < this._Str_1929.numListItems)
            {
                if (this._Str_1929.getListItemAt(_local_2).visible)
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
            var _local_2:IWindowContainer = IWindowContainer(this._Str_2272.getXmlWindow("grs_guest_room_details_phase_one"));
            _local_2.background = true;
            _local_2.addEventListener(WindowMouseEvent.MOVE, this._Str_4955);
            _local_2.addEventListener(WindowMouseEvent.OVER, this.onMouseOver);
            _local_2.addEventListener(WindowMouseEvent.OUT, this.onMouseOut);
            _local_2.addEventListener(WindowMouseEvent.CLICK, this.onMouseClick);
            _local_2.setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, true);
            _local_2.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRETCH, true);
            _local_2.color = this.getBgColor(k);
            _local_2.tags.push(k);
            if (this._Str_16040)
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

        private function _Str_2966(k:Boolean, _arg_2:int, _arg_3:_Str_2370):Boolean
        {
            var _local_4:IWindowContainer = IWindowContainer(this._Str_1929.getListItemAt(_arg_2));
            var _local_5:Boolean;
            if (_local_4 == null)
            {
                if (!k)
                {
                    return true;
                }
                _local_4 = this.getListEntry(_arg_2);
                this._Str_1929.addListItem(_local_4);
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
                _local_4.width = (_local_4.width + this._Str_21859);
                MainViewCtrl._Str_24055(this, _local_4);
            }
            return false;
        }

        protected function refreshEntryDetails(k:IWindowContainer, _arg_2:_Str_2370):void
        {
            k.visible = true;
            Util._Str_2930(k);
            this._Str_23295(k, _arg_2);
            var _local_3:String = ((((_arg_2._Str_2738 == _Str_3560.DOORMODE_CLOSED) || (_arg_2._Str_2738 == _Str_3560.DOORMODE_PASSWORD)) || (_arg_2._Str_2738 == _Str_3560.DOORMODE_INVISIBLE)) ? "group_base_icon" : "group_base_icon_no_doormode");
            this._Str_2272.refreshButton(k, _local_3, (_arg_2.habboGroupId > 0), null, 0, "group_base_icon");
            this._Str_2272.refreshButton(k, "home", this._Str_10475(_arg_2), null, 0);
            this._Str_2272.refreshButton(k, "doormode_doorbell_small", (_arg_2._Str_2738 == _Str_3560.DOORMODE_CLOSED), null, 0);
            this._Str_2272.refreshButton(k, "doormode_password_small", (_arg_2._Str_2738 == _Str_3560.DOORMODE_PASSWORD), null, 0);
            this._Str_2272.refreshButton(k, "doormode_invisible_small", (_arg_2._Str_2738 == _Str_3560.DOORMODE_INVISIBLE), null, 0);
            if (this._Str_16040)
            {
                k.findChildByName("room_number").visible = true;
                k.findChildByName("room_number").caption = ((k.tags[0] + 2) + ".");
            }
            this._Str_16465(k, _arg_2);
            this._Str_3220.refreshUserCount(_arg_2._Str_9029, k, _arg_2.userCount, "${navigator.usercounttooltip.users}", 308, 2);
            k.name = ((("guestroom_" + _arg_2.ownerName) + "_") + _arg_2.roomName);
        }

        private function _Str_16465(k:IWindowContainer, _arg_2:_Str_2370):void
        {
            var _local_3:ITextWindow = ITextWindow(k.getChildByName("roomname"));
            _local_3.visible = true;
            var _local_4:Boolean = (((k.findChildByName("home").visible) || (k.findChildByName("favourite").visible)) || (k.findChildByName("make_favourite").visible));
            Util._Str_21212(_local_3, _arg_2.roomName, ((_local_4) ? (_local_3.width - 20) : _local_3.width));
        }

        protected function _Str_4955(k:WindowEvent):void
        {
            this._Str_22464(k);
        }

        protected function onMouseOver(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            if (((this._Str_4871.visible) && (this._Str_19895)))
            {
                return;
            }
            this._Str_23553(IWindowContainer(_local_2));
            var _local_3:int = _local_2.tags[0];
            var _local_4:_Str_2370 = this._Str_9465(_local_3);
            if (_local_4 == null)
            {
                return;
            }
            this._Str_4871.room = _local_4;
            this._Str_4871._Str_8168(_local_2);
        }

        public function getRooms():Array
        {
            return ((((this._Str_2272 == null) || (this._Str_2272.data == null)) || (this._Str_2272.data._Str_4518 == null)) || (this._Str_2272.data._Str_4518.rooms == null)) ? (new Array()) : this._Str_2272.data._Str_4518.rooms;
        }

        private function _Str_9465(k:int):_Str_2370
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
            this._Str_4871._Str_17240();
        }

        protected function onMouseClick(k:WindowEvent):void
        {
            var _local_5:Point;
            var _local_2:IWindow = k.target;
            var _local_3:int = _local_2.tags[0];
            var _local_4:_Str_2370 = this._Str_9465(_local_3);
            if (_local_4 == null)
            {
                return;
            }
            if (_local_4.ownerName != this._Str_2272._Str_2627.userName)
            {
                if (_local_4.habboGroupId != 0)
                {
                    this._Str_2272.goToPrivateRoom(_local_4.flatId);
                    return;
                }
                _local_5 = new Point((k as WindowMouseEvent).stageX, (k as WindowMouseEvent).stageY);
                switch (_local_4._Str_2738)
                {
                    case _Str_3560.DOORMODE_PASSWORD:
                        this._Str_2272._Str_7174.show(_local_4, _local_5);
                        return;
                    case _Str_3560.DOORMODE_CLOSED:
                        this._Str_2272.doorbell.show(_local_4, _local_5);
                        return;
                }
            }
            this.beforeEnterRoom(_local_3);
            this._Str_2272.goToRoom(_local_4.flatId, true, "", _local_3);
            this._Str_4871._Str_14696();
        }

        public function beforeEnterRoom(k:int):void
        {
        }

        private function _Str_23295(k:IWindowContainer, _arg_2:_Str_2370):void
        {
            var _local_3:Boolean = this._Str_2272.data._Str_20543(_arg_2.flatId);
            var _local_4:Boolean = this._Str_10475(_arg_2);
            this._Str_19600(k, "make_favourite", ((!(_local_3)) && (!(_local_4))), this._Str_16071);
            this._Str_19600(k, "favourite", ((_local_3) && (!(_local_4))), this._Str_16307);
        }

        private function _Str_10475(k:_Str_2370):Boolean
        {
            return k.flatId == this._Str_2272.data.homeRoomId;
        }

        private function _Str_19600(k:IWindowContainer, _arg_2:String, _arg_3:Boolean, _arg_4:Function):void
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
                this._Str_2272.refreshButton(_local_5, _arg_2, _arg_3, null, 0);
            }
        }

        private function _Str_16307(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = k.target;
            if (((_local_2 == null) || (_local_2.parent == null)))
            {
                return;
            }
            var _local_3:_Str_2370 = this._Str_9465(_local_2.parent.tags[0]);
            if (_local_3 == null)
            {
                return;
            }
            this._Str_2272.send(new _Str_5262(_local_3.flatId));
        }

        private function _Str_16071(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = k.target;
            if (((_local_2 == null) || (_local_2.parent == null)))
            {
                return;
            }
            var _local_3:_Str_2370 = this._Str_9465(int(_local_2.parent.tags[0]));
            if (_local_3 == null)
            {
                return;
            }
            this._Str_2272.send(new _Str_4893(_local_3.flatId));
        }

        private function _Str_23553(k:IWindowContainer):void
        {
            var _local_2:int;
            if (((!(this._Str_12349 == null)) && (!(this._Str_12349.disposed))))
            {
                _local_2 = this._Str_12349.tags[0];
                this._Str_12349.color = this.getBgColor(_local_2);
            }
            this._Str_12349 = k;
            k.color = 4288861930;
        }

        private function _Str_22464(k:WindowEvent):void
        {
            var _local_2:WindowMouseEvent = WindowMouseEvent(k);
            var _local_3:int = Math.abs((this._Str_22153 - _local_2.stageX));
            this._Str_22153 = _local_2.stageX;
            this._Str_19895 = (_local_3 > 2);
        }

        public function get _Str_26238():RoomPopupCtrl
        {
            return this._Str_4871;
        }

        public function get navigator():HabboNavigator
        {
            return this._Str_2272;
        }
    }
}
