package com.sulake.habbo.ui.widget.playlisteditor
{
    import com.sulake.habbo.sound.IHabboMusicController;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
    import com.sulake.habbo.sound.ISongInfo;
    import flash.geom.ColorTransform;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class MusicInventoryGridView 
    {
        private var _musicController:IHabboMusicController;
        private var _itemGridWindow:IItemGridWindow;
        private var _items:Map;
        private var _widget:PlaylistEditorWidget;
        private var _selectedItem:MusicInventoryGridItem;

        public function MusicInventoryGridView(k:PlaylistEditorWidget, _arg_2:IItemGridWindow, _arg_3:IHabboMusicController)
        {
            this._items = new Map();
            super();
            this._musicController = _arg_3;
            this._itemGridWindow = _arg_2;
            this._widget = k;
            this._selectedItem = null;
            this._musicController.events.addEventListener(SongInfoReceivedEvent.SIR_TRAX_SONG_INFO_RECEIVED, this._Str_3530);
        }

        public function get _Str_11307():int
        {
            return this._items.length;
        }

        public function destroy():void
        {
            if (this._itemGridWindow != null)
            {
                this._itemGridWindow.destroyGridItems();
                this._itemGridWindow = null;
            }
            if (this._musicController != null)
            {
                if (this._musicController.events != null)
                {
                    this._musicController.events.removeEventListener(SongInfoReceivedEvent.SIR_TRAX_SONG_INFO_RECEIVED, this._Str_3530);
                }
                this._musicController = null;
            }
            if (this._items)
            {
                this._items.reset();
                this._items = null;
            }
            this._selectedItem = null;
            this._widget = null;
        }

        public function refresh():void
        {
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:ISongInfo;
            var _local_10:String;
            var _local_11:ColorTransform;
            var _local_12:MusicInventoryGridItem;
            var _local_13:MusicInventoryGridItem;
            if (this._itemGridWindow == null)
            {
                return;
            }
            this._itemGridWindow._Str_3956();
            var k:Map = this._items;
            var _local_2:Map = new Map();
            var _local_3:Array = k.getKeys();
            this._items = new Map();
            var _local_4:int = this._musicController._Str_16230();
            var _local_5:int;
            while (_local_5 < _local_4)
            {
                _local_7 = this._musicController._Str_19508(_local_5);
                _local_8 = this._musicController._Str_20038(_local_5);
                _local_9 = this._musicController._Str_3255(_local_8);
                _local_10 = null;
                _local_11 = null;
                if (_local_9 != null)
                {
                    _local_10 = _local_9.name;
                    _local_11 = this._widget._Str_18331(_local_9._Str_7824);
                }
                if (_local_3.indexOf(_local_7) == -1)
                {
                    _local_12 = new MusicInventoryGridItem(this._widget, _local_7, _local_8, _local_10, _local_11);
                }
                else
                {
                    _local_12 = k[_local_7];
                    _local_3.splice(_local_3.indexOf(_local_7), 1);
                }
                _local_12.window.procedure = this._Str_20197;
                _local_12._Str_23170.procedure = this._Str_20197;
                this._itemGridWindow._Str_2816(_local_12.window);
                this._items.add(_local_7, _local_12);
                _local_5++;
            }
            for each (_local_6 in _local_3)
            {
                _local_13 = k[_local_6];
                _local_13.destroy();
                k.remove(_local_6);
            }
        }

        public function _Str_24959():void
        {
            if (this._selectedItem != null)
            {
                this._selectedItem._Str_8343 = MusicInventoryGridItem._Str_13281;
            }
        }

        public function _Str_22162():void
        {
            if (this._selectedItem != null)
            {
                this._selectedItem._Str_8343 = MusicInventoryGridItem._Str_8425;
            }
        }

        public function _Str_16851():void
        {
            if (this._selectedItem != null)
            {
                this._selectedItem.deselect();
                this._selectedItem = null;
            }
        }

        private function _Str_20197(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:int;
            var _local_5:MusicInventoryGridItem;
            var _local_3:* = (k.type == WindowMouseEvent.DOUBLE_CLICK);
            if (((k.type == WindowMouseEvent.CLICK) || (_local_3)))
            {
                if (((_arg_2.name == "button_to_playlist") || (_local_3)))
                {
                    if (this._selectedItem != null)
                    {
                        this._selectedItem.deselect();
                        this._Str_16797();
                        this._widget._Str_23659(this._selectedItem._Str_5848);
                        this._selectedItem = null;
                    }
                }
                else
                {
                    if (_arg_2.name == "button_play_pause")
                    {
                        if (this._selectedItem._Str_8343 == MusicInventoryGridItem._Str_8425)
                        {
                            this._selectedItem._Str_8343 = MusicInventoryGridItem._Str_13230;
                            this._widget._Str_25259(this._selectedItem._Str_3951);
                        }
                        else
                        {
                            this._Str_16797();
                        }
                    }
                    else
                    {
                        _local_4 = this._itemGridWindow._Str_3373(k.window);
                        if (_local_4 != -1)
                        {
                            _local_5 = this._items.getWithIndex(_local_4);
                            if (_local_5 != this._selectedItem)
                            {
                                if (this._selectedItem != null)
                                {
                                    this._selectedItem.deselect();
                                }
                                this._selectedItem = _local_5;
                                this._selectedItem.select();
                                this._Str_16797();
                            }
                            if (this._widget._Str_15010 != null)
                            {
                                this._widget._Str_15010._Str_15855._Str_16851();
                            }
                        }
                    }
                }
            }
        }

        private function _Str_16797():void
        {
            this._widget._Str_16919();
            this._Str_22162();
        }

        private function _Str_3530(k:SongInfoReceivedEvent):void
        {
            var _local_2:ISongInfo;
            var _local_3:String;
            var _local_4:ColorTransform;
            var _local_5:MusicInventoryGridItem;
            if (this._musicController != null)
            {
                _local_2 = this._musicController._Str_3255(k.id);
                if (_local_2 != null)
                {
                    _local_3 = _local_2.name;
                    _local_4 = this._widget._Str_18331(_local_2._Str_7824);
                    _local_5 = this._items[k.id];
                    if (_local_5 != null)
                    {
                        _local_5.update(k.id, _local_3, _local_4);
                    }
                }
            }
        }
    }
}
