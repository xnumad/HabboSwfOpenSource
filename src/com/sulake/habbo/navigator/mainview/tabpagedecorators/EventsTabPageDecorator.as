package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.navigator.domain.Tabs;

    public class EventsTabPageDecorator implements ITabPageDecorator 
    {
        private var _navigator:HabboNavigator;
        private var _filter:IDropMenuWindow;

        public function EventsTabPageDecorator(k:HabboNavigator)
        {
            this._navigator = k;
        }

        public function _Str_6025(k:IWindowContainer):void
        {
            var _local_2:IWindowContainer = (k.getChildByName("room_ad_header") as IWindowContainer);
            if (((this._filter == null) || (this._filter.disposed)))
            {
                this._filter = (_local_2.getChildByName("roomAdFilter") as IDropMenuWindow);
                this._Str_22411();
                this._filter.addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_5118);
            }
            _local_2.visible = true;
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
            var _local_2:IWindowContainer = (k.getChildByName("room_ads_footer") as IWindowContainer);
            var _local_3:IWindow = _local_2.findChildByName("get_event_but");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_17806);
            }
            _local_2.visible = true;
        }

        public function _Str_8146():void
        {
            this._Str_2798();
        }

        private function _Str_22411():void
        {
            if (((this._filter == null) || (this._filter.disposed)))
            {
                return;
            }
            var k:Array = new Array();
            k.push(this._navigator.getText("navigator.roomad.topads"));
            k.push(this._navigator.getText("navigator.roomad.newads"));
            this._filter.populate(k);
            this._filter.selection = 0;
        }

        private function _Str_5118(k:WindowEvent):void
        {
            this._Str_2798();
        }

        private function _Str_17806(k:WindowEvent):void
        {
            this._navigator._Str_12506();
        }

        private function _Str_2798():void
        {
            var k:int = Tabs._Str_6358;
            if (((!(this._filter == null)) && (!(this._filter.disposed))))
            {
                k = this._Str_22587(this._filter.selection);
            }
            this._navigator._Str_2813._Str_2798(Tabs._Str_6209, k);
        }

        private function _Str_22587(k:int):int
        {
            switch (k)
            {
                case 0:
                    return Tabs._Str_6358;
                case 1:
                    return Tabs._Str_12070;
            }
            Logger.log(("Invalid index when searching Room ad search type: " + k));
            return 0;
        }

        public function get _Str_5960():String
        {
            if (((this._filter == null) || (this._filter.disposed)))
            {
                return null;
            }
            return this._filter._Str_4487()[this._filter.selection];
        }

        public function _Str_8025(k:int):void
        {
        }

        public function _Str_8512(k:String):String
        {
            return k;
        }
    }
}
