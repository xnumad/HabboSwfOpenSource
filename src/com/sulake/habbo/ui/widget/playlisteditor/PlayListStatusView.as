package com.sulake.habbo.ui.widget.playlisteditor
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.components.IContainerButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.BitmapDataAsset;

    public class PlayListStatusView 
    {
        public static const PLSV_ADD_SONGS:String = "PLSV_ADD_SONGS";
        public static const PLSV_START_PLAYBACK:String = "PLSV_START_PLAYBACK";
        public static const PLSV_NOW_PLAYING:String = "PLSV_NOW_PLAYING";

        private var _container:IWindowContainer;
        private var _windows:Map;
        private var _widget:PlaylistEditorWidget;
        private var _currentView:String;

        public function PlayListStatusView(k:PlaylistEditorWidget, _arg_2:IWindowContainer)
        {
            this._windows = new Map();
            super();
            this._container = _arg_2;
            this._widget = k;
            this._Str_18317();
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

        public function _Str_3734(k:String):void
        {
            this._container.removeChildAt(0);
            this._container.addChildAt((this._windows[k] as IWindowContainer), 0);
            this._currentView = k;
        }

        public function set _Str_11249(k:String):void
        {
            if (this._currentView != PLSV_NOW_PLAYING)
            {
                return;
            }
            var _local_2:IWindowContainer = this._windows[this._currentView];
            var _local_3:ITextWindow = (_local_2.getChildByName("now_playing_track_name") as ITextWindow);
            if (_local_3 != null)
            {
                _local_3.text = k;
            }
        }

        public function set _Str_9732(k:String):void
        {
            if (this._currentView != PLSV_NOW_PLAYING)
            {
                return;
            }
            var _local_2:IWindowContainer = this._windows[this._currentView];
            var _local_3:ITextWindow = (_local_2.getChildByName("now_playing_author_name") as ITextWindow);
            if (_local_3 != null)
            {
                _local_3.text = k;
            }
        }

        public function set _Str_24999(k:BitmapData):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:IWindowContainer = this._windows[PLSV_ADD_SONGS];
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IBitmapWrapperWindow = (_local_2.getChildByName("background_image") as IBitmapWrapperWindow);
            if (_local_3 == null)
            {
                return;
            }
            _local_3.bitmap = k.clone();
            _local_3.width = k.width;
            _local_3.height = k.height;
        }

        private function _Str_18317():void
        {
            var k:IWindowContainer;
            var _local_2:XmlAsset;
            var _local_3:IButtonWindow;
            var _local_4:IContainerButtonWindow;
            _local_2 = (this._widget.assets.getAssetByName("playlisteditor_playlist_subwindow_add_songs") as XmlAsset);
            k = (this._widget.windowManager.buildFromXML((_local_2.content as XML)) as IWindowContainer);
            if (k != null)
            {
                this._windows.add(PLSV_ADD_SONGS, k);
            }
            _local_2 = (this._widget.assets.getAssetByName("playlisteditor_playlist_subwindow_play_now") as XmlAsset);
            k = (this._widget.windowManager.buildFromXML((_local_2.content as XML)) as IWindowContainer);
            if (k != null)
            {
                this._windows.add(PLSV_START_PLAYBACK, k);
                _local_3 = (k.getChildByName("play_now_button") as IButtonWindow);
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_20826);
            }
            _local_2 = (this._widget.assets.getAssetByName("playlisteditor_playlist_subwindow_nowplaying") as XmlAsset);
            k = (this._widget.windowManager.buildFromXML((_local_2.content as XML)) as IWindowContainer);
            if (k != null)
            {
                this._windows.add(PLSV_NOW_PLAYING, k);
                _local_4 = (k.getChildByName("button_pause") as IContainerButtonWindow);
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_20826);
                this._Str_16778("icon_pause_large", (_local_4.getChildByName("pause_image") as IBitmapWrapperWindow));
                this._Str_16778("jb_icon_disc", (k.getChildByName("song_name_icon_bitmap") as IBitmapWrapperWindow));
                this._Str_16778("jb_icon_composer", (k.getChildByName("author_name_icon_bitmap") as IBitmapWrapperWindow));
            }
        }

        private function _Str_16778(k:String, _arg_2:IBitmapWrapperWindow):void
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

        private function _Str_20826(k:WindowMouseEvent):void
        {
            this._widget._Str_23449();
        }
    }
}
