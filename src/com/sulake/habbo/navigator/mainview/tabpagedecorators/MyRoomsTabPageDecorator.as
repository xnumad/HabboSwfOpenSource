package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateRoomMessageComposer;
    import com.sulake.core.window.events.*;

    public class MyRoomsTabPageDecorator implements ITabPageDecorator 
    {
        private const _Str_8929:Array = [[Tabs.SEARCHTYPE_MY_ROOMS, "navigator.navisel.myrooms"], [Tabs.SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE, "navigator.navisel.wherearemyfriends"], [Tabs.SEARCHTYPE_MY_FRIENDS_ROOMS, "navigator.navisel.myfriendsrooms"], [Tabs.SEARCHTYPE_ROOMS_WITH_RIGHTS, "navigator.navisel.roomswithrights"], [Tabs.SEARCHTYPE_MY_GUILD_BASES, "navigator.navisel.mygroups"], [Tabs.SEARCHTYPE_MY_FAVOURITES, "navigator.navisel.myfavourites"], [Tabs.SEARCHTYPE_MY_HISTORY, "navigator.navisel.visitedrooms"], [Tabs.SEARCHTYPE_FREQUENT_HISTORY, ""]];

        private var _navigator:HabboNavigator;
        private var _filter:IDropMenuWindow;

        public function MyRoomsTabPageDecorator(k:HabboNavigator)
        {
            this._navigator = k;
        }

        public function refreshCustomContent(k:IWindowContainer):void
        {
            var _local_2:String = "me_header";
            var _local_3:IWindowContainer = (k.getChildByName(_local_2) as IWindowContainer);
            if (((this._filter == null) || (this._filter.disposed)))
            {
                this._filter = IDropMenuWindow(_local_3.findChildByName("meSubNavi"));
                this._Str_22831();
                this._filter.addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this.onFilterSelected);
            }
            _local_3.visible = true;
        }

        public function tabSelected():void
        {
            if (((!(this._filter == null)) && (!(this._filter.disposed))))
            {
                this._filter.removeEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this.onFilterSelected);
                this._filter.selection = 0;
                this._filter.addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this.onFilterSelected);
            }
        }

        public function refreshFooter(k:IWindowContainer):void
        {
            var _local_2:IWindowContainer = (k.getChildByName("me_footer") as IWindowContainer);
            var _local_3:IWindow = _local_2.findChildByName("create_room_but");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this.onCreateRoomClick);
            }
            this._navigator.refreshButton(_local_2, "create_room", true, null, 0);
            _local_2.visible = true;
        }

        public function navigatorOpenedWhileInTab():void
        {
            this.startSearch();
        }

        private function onCreateRoomClick(k:WindowEvent):void
        {
            this._navigator.send(new CanCreateRoomMessageComposer());
        }

        private function _Str_22831():void
        {
            var _local_2:Array;
            if (((this._filter == null) || (this._filter.disposed)))
            {
                return;
            }
            var k:Array = [];
            for each (_local_2 in this._Str_8929)
            {
                k.push(this._navigator.getText(_local_2[1]));
            }
            this._filter.populate(k);
            this._filter.selection = 0;
        }

        private function onFilterSelected(k:WindowEvent):void
        {
            this.startSearch();
            var _local_2:IWindow = k.target;
            if ((_local_2 is IDropMenuWindow))
            {
                this._navigator.trackNavigationDataPoint(IDropMenuWindow(_local_2).items()[IDropMenuWindow(_local_2).selection], "category.view");
            }
        }

        private function startSearch():void
        {
            var k:int = (((this._filter == null) || (this._filter.disposed)) ? 0 : this._filter.selection);
            this._navigator.mainViewCtrl.startSearch(Tabs.TAB_ME, this._Str_24302(k));
        }

        private function _Str_24302(k:int):int
        {
            if (k <= this._Str_8929.length)
            {
                return this._Str_8929[k][0];
            }
            return this._Str_8929[0][0];
        }

        public function get filterCategory():String
        {
            return ((this._filter) && (!(this._filter.disposed))) ? this._filter.items()[this._filter.selection] : null;
        }

        public function setSubSelection(k:int):void
        {
            var _local_4:Array;
            if (((!(this._filter)) || (this._filter.disposed)))
            {
                return;
            }
            var _local_2:int = this._filter.numMenuItems;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = this._Str_8929[_local_3];
                if (_local_4[0] == k)
                {
                    this._filter.selection = _local_3;
                    return;
                }
                _local_3++;
            }
            this._filter.selection = 0;
        }

        public function processSearchParam(k:String):String
        {
            return k;
        }
    }
}
