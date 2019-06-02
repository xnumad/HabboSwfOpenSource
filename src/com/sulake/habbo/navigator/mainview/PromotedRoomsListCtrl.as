package com.sulake.habbo.navigator.mainview
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.habbo.navigator.UserCountRenderer;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.navigator.Util;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_3451;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.navigator.domain.RoomSessionTags;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.habbo.navigator.*;

    public class PromotedRoomsListCtrl implements IDisposable 
    {
        private static const _Str_7717:int = 5;

        private var _navigator:HabboNavigator;
        private var _userCountRenderer:UserCountRenderer;
        private var _guestRoomListCtrl:PromotedRoomsGuestRoomListCtrl;

        public function PromotedRoomsListCtrl(k:HabboNavigator):void
        {
            this._navigator = k;
            this._userCountRenderer = new UserCountRenderer(this._navigator);
            this._guestRoomListCtrl = new PromotedRoomsGuestRoomListCtrl(this._navigator);
        }

        public function dispose():void
        {
            this._navigator = null;
            if (this._userCountRenderer)
            {
                this._userCountRenderer.dispose();
                this._userCountRenderer = null;
            }
            if (this._guestRoomListCtrl)
            {
                this._guestRoomListCtrl.dispose();
                this._guestRoomListCtrl = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._navigator == null;
        }

        private function getCategoryContainer(k:IWindowContainer, _arg_2:int):IWindowContainer
        {
            return IWindowContainer(k.getChildByID(_arg_2));
        }

        public function refresh(k:IWindowContainer, _arg_2:Array):void
        {
            var _local_5:IWindowContainer;
            Util._Str_2930(k);
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _arg_2.length)
            {
                _local_5 = this.getCategoryContainer(k, _local_4);
                if (_local_5 == null)
                {
                    _local_5 = this._Str_9034(_local_4);
                    _local_5.id = _local_4;
                    k.addChild(_local_5);
                }
                this._Str_2966(_local_5, _arg_2[_local_4]);
                _local_5.y = _local_3;
                _local_3 = (_local_3 + (_local_5.height + _Str_7717));
                _local_5.visible = true;
                _local_4++;
            }
            k.height = ((Util._Str_2647(k) > 0) ? (Util._Str_2647(k) + 5) : 0);
        }

        public function _Str_9034(k:int):IWindowContainer
        {
            var _local_2:IWindowContainer = IWindowContainer(this._navigator.getXmlWindow("grs_promoted_room_category"));
            this._Str_11971(_local_2, k, "enter_room_button", this._Str_23764);
            this._Str_11971(_local_2, k, "leader_region", this._Str_23520);
            this._Str_11971(_local_2, k, "toggle_open_region", this._Str_23366);
            this._navigator.refreshButton(_local_2, "navi_room_icon", true, null, 0);
            return _local_2;
        }

        private function _Str_17813(k:IWindowContainer, _arg_2:String, _arg_3:int=3):int
        {
            var _local_4:IWindow = k.findChildByName(_arg_2);
            return (_local_4.x + _local_4.width) + _arg_3;
        }

        private function _Str_11971(k:IWindowContainer, _arg_2:int, _arg_3:String, _arg_4:Function):void
        {
            k.findChildByName(_arg_3).procedure = _arg_4;
            k.findChildByName(_arg_3).id = _arg_2;
        }

        public function _Str_2966(k:IWindowContainer, _arg_2:_Str_3451):void
        {
            var _local_3:String = this._navigator.getText(("promotedroomcategory." + _arg_2.code));
            k.findChildByName("category_name_txt").caption = _local_3;
            k.findChildByName("category_header").width = (k.findChildByName("category_name_txt").width + 13);
            this._navigator.registerParameter("navigator.promotedrooms.hidetopten", "category", _local_3);
            this._navigator.registerParameter("navigator.promotedrooms.viewtopten", "category", _local_3);
            k.findChildByName("open_txt").caption = this._navigator.getText("navigator.promotedrooms.viewtopten");
            k.findChildByName("close_txt").caption = this._navigator.getText("navigator.promotedrooms.hidetopten");
            k.findChildByName("room_name_txt").caption = _arg_2._Str_7144.roomName;
            var _local_4:IWindow = k.findChildByName("leader_name_txt");
            _local_4.caption = ((_arg_2._Str_7144._Str_6938) ? _arg_2._Str_7144.ownerName : "");
            _local_4.x = this._Str_17813(k, "leader_name_caption_txt", 0);
            k.findChildByName("arrow_down_icon").visible = _arg_2.open;
            k.findChildByName("arrow_right_icon").visible = (!(_arg_2.open));
            k.findChildByName("close_txt").visible = _arg_2.open;
            k.findChildByName("open_txt").visible = (!(_arg_2.open));
            k.findChildByName("arrow_down_icon").x = this._Str_17813(k, "close_txt");
            k.findChildByName("arrow_right_icon").x = this._Str_17813(k, "open_txt");
            this._userCountRenderer.refreshUserCount(_arg_2._Str_7144._Str_9029, IWindowContainer(k.findChildByName("enter_room_button")), _arg_2._Str_7144.userCount, "${navigator.usercounttooltip.users}", 222, 35);
            this._Str_16592(k, _arg_2);
            k.findChildByName("item_list").visible = _arg_2.open;
            if (_arg_2.open)
            {
                k.findChildByName("item_list").height = (_arg_2.rooms.length * 17);
                this._guestRoomListCtrl.content = k;
                this._guestRoomListCtrl.category = _arg_2;
                this._guestRoomListCtrl.refresh();
            }
            k.height = ((_arg_2.open) ? (Util._Str_2647(k) + 3) : 90);
        }

        private function _Str_23764(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:_Str_3451;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = this._Str_5067(_arg_2);
                this._navigator.data.roomSessionTags = new RoomSessionTags(_local_3.code, "1");
                this._navigator.goToPrivateRoom(_local_3._Str_7144.flatId);
                this._navigator.closeNavigator();
            }
        }

        private function _Str_23520(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:_Str_3451;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = this._Str_5067(_arg_2);
                this._navigator.trackGoogle("extendedProfile", "navigator_promotedRoom");
                this._navigator.send(new _Str_2553(_local_3._Str_7144.ownerId));
            }
        }

        private function _Str_23366(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            var _local_4:_Str_3451;
            var _local_5:_Str_3451;
            if (k.type == WindowMouseEvent.CLICK)
            {
                while (_local_3 < this._navigator.data._Str_5482.entries.length)
                {
                    _local_5 = this._navigator.data._Str_5482.entries[_local_3];
                    if (_arg_2.id != _local_3)
                    {
                        _local_5.open = false;
                    }
                    _local_3++;
                }
                _local_4 = this._Str_5067(_arg_2);
                _local_4._Str_16147();
                this._navigator._Str_2813.refresh();
            }
        }

        private function _Str_5067(k:IWindow):_Str_3451
        {
            return this._navigator.data._Str_5482.entries[k.id];
        }

        private function _Str_16592(k:IWindowContainer, _arg_2:_Str_3451):void
        {
            var _local_3:IWidgetWindow = IWidgetWindow(k.findChildByName("avatar_image_widget"));
            var _local_4:_Str_2483 = _Str_2483(_local_3.widget);
            _local_4.figure = _arg_2._Str_23315;
        }
    }
}
