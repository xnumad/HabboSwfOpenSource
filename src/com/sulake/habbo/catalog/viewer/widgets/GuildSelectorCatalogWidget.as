package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.components.IDropListWindow;
    import com.sulake.habbo.catalog.guilds.GuildMembershipsController;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetGuildSelectedEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events._Str_3308;
    import com.sulake.habbo.communication.messages.incoming.users._Str_3266;
    import com.sulake.habbo.catalog.viewer.widgets.events._Str_4201;
    import com.sulake.habbo.catalog.viewer.Offer;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetRoomPreviewerStuffDataEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.habbo.room.object.data.StringArrayStuffData;
    import com.sulake.habbo.room.IStuffData;

    public class GuildSelectorCatalogWidget extends CatalogWidget
    {
        private static const GUILD_SELECTOR:String = "guild_selector";
        private static const GUILD_SELECTOR_WIDGET_ITEM:String = "guild_selector_widget_item";
        private static const _Str_18419:uint = 0;
        private static const _Str_6422:int = 1;
        private static const _Str_16811:int = 14;
        private static const _Str_18723:int = 21;

        private var _Str_4025:IDropListWindow;
        protected var _Str_5363:GuildMembershipsController;
        private var _Str_14021:Array;
        private var _Str_4978:IWindow;
        private var _Str_15746:IWindow;
        private var _Str_5561:int = -1;

        public function GuildSelectorCatalogWidget(k:IWindowContainer, _arg_2:GuildMembershipsController)
        {
            super(k);
            this._Str_5363 = _arg_2;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                events.removeEventListener(CatalogWidgetEvent.WIDGETS_INITIALIZED, this._Str_3393);
                page.dispatchWidgetEvent(new CatalogWidgetGuildSelectedEvent(CatalogWidgetGuildSelectedEvent._Str_15457, "", "", ""));
                if (this._Str_4025)
                {
                    this._Str_4025.procedure = null;
                    this._Str_4025 = null;
                }
                this._Str_4978 = null;
                this._Str_15746 = null;
                if (this._Str_5363)
                {
                    this._Str_5363._Str_24420(this);
                    this._Str_5363 = null;
                }
                super.dispose();
            }
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            events.addEventListener(CatalogWidgetEvent.WIDGETS_INITIALIZED, this._Str_3393);
            _Str_2819(CatalogWidgetEnum.GUILD_SELECTOR);
            this._Str_4978 = window.findChildByName("guild_selector");
            this._Str_15746 = window.findChildByName("members_only");
            var k:IWindow = window.findChildByName("find_groups_button");
            if (k)
            {
                k.addEventListener(WindowMouseEvent.CLICK, this._Str_22828);
            }
            this._Str_4025 = (_window.findChildByName(GUILD_SELECTOR) as IDropListWindow);
            if (this._Str_4025)
            {
                this._Str_4025.procedure = this._Str_23967;
            }
            else
            {
                Logger.log((("ERROR: Missing '" + GUILD_SELECTOR) + "' itemlist_dropmenu component from page layout xml"));
            }
            this._Str_4978.visible = false;
            this._Str_15746.visible = false;
            return true;
        }

        private function _Str_3393(k:_Str_3308):void
        {
            this._Str_5363._Str_24019(this);
            events.dispatchEvent(new _Str_3308(CatalogWidgetEvent.EXTRA_PARAM_REQUIRED_FOR_BUY));
        }

        public function _Str_24364(k:Array):void
        {
            var _local_7:_Str_3266;
            var _local_2:int = -1;
            this._Str_14021 = this.filterGroupMemberships(k);
            var _local_3:* = (k.length > 0);
            events.dispatchEvent(new _Str_4201(CatalogWidgetEnum.PURCHASE, _local_3));
            this._Str_4978.visible = _local_3;
            this._Str_15746.visible = (!(_local_3));
            var _local_4:int = this._Str_4025.numMenuItems;
            var _local_5:int;
            while (_local_5 < _local_4)
            {
                this._Str_4025.removeMenuItemAt(0);
                _local_5++;
            }
            var _local_6:int;
            while (_local_6 < this._Str_14021.length)
            {
                _local_7 = this._Str_14021[_local_6];
                this._Str_4025.addMenuItem(this._Str_23230(_local_7));
                if (_local_7.favourite)
                {
                    _local_2 = _local_6;
                }
                _local_6++;
            }
            if (this._Str_5561 == -1)
            {
                if (_local_2 != -1)
                {
                    this._Str_4025.selection = _local_2;
                }
                else
                {
                    if (this._Str_4025.numMenuItems > 0)
                    {
                        this._Str_4025.selection = 0;
                    }
                }
            }
            else
            {
                this._Str_4025.selection = this._Str_5561;
            }
        }

        protected function filterGroupMemberships(k:Array):Array
        {
            return k;
        }

        public function _Str_22864():void
        {
            if ((((page) && (page.offers)) && (page.offers.length > 0)))
            {
                page.selectOffer(Offer(page.offers[0]).offerId);
            }
        }

        private function _Str_23967(k:WindowEvent, _arg_2:IWindow):void
        {
            switch (k.type)
            {
                case WindowEvent.WINDOW_EVENT_SELECTED:
                    this._Str_24750(this._Str_4025.selection);
                    this._Str_5561 = this._Str_4025.selection;
                    return;
            }
        }

        private function _Str_24750(k:int):void
        {
            var _local_2:_Str_3266;
            if (k > -1)
            {
                _local_2 = this._Str_14021[k];
                this.selectGroup(_local_2);
            }
        }

        protected function selectGroup(k:_Str_3266):void
        {
            page.dispatchWidgetEvent(new CatalogWidgetGuildSelectedEvent(k.groupId, k._Str_5845, k._Str_6659, k.badgeCode));
            page.dispatchWidgetEvent(new SetRoomPreviewerStuffDataEvent(this._Str_17425(k.groupId, k._Str_5845, k._Str_6659, k.badgeCode)));
            events.dispatchEvent(new SetExtraPurchaseParameterEvent(k.groupId.toString()));
        }

        private function _Str_23401(k:uint, _arg_2:uint):BitmapData
        {
            var _local_3:BitmapData = new BitmapData(_Str_18723, _Str_16811, false, _Str_18419);
            var _local_4:int = ((_local_3.width / 2) + 1);
            var _local_5:Rectangle = new Rectangle();
            _local_5.left = _Str_6422;
            _local_5.top = _Str_6422;
            _local_5.right = _local_4;
            _local_5.bottom = (_local_3.height - _Str_6422);
            var _local_6:Rectangle = new Rectangle();
            _local_6.left = _local_4;
            _local_6.top = _Str_6422;
            _local_6.right = (_local_3.width - _Str_6422);
            _local_6.bottom = (_local_3.height - _Str_6422);
            _local_3.fillRect(_local_5, k);
            _local_3.fillRect(_local_6, _arg_2);
            return _local_3;
        }

        private function _Str_23230(k:_Str_3266):IWindow
        {
            var _local_2:BitmapData = this._Str_23401(parseInt(k._Str_5845, 16), parseInt(k._Str_6659, 16));
            var _local_3:XML = (page.viewer.catalog.assets.getAssetByName(GUILD_SELECTOR_WIDGET_ITEM).content as XML);
            var _local_4:IWindowContainer = (page.viewer.catalog.windowManager.buildFromXML(_local_3) as IWindowContainer);
            var _local_5:IBitmapWrapperWindow = (_local_4.findChildByName("guild_colors") as IBitmapWrapperWindow);
            var _local_6:ILabelWindow = (_local_4.findChildByName("guild_name") as ILabelWindow);
            _local_5.bitmap = _local_2;
            _local_6.caption = k.groupName;
            return _local_4;
        }

        private function _Str_22828(k:WindowMouseEvent):void
        {
            if (((((page) && (page.viewer)) && (page.viewer.catalog)) && (page.viewer.catalog.navigator)))
            {
                page.viewer.catalog.navigator.performGuildBaseSearch();
            }
        }

        private function _Str_17425(k:uint, _arg_2:String, _arg_3:String, _arg_4:String):IStuffData
        {
            var _local_5:Array = new Array();
            _local_5.push("0");
            _local_5.push(k.toString());
            _local_5.push(_arg_4);
            _local_5.push(_arg_2);
            _local_5.push(_arg_3);
            var _local_6:StringArrayStuffData = new StringArrayStuffData();
            _local_6._Str_13438(_local_5);
            return _local_6;
        }
    }
}
