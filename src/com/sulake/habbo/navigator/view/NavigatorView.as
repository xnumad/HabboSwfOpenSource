package com.sulake.habbo.navigator.view
{
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.habbo.navigator.view.search.SearchView;
    import com.sulake.habbo.navigator.view.search.results.BlockResultsView;
    import com.sulake.habbo.navigator.view.search.results.RoomEntryElementFactory;
    import com.sulake.habbo.navigator.view.search.results.CategoryElementFactory;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import flash.geom.Rectangle;
    import flash.utils.getTimer;
    import com.sulake.habbo.navigator.view.search.ViewMode;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.SavedSearch;
    import com.sulake.habbo.communication.messages.incoming.newnavigator._Str_4173;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.IScrollableListWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window.components.ITabButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.habbo.navigator.view.search.results.ResultsModeEnum;

    public class NavigatorView implements IUpdateReceiver 
    {
        private static const _Str_16404:uint = 4000;
        private static const _Str_6985:int = 578;
        private static const _Str_15385:int = 115;
        private static const _Str_18101:int = 7;
        private static const _Str_17599:int = 7;

        private var _habboNewNavigator:HabboNewNavigator;
        private var _Str_16068:LiftView;
        private var _Str_8068:QuickLinksView;
        private var _Str_9680:SearchView;
        private var _Str_3208:BlockResultsView;
        private var _Str_4128:RoomEntryElementFactory;
        private var _Str_4787:CategoryElementFactory;
        private var _Str_4000:TopViewSelector;
        private var _roomInfoPopup:RoomInfoPopup;
        private var _Str_24732:IBorderWindow;
        private var _Str_25144:IBorderWindow;
        private var _Str_25621:IBorderWindow;
        private var _window:IWindowContainer;
        private var _Str_16928:Boolean;
        private var _Str_13838:uint;
        private var _Str_4451:int = -1;
        private var _Str_4599:int = -1;
        private var _Str_4481:int = -1;
        private var _Str_3860:int = -1;
        private var _Str_11769:Boolean = false;
        private var _Str_16641:int = -1;
        private var _Str_13354:int = 4000;
        private var _Str_23677:Boolean = false;
        private var _Str_8802:int;
        private var _Str_17392:int;
        private var _Str_3380:IWindow;
        private var _Str_20831:int;
        private var _Str_16596:Rectangle;

        public function NavigatorView(k:HabboNewNavigator)
        {
            this._Str_13838 = getTimer();
            this._Str_16596 = new Rectangle();
            super();
            this._habboNewNavigator = k;
        }

        public function set visible(k:Boolean):void
        {
            if (((k) && (this._habboNewNavigator.isReady)))
            {
                if (this._Str_4128 == null)
                {
                    this._Str_4128 = new RoomEntryElementFactory(this._habboNewNavigator);
                }
                if (this._Str_4787 == null)
                {
                    this._Str_4787 = new CategoryElementFactory(this._habboNewNavigator, this._Str_4128);
                }
                this._Str_25106();
                if (this._window == null)
                {
                    this._Str_7718();
                    this._habboNewNavigator.registerUpdateReceiver(this, 1000);
                    this._Str_8068._Str_22170(this._habboNewNavigator._Str_7014._Str_8597);
                }
                if (this._habboNewNavigator._Str_3440 != null)
                {
                    this._Str_18091(this._habboNewNavigator._Str_3440);
                }
                else
                {
                    if (!this._Str_16928)
                    {
                        this._habboNewNavigator._Str_3310(ViewMode.OFFICIAL_VIEW);
                    }
                }
                this._window.activate();
            }
            else
            {
                if (this._roomInfoPopup)
                {
                    this._roomInfoPopup.show(false);
                }
            }
            if (this._window)
            {
                this._window.visible = k;
            }
        }

        public function get visible():Boolean
        {
            if (this._window)
            {
                return this._window.visible;
            }
            return false;
        }

        public function _Str_23074(k:int, _arg_2:int, _arg_3:int, _arg_4:Boolean, _arg_5:int):void
        {
            if (this._window)
            {
                this._Str_6496((!(_arg_4)));
                this._window.x = k;
                this._window.y = _arg_2;
                this._window.height = _arg_3;
            }
            else
            {
                this._Str_4451 = k;
                this._Str_4599 = _arg_2;
                this._Str_3860 = _arg_3;
                this._Str_11769 = _arg_4;
            }
        }

        public function _Str_11632(k:Vector.<SavedSearch>):void
        {
            if (this._Str_8068)
            {
                this._Str_8068._Str_22170(k);
            }
        }

        private function _Str_25106():void
        {
            if (this._Str_3208 == null)
            {
                this._Str_3208 = new BlockResultsView(this._habboNewNavigator);
                this._Str_3208._Str_24528 = this._Str_4787;
                this._Str_4787._Str_23184 = this._Str_3208;
            }
            if (this._Str_9680 == null)
            {
                this._Str_9680 = new SearchView(this._habboNewNavigator);
            }
            if (this._Str_8068 == null)
            {
                this._Str_8068 = new QuickLinksView(this._habboNewNavigator);
            }
            if (this._Str_16068 == null)
            {
            }
            if (this._Str_4000 == null)
            {
                this._Str_4000 = new TopViewSelector(this._habboNewNavigator);
            }
        }

        public function _Str_18091(k:_Str_4173, _arg_2:String=""):void
        {
            var _local_3:int;
            if (this._habboNewNavigator._Str_16771)
            {
                return;
            }
            if (((!(this._Str_4128)) || (!(this._Str_3208))))
            {
                return;
            }
            this._Str_4128.viewMode = ViewMode._Str_20005(k._Str_4569);
            this._Str_3208._Str_22947();
            if (this._habboNewNavigator._Str_7014._Str_23059(k._Str_4569))
            {
                _local_3 = this._habboNewNavigator._Str_7014._Str_9965().indexOf(k._Str_4569);
                if (_local_3 != -1)
                {
                    this._Str_4000._Str_12925(_local_3);
                }
            }
            this._window.findChildByName("create_room").procedure = this._Str_25038;
            this._window.findChildByName("random_room_border").visible = false;
            this._window.findChildByName("promote_room_border").visible = false;
            if (((k._Str_4569 == ViewMode.ROOMADS_VIEW) || (k._Str_4569 == ViewMode.MYWORLD_VIEW)))
            {
                this._window.findChildByName("promote_room_border").visible = true;
                this._window.findChildByName("promote_room").procedure = this._Str_23064;
            }
            else
            {
                this._window.findChildByName("random_room_border").visible = true;
                this._window.findChildByName("random_room").procedure = this._Str_22366;
            }
            this._Str_9680._Str_22850(k._Str_5610, _arg_2);
            this._habboNewNavigator._Str_16771 = true;
            this._Str_9330 = false;
            if (this._roomInfoPopup)
            {
                this._roomInfoPopup.show(false);
            }
        }

        public function _Str_24940():String
        {
            if (this._Str_9680 != null)
            {
                return this._Str_9680._Str_25291;
            }
            return null;
        }

        public function _Str_24377():void
        {
            if (this._Str_16068)
            {
                this._Str_16068.refresh();
            }
        }

        public function _Str_15353(k:_Str_2370, _arg_2:int, _arg_3:int, _arg_4:Boolean=false):void
        {
            this._Str_23677 = true;
            if (!this._window)
            {
                return;
            }
            if (!this._roomInfoPopup)
            {
                this._roomInfoPopup = new RoomInfoPopup(this._habboNewNavigator);
            }
            if (((this._roomInfoPopup.visible) && (!(_arg_4))))
            {
                this._roomInfoPopup.show(false);
            }
            else
            {
                this._roomInfoPopup._Str_5479(k);
                if (((!(k.habboGroupId == 0)) && (this._habboNewNavigator._Str_20693(k.habboGroupId) == null)))
                {
                    this._habboNewNavigator._Str_18961(k.habboGroupId, false);
                    this._Str_16641 = k.habboGroupId;
                }
                this._roomInfoPopup._Str_23392(true, _arg_2, _arg_3);
                this._habboNewNavigator.trackEventLog("browse.openroominfo", "Results", k.roomName, k.flatId);
                this._Str_13354 = _Str_16404;
            }
        }

        public function get mainWindow():IFrameWindow
        {
            return this._window as IFrameWindow;
        }

        public function set _Str_9330(k:Boolean):void
        {
            if (this._window)
            {
                this._window.caption = ((k) ? "${navigator.title.is.busy}" : "${navigator.title}");
                this._window.findChildByName("search_waiting_for_results_mask").visible = k;
            }
            this._Str_16928 = k;
        }

        public function get _Str_9330():Boolean
        {
            return this._Str_16928;
        }

        private function _Str_7718():void
        {
            var k:IWindowContainer = IWindowContainer(this._habboNewNavigator.windowManager.buildFromXML(XML(this._habboNewNavigator.assets.getAssetByName("navigator_frame_2_xml").content)));
            IScrollableListWindow(k.findChildByName("block_results"))._Str_6416 = false;
            var _local_2:IWindowContainer = IWindowContainer(k.findChildByName("navigator_entry_row_container"));
            this._Str_4128._Str_23915 = IWindowContainer(_local_2.clone());
            _local_2.destroy();
            var _local_3:IItemListWindow = IItemListWindow(k.findChildByName("navigator_entry_tile_container").clone());
            var _local_4:IWindowContainer = IWindowContainer(_local_3.getListItemByName("navigator_entry_tile").clone());
            this._Str_4128._Str_24632 = _local_4;
            _local_3.destroyListItems();
            this._Str_4128._Str_25029 = _local_3;
            IItemListWindow(k.findChildByName("category_content")).destroyListItems();
            var _local_5:IWindowContainer = IWindowContainer(k.findChildByName("category_container"));
            this._Str_4787._Str_25135 = IWindowContainer(_local_5.clone());
            IItemListWindow(k.findChildByName("block_results")).removeListItemAt(0);
            _local_5.destroy();
            var _local_6:IWindowContainer = IWindowContainer(k.findChildByName("category_container_collapsed"));
            this._Str_4787._Str_23119 = IWindowContainer(_local_6.clone());
            IItemListWindow(k.findChildByName("block_results")).removeListItemAt(0);
            _local_6.destroy();
            var _local_7:IWindowContainer = IWindowContainer(k.findChildByName("no_results_container"));
            this._Str_4787._Str_24754 = IWindowContainer(_local_7.clone());
            IItemListWindow(k.findChildByName("block_results")).removeListItemAt(0);
            _local_7.destroy();
            this._Str_3208.itemList = IItemListWindow(k.findChildByName("block_results"));
            this._Str_9680.container = IWindowContainer(k.findChildByName("search_tools"));
            var _local_8:IRegionWindow = IRegionWindow(k.findChildByName("quick_link"));
            _local_8.findChildByName("quick_link_text").caption = "";
            this._Str_8068.template = IRegionWindow(_local_8.clone());
            this._Str_8068.itemList = IItemListWindow(k.findChildByName("quicklinks_list"));
            IItemListWindow(k.findChildByName("quicklinks_list")).removeListItems();
            _local_8.destroy();
            var _local_9:ITabContextWindow = ITabContextWindow(k.findChildByName("top_view_select_tab_context"));
            var _local_10:ITabButtonWindow = ITabButtonWindow(_local_9._Str_3363(0).clone());
            this._Str_4000.template = _local_10;
            this._Str_4000._Str_23159 = _local_9;
            _local_9._Str_5897(_local_10);
            this._Str_4000.refresh();
            this._Str_24732 = IBorderWindow(k.findChildByName("create_room_border").clone());
            IItemListWindow(k.findChildByName("left_pane")).removeListItem(k.findChildByName("create_room_border"));
            this._Str_25144 = IBorderWindow(k.findChildByName("promote_room_border").clone());
            IItemListWindow(k.findChildByName("left_pane")).removeListItem(k.findChildByName("promote_room_border"));
            this._Str_25621 = IBorderWindow(k.findChildByName("random_room_border").clone());
            IItemListWindow(k.findChildByName("left_pane")).removeListItem(k.findChildByName("random_room_border"));
            this._Str_20831 = k.findChildByName("left_pane").x;
            k.findChildByName("refreshButton").procedure = this._Str_22805;
            k.findChildByName("header_button_close").procedure = this._Str_25010;
            this._Str_8802 = _Str_18101;
            k.findChildByName("temp_back").procedure = this._Str_25734;
            this._Str_3380 = k.findChildByName("right_pane");
            this._Str_17392 = this._Str_3380.x;
            this._window = k;
            this._Str_6496(false);
            if (((this._Str_4451 == -1) && (this._Str_4599 == -1)))
            {
                this._Str_4451 = this._window.x;
                this._Str_4599 = this._window.y;
                this._Str_4481 = this._window.width;
                this._Str_3860 = this._window.height;
            }
            else
            {
                if (this._Str_11769)
                {
                    this._Str_6496(true);
                }
                this._window.x = this._Str_4451;
                this._window.y = this._Str_4599;
                this._window.height = this._Str_3860;
            }
            this._Str_13838 = getTimer();
        }

        private function _Str_22805(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((k.type == WindowMouseEvent.CLICK) && (_arg_2.name == "refreshButton")))
            {
                this._habboNewNavigator._Str_20175();
            }
        }

        private function _Str_25010(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (_arg_2.name == "header_button_close")
                {
                    this.visible = false;
                }
            }
        }

        private function _Str_25038(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._habboNewNavigator.createRoom();
                if (this._roomInfoPopup)
                {
                    this._roomInfoPopup.show(false);
                }
            }
        }

        private function _Str_23064(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._habboNewNavigator.context.createLinkEvent("catalog/open/room_ad");
                if (this._roomInfoPopup)
                {
                    this._roomInfoPopup.show(false);
                }
            }
        }

        private function _Str_22366(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._habboNewNavigator.context.createLinkEvent("navigator/goto/random_friending_room");
                if (this._roomInfoPopup)
                {
                    this._roomInfoPopup.show(false);
                }
                this.visible = false;
            }
        }

        private function _Str_25734(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:IWindow;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = this._window.findChildByName("left_pane");
                this._Str_6496((!(_local_3.visible)));
                if (this._roomInfoPopup)
                {
                    this._roomInfoPopup.show(false);
                }
            }
        }

        public function _Str_6496(k:Boolean):void
        {
            var _local_5:int;
            var _local_2:IWindow = this._window.findChildByName("left_pane");
            var _local_3:int = ((this._Str_17392 - this._Str_20831) + _Str_17599);
            this._Str_3380.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_FIXED, true);
            this._Str_3380.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRETCH, false);
            if (!k)
            {
                _local_2.visible = false;
                this._Str_3380.x = this._Str_8802;
                this._window.limits.minWidth = ((this._window.width - _local_3) + this._Str_8802);
                this._window.limits.maxWidth = ((this._window.width - _local_3) + this._Str_8802);
                this._window.width = ((this._window.width - _local_3) + this._Str_8802);
            }
            else
            {
                _local_2.visible = true;
                this._Str_3380.x = this._Str_17392;
                _local_5 = ((this._window.width + _local_3) - this._Str_8802);
                this._window.limits.minWidth = ((_local_5 > _Str_6985) ? _Str_6985 : _local_5);
                this._window.limits.maxWidth = ((_local_5 > _Str_6985) ? _Str_6985 : _local_5);
                this._window.width = ((_local_5 > _Str_6985) ? _Str_6985 : _local_5);
            }
            this._Str_3380.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_FIXED, false);
            this._Str_3380.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRETCH, true);
            this._window.findChildByName("left_hide_container").visible = k;
            this._window.findChildByName("left_show_container").visible = (!(k));
            var _local_4:int = ((k) ? _Str_15385 : (_Str_15385 - (_local_3 / 2)));
            this._window.findChildByName("top_view_select_tab_context").x = _local_4;
        }

        private function _Str_24575():void
        {
            this._window.x = Math.max(0, this._window.x);
            this._window.y = Math.max(0, this._window.y);
            if (this._window.desktop)
            {
                this._window.x = Math.min((this._window.desktop.width - this._window.width), this._window.x);
                this._window.y = Math.min((this._window.desktop.height - this._window.height), this._window.y);
            }
        }

        private function _Str_10331():void
        {
            this._Str_4451 = this._window.x;
            this._Str_4599 = this._window.y;
            this._Str_4481 = this._window.width;
            this._Str_3860 = this._window.height;
            this._Str_11769 = this._window.findChildByName("left_pane").visible;
            this._Str_13838 = getTimer();
            this._habboNewNavigator._Str_10331(this._Str_4451, this._Str_4599, this._Str_4481, this._Str_3860, this._Str_11769, ResultsModeEnum._Str_6023);
            this._habboNewNavigator.trackEventLog("windowsettings", "Interface", ((this._window.width + " x ") + this._window.height));
        }

        private function get _Str_25319():Boolean
        {
            if (this._Str_11769 != this._window.findChildByName("left_pane").visible)
            {
                return true;
            }
            if (this._Str_4451 != this._window.x)
            {
                return true;
            }
            if (this._Str_4599 != this._window.y)
            {
                return true;
            }
            if (this._Str_3860 != this._window.height)
            {
                return true;
            }
            return false;
        }

        public function update(k:uint):void
        {
            var _local_2:uint = getTimer();
            if (((this._Str_25319) && ((_local_2 - this._Str_13838) > 5000)))
            {
                this._Str_10331();
            }
            this._Str_24575();
            this._Str_13354 = (this._Str_13354 - k);
            if (((this._Str_15872) && (this._Str_13354 < 0)))
            {
                this._roomInfoPopup.getGlobalRectangle(this._Str_16596);
                if (!this._Str_16596.contains(this._window.desktop.mouseX, this._window.desktop.mouseY))
                {
                    this._roomInfoPopup.show(false);
                }
            }
        }

        public function dispose():void
        {
            this._habboNewNavigator.removeUpdateReceiver(this);
        }

        public function get disposed():Boolean
        {
            return false;
        }

        public function _Str_24313(k:int):void
        {
            if (this._Str_16641 == k)
            {
                this._Str_16641 = -1;
            }
        }

        public function get _Str_15872():Boolean
        {
            if (this._roomInfoPopup)
            {
                return this._roomInfoPopup.visible;
            }
            return false;
        }
    }
}
