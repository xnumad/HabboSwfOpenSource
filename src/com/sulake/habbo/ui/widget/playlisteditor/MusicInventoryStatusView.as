package com.sulake.habbo.ui.widget.playlisteditor
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.components.ITextWindow;
    import flash.display.BitmapData;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;

    public class MusicInventoryStatusView 
    {
        public static const MISV_BUY_MORE:String = "MISV_BUY_MORE";
        public static const MISV_PREVIEW_PLAYING:String = "MISV_PREVIEW_PLAYING";

        private var _container:IWindowContainer;
        private var _windows:Map;
        private var _widget:PlaylistEditorWidget;
        private var _currentView:String;
        private var _songNameElement:ITextWindow;
        private var _songAuthorElement:ITextWindow;

        public function MusicInventoryStatusView(k:PlaylistEditorWidget, _arg_2:IWindowContainer)
        {
            this._windows = new Map();
            super();
            this._container = _arg_2;
            this._widget = k;
            this._Str_18317();
            this.hide();
        }

        public function destroy():void
        {
            var k:IWindowContainer;
            for each (k in this._windows.getValues())
            {
                k.destroy();
            }
            this._windows = null;
        }

        public function show():void
        {
            this._container.visible = true;
        }

        public function hide():void
        {
            this._container.visible = false;
        }

        public function _Str_3734(k:String):void
        {
            this._container.removeChildAt(0);
            this._container.addChildAt((this._windows[k] as IWindowContainer), 0);
            this._currentView = k;
        }

        public function set _Str_10782(k:String):void
        {
            if (this._songNameElement == null)
            {
                return;
            }
            this._songNameElement.text = k;
        }

        public function set _Str_6415(k:String):void
        {
            if (this._songAuthorElement == null)
            {
                return;
            }
            this._songAuthorElement.text = k;
        }

        public function _Str_20507(k:BitmapData, _arg_2:Boolean=true):void
        {
            this._Str_19789(MISV_PREVIEW_PLAYING, "preview_play_background_image", k);
            if (((_arg_2) && (!(k == null))))
            {
                k.dispose();
            }
        }

        public function _Str_21729(k:BitmapData, _arg_2:Boolean=true):void
        {
            this._Str_19789(MISV_BUY_MORE, "get_more_music_background_image", k);
            if (((_arg_2) && (!(k == null))))
            {
                k.dispose();
            }
        }

        private function _Str_18317():void
        {
            var k:IWindowContainer;
            var _local_2:XmlAsset;
            var _local_3:IButtonWindow;
            var _local_4:IButtonWindow;
            _local_2 = (this._widget.assets.getAssetByName("playlisteditor_inventory_subwindow_play_preview") as XmlAsset);
            k = (this._widget.windowManager.buildFromXML((_local_2.content as XML)) as IWindowContainer);
            if (k != null)
            {
                this._windows.add(MISV_PREVIEW_PLAYING, k);
                this._songNameElement = (k.getChildByName("preview_play_track_name") as ITextWindow);
                this._songAuthorElement = (k.getChildByName("preview_play_author_name") as ITextWindow);
                _local_3 = (k.getChildByName("stop_preview_button") as IButtonWindow);
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_24304);
                this._Str_20507(this._widget._Str_8169(PlayListEditorWidgetAssetsEnum.BACKGROUND_PREVIEW_PLAYING));
                this._Str_7584("jb_icon_disc", (k.getChildByName("song_name_icon_bitmap") as IBitmapWrapperWindow));
                this._Str_7584("jb_icon_composer", (k.getChildByName("author_name_icon_bitmap") as IBitmapWrapperWindow));
            }
            _local_2 = (this._widget.assets.getAssetByName("playlisteditor_inventory_subwindow_get_more_music") as XmlAsset);
            k = (this._widget.windowManager.buildFromXML((_local_2.content as XML)) as IWindowContainer);
            if (k != null)
            {
                this._windows.add(MISV_BUY_MORE, k);
                _local_4 = (k.getChildByName("open_catalog_button") as IButtonWindow);
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_25633);
                this._Str_21729(this._widget._Str_8169(PlayListEditorWidgetAssetsEnum.BACKGROUND_GET_MORE_MUSIC));
            }
        }

        private function _Str_19789(k:String, _arg_2:String, _arg_3:BitmapData):void
        {
            var _local_6:BitmapData;
            var _local_4:IWindowContainer = (this._windows[k] as IWindowContainer);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:IBitmapWrapperWindow = (_local_4.getChildByName(_arg_2) as IBitmapWrapperWindow);
            if (_local_5 == null)
            {
                return;
            }
            if (_arg_3 != null)
            {
                _local_6 = new BitmapData(_local_5.width, _local_5.height, false, 0xFFFFFFFF);
                _local_6.copyPixels(_arg_3, _arg_3.rect, new Point(0, 0));
                _local_5.bitmap = _local_6;
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

        private function _Str_25633(k:WindowMouseEvent):void
        {
            this._widget._Str_25595();
        }

        private function _Str_24304(k:WindowMouseEvent):void
        {
            this._widget._Str_16919();
        }
    }
}
