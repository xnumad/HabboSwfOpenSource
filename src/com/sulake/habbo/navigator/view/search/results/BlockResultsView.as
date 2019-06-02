package com.sulake.habbo.navigator.view.search.results
{
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.core.window.components.IItemListWindow;
    import flash.utils.Dictionary;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.SearchResultSet;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.SearchResultList;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.navigator.view.search.ViewMode;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;

    public class BlockResultsView 
    {
        private var _navigator:HabboNewNavigator;
        private var _itemList:IItemListWindow;
        private var _categoryElementFactory:CategoryElementFactory;
        private var _searchCodeShowMore:Dictionary;
        private var _currentWindowsInItemList:Dictionary;
        private var _searchCodeViewMode:Dictionary;

        public function BlockResultsView(k:HabboNewNavigator)
        {
            this._searchCodeShowMore = new Dictionary();
            this._currentWindowsInItemList = new Dictionary();
            this._searchCodeViewMode = new Dictionary();
            super();
            this._navigator = k;
        }

        public function get itemList():IItemListWindow
        {
            return this._itemList;
        }

        public function set itemList(k:IItemListWindow):void
        {
            this._itemList = k;
            this._itemList.disableAutodrag = true;
        }

        public function set _Str_24528(k:CategoryElementFactory):void
        {
            this._categoryElementFactory = k;
        }

        public function _Str_22947():void
        {
            var k:IWindow;
            var _local_2:SearchResultSet;
            var _local_3:int;
            var _local_4:SearchResultList;
            if (this._navigator._Str_3440 == null)
            {
                return;
            }
            this._currentWindowsInItemList = new Dictionary();
            this._searchCodeShowMore = new Dictionary();
            this._searchCodeViewMode = new Dictionary();
            this._itemList.destroyListItems();
            if (this._navigator._Str_3440._Str_11413._Str_7385.length == 0)
            {
                this._itemList.addListItem(this._categoryElementFactory._Str_24646());
            }
            else
            {
                _local_2 = this._navigator._Str_3440._Str_11413;
                _local_3 = 0;
                while (_local_3 < _local_2._Str_7385.length)
                {
                    _local_4 = _local_2._Str_7385[_local_3];
                    k = this._Str_20272(_local_3, (((!(this._Str_23804(_local_4.searchCode))) || (this._Str_25088(_local_2))) && (!(_local_4._Str_25561))));
                    k.id = _local_3;
                    this._itemList.addListItem(k);
                    this._currentWindowsInItemList[_local_3] = k;
                    this._searchCodeShowMore[_local_3] = _local_4.searchCode;
                    this._searchCodeViewMode[_local_3] = _local_4.viewMode;
                    _local_3++;
                }
            }
            this._itemList.arrangeListItems();
        }

        public function _Str_19195(k:WindowEvent):void
        {
            this._navigator._Str_3310(this._searchCodeShowMore[k.window.id], this._navigator._Str_3440._Str_5610);
            this._navigator.trackEventLog("browse.expandsearch", "Results", HabboNewNavigator._Str_6560(this._searchCodeShowMore[k.window.id], this._navigator._Str_3440._Str_5610));
        }

        public function _Str_23002(k:WindowEvent):void
        {
            this._navigator._Str_25434();
        }

        public function _Str_19418(k:WindowEvent):void
        {
            this._navigator._Str_23169(this._searchCodeShowMore[k.window.id]);
            this._navigator._Str_8273.push(this._searchCodeShowMore[k.window.id]);
            this._Str_18512(k.window.id, false);
            this._navigator.trackEventLog("browse.collapsecategory", "Results", HabboNewNavigator._Str_6560(this._searchCodeShowMore[k.window.id], this._navigator._Str_3440._Str_5610));
        }

        public function _Str_21896(k:WindowEvent):void
        {
            this._navigator._Str_23630(this._searchCodeShowMore[k.window.id]);
            this._navigator._Str_8273.splice(this._navigator._Str_8273.indexOf(this._searchCodeShowMore[k.window.id]), 1);
            this._Str_18512(k.window.id, true);
            this._navigator.trackEventLog("browse.uncollapsecategory", "Results", HabboNewNavigator._Str_6560(this._searchCodeShowMore[k.window.id], this._navigator._Str_3440._Str_5610));
        }

        public function _Str_21650(k:WindowEvent):void
        {
            this._navigator._Str_25074(this._searchCodeShowMore[k.window.id], this._navigator._Str_3440._Str_5610);
        }

        public function _Str_20474(k:WindowEvent):void
        {
            var _local_2:int = this._Str_25538(this._searchCodeViewMode[k.window.id]);
            this._navigator._Str_25231(this._searchCodeShowMore[k.window.id], _local_2);
            this._navigator._Str_3440._Str_11413._Str_7385[k.window.id].viewMode = _local_2;
            this._Str_18512(k.window.id, true);
            this._searchCodeViewMode[k.window.id] = _local_2;
        }

        private function _Str_25538(k:int):int
        {
            if (k == ResultsModeEnum._Str_6023)
            {
                return ResultsModeEnum._Str_13822;
            }
            return ResultsModeEnum._Str_6023;
        }

        public function get _Str_20093():int
        {
            return this._itemList.width;
        }

        private function _Str_23804(k:String):Boolean
        {
            return !(this._navigator._Str_8273.indexOf(k) == -1);
        }

        private function _Str_25088(k:SearchResultSet):Boolean
        {
            return k._Str_7385.length == 1;
        }

        private function _Str_20272(k:int, _arg_2:Boolean):IWindow
        {
            var _local_5:int;
            var _local_3:SearchResultList = this._navigator._Str_3440._Str_11413._Str_7385[k];
            var _local_4:String = ((_local_3.text == "") ? (("${navigator.searchcode.title." + _local_3.searchCode) + "}") : _local_3.text);
            if (_arg_2)
            {
                _local_5 = (((!(this._navigator._Str_2627.isPerkAllowed(PerkEnum.NAVIGATOR_ROOM_THUMBNAIL_CAMERA))) && (!(this._navigator._Str_3440._Str_4569 == ViewMode.OFFICIAL_VIEW))) ? ResultsModeEnum._Str_6023 : _local_3.viewMode);
                return this._categoryElementFactory._Str_22713(_local_3.guestRooms, _local_4, k, _local_3.actionAllowed, _local_5);
            }
            return this._categoryElementFactory._Str_24067(_local_4, k, _local_3.actionAllowed);
        }

        private function _Str_18512(k:int, _arg_2:Boolean):void
        {
            var _local_3:int = this._itemList.getListItemIndex(this._currentWindowsInItemList[k]);
            this._itemList.removeListItemAt(_local_3);
            var _local_4:IWindow = this._Str_20272(k, _arg_2);
            _local_4.id = k;
            this._itemList.addListItemAt(_local_4, _local_3);
            this._currentWindowsInItemList[k] = _local_4;
        }
    }
}
