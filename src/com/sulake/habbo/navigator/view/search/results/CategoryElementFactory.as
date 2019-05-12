package com.sulake.habbo.navigator.view.search.results
{
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.SearchResultList;
    import com.sulake.habbo.navigator.view.search.ViewMode;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import __AS3__.vec.Vector;

    public class CategoryElementFactory 
    {
        private static const _Str_14513:int = 13;

        private var _navigator:HabboNewNavigator;
        private var _blockResultsView:BlockResultsView;
        private var _roomEntryElementFactory:RoomEntryElementFactory;
        private var _categoryTemplate:IWindowContainer;
        private var _collapsedCategoryTemplate:IWindowContainer;
        private var _noResultsTemplate:IWindowContainer;

        public function CategoryElementFactory(k:HabboNewNavigator, _arg_2:RoomEntryElementFactory)
        {
            this._navigator = k;
            this._roomEntryElementFactory = _arg_2;
        }

        public function set _Str_23184(k:BlockResultsView):void
        {
            this._blockResultsView = k;
        }

        public function set _Str_25135(k:IWindowContainer):void
        {
            this._categoryTemplate = k;
        }

        public function set _Str_23119(k:IWindowContainer):void
        {
            this._collapsedCategoryTemplate = k;
        }

        public function set _Str_24754(k:IWindowContainer):void
        {
            this._noResultsTemplate = k;
        }

        public function _Str_22713(guestRooms:Vector.<_Str_2370>, title:String, showMoreId:int=-1, actionAllowed:int=0, resultMode:int=-1):IWindowContainer
        {
            var guestRoom:_Str_2370;
            var alternatingColor:int;
            var container:IWindowContainer = IWindowContainer(this._categoryTemplate.clone());
            container.width = (this._blockResultsView._Str_20093 - _Str_14513);
            container.height = (16 + (this._roomEntryElementFactory._Str_19124 * (guestRooms.length + 1)));
            container.findChildByName("category_name").caption = title;
            container.findChildByName("category_back").addEventListener(WindowMouseEvent.CLICK, this._blockResultsView._Str_23002);
            container.findChildByName("category_back").visible = (actionAllowed == SearchResultList._Str_15183);
            container.findChildByName("category_collapse").visible = (!(actionAllowed == SearchResultList._Str_15183));
            container.findChildByName("category_collapse").id = showMoreId;
            container.findChildByName("category_collapse").addEventListener(WindowMouseEvent.CLICK, this._blockResultsView._Str_19418);
            container.findChildByName("category_name_region").id = showMoreId;
            container.findChildByName("category_name_region").addEventListener(WindowMouseEvent.CLICK, this._blockResultsView._Str_19418);
            container.findChildByName("category_show_more").id = showMoreId;
            container.findChildByName("category_show_more").addEventListener(WindowMouseEvent.CLICK, this._blockResultsView._Str_19195);
            container.findChildByName("category_show_more").visible = (actionAllowed == SearchResultList._Str_14200);
            container.findChildByName("category_add_quick_link").id = showMoreId;
            container.findChildByName("category_add_quick_link").addEventListener(WindowMouseEvent.CLICK, this._blockResultsView._Str_21650);
            container.findChildByName("category_content_background").background = true;
            container.findChildByName("category_content_background").height = (12 + (this._roomEntryElementFactory._Str_19124 * (guestRooms.length + 1)));
            container.findChildByName("category_add_quick_link").visible = (this._navigator._Str_3440._Str_4569.indexOf(ViewMode.OFFICIAL_VIEW) == -1);
            var headerControls:IItemListWindow = IItemListWindow(container.findChildByName("category_controls_itemlist"));
            if (this._navigator._Str_2627.isPerkAllowed(PerkEnum.NAVIGATOR_ROOM_THUMBNAIL_CAMERA))
            {
                headerControls.getListItemByName("category_toggle_tiles").addEventListener(WindowMouseEvent.CLICK, this._blockResultsView._Str_20474);
                headerControls.getListItemByName("category_toggle_tiles").id = showMoreId;
                headerControls.getListItemByName("category_toggle_tiles").visible = (resultMode == ResultsModeEnum._Str_6023);
                headerControls.getListItemByName("category_toggle_rows").addEventListener(WindowMouseEvent.CLICK, this._blockResultsView._Str_20474);
                headerControls.getListItemByName("category_toggle_rows").id = showMoreId;
                headerControls.getListItemByName("category_toggle_rows").visible = (resultMode == ResultsModeEnum._Str_13822);
            }
            else
            {
                headerControls.removeListItem(headerControls.getListItemByName("category_toggle_tiles"));
                headerControls.removeListItem(headerControls.getListItemByName("category_toggle_rows"));
            }
            headerControls.arrangeListItems();
            var roomList:IItemListWindow = IItemListWindow(container.findChildByName("category_content"));
            if (resultMode == ResultsModeEnum._Str_6023)
            {
                roomList.spacing = 0;
            }
            var colorMod:uint = 9412607;
            var color:int = -1;
            var colorModAccumulator:int = 1;
            var currentTileContainer:IItemListWindow;
            for each (guestRoom in guestRooms)
            {
                alternatingColor = (((colorModAccumulator % 2) == 0) ? color : colorMod);
                if (resultMode == ResultsModeEnum._Str_6023)
                {
                    roomList.addListItem(this._roomEntryElementFactory._Str_24858(guestRoom, alternatingColor));
                    colorModAccumulator = (colorModAccumulator + 1);
                }
                else
                {
                    if (!currentTileContainer)
                    {
                        currentTileContainer = this._roomEntryElementFactory._Str_25258();
                        roomList.addListItem(currentTileContainer);
                    }
                    currentTileContainer.addEventListener(WindowMouseEvent.WHEEL, function (k:WindowMouseEvent):void
                    {
                        _blockResultsView.itemList.scrollV = (_blockResultsView.itemList.scrollV - (k.delta * 0.01));
                    });
                    currentTileContainer.addListItem(this._roomEntryElementFactory._Str_22789(guestRoom, alternatingColor));
                    if (currentTileContainer.numListItems >= RoomEntryElementFactory._Str_17291)
                    {
                        currentTileContainer = null;
                        colorModAccumulator = (colorModAccumulator + 1);
                    }
                }
            }
            roomList.arrangeListItems();
            return container;
        }

        public function _Str_24067(k:String, _arg_2:int=-1, _arg_3:int=0):IWindowContainer
        {
            var _local_4:IWindowContainer = IWindowContainer(this._collapsedCategoryTemplate.clone());
            _local_4.findChildByName("category_name").caption = k;
            _local_4.findChildByName("category_show_more").id = _arg_2;
            _local_4.findChildByName("category_show_more").addEventListener(WindowMouseEvent.CLICK, this._blockResultsView._Str_19195);
            _local_4.findChildByName("category_show_more").visible = (_arg_3 == SearchResultList._Str_14200);
            _local_4.findChildByName("category_expand").addEventListener(WindowMouseEvent.CLICK, this._blockResultsView._Str_21896);
            _local_4.findChildByName("category_expand").id = _arg_2;
            _local_4.findChildByName("category_name_region").addEventListener(WindowMouseEvent.CLICK, this._blockResultsView._Str_21896);
            _local_4.findChildByName("category_name_region").id = _arg_2;
            _local_4.findChildByName("category_add_quick_link").addEventListener(WindowMouseEvent.CLICK, this._blockResultsView._Str_21650);
            _local_4.findChildByName("category_add_quick_link").id = _arg_2;
            _local_4.findChildByName("category_add_quick_link").visible = (this._navigator._Str_3440._Str_4569.indexOf(ViewMode.OFFICIAL_VIEW) == -1);
            _local_4.width = (this._blockResultsView._Str_20093 - _Str_14513);
            IItemListWindow(_local_4.findChildByName("category_controls_itemlist")).arrangeListItems();
            return _local_4;
        }

        public function _Str_24646():IWindowContainer
        {
            return IWindowContainer(this._noResultsTemplate.clone());
        }
    }
}
