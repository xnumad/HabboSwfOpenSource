package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.ui.widget.events.RoomWidgetSongUpdateEvent;

    public class InfoStandJukeboxView extends InfoStandFurniView 
    {
        private var _songId:int = -1;
        private var _songName:String = "";
        private var _songAuthor:String = "";

        public function InfoStandJukeboxView(k:InfoStandWidget, _arg_2:String, _arg_3:IHabboCatalog)
        {
            super(k, _arg_2, _arg_3);
        }

        override public function dispose():void
        {
            super.dispose();
        }

        override protected function createWindow(k:String):void
        {
            var _local_4:IWindow;
            var _local_5:BitmapDataAsset;
            var _local_6:BitmapData;
            var _local_10:int;
            var _local_2:XmlAsset = (_Str_2268.assets.getAssetByName("jukebox_view") as XmlAsset);
            _window = (_Str_2268.windowManager.buildFromXML((_local_2.content as XML)) as IItemListWindow);
            if (_window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            _Str_2341 = (_window.getListItemByName("info_border") as IBorderWindow);
            _Str_2374 = (_window.getListItemByName("button_list") as IItemListWindow);
            if (_Str_2341 != null)
            {
                _Str_2373 = (_Str_2341.findChildByName("infostand_element_list") as IItemListWindow);
            }
            _window.name = k;
            _Str_2268.mainContainer.addChild(_window);
            var _local_3:IWindow = _Str_2341.findChildByTag("close");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, onCloseHandler);
            }
            if (_Str_2374 != null)
            {
                _local_10 = 0;
                while (_local_10 < _Str_2374.numListItems)
                {
                    _local_4 = _Str_2374.getListItemAt(_local_10);
                    _local_4.addEventListener(WindowMouseEvent.CLICK, _Str_2608);
                    _local_10++;
                }
            }
            _Str_3793 = _Str_2341.findChildByTag("catalog");
            if (_Str_3793 != null)
            {
                _Str_3793.addEventListener(WindowMouseEvent.CLICK, _Str_12960);
            }
            _Str_3823 = _Str_2341.findChildByName("rent_button");
            if (_Str_3823 != null)
            {
                _Str_3823.addEventListener(WindowMouseEvent.CLICK, _Str_12518);
            }
            _Str_3747 = _Str_2341.findChildByName("extend_button");
            if (_Str_3747 != null)
            {
                _Str_3747.addEventListener(WindowMouseEvent.CLICK, _Str_15302);
            }
            _Str_3810 = _Str_2341.findChildByName("buyout_button");
            if (_Str_3810 != null)
            {
                _Str_3810.addEventListener(WindowMouseEvent.CLICK, _Str_15887);
            }
            var _local_7:IBitmapWrapperWindow = (_Str_2341.findChildByName("icon_disc") as IBitmapWrapperWindow);
            if (_local_7 != null)
            {
                _local_5 = (_Str_2268.assets.getAssetByName("jb_icon_disc") as BitmapDataAsset);
                _local_6 = (_local_5.content as BitmapData);
                _local_7.bitmap = _local_6.clone();
            }
            var _local_8:IBitmapWrapperWindow = (_Str_2341.findChildByName("icon_composer") as IBitmapWrapperWindow);
            if (_local_8 != null)
            {
                _local_5 = (_Str_2268.assets.getAssetByName("jb_icon_composer") as BitmapDataAsset);
                _local_6 = (_local_5.content as BitmapData);
                _local_8.bitmap = _local_6.clone();
            }
            var _local_9:IRegionWindow = (_Str_2373.getListItemByName("owner_region") as IRegionWindow);
            if (_local_9 != null)
            {
                _local_9.addEventListener(WindowMouseEvent.CLICK, _Str_4711);
                _local_9.addEventListener(WindowMouseEvent.OVER, _Str_4711);
                _local_9.addEventListener(WindowMouseEvent.OUT, _Str_4711);
            }
        }

        private function set _Str_11249(k:String):void
        {
            var _local_2:IWindowContainer = (_Str_2373.getListItemByName("trackname_container") as IWindowContainer);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:ITextWindow = (_local_2.getChildByName("track_name_text") as ITextWindow);
            if (_local_3 == null)
            {
                return;
            }
            _local_3.text = k;
            _local_3.visible = true;
            _local_3.height = (_local_3.textHeight + 5);
        }

        private function set _Str_9732(k:String):void
        {
            var _local_2:IWindowContainer = (_Str_2373.getListItemByName("creatorname_container") as IWindowContainer);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:ITextWindow = (_local_2.getChildByName("track_creator_text") as ITextWindow);
            if (_local_3 == null)
            {
                return;
            }
            _local_3.text = k;
            _local_3.visible = true;
            _local_3.height = (_local_3.textHeight + 5);
        }

        public function _Str_17571(k:RoomWidgetSongUpdateEvent):void
        {
            if (k.type == RoomWidgetSongUpdateEvent.PLAYING_CHANGED)
            {
                this._songId = k._Str_3951;
            }
            if (k._Str_3951 == this._songId)
            {
                this._songName = k._Str_10782;
                this._songAuthor = k._Str_20860;
                this._Str_23399((this._songId >= 0));
            }
        }

        private function _Str_23399(k:Boolean):void
        {
            var _local_3:String;
            var _local_2:ITextWindow = (_Str_2373.getListItemByName("now_playing_text") as ITextWindow);
            if (_local_2 != null)
            {
                if (k)
                {
                    _local_3 = _Str_2268.localizations.getLocalization("infostand.jukebox.text.now.playing");
                }
                else
                {
                    _local_3 = _Str_2268.localizations.getLocalization("infostand.jukebox.text.not.playing");
                }
                _local_2.text = _local_3;
            }
            if (k)
            {
                this._Str_11249 = this._songName;
                this._Str_9732 = this._songAuthor;
            }
            else
            {
                this._Str_11249 = "";
                this._Str_9732 = "";
            }
            updateWindow();
        }
    }
}
