package com.sulake.habbo.navigator.view
{
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.navigator.context.SearchContext;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.SavedSearch;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IContainerButtonWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class QuickLinksView 
    {
        private var _navigator:HabboNewNavigator;
        private var _template:IRegionWindow;
        private var _itemList:IItemListWindow;
        private var _linkSearches:Array;
        private var _searchIds:Array;

        public function QuickLinksView(k:HabboNewNavigator)
        {
            this._linkSearches = [];
            this._searchIds = [];
            super();
            this._navigator = k;
        }

        public function set itemList(k:IItemListWindow):void
        {
            this._itemList = k;
        }

        public function set template(k:IRegionWindow):void
        {
            this._template = k;
        }

        public function _Str_22170(k:Vector.<SavedSearch>):void
        {
            var _local_3:IRegionWindow;
            var _local_4:ITextWindow;
            this._itemList.removeListItems();
            this._linkSearches = [];
            this._searchIds = [];
            var _local_2:int;
            while (_local_2 < k.length)
            {
                _local_3 = IRegionWindow(this._template.clone());
                _local_3.id = _local_2;
                _local_4 = ITextWindow(_local_3.findChildByName("quick_link_text"));
                _local_4.caption = (this._navigator.localization.getLocalization(("navigator.searchcode.title." + k[_local_2].searchCode), k[_local_2].searchCode) + ((k[_local_2].filter != "") ? (" - " + k[_local_2].filter) : ""));
                if (k[_local_2].searchCode.indexOf("category__") == 0)
                {
                    _local_4.caption = (k[_local_2].searchCode.substr("category__".length) + ((k[_local_2].filter != "") ? (" - " + k[_local_2].filter) : ""));
                }
                _local_3.procedure = this._Str_25005;
                this._linkSearches.push(new SearchContext(k[_local_2].searchCode, k[_local_2].filter));
                this._searchIds.push(k[_local_2].id);
                this._itemList.addListItem(_local_3);
                _local_2++;
            }
        }

        private function _Str_25005(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                if ((_arg_2 is IRegionWindow))
                {
                    if (this._linkSearches.length > _arg_2.id)
                    {
                        this._navigator._Str_21272(this._linkSearches[_arg_2.id]);
                        this._navigator.trackEventLog("savedsearch.execute", "SavedSearch", HabboNewNavigator._Str_6560(this._linkSearches[_arg_2.id].searchCode, this._linkSearches[_arg_2.id].filtering));
                    }
                }
                else
                {
                    if ((_arg_2 is IContainerButtonWindow))
                    {
                        this._navigator._Str_25285(this._searchIds[_arg_2.parent.id]);
                    }
                }
            }
            else
            {
                if (k.type == WindowMouseEvent.OVER)
                {
                    if ((_arg_2 is IRegionWindow))
                    {
                        IContainerButtonWindow(IRegionWindow(_arg_2).getChildAt(1)).visible = true;
                    }
                    else
                    {
                        if ((_arg_2 is IContainerButtonWindow))
                        {
                            _arg_2.visible = true;
                        }
                    }
                }
                else
                {
                    if (((k.type == WindowMouseEvent.OUT) && (_arg_2 is IRegionWindow)))
                    {
                        IContainerButtonWindow(IRegionWindow(_arg_2).getChildAt(1)).visible = false;
                    }
                }
            }
        }
    }
}

