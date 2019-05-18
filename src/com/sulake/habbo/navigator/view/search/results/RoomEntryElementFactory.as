package com.sulake.habbo.navigator.view.search.results
{
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.navigator.view.search.ViewMode;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.window.utils._Str_18430;
    import com.sulake.core.window.events.WindowEvent;
    import flash.geom.Rectangle;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_5262;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_4893;
    import com.sulake.core.window.components.IRegionWindow;

    public class RoomEntryElementFactory 
    {
        public static const _Str_17291:int = 3;

        private var _navigator:HabboNewNavigator;
        private var _rowEntryTemplate:IWindowContainer;
        private var _tileEntryTemplate:IWindowContainer;
        private var _tileContainerTemplate:IItemListWindow;
        private var _viewMode:int;

        public function RoomEntryElementFactory(k:HabboNewNavigator)
        {
            this._navigator = k;
            this._viewMode = ViewMode._Str_20005(ViewMode.HOTEL_VIEW);
        }

        public function set viewMode(k:int):void
        {
            this._viewMode = k;
        }

        public function set _Str_23915(k:IWindowContainer):void
        {
            this._rowEntryTemplate = k;
        }

        public function set _Str_24632(k:IWindowContainer):void
        {
            this._tileEntryTemplate = k;
        }

        public function set _Str_25029(k:IItemListWindow):void
        {
            this._tileContainerTemplate = k;
        }

        public function get _Str_19124():int
        {
            return this._rowEntryTemplate.height;
        }

        public function _Str_24858(k:_Str_2370, _arg_2:int, _arg_3:int=-1):IWindowContainer
        {
            var _local_4:IWindowContainer = IWindowContainer(this._rowEntryTemplate.clone());
            if (_arg_3 != -1)
            {
                _local_4.width = _arg_3;
            }
            IBorderWindow(_local_4).color = RoomEntryUtils._Str_24293(_arg_2, IBorderWindow(_local_4).color);
            this._Str_20769(_local_4, k, false);
            _local_4.findChildByName("grouphome_icon").visible = (!(k._Str_7146 == ""));
            return _local_4;
        }

        public function _Str_22789(k:_Str_2370, _arg_2:int):IWindowContainer
        {
            var _local_3:IWindowContainer = IWindowContainer(this._tileEntryTemplate.clone());
            this._Str_20769(_local_3, k, true);
            if (k._Str_7146 != "")
            {
                _local_3.findChildByName("room_group_badge").visible = true;
                _Str_2402(IWidgetWindow(_local_3.findChildByName("room_group_badge")).widget).badgeId = k._Str_7146;
            }
            if (k.officialRoomPicRef != null)
            {
                if (this._navigator.getBoolean("new.navigator.official.room.thumbnails.in.amazon"))
                {
                    IStaticBitmapWrapperWindow(_local_3.findChildByName("room_pic_placeholder")).assetUri = (this._navigator.getProperty("navigator.thumbnail.url_base") + k.officialRoomPicRef);
                }
                else
                {
                    IStaticBitmapWrapperWindow(_local_3.findChildByName("room_pic_placeholder")).assetUri = (this._navigator.getProperty("image.library.url") + k.officialRoomPicRef);
                }
            }
            else
            {
                IStaticBitmapWrapperWindow(_local_3.findChildByName("room_pic_placeholder")).assetUri = ((this._navigator.getProperty("navigator.thumbnail.url_base") + k.flatId) + ".png");
            }
            return _local_3;
        }

        private function _Str_20769(k:IWindowContainer, _arg_2:_Str_2370, _arg_3:Boolean):void
        {
            k.findChildByName("room_usercount").caption = _arg_2.userCount.toString();
            k.findChildByName("room_name").caption = ((ViewMode._Str_25096(this._viewMode)) ? _arg_2._Str_8163 : _arg_2.roomName);
            k.findChildByName("go_to_room_region").id = _arg_2.flatId;
            k.findChildByName("go_to_room_region").addEventListener(WindowMouseEvent.CLICK, this._Str_23456);
            k.findChildByName("go_to_room_region").addEventListener(WindowMouseEvent.OVER, ((_arg_3) ? this._Str_25608 : this._Str_24397));
            k.findChildByName("info_popup_click_region").id = _arg_2.flatId;
            k.findChildByName("info_popup_click_region").addEventListener(WindowMouseEvent.CLICK, this._Str_24506);
            k.findChildByName("info_popup_click_region").addEventListener(WindowMouseEvent.OVER, this._Str_25237);
            IBorderWindow(k.findChildByName("room_info_usercount_border")).color = _Str_18430._Str_25426(_arg_2.userCount, _arg_2._Str_9029);
            IStaticBitmapWrapperWindow(k.findChildByName("doormode_icon")).assetUri = RoomEntryUtils._Str_25339(_arg_2._Str_2738);
        }

        public function _Str_25258():IItemListWindow
        {
            return this._tileContainerTemplate.clone() as IItemListWindow;
        }

        private function _Str_23456(k:WindowEvent):void
        {
            this._navigator.goToRoom(k.window.id);
        }

        private function _Str_24506(k:WindowEvent):void
        {
            var _local_2:Rectangle = new Rectangle();
            k.window.getGlobalRectangle(_local_2);
            this._navigator.view._Str_15353(this._navigator._Str_3440._Str_6684(k.window.id), _local_2.right, (((_local_2.bottom - _local_2.top) / 2) + _local_2.top));
        }

        private function _Str_25237(k:WindowEvent):void
        {
            var _local_2:Rectangle;
            if (this._navigator.view._Str_15872)
            {
                _local_2 = new Rectangle();
                k.window.getGlobalRectangle(_local_2);
                this._navigator.view._Str_15353(this._navigator._Str_3440._Str_6684(k.window.id), _local_2.right, (((_local_2.bottom - _local_2.top) / 2) + _local_2.top), true);
            }
        }

        private function _Str_25608(k:WindowEvent):void
        {
            var _local_2:Rectangle;
            if (this._navigator.view._Str_15872)
            {
                _local_2 = new Rectangle();
                k.window.getGlobalRectangle(_local_2);
                this._navigator.view._Str_15353(this._navigator._Str_3440._Str_6684(k.window.id), (_local_2.right - 6), ((((_local_2.bottom - _local_2.top) / 2) + _local_2.top) + 56), true);
            }
        }

        private function _Str_24397(k:WindowEvent):void
        {
            var _local_2:Rectangle;
            if (this._navigator.view._Str_15872)
            {
                _local_2 = new Rectangle();
                k.window.getGlobalRectangle(_local_2);
                this._navigator.view._Str_15353(this._navigator._Str_3440._Str_6684(k.window.id), (_local_2.right + 20), (((_local_2.bottom - _local_2.top) / 2) + _local_2.top), true);
            }
        }

        private function _Str_26273(k:WindowEvent):void
        {
            this._navigator._Str_12024(k.window.id);
        }

        private function _Str_26401(k:WindowEvent):void
        {
            this._navigator._Str_18961(k.window.id);
        }

        private function _Str_26403(k:WindowEvent):void
        {
            var _local_2:Boolean = this._navigator._Str_2559._Str_12281(k.window.id);
            if (_local_2)
            {
                this._navigator.communication.connection.send(new _Str_5262(k.window.id));
            }
            else
            {
                this._navigator.communication.connection.send(new _Str_4893(k.window.id));
            }
            IStaticBitmapWrapperWindow(IRegionWindow(k.window).findChildByName("favourite_icon")).assetUri = RoomEntryUtils._Str_25708((!(_local_2)));
        }
    }
}



