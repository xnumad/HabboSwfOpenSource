package com.sulake.habbo.ui.widget.playlisteditor
{
    import com.sulake.habbo.sound.IHabboMusicController;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.components.IScrollbarWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.sound.HabboMusicPrioritiesEnum;
    import com.sulake.habbo.sound.IPlayListController;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.XmlAsset;
    import flash.geom.Point;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.sound.ISongInfo;
    import com.sulake.habbo.ui.widget.events._Str_3301;

    public class MainWindowHandler 
    {
        private static const _Str_16427:int = 6;
        private static const _Str_17484:int = 9;
        private static const _Str_15951:int = 5;

        private var _widget:PlaylistEditorWidget;
        private var _musicController:IHabboMusicController;
        private var _mainWindow:IWindowContainer;
        private var _myMusicContainer:IBorderWindow;
        private var _playListContainer:IBorderWindow;
        private var _musicInventoryView:MusicInventoryGridView;
        private var _playListEditorView:PlayListEditorItemListView;
        private var _musicStatusView:MusicInventoryStatusView;
        private var _playListStatusView:PlayListStatusView;
        private var _myMusicScrollBar:IScrollbarWindow;
        private var _playlistScrollBar:IScrollbarWindow;

        public function MainWindowHandler(k:PlaylistEditorWidget, _arg_2:IHabboMusicController)
        {
            var _local_4:String;
            var _local_5:BitmapData;
            super();
            this._widget = k;
            this._musicController = _arg_2;
            var _local_3:Array = [PlayListEditorWidgetAssetsEnum.TITLE_MYMUSIC, PlayListEditorWidgetAssetsEnum.TITLE_PLAYLIST, PlayListEditorWidgetAssetsEnum.BACKGROUND_PREVIEW_PLAYING, PlayListEditorWidgetAssetsEnum.BACKGROUND_GET_MORE_MUSIC, PlayListEditorWidgetAssetsEnum.BACKGROUND_ADD_SONGS];
            for each (_local_4 in _local_3)
            {
                _local_5 = this._widget._Str_8169(_local_4);
                if (_local_5 != null)
                {
                    _local_5.dispose();
                }
                else
                {
                    this._widget._Str_24749(_local_4);
                }
            }
            this.createWindow();
            this._musicInventoryView = new MusicInventoryGridView(k, this._Str_24707(), _arg_2);
            this._playListEditorView = new PlayListEditorItemListView(k, this._Str_23926());
            this._musicStatusView = new MusicInventoryStatusView(k, this._Str_24828());
            this._playListStatusView = new PlayListStatusView(k, this._Str_24111());
            this._Str_19051();
        }

        public function get window():IWindow
        {
            return this._mainWindow;
        }

        public function get _Str_23639():MusicInventoryGridView
        {
            return this._musicInventoryView;
        }

        public function get _Str_15855():PlayListEditorItemListView
        {
            return this._playListEditorView;
        }

        public function destroy():void
        {
            if (this._musicController)
            {
                this._musicController.stop(HabboMusicPrioritiesEnum._Str_7215);
                this._musicController = null;
            }
            if (this._musicInventoryView)
            {
                this._musicInventoryView.destroy();
                this._musicInventoryView = null;
            }
            if (this._playListEditorView)
            {
                this._playListEditorView.destroy();
                this._playListEditorView = null;
            }
            if (this._playListStatusView)
            {
                this._playListStatusView.destroy();
                this._playListStatusView = null;
            }
            if (this._musicStatusView)
            {
                this._musicStatusView.destroy();
                this._musicStatusView = null;
            }
            this._mainWindow.destroy();
            this._mainWindow = null;
        }

        public function hide():void
        {
            this._mainWindow.visible = false;
            if (this._widget != null)
            {
                this._widget._Str_16919();
            }
        }

        public function show():void
        {
            this._musicController._Str_14232();
            var k:IPlayListController = this._musicController._Str_6500();
            if (k != null)
            {
                k._Str_5930();
                this._Str_16190();
            }
            this._mainWindow.visible = true;
        }

        public function _Str_19051(k:String=""):void
        {
            if (((k == "") || (k == PlayListEditorWidgetAssetsEnum.TITLE_MYMUSIC)))
            {
                this._Str_20561(this._myMusicContainer, "music_inventory_splash_image", PlayListEditorWidgetAssetsEnum.TITLE_MYMUSIC);
            }
            if (((k == "") || (k == PlayListEditorWidgetAssetsEnum.TITLE_PLAYLIST)))
            {
                this._Str_20561(this._playListContainer, "playlist_editor_splash_image", PlayListEditorWidgetAssetsEnum.TITLE_PLAYLIST);
            }
            if (((k == "") || (k == PlayListEditorWidgetAssetsEnum.BACKGROUND_PREVIEW_PLAYING)))
            {
                this._musicStatusView._Str_20507(this._widget._Str_8169(PlayListEditorWidgetAssetsEnum.BACKGROUND_PREVIEW_PLAYING));
            }
            if (((k == "") || (k == PlayListEditorWidgetAssetsEnum.BACKGROUND_GET_MORE_MUSIC)))
            {
                this._musicStatusView._Str_21729(this._widget._Str_8169(PlayListEditorWidgetAssetsEnum.BACKGROUND_GET_MORE_MUSIC));
            }
            if (((k == "") || (k == PlayListEditorWidgetAssetsEnum.BACKGROUND_ADD_SONGS)))
            {
                this._playListStatusView._Str_24999 = this._widget._Str_8169(PlayListEditorWidgetAssetsEnum.BACKGROUND_ADD_SONGS);
            }
        }

        private function _Str_20561(k:IWindowContainer, _arg_2:String, _arg_3:String):void
        {
            var _local_5:BitmapData;
            var _local_4:IBitmapWrapperWindow = (k.getChildByName(_arg_2) as IBitmapWrapperWindow);
            if (_local_4 != null)
            {
                _local_5 = this._widget._Str_8169(_arg_3);
                if (_local_5 != null)
                {
                    _local_4.bitmap = _local_5;
                    _local_4.width = _local_5.width;
                    _local_4.height = _local_5.height;
                }
            }
        }

        private function createWindow():void
        {
            if (this._widget == null)
            {
                return;
            }
            var k:XmlAsset = (this._widget.assets.getAssetByName("playlisteditor_main_window") as XmlAsset);
            this._mainWindow = (this._widget.windowManager.buildFromXML((k.content as XML)) as IWindowContainer);
            if (this._mainWindow == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            this._mainWindow.position = new Point(80, 0);
            var _local_2:IWindowContainer = (this._mainWindow.getChildByName("content_area") as IWindowContainer);
            if (_local_2 == null)
            {
                throw (new Error("Window is missing 'content_area' element"));
            }
            this._myMusicContainer = (_local_2.getChildByName("my_music_border") as IBorderWindow);
            this._playListContainer = (_local_2.getChildByName("playlist_border") as IBorderWindow);
            if (this._myMusicContainer == null)
            {
                throw (new Error("Window content area is missing 'my_music_border' window element"));
            }
            if (this._playListContainer == null)
            {
                throw (new Error("Window content area is missing 'playlist_border' window element"));
            }
            this._myMusicScrollBar = (this._myMusicContainer.getChildByName("music_inventory_scrollbar") as IScrollbarWindow);
            this._playlistScrollBar = (this._playListContainer.getChildByName("playlist_scrollbar") as IScrollbarWindow);
            if (this._myMusicScrollBar == null)
            {
                throw (new Error("Window content area is missing 'music_inventory_scrollbar' window element"));
            }
            if (this._playlistScrollBar == null)
            {
                throw (new Error("Window content area is missing 'playlist_scrollbar' window element"));
            }
            var _local_3:IWindow = this._mainWindow.findChildByTag("close");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            }
        }

        private function _Str_24707():IItemGridWindow
        {
            return this._myMusicContainer.getChildByName("music_inventory_itemgrid") as IItemGridWindow;
        }

        private function _Str_23926():IItemListWindow
        {
            return this._playListContainer.getChildByName("playlist_editor_itemlist") as IItemListWindow;
        }

        private function _Str_24828():IWindowContainer
        {
            return this._myMusicContainer.getChildByName("preview_play_container") as IWindowContainer;
        }

        private function _Str_24111():IWindowContainer
        {
            return this._playListContainer.getChildByName("now_playing_container") as IWindowContainer;
        }

        private function _Str_16190():void
        {
            var k:IPlayListController = this._musicController._Str_6500();
            if (k == null)
            {
                return;
            }
            if (k.isPlaying)
            {
                this._playListStatusView._Str_3734(PlayListStatusView.PLSV_NOW_PLAYING);
            }
            else
            {
                if (k.length > 0)
                {
                    this._playListStatusView._Str_3734(PlayListStatusView.PLSV_START_PLAYBACK);
                }
                else
                {
                    this._playListStatusView._Str_3734(PlayListStatusView.PLSV_ADD_SONGS);
                }
            }
        }

        private function _Str_18647():void
        {
            if (this._Str_23997())
            {
                this._musicStatusView.show();
                this._musicStatusView._Str_3734(MusicInventoryStatusView.MISV_PREVIEW_PLAYING);
            }
            else
            {
                if (this._musicController._Str_16230() <= _Str_16427)
                {
                    this._musicStatusView.show();
                    this._musicStatusView._Str_3734(MusicInventoryStatusView.MISV_BUY_MORE);
                }
                else
                {
                    this._musicStatusView.hide();
                }
            }
        }

        private function _Str_24609():void
        {
            var _local_4:int;
            var _local_5:ISongInfo;
            var k:IPlayListController = this._musicController._Str_6500();
            var _local_2:Array = [];
            var _local_3:int = -1;
            if (k != null)
            {
                _local_4 = 0;
                while (_local_4 < k.length)
                {
                    _local_5 = k._Str_4666(_local_4);
                    if (_local_5 != null)
                    {
                        _local_2.push(_local_5);
                    }
                    _local_4++;
                }
                _local_3 = k._Str_15560;
            }
            this._playListEditorView.refresh(_local_2, _local_3);
        }

        public function _Str_25748():void
        {
            var _local_3:ISongInfo;
            this._Str_24609();
            this._Str_16190();
            var k:IPlayListController = this._musicController._Str_6500();
            if (k == null)
            {
                return;
            }
            var _local_2:int = k._Str_13794;
            if (_local_2 != -1)
            {
                _local_3 = this._musicController._Str_3255(_local_2);
                this._playListStatusView._Str_11249 = _local_3.name;
                this._playListStatusView._Str_9732 = _local_3.creator;
            }
            this._playlistScrollBar.visible = (k.length > _Str_15951);
        }

        public function _Str_25286():void
        {
            this._musicInventoryView.refresh();
            this._Str_18647();
            this._myMusicScrollBar.visible = (this._musicInventoryView._Str_11307 > _Str_17484);
        }

        public function _Str_14970(k:_Str_3301):void
        {
            var _local_2:ISongInfo;
            var _local_3:ISongInfo;
            switch (k.type)
            {
                case _Str_3301.RWPLENPE_SONG_CHANGED:
                    this._Str_16190();
                    this._playListEditorView._Str_21115(k.position);
                    if (k.id != -1)
                    {
                        _local_3 = this._musicController._Str_3255(k.id);
                        this._playListStatusView._Str_11249 = ((_local_3 != null) ? _local_3.name : "");
                        this._playListStatusView._Str_9732 = ((_local_3 != null) ? _local_3.creator : "");
                    }
                    return;
                case _Str_3301.RWPLENPE_USER_PLAY_SONG:
                    this._musicInventoryView._Str_24959();
                    _local_2 = this._musicController._Str_3255(k.id);
                    this._musicStatusView._Str_10782 = ((_local_2 != null) ? _local_2.name : "");
                    this._musicStatusView._Str_10782 = ((_local_2 != null) ? _local_2.name : "");
                    this._musicStatusView._Str_6415 = ((_local_2 != null) ? _local_2.creator : "");
                    this._Str_18647();
                    return;
                case _Str_3301.RWPLENPW_USER_STOP_SONG:
                    this._musicInventoryView._Str_22162();
                    this._Str_18647();
                    return;
            }
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this.hide();
        }

        private function _Str_23997():Boolean
        {
            return !(this._musicController._Str_6665(HabboMusicPrioritiesEnum._Str_7215) == -1);
        }
    }
}
