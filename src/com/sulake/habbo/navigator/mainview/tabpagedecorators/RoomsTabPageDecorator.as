package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.core.window.events.*;

    public class RoomsTabPageDecorator implements ITabPageDecorator 
    {
        private var _navigator:HabboNavigator;
        private var _filter:IDropMenuWindow;
        private var _personalizedRoomsEnabled:Boolean = false;

        public function RoomsTabPageDecorator(k:HabboNavigator)
        {
            this._navigator = k;
        }

        public function refreshCustomContent(k:IWindowContainer):void
        {
            var _local_2:String = "rooms_header";
            var _local_3:IWindowContainer = (k.getChildByName(_local_2) as IWindowContainer);
            if (((this._filter == null) || (this._filter.disposed)))
            {
                this._filter = IDropMenuWindow(_local_3.findChildByName("roomCtgFilter"));
                this.prepareRoomCategories();
                this._filter.addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this.onFilterSelected);
            }
            _local_3.visible = true;
        }

        public function prepareRoomCategories():void
        {
            var _local_2:FlatCategory;
            if (((this._filter == null) || (this._filter.disposed)))
            {
                return;
            }
            var k:Array = [this._navigator.getText("navigator.navisel.popularrooms"), this._navigator.getText("navigator.navisel.highestscore")];
            this._personalizedRoomsEnabled = this._navigator.context.configuration.getBoolean("navigator.2014.personalized.navigator");
            if (this._personalizedRoomsEnabled)
            {
                k.push(this._navigator.getText("navigator.navisel.recommendedrooms"));
            }
            for each (_local_2 in this._navigator.data._Str_11717)
            {
                k.push(_local_2.nodeName);
            }
            this._filter.populate(k);
            this._filter.selection = this.defaultSelection;
        }

        private function get defaultSelection():int
        {
            return (this._personalizedRoomsEnabled) ? 2 : 0;
        }

        public function tabSelected():void
        {
            if (((!(this._filter == null)) && (!(this._filter.disposed))))
            {
                this._filter.removeEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this.onFilterSelected);
                this._filter.selection = this.defaultSelection;
                this._filter.addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this.onFilterSelected);
            }
        }

        public function refreshFooter(k:IWindowContainer):void
        {
            this._navigator.officialRoomEntryManager._Str_21717(k);
        }

        public function navigatorOpenedWhileInTab():void
        {
            this.startSearch();
        }

        private function onFilterSelected(k:WindowEvent):void
        {
            this.startSearch();
        }

        private function startSearch():void
        {
            var _local_2:int;
            var _local_3:FlatCategory;
            var _local_4:int;
            var k:int = (((this._filter) && (!(this._filter.disposed))) ? this._filter.selection : this.defaultSelection);
            Logger.log(("Room filter changed: " + k));
            if (k == 0)
            {
                this._navigator.mainViewCtrl.startSearch(Tabs.TAB_ROOMS, Tabs.SEARCHTYPE_POPULAR_ROOMS);
            }
            else
            {
                if (k == 1)
                {
                    this._navigator.mainViewCtrl.startSearch(Tabs.TAB_ROOMS, Tabs.SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE);
                }
                else
                {
                    if (((k == 2) && (this._personalizedRoomsEnabled)))
                    {
                        this._navigator.mainViewCtrl.startSearch(Tabs.TAB_ROOMS, Tabs.SEARCHTYPE_RECOMMENDED_ROOMS);
                    }
                    else
                    {
                        _local_2 = 2;
                        if (this._personalizedRoomsEnabled)
                        {
                            _local_2++;
                        }
                        _local_3 = this._navigator.data._Str_11717[(k - _local_2)];
                        if (_local_3 == null)
                        {
                            Logger.log(((("No fc found: " + k) + ", ") + this._navigator.data._Str_11717.length));
                            return;
                        }
                        _local_4 = _local_3.nodeId;
                        Logger.log(("Searching with catId: " + _local_4));
                        this._navigator.mainViewCtrl.startSearch(Tabs.TAB_ROOMS, Tabs.SEARCHTYPE_POPULAR_ROOMS, ("" + _local_4));
                    }
                }
            }
            if (((this._filter) && (!(this._filter.disposed))))
            {
                this._navigator.trackNavigationDataPoint(this._filter.items()[this._filter.selection], "category.view");
            }
        }

        public function get filterCategory():String
        {
            return ((this._filter) && (!(this._filter.disposed))) ? this._filter.items()[this._filter.selection] : null;
        }

        public function setSubSelection(k:int):void
        {
        }

        public function processSearchParam(k:String):String
        {
            return k;
        }
    }
}


