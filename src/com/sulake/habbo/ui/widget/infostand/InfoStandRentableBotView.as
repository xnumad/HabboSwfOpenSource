package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRentrableBotInfostandUpdateEvent;
    import com.sulake.core.window.components.ITextWindow;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_5937;

    public class InfoStandRentableBotView 
    {
        private static const _Str_5169:int = 162;
        private static const _Str_8071:int = 16;
        private static const _Str_4882:int = 5;
        private static const _Str_3835:int = 4;
        private static const _Str_5037:uint = 0xDADADA;
        private static const _Str_4952:uint = 0x3A3A3A;
        private static const _Str_19674:uint = 2085362;
        private static const _Str_21814:uint = 39616;
        private static const NAME_TEXT:String = "name_text";
        private static const DESCRIPTION_TEXT:String = "description_text";
        private static const HANDITEM_TEXT:String = "handitem_text";
        private static const OWNER_TEXT:String = "owner_text";
        private static const EXPIRE_TIME_LEFT:String = "expire_time_left";
        private static const EXPIRE_TIME_INFO:String = "expire_time_info";
        private static const HANDITEM_SPACER:String = "handitem_spacer";
        private static const _Str_8222:int = 250;
        private static const _Str_4468:int = 25;
        private static const _Str_6207:int = 5;

        private var _catalog:IHabboCatalog;
        private var _habboTracking:IHabboTracking;
        private var _widget:InfoStandWidget;
        private var _window:IItemListWindow;
        private var _border:IBorderWindow;
        private var _buttonsContainer:IWindowContainer;
        private var _infoElements:IItemListWindow;
        private var _badgeId:String;
        private var _botId:int;
        private var _disposed:Boolean;

        public function InfoStandRentableBotView(k:InfoStandWidget, _arg_2:String, _arg_3:IHabboCatalog)
        {
            this._widget = k;
            this._catalog = _arg_3;
            this._habboTracking = HabboTracking.getInstance();
            this.createWindow(_arg_2);
        }

        public function dispose():void
        {
            this._widget = null;
            this._catalog = null;
            this._habboTracking = null;
            this._border = null;
            this._buttonsContainer = null;
            this._infoElements = null;
            if (this._window)
            {
                this._window.dispose();
            }
            this._window = null;
            this._disposed = true;
        }

        public function get window():IItemListWindow
        {
            return this._window;
        }

        private function updateWindow():void
        {
            if ((((this._infoElements == null) || (this._border == null)) || (this._buttonsContainer == null)))
            {
                return;
            }
            this._buttonsContainer.width = this._buttonsContainer.width;
            this._buttonsContainer.visible = (this._buttonsContainer.width > 0);
            this._infoElements.height = this._infoElements.visibleRegion.height;
            this._border.height = (this._infoElements.height + 20);
            this._window.width = Math.max(this._border.width, this._buttonsContainer.width);
            this._window.height = this._window.visibleRegion.height;
            if (this._border.width < this._buttonsContainer.width)
            {
                this._border.x = (this._window.width - this._border.width);
                this._buttonsContainer.x = 0;
            }
            else
            {
                this._buttonsContainer.x = (this._window.width - this._buttonsContainer.width);
                this._border.x = 0;
            }
            this._widget._Str_10301();
        }

        public function update(k:RoomWidgetRentrableBotInfostandUpdateEvent):void
        {
            this._botId = k._Str_2394;
            this._Str_9667(NAME_TEXT, true, k.name);
            this._Str_9667(DESCRIPTION_TEXT, true, k.motto);
            if (k.ownerId > -1)
            {
                this._widget.localizations.registerParameter("infostand.text.botowner", "name", k.ownerName);
                this._Str_9667(OWNER_TEXT, true, this._widget.localizations.getLocalization("infostand.text.botowner"));
            }
            else
            {
                this._Str_9667(OWNER_TEXT, false, "");
            }
            this._Str_25241();
            this._Str_22346(k._Str_3249);
            var _local_2:Array = k.badges;
            this._Str_5605((((_local_2) && (_local_2.length > 0)) ? _local_2[0] : null));
            this._Str_7907(k.figure);
            this._Str_2304("whisper", false);
            this._Str_2304("ignore", false);
            this._Str_2304("unignore", false);
            this._Str_2304("pick", ((k.ownerId > -1) && ((k._Str_3246) || (k._Str_3529))));
            this.updateWindow();
        }

        private function _Str_25241():void
        {
            this._Str_9667(EXPIRE_TIME_LEFT, false, "N/A");
            this._Str_9667(EXPIRE_TIME_INFO, false, "");
        }

        public function _Str_22346(k:int):void
        {
            var _local_6:String;
            var _local_2:ITextWindow = (this._infoElements.getListItemByName(HANDITEM_TEXT) as ITextWindow);
            var _local_3:IWindowContainer = (this._infoElements.getListItemByName(HANDITEM_SPACER) as IWindowContainer);
            if (((_local_2 == null) || (_local_3 == null)))
            {
                return;
            }
            if (((k > 0) && (k < 999999)))
            {
                _local_6 = this._widget.localizations.getLocalization(("handitem" + k), ("handitem" + k));
                this._widget.localizations.registerParameter("infostand.text.handitem", "item", _local_6);
            }
            _local_2.height = (_local_2.textHeight + _Str_4882);
            var _local_4:Boolean = _local_2.visible;
            var _local_5:Boolean = ((k > 0) && (k < 999999));
            _local_2.visible = _local_5;
            _local_3.visible = _local_5;
            if (_local_5 != _local_4)
            {
                this._infoElements.arrangeListItems();
            }
            this.updateWindow();
        }

        private function _Str_12421(k:int, _arg_2:int, _arg_3:uint, _arg_4:uint):BitmapData
        {
            _arg_2 = Math.max(_arg_2, 1);
            k = Math.max(k, 0);
            if (k > _arg_2)
            {
                k = _arg_2;
            }
            var _local_5:Number = (k / _arg_2);
            var _local_6:int = 1;
            var _local_7:BitmapData = new BitmapData(_Str_5169, _Str_8071, false);
            _local_7.fillRect(new Rectangle(0, 0, _local_7.width, _local_7.height), _Str_5037);
            var _local_8:Rectangle = new Rectangle(_local_6, _local_6, (_local_7.width - (_local_6 * 2)), (_local_7.height - (_local_6 * 2)));
            _local_7.fillRect(_local_8, _Str_4952);
            var _local_9:Rectangle = new Rectangle(_local_6, (_local_6 + _Str_3835), (_local_7.width - (_local_6 * 2)), ((_local_7.height - (_local_6 * 2)) - _Str_3835));
            _local_9.width = (_local_5 * _local_9.width);
            _local_7.fillRect(_local_9, _arg_3);
            var _local_10:Rectangle = new Rectangle(_local_6, _local_6, (_local_7.width - (_local_6 * 2)), _Str_3835);
            _local_10.width = (_local_5 * _local_10.width);
            _local_7.fillRect(_local_10, _arg_4);
            return _local_7;
        }

        private function createWindow(k:String):void
        {
            var _local_5:IWindow;
            var _local_6:IWindow;
            var _local_2:XmlAsset = (this._widget.assets.getAssetByName("rentable_bot_view") as XmlAsset);
            this._window = (this._widget.windowManager.buildFromXML((_local_2.content as XML)) as IItemListWindow);
            if (this._window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            this._border = (this._window.getListItemByName("info_border") as IBorderWindow);
            if (this._border != null)
            {
                this._infoElements = (this._border.findChildByName("infostand_element_list") as IItemListWindow);
            }
            this._window.name = k;
            this._widget.mainContainer.addChild(this._window);
            var _local_3:IWindow = this._border.findChildByTag("close");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            }
            this._buttonsContainer = (this._window.getListItemByName("button_list") as IWindowContainer);
            if (this._buttonsContainer == null)
            {
                return;
            }
            var _local_4:Array = [];
            this._buttonsContainer.groupChildrenWithTag("CMD_BUTTON", _local_4, -1);
            for each (_local_5 in _local_4)
            {
                _local_5.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
            }
            for each (_local_6 in _local_4)
            {
                if (_local_6.parent)
                {
                    _local_6.parent.width = _local_6.width;
                }
                _local_6.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_17596);
            }
        }

        private function _Str_9667(k:String, _arg_2:Boolean, _arg_3:String):void
        {
            var _local_5:IWindowContainer;
            if (this._infoElements == null)
            {
                return;
            }
            var _local_4:ITextWindow = (this._infoElements.getListItemByName(k) as ITextWindow);
            if (_local_4 == null)
            {
                _local_5 = (this._infoElements.getListItemByName("description_container") as IWindowContainer);
                if (_local_5 == null)
                {
                    return;
                }
                _local_4 = (_local_5.findChildByName(k) as ITextWindow);
                if (!_local_4)
                {
                    return;
                }
            }
            _local_4.text = _arg_3;
            _local_4.visible = _arg_2;
        }

        private function _Str_7907(k:String):void
        {
            var _local_2:_Str_2483 = (IWidgetWindow(this._border.findChildByName("avatar_image")).widget as _Str_2483);
            _local_2.figure = k;
        }

        private function _Str_5605(k:String):void
        {
            var _local_2:_Str_2402 = (IWidgetWindow(this._border.findChildByName("badge")).widget as _Str_2402);
            _local_2.badgeId = k;
        }

        protected function _Str_2608(k:WindowMouseEvent):void
        {
            if (k.target.name == "pick")
            {
                this._widget.handler.container.connection.send(new _Str_5937(this._botId));
            }
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this._widget.close();
        }

        protected function _Str_2304(k:String, _arg_2:Boolean):void
        {
            if (this._buttonsContainer == null)
            {
                return;
            }
            var _local_3:IWindow = this._buttonsContainer.getChildByName(k);
            if (_local_3 != null)
            {
                _local_3.visible = _arg_2;
                this._Str_18168();
            }
        }

        protected function _Str_17596(k:WindowEvent):void
        {
            var _local_2:IWindow = k.window.parent;
            if (((_local_2) && (_local_2.tags.indexOf("CMD_BUTTON_REGION") > -1)))
            {
                _local_2.width = k.window.width;
            }
        }

        private function _Str_18168():void
        {
            var _local_5:IWindow;
            var k:int = _Str_8222;
            this._buttonsContainer.width = k;
            var _local_2:Array = [];
            this._buttonsContainer.groupChildrenWithTag("CMD_BUTTON_REGION", _local_2, -1);
            var _local_3:int = k;
            var _local_4:int;
            for each (_local_5 in _local_2)
            {
                if (!_local_5.visible)
                {
                }
                else
                {
                    if ((_local_3 - _local_5.width) < 0)
                    {
                        _local_3 = k;
                        _local_4 = (_local_4 + (_Str_4468 + _Str_6207));
                    }
                    _local_5.x = (_local_3 - _local_5.width);
                    _local_5.y = _local_4;
                    _local_3 = (_local_5.x - _Str_6207);
                }
            }
            this._buttonsContainer.height = (_local_4 + _Str_4468);
            this.updateWindow();
        }
    }
}
