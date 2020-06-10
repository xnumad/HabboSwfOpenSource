package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfostandUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetSongUpdateEvent;
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
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnumItemExtradataParameter;

    public class InfoStandSongDiskView extends InfoStandFurniView 
    {
        private var _songId:int = -1;

        public function InfoStandSongDiskView(k:InfoStandWidget, _arg_2:String, _arg_3:IHabboCatalog)
        {
            super(k, _arg_2, _arg_3);
        }

        override public function dispose():void
        {
            super.dispose();
        }

        override public function update(k:RoomWidgetFurniInfostandUpdateEvent):void
        {
            super.update(k);
            this._songId = this._Str_24806(k.extraParam);
        }

        public function _Str_17571(k:RoomWidgetSongUpdateEvent):void
        {
            if (((k.type == RoomWidgetSongUpdateEvent.DATA_RECEIVED) && (k.songId == this._songId)))
            {
                this._Str_8410 = k._Str_10782;
                this._Str_6415 = k._Str_20860;
            }
        }

        override protected function createWindow(k:String):void
        {
            var _local_4:IWindow;
            var _local_5:BitmapDataAsset;
            var _local_6:BitmapData;
            var _local_10:int;
            var _local_2:XmlAsset = (_widget.assets.getAssetByName("songdisk_view") as XmlAsset);
            _window = (_widget.windowManager.buildFromXML((_local_2.content as XML)) as IItemListWindow);
            if (window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            _border = (window.getListItemByName("info_border") as IBorderWindow);
            _buttons = (window.getListItemByName("button_list") as IItemListWindow);
            if (_border != null)
            {
                _infoElements = (_border.findChildByName("infostand_element_list") as IItemListWindow);
            }
            window.name = k;
            _widget.mainContainer.addChild(window);
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

        private function set _Str_8410(k:String):void
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
            updateWindow();
        }

        private function set _Str_6415(k:String):void
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
            updateWindow();
        }

        private function _Str_24806(k:String):int
        {
            var _local_2:String;
            if (k != null)
            {
                _local_2 = k.substr(RoomWidgetEnumItemExtradataParameter.SONGDISK.length, k.length);
                return parseInt(_local_2);
            }
            return -1;
        }
    }
}
