package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_7214;
    import com.sulake.core.window.events.*;

    public class MyRoomsTabPageDecorator implements ITabPageDecorator 
    {
        private const _Str_8929:Array = [[Tabs._Str_4869, "navigator.navisel.myrooms"], [Tabs._Str_8473, "navigator.navisel.wherearemyfriends"], [Tabs._Str_9161, "navigator.navisel.myfriendsrooms"], [Tabs._Str_12236, "navigator.navisel.roomswithrights"], [Tabs._Str_10261, "navigator.navisel.mygroups"], [Tabs._Str_8122, "navigator.navisel.myfavourites"], [Tabs._Str_8161, "navigator.navisel.visitedrooms"], [Tabs._Str_7094, ""]];

        private var _navigator:HabboNavigator;
        private var _filter:IDropMenuWindow;

        public function MyRoomsTabPageDecorator(k:HabboNavigator)
        {
            this._navigator = k;
        }

        public function _Str_6025(k:IWindowContainer):void
        {
            var _local_2:String = "me_header";
            var _local_3:IWindowContainer = (k.getChildByName(_local_2) as IWindowContainer);
            if (((this._filter == null) || (this._filter.disposed)))
            {
                this._filter = IDropMenuWindow(_local_3.findChildByName("meSubNavi"));
                this._Str_22831();
                this._filter.addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_5118);
            }
            _local_3.visible = true;
        }

        public function _Str_6883():void
        {
            if (((!(this._filter == null)) && (!(this._filter.disposed))))
            {
                this._filter.removeEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_5118);
                this._filter.selection = 0;
                this._filter.addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_5118);
            }
        }

        public function _Str_5920(k:IWindowContainer):void
        {
            var _local_2:IWindowContainer = (k.getChildByName("me_footer") as IWindowContainer);
            var _local_3:IWindow = _local_2.findChildByName("create_room_but");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_18652);
            }
            this._navigator.refreshButton(_local_2, "create_room", true, null, 0);
            _local_2.visible = true;
        }

        public function _Str_8146():void
        {
            this._Str_2798();
        }

        private function _Str_18652(k:WindowEvent):void
        {
            this._navigator.send(new _Str_7214());
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

        private function _Str_5118(k:WindowEvent):void
        {
            this._Str_2798();
            var _local_2:IWindow = k.target;
            if ((_local_2 is IDropMenuWindow))
            {
                this._navigator._Str_4051(IDropMenuWindow(_local_2)._Str_4487()[IDropMenuWindow(_local_2).selection], "category.view");
            }
        }

        private function _Str_2798():void
        {
            var k:int = (((this._filter == null) || (this._filter.disposed)) ? 0 : this._filter.selection);
            this._navigator._Str_2813._Str_2798(Tabs._Str_5203, this._Str_24302(k));
        }

        private function _Str_24302(k:int):int
        {
            if (k <= this._Str_8929.length)
            {
                return this._Str_8929[k][0];
            }
            return this._Str_8929[0][0];
        }

        public function get _Str_5960():String
        {
            return ((this._filter) && (!(this._filter.disposed))) ? this._filter._Str_4487()[this._filter.selection] : null;
        }

        public function _Str_8025(k:int):void
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

        public function _Str_8512(k:String):String
        {
            return k;
        }
    }
}
