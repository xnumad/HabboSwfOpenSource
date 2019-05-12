package com.sulake.habbo.ui.widget.playlisteditor
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.sound.IHabboSoundManager;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.ui.widget.events._Str_2693;
    import com.sulake.habbo.ui.widget.events._Str_3301;
    import flash.events.IEventDispatcher;
    import flash.geom.ColorTransform;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPlayListModificationMessage;
    import com.sulake.habbo.sound.IPlayListController;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPlayListPlayStateMessage;
    import com.sulake.habbo.sound.ISongInfo;
    import com.sulake.habbo.sound.HabboMusicPrioritiesEnum;
    import flash.display.BitmapData;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPlayListUserActionMessage;
    import com.sulake.habbo.catalog.enum.CatalogPageName;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.events.WindowEvent;

    public class PlaylistEditorWidget extends ConversionTrackingWidget 
    {
        private static const _Str_17485:int = 130;
        private static const _Str_16479:int = 100;
        private static const _Str_18630:int = 130;
        private static const _Str_15986:int = 100;
        private static const _Str_18472:int = 130;
        private static const _Str_16988:int = 100;

        private var _catalog:IHabboCatalog;
        private var _configurationManager:IHabboConfigurationManager;
        private var _soundManager:IHabboSoundManager;
        private var _Str_2314:MainWindowHandler;
        private var _Str_2502:int;

        public function PlaylistEditorWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IHabboSoundManager, _arg_4:IAssetLibrary, _arg_5:IHabboLocalizationManager, _arg_6:IHabboConfigurationManager, _arg_7:IHabboCatalog)
        {
            super(k, _arg_2, _arg_4, _arg_5);
            this._soundManager = _arg_3;
            this._configurationManager = _arg_6;
            this._catalog = _arg_7;
            this._Str_2314 = null;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (this._Str_2314)
                {
                    this._Str_2314.destroy();
                    this._Str_2314 = null;
                }
                this._soundManager = null;
                super.dispose();
            }
        }

        override public function get mainWindow():IWindow
        {
            if (this._Str_2314 == null)
            {
                return null;
            }
            return this._Str_2314.window;
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            k.addEventListener(_Str_2693.RWPLEE_SHOW_PLAYLIST_EDITOR, this._Str_19678);
            k.addEventListener(_Str_2693.RWPLEE_HIDE_PLAYLIST_EDITOR, this._Str_19485);
            k.addEventListener(_Str_2693.RWPLEE_INVENTORY_UPDATED, this._Str_20116);
            k.addEventListener(_Str_2693.RWPLEE_SONG_DISK_INVENTORY_UPDATED, this._Str_22187);
            k.addEventListener(_Str_2693.RWPLEE_PLAY_LIST_UPDATED, this._Str_19711);
            k.addEventListener(_Str_2693.RWPLEE_PLAY_LIST_FULL, this._Str_21874);
            k.addEventListener(_Str_3301.RWPLENPE_SONG_CHANGED, this._Str_9132);
            k.addEventListener(_Str_3301.RWPLENPE_USER_PLAY_SONG, this._Str_9132);
            k.addEventListener(_Str_3301.RWPLENPW_USER_STOP_SONG, this._Str_9132);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            k.removeEventListener(_Str_2693.RWPLEE_SHOW_PLAYLIST_EDITOR, this._Str_19678);
            k.removeEventListener(_Str_2693.RWPLEE_HIDE_PLAYLIST_EDITOR, this._Str_19485);
            k.removeEventListener(_Str_2693.RWPLEE_INVENTORY_UPDATED, this._Str_20116);
            k.removeEventListener(_Str_2693.RWPLEE_SONG_DISK_INVENTORY_UPDATED, this._Str_22187);
            k.removeEventListener(_Str_2693.RWPLEE_PLAY_LIST_UPDATED, this._Str_19711);
            k.removeEventListener(_Str_2693.RWPLEE_PLAY_LIST_FULL, this._Str_21874);
            k.removeEventListener(_Str_3301.RWPLENPE_SONG_CHANGED, this._Str_9132);
            k.removeEventListener(_Str_3301.RWPLENPE_USER_PLAY_SONG, this._Str_9132);
            k.removeEventListener(_Str_3301.RWPLENPW_USER_STOP_SONG, this._Str_9132);
        }

        public function get _Str_15010():MainWindowHandler
        {
            return this._Str_2314;
        }

        public function _Str_18331(k:String):ColorTransform
        {
            var _local_2:uint;
            var _local_3:uint;
            var _local_4:uint;
            var _local_5:int;
            while (_local_5 < k.length)
            {
                switch ((_local_5 % 3))
                {
                    case 0:
                        _local_2 = (_local_2 + ((k.charCodeAt(_local_5) * 37) as int));
                        break;
                    case 1:
                        _local_3 = (_local_3 + ((k.charCodeAt(_local_5) * 37) as int));
                        break;
                    case 2:
                        _local_4 = (_local_4 + ((k.charCodeAt(_local_5) * 37) as int));
                        break;
                }
                _local_5++;
            }
            _local_2 = ((_local_2 % _Str_16479) + _Str_17485);
            _local_3 = ((_local_3 % _Str_15986) + _Str_18630);
            _local_4 = ((_local_4 % _Str_16988) + _Str_18472);
            return new ColorTransform((_local_2 / 0xFF), (_local_3 / 0xFF), (_local_4 / 0xFF));
        }

        public function _Str_23659(k:int):void
        {
            var _local_3:int;
            var _local_4:RoomWidgetPlayListModificationMessage;
            var _local_2:IPlayListController = this._soundManager._Str_2774._Str_6500();
            if (_local_2 != null)
            {
                _local_3 = _local_2.length;
                _local_4 = new RoomWidgetPlayListModificationMessage(RoomWidgetPlayListModificationMessage.RWPLAM_ADD_TO_PLAYLIST, _local_3, k);
                if (messageListener != null)
                {
                    messageListener.processWidgetMessage(_local_4);
                }
            }
        }

        public function _Str_20304(k:int):void
        {
            var _local_2:RoomWidgetPlayListModificationMessage = new RoomWidgetPlayListModificationMessage(RoomWidgetPlayListModificationMessage.RWPLAM_REMOVE_FROM_PLAYLIST, k);
            if (messageListener != null)
            {
                messageListener.processWidgetMessage(_local_2);
            }
        }

        public function _Str_23449():void
        {
            var k:int;
            if (((!(this._Str_2314 == null)) && (!(this._Str_2314._Str_15855 == null))))
            {
                k = ((this._Str_2314._Str_15855._Str_4405 != -1) ? this._Str_2314._Str_15855._Str_4405 : 0);
            }
            var _local_2:RoomWidgetPlayListPlayStateMessage = new RoomWidgetPlayListPlayStateMessage(RoomWidgetPlayListPlayStateMessage.RWPLPS_TOGGLE_PLAY_PAUSE, this._Str_2502, k);
            if (messageListener != null)
            {
                messageListener.processWidgetMessage(_local_2);
            }
        }

        public function _Str_25259(k:int):void
        {
            var _local_3:ISongInfo;
            var _local_2:int = this._soundManager._Str_2774._Str_6665(HabboMusicPrioritiesEnum._Str_4350);
            if (_local_2 != -1)
            {
                _local_3 = this._soundManager._Str_2774._Str_3255(_local_2);
                if (_local_3._Str_3502 != null)
                {
                    _local_3._Str_3502._Str_4908 = 0;
                }
            }
            this._soundManager._Str_2774._Str_9539(k, HabboMusicPrioritiesEnum._Str_7215, 0, 0, 0, 0);
        }

        public function _Str_16919():void
        {
            this._soundManager._Str_2774.stop(HabboMusicPrioritiesEnum._Str_7215);
        }

        public function _Str_8169(k:String):BitmapData
        {
            var _local_3:BitmapData;
            var _local_2:BitmapDataAsset = (this.assets.getAssetByName(k) as BitmapDataAsset);
            if (_local_2 == null)
            {
                return null;
            }
            _local_3 = (_local_2.content as BitmapData);
            return _local_3.clone();
        }

        public function _Str_24749(k:String):void
        {
            var _local_2:String = this._configurationManager.getProperty("image.library.playlist.url");
            var _local_3:* = ((_local_2 + k) + ".gif");
            Logger.log(("[PlayListEditorWidget]  : " + _local_3));
            var _local_4:URLRequest = new URLRequest(_local_3);
            var _local_5:AssetLoaderStruct = this.assets.loadAssetFromFile(k, _local_4, "image/gif");
            _local_5.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_24982);
        }

        public function _Str_25595():void
        {
            var k:RoomWidgetPlayListUserActionMessage = new RoomWidgetPlayListUserActionMessage(RoomWidgetPlayListUserActionMessage.RWPLUA_OPEN_CATALOGUE_BUTTON_PRESSED);
            if (messageListener != null)
            {
                messageListener.processWidgetMessage(k);
            }
            this._catalog.openCatalogPage(CatalogPageName.TRAX_SONGS);
        }

        public function _Str_25543():void
        {
            this.windowManager.alert(("$" + "{playlist.editor.alert.playlist.full.title}"), ("$" + "{playlist.editor.alert.playlist.full}"), 0, this._Str_18087);
        }

        private function _Str_18087(k:_Str_2418, _arg_2:WindowEvent):void
        {
            k.dispose();
        }

        private function _Str_19678(k:_Str_2693):void
        {
            var _local_2:IPlayListController;
            this._Str_2502 = k.furniId;
            if (!this._Str_2314)
            {
                this._Str_2314 = new MainWindowHandler(this, this._soundManager._Str_2774);
                this._Str_2314.window.visible = false;
            }
            if (!this._Str_2314.window.visible)
            {
                this._Str_2314.show();
                this._soundManager._Str_2774._Str_14232();
                _local_2 = this._soundManager._Str_2774._Str_6500();
                if (_local_2 != null)
                {
                    _local_2._Str_5930();
                }
            }
        }

        private function _Str_19485(k:_Str_2693):void
        {
            if (this._Str_2314 != null)
            {
                if (this._Str_2314.window.visible)
                {
                    this._Str_2314.hide();
                }
            }
        }

        private function _Str_20116(k:_Str_2693):void
        {
            if (!this._Str_2314)
            {
                return;
            }
            if (this._Str_2314.window.visible)
            {
                this._soundManager._Str_2774._Str_14232();
            }
        }

        private function _Str_24982(k:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct;
            if (k.type == AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE)
            {
                _local_2 = (k.target as AssetLoaderStruct);
                if (_local_2 != null)
                {
                    if (this._Str_2314 != null)
                    {
                        this._Str_2314._Str_19051(_local_2.assetName);
                    }
                }
            }
        }

        private function _Str_22187(k:_Str_2693):void
        {
            if (this._Str_2314)
            {
                this._Str_2314._Str_25286();
            }
        }

        private function _Str_19711(k:_Str_2693):void
        {
            if (this._Str_2314)
            {
                this._Str_2314._Str_25748();
            }
        }

        private function _Str_21874(k:_Str_2693):void
        {
            this._Str_25543();
        }

        private function _Str_9132(k:_Str_3301):void
        {
            if (this._Str_2314)
            {
                this._Str_2314._Str_14970(k);
            }
        }
    }
}
