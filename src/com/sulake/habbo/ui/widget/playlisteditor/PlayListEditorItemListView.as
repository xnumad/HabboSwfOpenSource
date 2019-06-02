package com.sulake.habbo.ui.widget.playlisteditor
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.sound.ISongInfo;
    import flash.geom.ColorTransform;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class PlayListEditorItemListView 
    {
        private var _itemListWindow:IItemListWindow;
        private var _items:Array;
        private var _widget:PlaylistEditorWidget;
        private var _selectedItem:PlayListEditorItem;
        private var _selectedItemIndex:int = -1;
        private var _previousItemPlaying:int = -1;

        public function PlayListEditorItemListView(k:PlaylistEditorWidget, _arg_2:IItemListWindow)
        {
            this._itemListWindow = _arg_2;
            this._widget = k;
            this._selectedItem = null;
        }

        public function get _Str_4405():int
        {
            return this._selectedItemIndex;
        }

        public function destroy():void
        {
            if (this._itemListWindow == null)
            {
                return;
            }
            this._itemListWindow.destroyListItems();
        }

        public function refresh(k:Array, _arg_2:int):void
        {
            var _local_3:ISongInfo;
            var _local_4:String;
            var _local_5:String;
            var _local_6:ColorTransform;
            var _local_7:PlayListEditorItem;
            if (this._itemListWindow == null)
            {
                return;
            }
            if (k == null)
            {
                return;
            }
            this._previousItemPlaying = -1;
            this._items = new Array();
            this._itemListWindow.destroyListItems();
            for each (_local_3 in k)
            {
                _local_4 = _local_3.name;
                _local_5 = _local_3.creator;
                _local_6 = this._widget._Str_18331(_local_3._Str_7824);
                _local_7 = new PlayListEditorItem(this._widget, _local_4, _local_5, _local_6);
                _local_7.window.procedure = this._Str_13002;
                _local_7._Str_25542.procedure = this._Str_13002;
                this._itemListWindow.addListItem(_local_7.window);
                this._items.push(_local_7);
            }
            this._Str_21115(_arg_2);
        }

        public function _Str_21115(k:int):void
        {
            var _local_2:PlayListEditorItem;
            var _local_3:PlayListEditorItem;
            if (this._items == null)
            {
                return;
            }
            if (k < 0)
            {
                for each (_local_3 in this._items)
                {
                    _local_3._Str_15168(PlayListEditorItem.PLEI_ICON_STATE_NORMAL);
                }
                return;
            }
            if (k >= this._items.length)
            {
                return;
            }
            if (((this._previousItemPlaying >= 0) && (this._previousItemPlaying < this._items.length)))
            {
                _local_2 = (this._items[this._previousItemPlaying] as PlayListEditorItem);
                _local_2._Str_15168(PlayListEditorItem.PLEI_ICON_STATE_NORMAL);
            }
            _local_2 = (this._items[k] as PlayListEditorItem);
            _local_2._Str_15168(PlayListEditorItem.PLEI_ICON_STATE_PLAYING);
            this._previousItemPlaying = k;
        }

        public function _Str_16851():void
        {
            if (this._selectedItem != null)
            {
                this._selectedItem.deselect();
                this._selectedItem = null;
                this._selectedItemIndex = -1;
            }
        }

        private function _Str_13002(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:int;
            var _local_3:* = (k.type == WindowMouseEvent.DOUBLE_CLICK);
            if (((k.type == WindowMouseEvent.CLICK) || (_local_3)))
            {
                if (((_arg_2.name == "button_remove_from_playlist") || (_local_3)))
                {
                    if (this._selectedItem != null)
                    {
                        this._selectedItem.deselect();
                    }
                    if (this._selectedItemIndex > -1)
                    {
                        this._widget._Str_20304(this._selectedItemIndex);
                    }
                    this._selectedItem = null;
                    this._selectedItemIndex = -1;
                }
                else
                {
                    if (this._selectedItem != null)
                    {
                        this._selectedItem.deselect();
                    }
                    _local_4 = this._itemListWindow.getListItemIndex(k.window);
                    if (_local_4 != -1)
                    {
                        this._selectedItemIndex = _local_4;
                        this._selectedItem = this._items[_local_4];
                        this._selectedItem.select();
                        if (_arg_2.name == "button_remove_from_playlist")
                        {
                            this._widget._Str_20304(_local_4);
                        }
                        if (this._widget._Str_15010 != null)
                        {
                            this._widget._Str_15010._Str_23639._Str_16851();
                        }
                    }
                }
            }
        }
    }
}
