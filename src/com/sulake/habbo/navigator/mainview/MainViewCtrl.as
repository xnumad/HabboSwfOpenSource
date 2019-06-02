package com.sulake.habbo.navigator.mainview
{
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.runtime.IDisposable;
    import flash.geom.Point;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.navigator.TextSearchInputs;
    import flash.utils.Timer;
    import com.sulake.habbo.utils._Str_3942;
    import flash.events.TimerEvent;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.navigator.IViewCtrl;
    import com.sulake.habbo.navigator.domain.Tab;
    import com.sulake.core.window.components.ITabButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.habbo.navigator.Util;
    import com.sulake.core.window.components.ISelectableWindow;
    import flash.events.Event;
    import com.sulake.habbo.navigator.events.HabboNavigatorTrackingEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_11858;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_10397;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_11143;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4374;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_11329;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_9956;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_12153;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_9988;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_10157;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_10079;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_9889;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_4390;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_10574;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_9911;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_11181;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_12106;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_9844;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_9807;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_11269;
    import com.sulake.core.communication.messages.IMessageComposer;

    public class MainViewCtrl implements ITransitionalMainViewCtrl, IUpdateReceiver, IDisposable 
    {
        public static const _Str_8485:int = 1;
        public static const _Str_14620:int = 2;
        public static const _Str_15148:int = 4;
        public static const _Str_13989:int = 5;
        private static const _Str_15647:int = 1;
        private static const _Str_10433:int = 2;
        private static const _Str_14003:int = 3;
        private static const _Str_17528:int = 4;
        private static const _Str_4906:int = 22;
        private static const _Str_15966:int = 60;

        private const _Str_6092:Point = new Point(100, 10);

        private var _navigator:HabboNavigator;
        private var _mainWindow:IFrameWindow;
        private var _content:IWindowContainer;
        private var _customContent:IWindowContainer;
        private var _footer:IWindowContainer;
        private var _listContent:IWindowContainer;
        private var _popularTags:PopularTagsListCtrl;
        private var _guestRooms:GuestRoomListCtrl;
        private var _officialRooms:OfficialRoomListCtrl;
        private var _roomAds:RoomAdListCtrl;
        private var _categoryListCtrl:CategoryListCtrl;
        private var _tabContext:ITabContextWindow;
        private var _ignoreNextTabSelectEvent:Boolean;
        private var _blendingStage:int;
        private var _blendCustomContent:Boolean = true;
        private var _loadCounter:int = 0;
        private var _loadingText:IWindow;
        private var _footerHeight:int = 0;
        private var _searchInput:TextSearchInputs;
        private var _resizeTimer:Timer;
        private var _disposed:Boolean = false;
        private var _toggle:_Str_3942;
        private var _phaseOneNavigator:Boolean = false;

        public function MainViewCtrl(k:HabboNavigator):void
        {
            this._navigator = k;
            this._popularTags = new PopularTagsListCtrl(this._navigator);
            this._guestRooms = new GuestRoomListCtrl(this._navigator, 0, false);
            this._officialRooms = new OfficialRoomListCtrl(this._navigator);
            this._roomAds = new RoomAdListCtrl(this._navigator, 0, false);
            this._categoryListCtrl = new CategoryListCtrl(this._navigator);
            this._resizeTimer = new Timer(300, 1);
            this._resizeTimer.addEventListener(TimerEvent.TIMER, this._Str_3774);
        }

        private static function _Str_9327(k:IViewCtrl, _arg_2:Boolean):void
        {
            var _local_3:IItemListWindow;
            var _local_4:IWindow;
            if (((k.content == null) || (!(k.content.visible))))
            {
                return;
            }
            _local_3 = IItemListWindow(k.content.findChildByName("item_list"));
            _local_4 = k.content.findChildByName("scroller");
            var _local_5:* = (_local_3.visibleRegion.height > _local_3.height);
            if (_local_4.visible)
            {
                if (!_local_5)
                {
                    _local_4.visible = false;
                    _local_3.width = (_local_3.width + _Str_4906);
                }
            }
            else
            {
                if (_local_5)
                {
                    _local_4.visible = true;
                    _local_3.width = (_local_3.width - _Str_4906);
                }
            }
        }

        public static function _Str_24055(k:IViewCtrl, _arg_2:IWindowContainer):void
        {
            var _local_3:IWindow = k.content.findChildByName("scroller");
            if (((_local_3 == null) || (_local_3.visible)))
            {
                return;
            }
            _arg_2.width = (_arg_2.width + _Str_4906);
        }


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_18392():void
        {
            if (!this._mainWindow)
            {
                this._Str_19017();
                return;
            }
            if (((!(this._toggle)) || (this._toggle.disposed)))
            {
                this._toggle = new _Str_3942(this._mainWindow, this._mainWindow.desktop, this._Str_19017, this.close);
            }
            this._toggle.toggle();
        }

        private function _Str_19017():void
        {
            var k:Tab = this._navigator.tabs.getSelected();
            k._Str_5252._Str_8146();
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._disposed = true;
                this._navigator = null;
                if (this._mainWindow)
                {
                    this._mainWindow.dispose();
                    this._mainWindow = null;
                }
                if (this._toggle)
                {
                    this._toggle.dispose();
                    this._toggle = null;
                }
                if (this._content)
                {
                    this._content.dispose();
                    this._content = null;
                }
                if (this._resizeTimer)
                {
                    this._resizeTimer.removeEventListener(TimerEvent.TIMER, this._Str_3774);
                    this._resizeTimer.reset();
                    this._resizeTimer = null;
                }
                if (this._popularTags)
                {
                    this._popularTags.dispose();
                    this._popularTags = null;
                }
                if (this._guestRooms)
                {
                    this._guestRooms.dispose();
                    this._guestRooms = null;
                }
                if (this._officialRooms)
                {
                    this._officialRooms.dispose();
                    this._officialRooms = null;
                }
                if (this._roomAds)
                {
                    this._roomAds.dispose();
                    this._roomAds = null;
                }
                if (this._searchInput)
                {
                    this._searchInput.dispose();
                    this._searchInput = null;
                }
            }
        }

        public function open():void
        {
            if (this._mainWindow == null)
            {
                this.prepare();
            }
            this.refresh();
            this._mainWindow.visible = true;
            this._mainWindow.y = Math.max(this._mainWindow.y, _Str_15966);
            this._mainWindow.activate();
        }

        public function isOpen():Boolean
        {
            return (!(this._mainWindow == null)) && (this._mainWindow.visible);
        }

        public function close():void
        {
            if (this._mainWindow != null)
            {
                if (this._searchInput)
                {
                    this._searchInput.dispose();
                    this._searchInput = null;
                }
                if (this._toggle)
                {
                    this._toggle.dispose();
                    this._toggle = null;
                }
                this._mainWindow.dispose();
                this._mainWindow = null;
                this._tabContext = null;
                this._content = null;
                this._customContent = null;
                this._listContent = null;
                this._footer = null;
                this._loadingText = null;
                this._popularTags.content = null;
                this._guestRooms.content = null;
                this._officialRooms.content = null;
                this._categoryListCtrl.content = null;
                this._roomAds.content = null;
                this._footerHeight = 0;
            }
        }

        public function get mainWindow():IFrameWindow
        {
            return this._mainWindow;
        }

        private function prepare():void
        {
            var _local_4:Tab;
            var _local_5:Array;
            var _local_6:ITabButtonWindow;
            var _local_7:ITabButtonWindow;
            var k:Boolean = this._navigator.getBoolean("eventinfo.enabled");
            var _local_2:Boolean;
            this._mainWindow = IFrameWindow(this._navigator.getXmlWindow("grs_main_window_new"));
            this._tabContext = ITabContextWindow(this._mainWindow.findChildByName("tab_context"));
            this._content = IWindowContainer(this._mainWindow.findChildByName("tab_content"));
            this._customContent = IWindowContainer(this._mainWindow.findChildByName("custom_content"));
            this._listContent = IWindowContainer(this._mainWindow.findChildByName("list_content"));
            this._footer = IWindowContainer(this._mainWindow.findChildByName("custom_footer"));
            this._loadingText = this._mainWindow.findChildByName("loading_text");
            var _local_3:IWindow = this._mainWindow.findChildByTag("close");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_3046);
            }
            this._mainWindow.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_22608);
            if (((!(k)) || (!(this._phaseOneNavigator))))
            {
                _local_5 = [];
                while (this._tabContext._Str_4277 > 0)
                {
                    _local_6 = this._tabContext._Str_3363(0);
                    _local_5.push(_local_6);
                    this._tabContext._Str_5897(_local_6);
                }
                for each (_local_6 in _local_5)
                {
                    if ((((_local_6.id == Tabs._Str_6209) && (!(k))) || ((_local_6.id == Tabs._Str_7172) && (!(_local_2)))))
                    {
                    }
                    else
                    {
                        this._tabContext._Str_5377(_local_6);
                    }
                }
            }
            for each (_local_4 in this._navigator.tabs.tabs)
            {
                _local_7 = this._tabContext._Str_20824(_local_4.id);
                if (_local_7 != null)
                {
                    _local_7.addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_18079);
                    _local_4.button = _local_7;
                }
            }
            this._mainWindow.scaler.setParamFlag(WindowParam.WINDOW_PARAM_MOUSE_SCALING_TRIGGER, false);
            this._mainWindow.scaler.setParamFlag(WindowParam.WINDOW_PARAM_VERTICAL_MOUSE_SCALING_TRIGGER, true);
            this._mainWindow.position = this._Str_6092;
            this._Str_22839();
        }

        private function _Str_22839():void
        {
            var _local_3:IWindowContainer;
            var k:String = "search_header";
            if (this._searchInput == null)
            {
                _local_3 = (this._mainWindow.findChildByName(k) as IWindowContainer);
                this._searchInput = new TextSearchInputs(this._navigator, _local_3);
            }
            var _local_2:IWindowContainer = (this._mainWindow.findChildByName(k) as IWindowContainer);
            _local_2.visible = true;
        }

        public function refresh():void
        {
            if (this._mainWindow == null)
            {
                return;
            }
            this._Str_23841();
            this._Str_6025();
            this._Str_24816(true);
            this._Str_5920();
            this._customContent.height = Util._Str_2647(this._customContent);
            this._footer.height = Util._Str_2647(this._footer);
            var k:int = this._listContent.y;
            Util._Str_4679(this._content, ["custom_content", "list_content"], this._customContent.y, 8);
            this._listContent.height = ((((this._listContent.height + k) - this._listContent.y) - this._footer.height) + this._footerHeight);
            Util._Str_4679(this._content, ["list_content", "custom_footer"], this._listContent.y, 0);
            this._footerHeight = this._footer.height;
            this._Str_3774(null);
        }

        private function _Str_23841():void
        {
            var k:Tab = this._navigator.tabs.getSelected();
            var _local_2:ISelectableWindow = this._tabContext.selector.getSelected();
            if (k.button != _local_2)
            {
                this._ignoreNextTabSelectEvent = true;
                this._tabContext.selector.setSelected(k.button);
            }
        }

        private function _Str_6025():void
        {
            Util._Str_2930(this._customContent);
            var k:Tab = this._navigator.tabs.getSelected();
            k._Str_5252._Str_6025(this._customContent);
            if (Util._Str_13639(this._customContent))
            {
                this._customContent.visible = true;
            }
            else
            {
                this._customContent.visible = false;
                this._customContent.blend = 1;
            }
        }

        private function _Str_5920():void
        {
            Util._Str_2930(this._footer);
            var k:Tab = this._navigator.tabs.getSelected();
            k._Str_5252._Str_5920(this._footer);
            this._footer.visible = Util._Str_13639(this._footer);
        }

        private function _Str_24816(k:Boolean):void
        {
            Util._Str_2930(this._listContent);
            var _local_2:Tab = this._navigator.tabs.getSelected();
            var _local_3:Boolean = ((this._navigator.data._Str_25514) && (_local_2._Str_22642 == Tabs._Str_6358));
            this._Str_25672(k, _local_3);
            this._Str_24977(k, (!(_local_3)));
            this._Str_23623(k, this._navigator.data._Str_25160);
            this._Str_25576(k, this._navigator.data._Str_23411);
        }

        private function _Str_24977(k:Boolean, _arg_2:Boolean):void
        {
            this._Str_3836(k, _arg_2, this._guestRooms, "guest_rooms");
        }

        private function _Str_23623(k:Boolean, _arg_2:Boolean):void
        {
            this._Str_3836(k, _arg_2, this._popularTags, "popular_tags");
        }

        private function _Str_25576(k:Boolean, _arg_2:Boolean):void
        {
            this._Str_3836(k, _arg_2, this._officialRooms, "official_rooms");
        }

        private function _Str_25672(k:Boolean, _arg_2:Boolean):void
        {
            this._Str_3836(k, _arg_2, this._roomAds, "room_ads");
        }

        private function _Str_20399(k:Boolean, _arg_2:Boolean):void
        {
            this._Str_3836(k, _arg_2, this._categoryListCtrl, "categories_container");
        }

        private function _Str_3836(k:Boolean, _arg_2:Boolean, _arg_3:IViewCtrl, _arg_4:String):void
        {
            var _local_5:IWindow;
            if (_arg_2)
            {
                if (_arg_3.content == null)
                {
                    _local_5 = this._listContent.findChildByName(_arg_4);
                    _arg_3.content = IWindowContainer(_local_5);
                }
                if (k)
                {
                    _arg_3.refresh();
                }
                _arg_3.content.visible = true;
            }
        }

        private function _Str_3046(k:WindowEvent):void
        {
            Logger.log("Close navigator window");
            this.close();
        }

        private function _Str_18079(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            var _local_3:int = _local_2.id;
            if (this._ignoreNextTabSelectEvent)
            {
                this._ignoreNextTabSelectEvent = false;
                return;
            }
            var _local_4:Tab = this._navigator.tabs._Str_9436(_local_3);
            _local_4._Str_25329();
            switch (_local_4.id)
            {
                case Tabs._Str_6209:
                    this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS));
                    this._navigator.send(new _Str_11858());
                    return;
                case Tabs._Str_5203:
                    this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ME));
                    return;
                case Tabs._Str_6250:
                    this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL));
                    return;
                case Tabs._Str_3866:
                    this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS));
                    return;
                case Tabs._Str_3813:
                    this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH));
                    return;
                case Tabs._Str_7172:
                    this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_CATEGORIES));
                    return;
            }
        }

        public function _Str_8316(k:int):Boolean
        {
            ErrorReportStorage.addDebugData("MainViewCtrl", "Reloading RoomList");
            if ((((this.isOpen()) && (!(this._navigator.data._Str_4518 == null))) && (this._navigator.data._Str_4518.searchType == k)))
            {
                this._Str_2798(this._navigator.tabs.getSelected().id, k, "");
                return true;
            }
            return false;
        }

        public function _Str_2798(k:int, _arg_2:int, _arg_3:String="-1", _arg_4:int=1):void
        {
            var _local_5:Tab = this._navigator.tabs.getSelected();
            this._navigator.tabs._Str_13005(k);
            var _local_6:Tab = this._navigator.tabs.getSelected();
            ErrorReportStorage.addDebugData("StartSearch", ((("Start search " + _local_5.id) + " => ") + _local_6.id));
            if (this._phaseOneNavigator)
            {
                if (_arg_3.substr(0, 1) == "#")
                {
                    _arg_2 = Tabs._Str_5383;
                    _arg_3 = _arg_3.substr(1, (_arg_3.length - 1));
                }
            }
            this._blendCustomContent = (!(_local_5 == _local_6));
            if (_local_5 != _local_6)
            {
                _local_6._Str_5252._Str_6883();
            }
            this._navigator.data._Str_23771();
            if (_arg_4 == _Str_8485)
            {
                this._navigator.send(this._Str_23726(_arg_2, _arg_3));
            }
            else
            {
                if (_arg_4 == _Str_14620)
                {
                    this._navigator.send(new _Str_10397());
                }
                else
                {
                    if (_arg_4 != _Str_13989)
                    {
                        this._navigator.send(new _Str_11143(this._navigator.data._Str_6357));
                    }
                }
            }
            if (!this.isOpen())
            {
                this.open();
                this._blendingStage = _Str_10433;
                this._listContent.blend = 0;
                if (this._customContent.visible)
                {
                    this._customContent.blend = 0;
                    this._footer.blend = 0;
                }
            }
            else
            {
                this._blendingStage = _Str_15647;
            }
            this._loadCounter = 0;
            this._navigator.registerUpdateReceiver(this, 2);
            this._Str_24170(_arg_2);
            this._navigator.data._Str_4079 = null;
            if (this._phaseOneNavigator)
            {
                if (((!(this._Str_6414 == null)) && (!(_arg_3 == "-1"))))
                {
                    if (_arg_2 != Tabs._Str_5348)
                    {
                        this._Str_6414._Str_2497(_arg_3, _arg_2);
                    }
                }
            }
        }

        private function _Str_24170(k:int):void
        {
            switch (k)
            {
                case Tabs._Str_8122:
                    this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES));
                    return;
                case Tabs._Str_9161:
                    this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS));
                    return;
                case Tabs._Str_8161:
                    this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY));
                    return;
                case Tabs._Str_4869:
                    this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS));
                    return;
                case Tabs._Str_8698:
                    this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS));
                    return;
                case Tabs._Str_5348:
                    this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS));
                    return;
                case Tabs._Str_8473:
                    this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE));
                    return;
                case Tabs._Str_9593:
                    this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE));
                    return;
                case Tabs._Str_5383:
                    this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH));
                    return;
                case Tabs._Str_5622:
                    this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH));
                    return;
                case Tabs._Str_7094:
                    this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FREQUENT_HISTORY));
                    return;
            }
        }

        private function _Str_23726(k:int, _arg_2:String):IMessageComposer
        {
            var _local_3:_Str_4374;
            switch (k)
            {
                case Tabs._Str_8122:
                    return new _Str_11329();
                case Tabs._Str_9161:
                    return new _Str_9956();
                case Tabs._Str_8161:
                    return new _Str_12153();
                case Tabs._Str_4869:
                    return new _Str_9988();
                case Tabs._Str_5348:
                    return new _Str_10157(_arg_2, this._navigator.data._Str_6357);
                case Tabs._Str_8473:
                    return new _Str_10079();
                case Tabs._Str_9593:
                    return new _Str_9889(this._navigator.data._Str_6357);
                case Tabs._Str_5383:
                    return new _Str_4390(("tag:" + _arg_2));
                case Tabs._Str_5622:
                    return new _Str_4390(_arg_2);
                case Tabs._Str_8671:
                    return new _Str_4390(("group:" + _arg_2));
                case Tabs._Str_9523:
                    return new _Str_4390(("roomname:" + _arg_2));
                case Tabs._Str_10120:
                    return new _Str_10574(this._navigator.data._Str_6357);
                case Tabs._Str_9891:
                    _local_3 = this._navigator.data._Str_4079;
                    return new _Str_9911(_local_3.goalId, _local_3.pageIndex);
                case Tabs._Str_6358:
                case Tabs._Str_12070:
                    return new _Str_11181(this._navigator.data._Str_6357, k);
                case Tabs._Str_12236:
                    return new _Str_12106();
                case Tabs._Str_10261:
                    return new _Str_9844();
                case Tabs._Str_9661:
                    return new _Str_4390(("owner:" + _arg_2));
                case Tabs._Str_9699:
                    return new _Str_9807();
                case Tabs._Str_7094:
                    return new _Str_11269();
            }
            Logger.log(("No message for searchType: " + k));
            return null;
        }

        public function update(k:uint):void
        {
            var _local_3:Number;
            if (this._listContent == null)
            {
                return;
            }
            var _local_2:Number = (k / 150);
            if (this._blendingStage == _Str_15647)
            {
                _local_3 = Math.min(1, Math.max(0, (this._listContent.blend - _local_2)));
                this._listContent.blend = _local_3;
                this._customContent.blend = ((this._blendCustomContent) ? _local_3 : 1);
                this._footer.blend = ((this._blendCustomContent) ? _local_3 : 1);
                if (_local_3 == 0)
                {
                    this._blendingStage = _Str_10433;
                }
            }
            else
            {
                if (this._blendingStage == _Str_10433)
                {
                    if ((this._loadCounter % 10) == 1)
                    {
                        this._loadingText.visible = (!(this._loadingText.visible));
                    }
                    this._loadCounter++;
                    if (!this._navigator.data._Str_19838())
                    {
                        this._blendingStage = _Str_14003;
                    }
                }
                else
                {
                    if (this._blendingStage == _Str_14003)
                    {
                        this.refresh();
                        this._blendingStage = _Str_17528;
                    }
                    else
                    {
                        this._loadingText.visible = false;
                        _local_3 = Math.min(1, Math.max(0, (this._listContent.blend + _local_2)));
                        this._listContent.blend = _local_3;
                        this._customContent.blend = ((this._blendCustomContent) ? _local_3 : 1);
                        this._footer.blend = ((this._blendCustomContent) ? _local_3 : 1);
                        if (this._listContent.blend >= 1)
                        {
                            this._navigator.removeUpdateReceiver(this);
                        }
                    }
                }
            }
        }

        private function _Str_22608(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            if (_local_2 != this._mainWindow)
            {
                return;
            }
            if (!this._resizeTimer.running)
            {
                this._resizeTimer.reset();
                this._resizeTimer.start();
            }
        }

        private function _Str_3774(k:TimerEvent):void
        {
            _Str_9327(this._popularTags, false);
            _Str_9327(this._guestRooms, false);
            _Str_9327(this._roomAds, false);
            if (this._navigator.isPerkAllowed("NAVIGATOR_PHASE_ONE_2014"))
            {
            }
        }

        public function get _Str_6414():TextSearchInputs
        {
            return this._searchInput;
        }

        public function _Str_20903(k:Point):void
        {
            this._Str_19017();
            if (k != null)
            {
                this._mainWindow.position = k;
            }
            else
            {
                if (this._mainWindow.position.x == 0)
                {
                    this._mainWindow.position = this._Str_6092;
                }
            }
        }

        public function get _Str_13071():Boolean
        {
            return this._phaseOneNavigator;
        }
    }
}
