package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.room.object.data.CrackableStuffData;
    import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfostandUpdateEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IRegionWindow;

    public class InfoStandCrackableFurniView extends InfoStandFurniView 
    {
        public function InfoStandCrackableFurniView(k:InfoStandWidget, _arg_2:String, _arg_3:IHabboCatalog)
        {
            super(k, _arg_2, _arg_3);
        }

        override public function update(k:RoomWidgetFurniInfostandUpdateEvent):void
        {
            super.update(k);
            var _local_2:CrackableStuffData = (k.stuffData as CrackableStuffData);
            showButton("use", true);
            _buttons.visible = true;
            this._Str_25073(_local_2.hits, _local_2.target);
        }

        private function _Str_25073(k:int, _arg_2:int):void
        {
            var _local_3:IWindow = _infoElements.getListItemByName("hits_remaining");
            if (_local_3 == null)
            {
                return;
            }
            _widget.localizations.registerParameter("infostand.crackable_furni.hits_remaining", "hits", String(k));
            _widget.localizations.registerParameter("infostand.crackable_furni.hits_remaining", "target", String(_arg_2));
            _local_3.visible = true;
            updateWindow();
        }

        override protected function createWindow(k:String):void
        {
            var _local_4:IWindow;
            var _local_6:int;
            var _local_2:XmlAsset = (_widget.assets.getAssetByName("crackable_furni_view") as XmlAsset);
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
            _widget.mainContainer.addChild(window);
            var _local_3:IWindow = _border.findChildByTag("close");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, onCloseHandler);
            }
            if (_buttons != null)
            {
                _local_6 = 0;
                while (_local_6 < _buttons.numListItems)
                {
                    _local_4 = _buttons.getListItemAt(_local_6);
                    _local_4.addEventListener(WindowMouseEvent.CLICK, onButtonClicked);
                    _local_6++;
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
            var _local_5:IRegionWindow = (_infoElements.getListItemByName("owner_region") as IRegionWindow);
            if (_local_5 != null)
            {
                _local_5.addEventListener(WindowMouseEvent.CLICK, _Str_4711);
                _local_5.addEventListener(WindowMouseEvent.OVER, _Str_4711);
                _local_5.addEventListener(WindowMouseEvent.OUT, _Str_4711);
            }
        }
    }
}
