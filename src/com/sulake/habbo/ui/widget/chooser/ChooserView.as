package com.sulake.habbo.ui.widget.chooser
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.ui.widget.events._Str_3405;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;

    public class ChooserView 
    {
        private const _Str_14861:uint = 4293848814;
        private const _Str_15515:uint = 0;
        private const _Str_22629:uint = 4282169599;

        private var _widget:ChooserWidgetBase;
        private var _title:String;
        private var _window:IFrameWindow;
        private var _itemList:IItemListWindow;
        private var _items:Array;
        private var _showIds:Boolean;
        private var _selectedIndex:int;

        public function ChooserView(k:ChooserWidgetBase, _arg_2:String)
        {
            this._widget = k;
            this._title = _arg_2;
        }

        public function dispose():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function isOpen():Boolean
        {
            return (!(this._window == null)) && (this._window.visible);
        }

        public function populate(k:Array, _arg_2:Boolean):void
        {
            var _local_4:_Str_3405;
            var _local_5:IWindowContainer;
            var _local_6:int;
            var _local_7:ITextWindow;
            if (this._widget == null)
            {
                return;
            }
            if (this._window == null)
            {
                this.createWindow();
            }
            if ((((this._window == null) || (this._itemList == null)) || (k == null)))
            {
                return;
            }
            this._itemList.destroyListItems();
            var _local_3:XmlAsset = XmlAsset(this._widget.assets.getAssetByName("chooser_item"));
            if (_local_3 == null)
            {
                return;
            }
            this._items = k.slice();
            this._showIds = _arg_2;
            _local_6 = 0;
            while (_local_6 < k.length)
            {
                _local_4 = (k[_local_6] as _Str_3405);
                if (_local_4 != null)
                {
                    _local_5 = (this._widget.windowManager.buildFromXML((_local_3.content as XML)) as IWindowContainer);
                    if (_local_5 == null)
                    {
                        return;
                    }
                    _local_7 = (_local_5.findChildByName("itemtext") as ITextWindow);
                    if (_local_7 == null)
                    {
                        return;
                    }
                    _local_5.id = _local_6;
                    if (this._showIds)
                    {
                        _local_7.text = ((_local_4.name + " id: ") + _local_4.id);
                    }
                    else
                    {
                        _local_7.text = _local_4.name;
                    }
                    _local_5.color = ((_local_6 % 2) ? this._Str_15515 : this._Str_14861);
                    _local_5.addEventListener(WindowMouseEvent.CLICK, this._Str_24444);
                    this._itemList.addListItem(_local_5);
                }
                _local_6++;
            }
            _local_6 = 0;
            while (_local_6 < this._itemList.numListItems)
            {
                _local_5 = (this._itemList.getListItemAt(_local_6) as IWindowContainer);
                if (_local_5 != null)
                {
                    _local_5.width = this._itemList.width;
                }
                _local_6++;
            }
            this._selectedIndex = -1;
        }

        private function createWindow():void
        {
            var k:XmlAsset = XmlAsset(this._widget.assets.getAssetByName("chooser_view"));
            if (k == null)
            {
                return;
            }
            this._window = (this._widget.windowManager.buildFromXML((k.content as XML)) as IFrameWindow);
            if (this._window == null)
            {
                return;
            }
            this._window.caption = this._title;
            this._itemList = (this._window.findChildByName("item_list") as IItemListWindow);
            var _local_2:IWindow = this._window.findChildByTag("close");
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            }
            if (this._window.parent != null)
            {
                this._window.x = ((this._window.parent.width - this._window.width) - 10);
                this._window.y = 10;
            }
        }

        private function _Str_15155():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function _Str_24444(k:WindowMouseEvent):void
        {
            if ((((k == null) || (k.window == null)) || (this._items == null)))
            {
                return;
            }
            var _local_2:int = k.window.id;
            if (((_local_2 < 0) || (_local_2 > this._items.length)))
            {
                return;
            }
            var _local_3:_Str_3405 = (this._items[_local_2] as _Str_3405);
            if (_local_3 == null)
            {
                return;
            }
            this._widget.choose(_local_3.id, _local_3.category);
            this._Str_22832(_local_2);
        }

        private function _Str_22832(k:int):void
        {
            var _local_2:IWindowContainer;
            if (((((this._itemList == null) || (k < 0)) || (k > this._itemList.numListItems)) || (k == this._selectedIndex)))
            {
                return;
            }
            if (this._selectedIndex != -1)
            {
                _local_2 = (this._itemList.getListItemAt(this._selectedIndex) as IWindowContainer);
                if (_local_2 != null)
                {
                    _local_2.color = ((this._selectedIndex % 2) ? this._Str_15515 : this._Str_14861);
                }
            }
            _local_2 = (this._itemList.getListItemAt(k) as IWindowContainer);
            if (_local_2 != null)
            {
                _local_2.color = this._Str_22629;
                this._selectedIndex = k;
            }
        }

        public function removeItem(k:int, _arg_2:int):void
        {
            var _local_3:_Str_3405;
            if (((this._items == null) || (this._itemList == null)))
            {
                return;
            }
            var _local_4:int;
            while (_local_4 < this._items.length)
            {
                _local_3 = (this._items[_local_4] as _Str_3405);
                if (_local_3 != null)
                {
                    if (((_local_3.id == k) && (_local_3.category == _arg_2)))
                    {
                        this._items.splice(_local_4, 1);
                        break;
                    }
                }
                _local_4++;
            }
            this.populate(this._items, this._showIds);
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this._Str_15155();
        }
    }
}


