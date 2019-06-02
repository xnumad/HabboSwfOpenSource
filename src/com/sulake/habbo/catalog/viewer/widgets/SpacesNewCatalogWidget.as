package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.catalog.viewer._Str_4311;
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.session.ISessionDataManager;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events._Str_3308;
    import com.sulake.habbo.catalog.viewer.ProductContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
    import com.sulake.habbo.catalog.viewer.IGridItem;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetUpdateRoomPreviewEvent;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.habbo.catalog.viewer.Offer;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import __AS3__.vec.*;

    public class SpacesNewCatalogWidget extends ItemGridCatalogWidget implements IDisposable, _Str_4311 
    {
        private var _groupNames:Array;
        private var _groups:Array;
        private var _selectedGroup:int = 0;
        private var _groupIndex:Array;
        private var _tabs:ISelectorWindow;
        private var _categories:Array;

        public function SpacesNewCatalogWidget(k:IWindowContainer, _arg_2:ISessionDataManager, _arg_3:String)
        {
            this._groupNames = ["wallpaper", "floor", "landscape"];
            this._groups = new Array();
            this._groupIndex = [0, 0, 0];
            this._categories = ["group.walls", "group.floors", "group.views"];
            super(k, _arg_2, _arg_3);
        }

        override public function dispose():void
        {
            var k:Vector.<IPurchasableOffer>;
            var _local_2:IPurchasableOffer;
            super.dispose();
            for each (k in this._groups)
            {
                for each (_local_2 in k)
                {
                    _local_2.dispose();
                }
            }
            this._groups = null;
        }

        override public function init():Boolean
        {
            var k:int;
            var _local_2:IWindow;
            Logger.log("Init Item Group Catalog Widget (Spaces New)");
            this._Str_24932();
            if (!super.init())
            {
                return false;
            }
            events.addEventListener(CatalogWidgetEvent.WIDGETS_INITIALIZED, this._Str_3393);
            this._tabs = (_window.findChildByName("groups") as ISelectorWindow);
            if (this._tabs)
            {
                k = 0;
                while (k < this._tabs.numSelectables)
                {
                    _local_2 = this._tabs.getSelectableAt(k);
                    if ((_local_2 is ISelectableWindow))
                    {
                        _local_2.addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_18701);
                    }
                    k++;
                }
            }
            this.switchCategory(this._categories[this._selectedGroup]);
            this._Str_21108();
            return true;
        }

        public function _Str_3393(k:_Str_3308):void
        {
            var _local_2:int = this._groupIndex[this._selectedGroup];
            var _local_3:IPurchasableOffer = this._groups[this._selectedGroup][_local_2];
            this.select(_local_3.gridItem, false);
        }

        public function _Str_25508(k:int):void
        {
            var _local_2:IPurchasableOffer;
            if (((k > -1) && (k < _Str_2448.numGridItems)))
            {
                _local_2 = this._groups[this._selectedGroup][k];
                this.select(_local_2.gridItem, false);
            }
        }

        override public function select(k:IGridItem, _arg_2:Boolean):void
        {
            if (k == null)
            {
                return;
            }
            super.select(k, false);
            var _local_3:IPurchasableOffer = (k as ProductContainer).offer;
            if (_local_3 == null)
            {
                return;
            }
            events.dispatchEvent(new SetExtraPurchaseParameterEvent(_local_3.product.extraParam));
            this._groupIndex[this._selectedGroup] = (this._groups[this._selectedGroup] as Vector.<IPurchasableOffer>).indexOf(_local_3);
            this._Str_21108();
        }

        private function _Str_21108():void
        {
            var k:int = this._groupIndex[0];
            var _local_2:int = this._groupIndex[1];
            var _local_3:int = this._groupIndex[2];
            var _local_4:IPurchasableOffer = ((this._groups[0].length > k) ? this._groups[0][k] : null);
            var _local_5:IPurchasableOffer = ((this._groups[1].length > _local_2) ? this._groups[1][_local_2] : null);
            var _local_6:IPurchasableOffer = ((this._groups[2].length > _local_3) ? this._groups[2][_local_3] : null);
            if ((((!(_local_5)) || (!(_local_4))) || (!(_local_6))))
            {
                return;
            }
            events.dispatchEvent(new CatalogWidgetUpdateRoomPreviewEvent(_local_5.product.extraParam, _local_4.product.extraParam, _local_6.product.extraParam, 64));
        }

        private function _Str_24932():Boolean
        {
            var k:IPurchasableOffer;
            var _local_2:IProduct;
            var _local_3:int;
            var _local_4:String;
            var _local_5:int;
            for each (k in page.offers)
            {
                if (((k.pricingModel == Offer.PRICING_MODEL_SINGLE) || (k.pricingModel == Offer.PRICING_MODEL_MULTI)))
                {
                    _local_2 = k.product;
                    if (_local_2 != null)
                    {
                        _local_3 = _local_2.productClassId;
                        if (((_local_2.productType == ProductTypeEnum.WALL) || (_local_2.productType == ProductTypeEnum.FLOOR)))
                        {
                            if (_local_2.furnitureData != null)
                            {
                                _local_4 = _local_2.furnitureData.className;
                                _local_5 = this._groupNames.indexOf(_local_4);
                                if (this._groupNames.indexOf(_local_4) == -1)
                                {
                                    this._groupNames.push(_local_4);
                                }
                                while (this._groups.length < this._groupNames.length)
                                {
                                    this._groups.push(new Vector.<IPurchasableOffer>(0));
                                }
                                switch (_local_4)
                                {
                                    case "floor":
                                        (this._groups[_local_5] as Vector.<IPurchasableOffer>).push(k);
                                        break;
                                    case "wallpaper":
                                        (this._groups[_local_5] as Vector.<IPurchasableOffer>).push(k);
                                        break;
                                    case "landscape":
                                        (this._groups[_local_5] as Vector.<IPurchasableOffer>).push(k);
                                        break;
                                    default:
                                        Logger.log(("[SpacesCatalogWidget] : " + _local_4));
                                }
                            }
                        }
                    }
                }
            }
            page.replaceOffers(new Vector.<IPurchasableOffer>(0), false);
            return true;
        }

        private function _Str_18701(k:WindowEvent):void
        {
            var _local_3:int;
            var _local_2:ISelectableWindow = (k.target as ISelectableWindow);
            if (_local_2)
            {
                _local_3 = this._tabs.getSelectableIndex(_local_2);
                Logger.log(("select: " + [_local_2.name, _local_3]));
                this.switchCategory(_local_2.name);
            }
        }

        private function switchCategory(k:String):void
        {
            var _local_3:Vector.<IPurchasableOffer>;
            var _local_4:int;
            if (disposed)
            {
                return;
            }
            if (!this._tabs)
            {
                return;
            }
            this._tabs.setSelected(this._tabs.getSelectableByName(k));
            var _local_2:int = -1;
            switch (k)
            {
                case "group.walls":
                    _local_2 = 0;
                    break;
                case "group.floors":
                    _local_2 = 1;
                    break;
                case "group.views":
                    _local_2 = 2;
                    break;
                default:
                    _local_2 = -1;
            }
            if (_local_2 > -1)
            {
                if (_Str_2537 != null)
                {
                    _Str_2537.deactivate();
                }
                _Str_2537 = null;
                this._selectedGroup = _local_2;
                if (_Str_2448)
                {
                    _Str_2448.destroyGridItems();
                }
                _local_3 = ((this._groups[this._selectedGroup] == null) ? new Vector.<IPurchasableOffer>(0) : this._groups[this._selectedGroup]);
                page.replaceOffers(_local_3, false);
                _Str_16173();
                _Str_6159();
                _Str_10532();
                if (_Str_2364)
                {
                    _Str_2364.start();
                }
                _local_4 = this._groupIndex[this._selectedGroup];
                this._Str_25508(_local_4);
            }
        }
    }
}
