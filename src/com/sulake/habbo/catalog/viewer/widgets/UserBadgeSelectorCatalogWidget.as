package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.badges.BadgesEvent;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.habbo.catalog.viewer.widgets.events._Str_3308;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.window.widgets.IBadgeImageWidget;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.enum._Str_4387;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetRoomPreviewerStuffDataEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.room.object.data.StringArrayStuffData;
    import com.sulake.habbo.room.IStuffData;

    public class UserBadgeSelectorCatalogWidget extends CatalogWidget
    {
        private static const BADGEGRIDITEM:String = "badgeGridItem";

        private var _itemGrid:IItemGridWindow;
        private var _gridItemLayout:XML;
        private var _catalog:HabboCatalog;
        private var _selectedBadgeIndex:int = -1;
        private var _badgesUpdatedMessageListener:IMessageEvent;
        private var _excludedBadges:Array;

        public function UserBadgeSelectorCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._catalog = _arg_2;
            this._excludedBadges = this._catalog.getProperty("badge.display.excluded.badgeCodes").split(",");
        }

        override public function dispose():void
        {
            if (this._badgesUpdatedMessageListener)
            {
                this._catalog.connection.removeMessageEvent(this._badgesUpdatedMessageListener);
            }
            this._catalog = null;
            this._excludedBadges = null;
            super.dispose();
        }

        override public function init():Boolean
        {
            this._itemGrid = (_window.findChildByName("badgeGrid") as IItemGridWindow);
            var k:XmlAsset = (page.viewer.catalog.assets.getAssetByName("badgeGridItem") as XmlAsset);
            this._gridItemLayout = (k.content as XML);
            this._Str_20622();
            events.addEventListener(CatalogWidgetEvent.WIDGETS_INITIALIZED, this.onWidgetsInitialized);
            this._badgesUpdatedMessageListener = new BadgesEvent(this._Str_22798);
            this._catalog.connection.addMessageEvent(this._badgesUpdatedMessageListener);
            return true;
        }

        private function _Str_20622():void
        {
            var _local_2:String;
            this._itemGrid.destroyGridItems();
            var k:int;
            for each (_local_2 in this._catalog.inventory.getAllMyBadgeIds(this._excludedBadges))
            {
                this._itemGrid.addGridItem(this._Str_7360(_local_2, k++));
            }
        }

        private function onWidgetsInitialized(k:_Str_3308):void
        {
            if (page.offers.length == 0)
            {
                return;
            }
            var _local_2:IPurchasableOffer = page.offers[0];
            events.dispatchEvent(new _Str_3308(CatalogWidgetEvent.EXTRA_PARAM_REQUIRED_FOR_BUY));
            events.dispatchEvent(new SelectProductEvent(_local_2));
        }

        protected function _Str_7360(k:String, _arg_2:int):IWindowContainer
        {
            var _local_3:IWindowContainer = (page.viewer.catalog.windowManager.buildFromXML(this._gridItemLayout) as IWindowContainer);
            var _local_4:IBadgeImageWidget = IBadgeImageWidget(IWidgetWindow(_local_3.findChildByName("badgeWidget")).widget);
            _local_4.type = _Str_4387.NORMAL;
            _local_4.badgeId = k;
            _local_3.id = _arg_2;
            _local_3.name = BADGEGRIDITEM;
            _local_3.procedure = this._Str_24708;
            return _local_3;
        }

        private function _Str_21961(k:int, _arg_2:Boolean):void
        {
            var _local_3:IWindowContainer = IWindowContainer(this._itemGrid.getGridItemAt(k));
            if (_local_3 != null)
            {
                IBorderWindow(_local_3.findChildByName("bg")).style = ((_arg_2) ? 0 : 2);
            }
        }

        private function _Str_22817(k:int):String
        {
            var _local_2:IWindowContainer = IWindowContainer(this._itemGrid.getGridItemAt(k));
            var _local_3:IBadgeImageWidget = IBadgeImageWidget(IWidgetWindow(_local_2.findChildByName("badgeWidget")).widget);
            return _local_3.badgeId;
        }

        private function _Str_24708(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (_arg_2.name == BADGEGRIDITEM)
            {
                if (this._selectedBadgeIndex != -1)
                {
                    this._Str_21961(this._selectedBadgeIndex, false);
                }
                this._selectedBadgeIndex = _arg_2.id;
                if (this._selectedBadgeIndex < this._catalog.inventory.getAllMyBadgeIds(this._excludedBadges).length)
                {
                    this._Str_21961(this._selectedBadgeIndex, true);
                    events.dispatchEvent(new SetExtraPurchaseParameterEvent(this._Str_22817(this._selectedBadgeIndex)));
                    page.dispatchWidgetEvent(new SetRoomPreviewerStuffDataEvent(this._Str_17425()));
                }
            }
        }

        private function _Str_17425():IStuffData
        {
            var k:Array = new Array();
            k.push("0");
            k.push(this._catalog.inventory.getAllMyBadgeIds(this._excludedBadges)[this._selectedBadgeIndex]);
            k.push("");
            k.push("");
            var _local_2:StringArrayStuffData = new StringArrayStuffData();
            _local_2._Str_13438(k);
            return _local_2;
        }

        private function _Str_22798(k:IMessageEvent):void
        {
            this._Str_20622();
        }
    }
}
