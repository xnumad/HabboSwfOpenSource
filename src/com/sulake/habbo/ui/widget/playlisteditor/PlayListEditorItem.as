package com.sulake.habbo.ui.widget.playlisteditor
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IContainerButtonWindow;
    import flash.geom.ColorTransform;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.assets.XmlAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.components.ITextWindow;

    public class PlayListEditorItem 
    {
        public static const PLEI_ICON_STATE_NORMAL:String = "PLEI_ICON_STATE_NORMAL";
        public static const PLEI_ICON_STATE_PLAYING:String = "PLEI_ICON_STATE_PLAYING";
        private static const _Str_7833:uint = 14283002;
        private static const _Str_8065:uint = 0xF1F1F1;

        private var _widget:PlaylistEditorWidget;
        private var _window:IWindowContainer;
        private var _removeButton:IContainerButtonWindow = null;
        private var _colorTransform:ColorTransform;

        public function PlayListEditorItem(k:PlaylistEditorWidget, _arg_2:String, _arg_3:String, _arg_4:ColorTransform)
        {
            this._widget = k;
            this._colorTransform = _arg_4;
            this.createWindow();
            this._Str_15168(PLEI_ICON_STATE_NORMAL);
            this.deselect();
            this._Str_8410 = _arg_2;
            this._Str_24145 = _arg_3;
            this._Str_10802 = _arg_4;
        }

        public function get window():IWindow
        {
            return this._window as IWindow;
        }

        public function get _Str_25542():IContainerButtonWindow
        {
            return this._removeButton;
        }

        private function createWindow():void
        {
            var _local_2:BitmapDataAsset;
            if (this._widget == null)
            {
                return;
            }
            var k:XmlAsset = (this._widget.assets.getAssetByName("playlisteditor_playlist_item") as XmlAsset);
            this._window = (this._widget.windowManager.buildFromXML((k.content as XML)) as IWindowContainer);
            if (this._window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            _local_2 = (this._widget.assets.getAssetByName("icon_arrow_left") as BitmapDataAsset);
            if (_local_2 != null)
            {
                if (_local_2.content != null)
                {
                    this._Str_24045 = (_local_2.content as BitmapData);
                }
            }
            this._Str_7584("jb_icon_disc", (this._window.getChildByName("song_name_icon_bitmap") as IBitmapWrapperWindow));
            this._Str_7584("jb_icon_composer", (this._window.getChildByName("author_name_icon_bitmap") as IBitmapWrapperWindow));
            var _local_3:IWindowContainer = (this._window.getChildByName("action_buttons") as IWindowContainer);
            if (_local_3 != null)
            {
                _local_3 = (_local_3.getChildByName("button_border") as IWindowContainer);
                if (_local_3 != null)
                {
                    this._removeButton = (_local_3.getChildByName("button_remove_from_playlist") as IContainerButtonWindow);
                }
            }
        }

        public function select():void
        {
            var k:IBorderWindow = (this._window.getChildByName("background") as IBorderWindow);
            if (k != null)
            {
                k.color = _Str_7833;
            }
            var _local_2:IWindowContainer = (this._window.getChildByName("action_buttons") as IWindowContainer);
            if (_local_2 != null)
            {
                _local_2.visible = true;
            }
            var _local_3:IBorderWindow = (this._window.getChildByName("selected") as IBorderWindow);
            if (_local_3 != null)
            {
                _local_3.visible = true;
            }
        }

        public function deselect():void
        {
            var k:IBorderWindow = (this._window.getChildByName("background") as IBorderWindow);
            if (k != null)
            {
                k.color = _Str_8065;
            }
            var _local_2:IWindowContainer = (this._window.getChildByName("action_buttons") as IWindowContainer);
            if (_local_2 != null)
            {
                _local_2.visible = false;
            }
            var _local_3:IBorderWindow = (this._window.getChildByName("selected") as IBorderWindow);
            if (_local_3 != null)
            {
                _local_3.visible = false;
            }
        }

        public function _Str_15168(k:String):void
        {
            var _local_2:BitmapDataAsset;
            var _local_3:BitmapData;
            switch (k)
            {
                case PLEI_ICON_STATE_NORMAL:
                    this._Str_10802 = this._colorTransform;
                    return;
                case PLEI_ICON_STATE_PLAYING:
                    _local_2 = (this._widget.assets.getAssetByName("icon_notes_small") as BitmapDataAsset);
                    if (_local_2 == null)
                    {
                        return;
                    }
                    if (_local_2.content != null)
                    {
                        _local_3 = (_local_2.content as BitmapData);
                        this._Str_14890 = _local_3.clone();
                    }
                    return;
            }
        }

        public function set _Str_10802(k:ColorTransform):void
        {
            var _local_3:BitmapData;
            var _local_4:BitmapData;
            var _local_2:BitmapDataAsset = (this._widget.assets.getAssetByName("icon_cd_small") as BitmapDataAsset);
            if (_local_2 == null)
            {
                return;
            }
            if (_local_2.content != null)
            {
                _local_3 = (_local_2.content as BitmapData);
                _local_4 = _local_3.clone();
                if (_local_4 != null)
                {
                    _local_4.colorTransform(_local_3.rect, k);
                    this._Str_14890 = _local_4;
                }
            }
        }

        public function set _Str_8410(k:String):void
        {
            var _local_2:ITextWindow = (this._window.getChildByName("song_title_text") as ITextWindow);
            if (_local_2 != null)
            {
                _local_2.text = k;
            }
        }

        public function set _Str_24145(k:String):void
        {
            var _local_2:ITextWindow = (this._window.getChildByName("song_author_text") as ITextWindow);
            if (_local_2 != null)
            {
                _local_2.text = k;
            }
        }

        private function set _Str_14890(k:BitmapData):void
        {
            var _local_2:IBitmapWrapperWindow = (this._window.getChildByName("disk_image") as IBitmapWrapperWindow);
            if (_local_2 != null)
            {
                _local_2.bitmap = k;
            }
        }

        private function set _Str_24045(k:BitmapData):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:IWindowContainer = (this._window.getChildByName("action_buttons") as IWindowContainer);
            if (_local_2 == null)
            {
                return;
            }
            _local_2 = (_local_2.getChildByName("button_border") as IWindowContainer);
            if (_local_2 == null)
            {
                return;
            }
            _local_2 = (_local_2.getChildByName("button_remove_from_playlist") as IWindowContainer);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IBitmapWrapperWindow = (_local_2.getChildByName("button_remove_from_playlist_image") as IBitmapWrapperWindow);
            if (_local_3 != null)
            {
                _local_3.bitmap = k.clone();
                _local_3.width = k.width;
                _local_3.height = k.height;
            }
        }

        private function _Str_7584(k:String, _arg_2:IBitmapWrapperWindow):void
        {
            var _local_4:BitmapData;
            var _local_3:BitmapDataAsset = (this._widget.assets.getAssetByName(k) as BitmapDataAsset);
            if (_local_3 != null)
            {
                if (((!(_arg_2 == null)) && (!(_local_3.content == null))))
                {
                    _local_4 = (_local_3.content as BitmapData);
                    _arg_2.bitmap = _local_4.clone();
                }
            }
        }
    }
}
