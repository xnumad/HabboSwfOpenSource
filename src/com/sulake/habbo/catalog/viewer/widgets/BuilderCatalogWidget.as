package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.habbo.communication.messages.incoming._Str_89._Str_5266;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.enum.CatalogType;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetRoomChangedEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.catalog.enum.BuilderFurniPlaceableStatus;
    import com.sulake.core.window.components.IButtonWindow;

    public class BuilderCatalogWidget extends CatalogWidget implements IDisposable 
    {
        private var _catalog:HabboCatalog;
        private var _offer:IPurchasableOffer;
        private var _youAreOwnerMessageEvent:_Str_5266;

        public function BuilderCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._catalog = _arg_2;
            this._youAreOwnerMessageEvent = new _Str_5266(this.onYouAreOwner);
            this._catalog.connection.addMessageEvent(this._youAreOwnerMessageEvent);
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            if (((!(this._catalog == null)) && (!(this._catalog.connection == null))))
            {
                this._catalog.connection.removeMessageEvent(this._youAreOwnerMessageEvent);
                this._youAreOwnerMessageEvent = null;
                this._catalog = null;
            }
            events.removeEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_3115);
            super.dispose();
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            if (this._catalog.catalogType != CatalogType.BUILDER)
            {
                _window.visible = false;
                return true;
            }
            _Str_2819(CatalogWidgetEnum.BUILDER);
            this._Str_2771(false);
            _window.procedure = this._Str_2533;
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_3115);
            events.addEventListener(CatalogWidgetEvent.ROOM_CHANGED, this._Str_24491);
            return true;
        }

        private function _Str_24491(k:CatalogWidgetRoomChangedEvent):void
        {
            this._Str_2771(false);
        }

        private function onYouAreOwner(k:_Str_5266):void
        {
            if (this._catalog.catalogType != CatalogType.BUILDER)
            {
                return;
            }
            this._Str_2771(true);
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "place_one":
                    this._catalog._Str_8289(null, this._offer);
                    return;
                case "place_many":
                    this._catalog._Str_8289(null, this._offer, true);
                    return;
            }
        }

        private function _Str_3115(k:SelectProductEvent):void
        {
            this._offer = k.offer;
            this._Str_2771(false);
        }

        private function _Str_2771(k:Boolean):void
        {
            var _local_3:IStaticBitmapWrapperWindow;
            var _local_4:IWindow;
            if (((!(_window)) || (!(_window.visible))))
            {
                return;
            }
            var _local_2:int = this._catalog._Str_19136(this._offer);
            if (((_local_2 == BuilderFurniPlaceableStatus._Str_10467) && (k)))
            {
                _local_2 = BuilderFurniPlaceableStatus._Str_8891;
            }
            if (_local_2 == BuilderFurniPlaceableStatus._Str_8891)
            {
                IButtonWindow(_window.findChildByName("place_one")).enable();
                IButtonWindow(_window.findChildByName("place_many")).enable();
                _window.findChildByName("error_container").visible = false;
            }
            else
            {
                IButtonWindow(_window.findChildByName("place_one")).disable();
                IButtonWindow(_window.findChildByName("place_many")).disable();
                _window.findChildByName("error_container").visible = true;
                _local_3 = (_window.findChildByName("error_icon") as IStaticBitmapWrapperWindow);
                _local_4 = _window.findChildByName("error_message");
                switch (_local_2)
                {
                    case BuilderFurniPlaceableStatus._Str_12543:
                        _window.findChildByName("error_container").visible = false;
                        return;
                    case BuilderFurniPlaceableStatus._Str_14564:
                        _local_3.assetUri = "icons_builder_error_furnilimit";
                        _local_4.caption = "${builder.placement_widget.error.limit_reached}";
                        return;
                    case BuilderFurniPlaceableStatus._Str_13563:
                        _local_3.assetUri = "icons_builder_error_notroom";
                        _local_4.caption = "${builder.placement_widget.error.not_in_room}";
                        return;
                    case BuilderFurniPlaceableStatus._Str_10467:
                        _local_3.assetUri = "icons_builder_error_room";
                        _local_4.caption = "${builder.placement_widget.error.not_room_owner}";
                        return;
                    case BuilderFurniPlaceableStatus._Str_14160:
                        _local_3.assetUri = "icons_builder_error_grouproom";
                        _local_4.caption = "${builder.placement_widget.error.group_room}";
                        return;
                    case BuilderFurniPlaceableStatus._Str_14774:
                        _local_3.assetUri = "icons_builder_error_userinroom";
                        _local_4.caption = "${builder.placement_widget.error.visitors}";
                        return;
                }
            }
        }
    }
}
