package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.ITextWindow;
    import flash.geom.Rectangle;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateInfostandUserEvent;

    public class InfoStandBotView 
    {
        private const _Str_4882:int = 5;
        private const _Str_14702:int = 3;
        private const _Str_14746:int = 50;
        private const _Str_13324:int = 23;

        private var _widget:InfoStandWidget;
        private var _window:IItemListWindow;
        private var _infoElements:IItemListWindow;
        private var _border:IBorderWindow;
        private var _badgeDetails:IBorderWindow;

        public function InfoStandBotView(k:InfoStandWidget, _arg_2:String)
        {
            this._widget = k;
            this.createWindow(_arg_2);
        }

        public function dispose():void
        {
            this._widget = null;
            this._window.dispose();
            this._window = null;
            this._Str_9682();
        }

        public function get window():IItemListWindow
        {
            return this._window;
        }

        private function updateWindow():void
        {
            if (((this._infoElements == null) || (this._border == null)))
            {
                return;
            }
            this._infoElements.height = this._infoElements.visibleRegion.height;
            this._border.height = (this._infoElements.height + 20);
            this._window.width = this._border.width;
            this._window.height = this._window.visibleRegion.height;
            this._widget._Str_10301();
        }

        private function createWindow(k:String):void
        {
            var _local_3:IWindow;
            this._window = (this._widget.getXmlWindow("bot_view") as IItemListWindow);
            if (this._window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            this._border = (this._window.getListItemByName("info_border") as IBorderWindow);
            this._infoElements = (this._border.findChildByName("infostand_element_list") as IItemListWindow);
            if (this._border != null)
            {
                this._infoElements = (this._border.findChildByName("infostand_element_list") as IItemListWindow);
            }
            this._window.name = k;
            this._widget.mainContainer.addChild(this._window);
            var _local_2:IWindow = this._border.findChildByTag("close");
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            }
            var _local_4:int;
            while (_local_4 < 5)
            {
                _local_3 = this._border.findChildByName(("badge_" + _local_4));
                if (_local_3 == null)
                {
                }
                else
                {
                    _local_3.addEventListener(WindowMouseEvent.OVER, this._Str_18818);
                    _local_3.addEventListener(WindowMouseEvent.OUT, this._Str_16035);
                }
                _local_4++;
            }
        }

        private function _Str_18818(k:WindowMouseEvent):void
        {
            var _local_5:ITextWindow;
            if (k.window == null)
            {
                return;
            }
            var _local_2:int = int(k.window.name.replace("badge_", ""));
            if (_local_2 < 0)
            {
                return;
            }
            var _local_3:Array = this._widget.userData.badges;
            if (_local_3 == null)
            {
                return;
            }
            if (_local_2 >= _local_3.length)
            {
                return;
            }
            var _local_4:String = this._widget.userData.badges[_local_2];
            if (_local_4 == null)
            {
                return;
            }
            this._Str_13311();
            _local_5 = (this._badgeDetails.getChildByName("name") as ITextWindow);
            if (_local_5 != null)
            {
                _local_5.text = this._widget.localizations.getBadgeName(_local_4);
            }
            _local_5 = (this._badgeDetails.getChildByName("description") as ITextWindow);
            if (_local_5 != null)
            {
                _local_5.text = this._widget.localizations.getBadgeDesc(_local_4);
            }
            var _local_6:Rectangle = new Rectangle();
            k.window.getGlobalRectangle(_local_6);
            this._badgeDetails.x = (_local_6.left - this._badgeDetails.width);
            this._badgeDetails.y = (_local_6.top + ((_local_6.height - this._badgeDetails.height) / 2));
        }

        private function _Str_16035(k:WindowMouseEvent):void
        {
            this._Str_9682();
        }

        private function _Str_13311():void
        {
            if (this._badgeDetails != null)
            {
                return;
            }
            var k:XmlAsset = (this._widget.assets.getAssetByName("badge_details") as XmlAsset);
            if (k == null)
            {
                return;
            }
            this._badgeDetails = (this._widget.windowManager.buildFromXML((k.content as XML)) as IBorderWindow);
            if (this._badgeDetails == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
        }

        private function _Str_9682():void
        {
            if (this._badgeDetails != null)
            {
                this._badgeDetails.dispose();
                this._badgeDetails = null;
            }
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this._widget.close();
        }

        public function _Str_7907(k:String):void
        {
            var _local_2:_Str_2483 = (IWidgetWindow(this._border.findChildByName("avatar_image")).widget as _Str_2483);
            _local_2.figure = k;
        }

        public function set name(k:String):void
        {
            var _local_2:ITextWindow = (this._infoElements.getListItemByName("name_text") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.text = k;
            _local_2.visible = true;
        }

        public function _Str_12782(k:String):void
        {
            var _local_2:IWindowContainer = (this._infoElements.getListItemByName("motto_container") as IWindowContainer);
            if (!_local_2)
            {
                return;
            }
            var _local_3:ITextWindow = (_local_2.findChildByName("motto_text") as ITextWindow);
            var _local_4:IWindowContainer = (this._infoElements.getListItemByName("motto_spacer") as IWindowContainer);
            if (((_local_3 == null) || (_local_4 == null)))
            {
                return;
            }
            if (k == null)
            {
                k = "";
            }
            _local_3.text = k;
            _local_3.height = Math.min((_local_3.textHeight + this._Str_4882), this._Str_14746);
            _local_3.height = Math.max(_local_3.height, this._Str_13324);
            _local_2.height = (_local_3.height + this._Str_14702);
            this.updateWindow();
        }

        public function set activityPoints(k:int):void
        {
            if (!this._widget.handler._Str_7745)
            {
                return;
            }
            var _local_2:ITextWindow = (this._infoElements.getListItemByName("score_value") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.text = k.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
        }

        public function set _Str_3249(k:int):void
        {
            var _local_6:String;
            var _local_2:ITextWindow = (this._infoElements.getListItemByName("handitem_txt") as ITextWindow);
            var _local_3:IWindowContainer = (this._infoElements.getListItemByName("handitem_spacer") as IWindowContainer);
            if (((_local_2 == null) || (_local_3 == null)))
            {
                return;
            }
            if (((k > 0) && (k < 999999)))
            {
                _local_6 = this._widget.localizations.getLocalization(("handitem" + k), ("handitem" + k));
                this._widget.localizations.registerParameter("infostand.text.handitem", "item", _local_6);
            }
            _local_2.height = (_local_2.textHeight + this._Str_4882);
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

        public function _Str_5605(k:int, _arg_2:String):void
        {
            var _local_3:_Str_2402 = (IWidgetWindow(this._border.findChildByName(("badge_" + k))).widget as _Str_2402);
            _local_3.badgeId = _arg_2;
        }

        public function _Str_10630():void
        {
            var _local_2:_Str_2402;
            var k:int;
            while (k < 5)
            {
                _local_2 = (IWidgetWindow(this._border.findChildByName(("badge_" + k))).widget as _Str_2402);
                _local_2.badgeId = "";
                k++;
            }
        }

        public function update(k:RoomWidgetUpdateInfostandUserEvent):void
        {
            this._Str_10630();
            this._Str_11602(k);
        }

        private function _Str_11602(k:RoomWidgetUpdateInfostandUserEvent):void
        {
            this.name = k.name;
            this._Str_12782(k.motto);
            this.activityPoints = k.activityPoints;
            this._Str_3249 = k._Str_3249;
            this._Str_7907(k.figure);
            this._Str_25101(k.badges);
        }

        private function _Str_25101(k:Array):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:int;
            while (_local_2 < k.length)
            {
                this._Str_5605(_local_2, k[_local_2]);
                _local_2++;
            }
        }
    }
}
