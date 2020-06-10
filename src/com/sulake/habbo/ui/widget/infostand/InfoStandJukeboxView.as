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
            var _local_2:XmlAsset = (_widget.assets.getAssetByName("jukebox_view") as XmlAsset);
            _window = (_widget.windowManager.buildFromXML((_local_2.content as XML)) as IItemListWindow);
            if (_window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            _border = (_window.getListItemByName("info_border") as IBorderWindow);
            _buttons = (_window.getListItemByName("button_list") as IItemListWindow);
            if (_border != null)
            {
                _infoElements = (_border.findChildByName("infostand_element_list") as IItemListWindow);
            }
            _window.name = k;
            _widget.mainContainer.addChild(_window);
            var _local_3:IWindow = _border.findChildByTag("close");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, onCloseHandler);
            }
            if (_buttons != null)
            {
                _local_10 = 0;
                while (_local_10 < _buttons.numListItems)
                {
                    _local_4 = _buttons.getListItemAt(_local_10);
                    _local_4.addEventListener(WindowMouseEvent.CLICK, onButtonClicked);
                    _local_10++;
                }
            }
            _Str_3793 = _border.findChildByTag("catalog");
            if (_Str_3793 != null)
            {
                _Str_3793.addEventListener(WindowMouseEvent.CLICK, _Str_12960);
            }
            _Str_3823 = _border.findChildByName("rent_button");
            if (_Str_3823 != null)
            {
                _Str_3823.addEventListener(WindowMouseEvent.CLICK, _Str_12518);
            }
            _Str_3747 = _border.findChildByName("extend_button");
            if (_Str_3747 != null)
            {
                _Str_3747.addEventListener(WindowMouseEvent.CLICK, _Str_15302);
            }
            _Str_3810 = _border.findChildByName("buyout_button");
            if (_Str_3810 != null)
            {
                _Str_3810.addEventListener(WindowMouseEvent.CLICK, _Str_15887);
            }
            var _local_7:IBitmapWrapperWindow = (_border.findChildByName("icon_disc") as IBitmapWrapperWindow);
            if (_local_7 != null)
            {
                _local_5 = (_widget.assets.getAssetByName("jb_icon_disc") as BitmapDataAsset);
                _local_6 = (_local_5.content as BitmapData);
                _local_7.bitmap = _local_6.clone();
            }
            var _local_8:IBitmapWrapperWindow = (_border.findChildByName("icon_composer") as IBitmapWrapperWindow);
            if (_local_8 != null)
            {
                _local_5 = (_widget.assets.getAssetByName("jb_icon_composer") as BitmapDataAsset);
                _local_6 = (_local_5.content as BitmapData);
                _local_8.bitmap = _local_6.clone();
            }
            var _local_9:IRegionWindow = (_infoElements.getListItemByName("owner_region") as IRegionWindow);
            if (_local_9 != null)
            {
                _local_9.addEventListener(WindowMouseEvent.CLICK, _Str_4711);
                _local_9.addEventListener(WindowMouseEvent.OVER, _Str_4711);
                _local_9.addEventListener(WindowMouseEvent.OUT, _Str_4711);
            }
        }

        private function set _Str_11249(k:String):void
        {
            var _local_2:IWindowContainer = (_infoElements.getListItemByName("trackname_container") as IWindowContainer);
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
            var _local_2:IWindowContainer = (_infoElements.getListItemByName("creatorname_container") as IWindowContainer);
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
                this._songId = k.songId;
            }
            if (k.songId == this._songId)
            {
                this._songName = k._Str_10782;
                this._songAuthor = k._Str_20860;
                this._Str_23399((this._songId >= 0));
            }
        }

        private function _Str_23399(k:Boolean):void
        {
            var _local_3:String;
            var _local_2:ITextWindow = (_infoElements.getListItemByName("now_playing_text") as ITextWindow);
            if (_local_2 != null)
            {
                if (k)
                {
                    _local_3 = _widget.localizations.getLocalization("infostand.jukebox.text.now.playing");
                }
                else
                {
                    _local_3 = _widget.localizations.getLocalization("infostand.jukebox.text.not.playing");
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
