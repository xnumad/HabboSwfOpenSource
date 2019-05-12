package com.sulake.habbo.ui.widget.playlisteditor
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IContainerButtonWindow;
    import flash.geom.ColorTransform;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.components.ITextWindow;

    public class MusicInventoryGridItem 
    {
        public static const _Str_8425:int = 0;
        public static const _Str_13281:int = 1;
        public static const _Str_13230:int = 2;
        private static const _Str_7833:uint = 14612159;
        private static const _Str_8065:uint = 0xF1F1F1;

        private var _widget:PlaylistEditorWidget;
        private var _window:IWindowContainer = null;
        private var _diskId:int;
        private var _songId:int;
        private var _toPlayListButton:IContainerButtonWindow = null;
        private var _buttonState:int;

        public function MusicInventoryGridItem(k:PlaylistEditorWidget, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:ColorTransform)
        {
            this._widget = k;
            this._diskId = _arg_2;
            this._songId = _arg_3;
            this.createWindow();
            this.deselect();
            if (((!(_arg_4 == null)) && (!(_arg_5 == null))))
            {
                this._Str_8410 = _arg_4;
                this._Str_10802 = _arg_5;
            }
        }

        public function get window():IWindow
        {
            return this._window as IWindow;
        }

        public function get _Str_5848():int
        {
            return this._diskId;
        }

        public function get _Str_3951():int
        {
            return this._songId;
        }

        public function get _Str_23170():IContainerButtonWindow
        {
            return this._toPlayListButton;
        }

        public function get _Str_8343():int
        {
            return this._buttonState;
        }

        public function update(k:int, _arg_2:String, _arg_3:ColorTransform):void
        {
            if (k == this._songId)
            {
                this._Str_8410 = _arg_2;
                this._Str_10802 = _arg_3;
            }
        }

        public function destroy():void
        {
            if (this._window)
            {
                this._window.destroy();
            }
        }

        private function createWindow():void
        {
            var _local_3:BitmapDataAsset;
            if (this._widget == null)
            {
                return;
            }
            var k:XmlAsset = (this._widget.assets.getAssetByName("playlisteditor_music_inventory_item") as XmlAsset);
            this._window = (this._widget.windowManager.buildFromXML((k.content as XML)) as IWindowContainer);
            if (this._window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            var _local_2:IWindowContainer = (this._window.getChildByName("action_buttons") as IWindowContainer);
            if (_local_2 != null)
            {
                this._toPlayListButton = (_local_2.getChildByName("button_to_playlist") as IContainerButtonWindow);
            }
            this._Str_7584("title_fader", (this._window.getChildByName("title_fader_bitmap") as IBitmapWrapperWindow));
            _local_3 = (this._widget.assets.getAssetByName("icon_arrow") as BitmapDataAsset);
            if (_local_3 != null)
            {
                if (_local_3.content != null)
                {
                    this._Str_24361 = (_local_3.content as BitmapData);
                }
            }
            this._Str_8343 = _Str_8425;
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

        public function set _Str_10802(k:ColorTransform):void
        {
            var _local_3:BitmapData;
            var _local_4:BitmapData;
            var _local_2:BitmapDataAsset = (this._widget.assets.getAssetByName("icon_cd_big") as BitmapDataAsset);
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

        public function set _Str_8343(k:int):void
        {
            var _local_2:BitmapDataAsset;
            if (k == _Str_8425)
            {
                _local_2 = (this._widget.assets.getAssetByName("icon_play") as BitmapDataAsset);
            }
            else
            {
                if (k == _Str_13281)
                {
                    _local_2 = (this._widget.assets.getAssetByName("icon_pause") as BitmapDataAsset);
                }
                else
                {
                    if (k == _Str_13230)
                    {
                        _local_2 = (this._widget.assets.getAssetByName("icon_download") as BitmapDataAsset);
                    }
                }
            }
            if (_local_2 != null)
            {
                if (_local_2.content != null)
                {
                    this._Str_23896 = (_local_2.content as BitmapData);
                }
            }
            this._buttonState = k;
        }

        public function set _Str_8410(k:String):void
        {
            var _local_2:ITextWindow = (this._window.getChildByName("song_title_text") as ITextWindow);
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

        private function set _Str_24361(k:BitmapData):void
        {
            this._Str_20607("button_to_playlist", "image_button_to_playlist", k);
        }

        private function set _Str_23896(k:BitmapData):void
        {
            this._Str_20607("button_play_pause", "image_button_play_pause", k);
        }

        private function _Str_20607(k:String, _arg_2:String, _arg_3:BitmapData):void
        {
            if (_arg_3 == null)
            {
                return;
            }
            var _local_4:IWindowContainer = (this._window.getChildByName("action_buttons") as IWindowContainer);
            if (_local_4 == null)
            {
                return;
            }
            _local_4 = (_local_4.getChildByName(k) as IWindowContainer);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:IBitmapWrapperWindow = (_local_4.getChildByName(_arg_2) as IBitmapWrapperWindow);
            if (_local_5 != null)
            {
                _local_5.bitmap = _arg_3.clone();
                _local_5.width = _arg_3.width;
                _local_5.height = _arg_3.height;
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
