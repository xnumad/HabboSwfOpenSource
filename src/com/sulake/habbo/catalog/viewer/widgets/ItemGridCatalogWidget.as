package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.viewer._Str_4311;
    import com.sulake.habbo.catalog.viewer._Str_4431;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.catalog.viewer.IGridItem;
    import flash.utils.Timer;
    import com.sulake.habbo.session.ISessionDataManager;
    import flash.utils.Dictionary;
    import com.sulake.core.window.IWindowContainer;
    import flash.events.TimerEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.enum.CatalogType;
    import com.sulake.habbo.catalog.viewer.ProductContainer;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetInitPurchaseEvent;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.viewer.Offer;
    import com.sulake.habbo.catalog.viewer.BundleProductContainer;
    import com.sulake.habbo.catalog.viewer.IProductContainer;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.room.object.data.StringArrayStuffData;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetGuildSelectedEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
    import __AS3__.vec.*;

    public class ItemGridCatalogWidget extends CatalogWidget implements _Str_4311, _Str_4431 
    {
        protected var _Str_2448:IItemGridWindow;
        protected var _Str_3370:XML;
        protected var _Str_16251:XML;
        protected var _Str_18737:XML;
        protected var _Str_2537:IGridItem;
        private var _Str_18734:int = 0;
        protected var _Str_2364:Timer;
        protected var _Str_23853:Boolean = true;
        private var _Str_8035:int = 0;
        protected var _Str_2720:ISessionDataManager;
        private var _Str_18623:int = -1;
        private var _selectedGuildColor1:String;
        private var _selectedGuildColor2:String;
        private var _Str_19595:String;
        private var _Str_2796:String;
        public var _Str_8284:Dictionary;
        public var _Str_26046:int = 0;
        private var _Str_26230:int = 0;

        public function ItemGridCatalogWidget(k:IWindowContainer, _arg_2:ISessionDataManager, _arg_3:String)
        {
            this._Str_8284 = new Dictionary();
            super(k);
            this._Str_2720 = _arg_2;
            this._Str_2796 = _arg_3;
        }

        override public function dispose():void
        {
            if (this._Str_2364 != null)
            {
                this._Str_2364.stop();
                this._Str_2364.removeEventListener(TimerEvent.TIMER, this._Str_10532);
                this._Str_2364 = null;
            }
            if (this._Str_2448 != null)
            {
                this._Str_2448.destroyGridItems();
                this._Str_2448 = null;
            }
            this._Str_3370 = null;
            this._Str_16251 = null;
            this._Str_18737 = null;
            this._Str_2537 = null;
            super.dispose();
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            _Str_2819(CatalogWidgetEnum.ITEM_GRID);
            var k:* = (_window.tags.indexOf("FIXED") > -1);
            this._Str_2448 = (_window.findChildByName("itemGrid") as IItemGridWindow);
            if (!k)
            {
                _window.getChildAt(0).width = _window.width;
                _window.getChildAt(0).height = _window.height;
            }
            this._Str_2448._Str_13282 = 0;
            var _local_2:XmlAsset = (page.viewer.catalog.assets.getAssetByName("gridItem") as XmlAsset);
            this._Str_3370 = (_local_2.content as XML);
            _local_2 = (page.viewer.catalog.assets.getAssetByName("grid_item_with_price_single") as XmlAsset);
            this._Str_18737 = (_local_2.content as XML);
            _local_2 = (page.viewer.catalog.assets.getAssetByName("grid_item_with_price_multi") as XmlAsset);
            this._Str_16251 = (_local_2.content as XML);
            this._Str_6159();
            if (this._Str_23853)
            {
                this._Str_2364 = new Timer(25);
                this._Str_2364.addEventListener(TimerEvent.TIMER, this._Str_10532);
                this._Str_2364.start();
            }
            else
            {
                this._Str_10532();
            }
            events.addEventListener(CatalogWidgetEvent.GUILD_SELECTED, this._Str_16625);
            events.addEventListener(CatalogWidgetEvent.COLOUR_INDEX, this._Str_7756);
            return true;
        }

        public function select(k:IGridItem, _arg_2:Boolean):void
        {
            if (this._Str_2537 != null)
            {
                this._Str_2537.deactivate();
            }
            this._Str_2537 = k;
            k.activate();
            if (this._Str_2537.view)
            {
                this._Str_2537.view.findChildByName("border_outline").color = ((this._Str_2796 == CatalogType.NORMAL) ? 6538729 : 16758076);
            }
            var _local_3:ProductContainer = (k as ProductContainer);
            if (!_local_3)
            {
                return;
            }
            if (_local_3.isLazy)
            {
                return;
            }
            var _local_4:IPurchasableOffer = _local_3.offer;
            if (_local_4 != null)
            {
                events.dispatchEvent(new SelectProductEvent(_local_4));
                if (((_local_4.product) && (_local_4.product.productType == ProductTypeEnum.WALL)))
                {
                    events.dispatchEvent(new SetExtraPurchaseParameterEvent(_local_4.product.extraParam));
                }
            }
            if (_arg_2)
            {
                events.dispatchEvent(new CatalogWidgetColoursEvent(this._Str_23323(), "ctlg_clr_27x22_1", "ctlg_clr_27x22_2", "ctlg_clr_27x22_3", this._Str_25049()));
            }
        }

        public function _Str_9974(k:IGridItem):Boolean
        {
            var _local_2:IPurchasableOffer = (k as ProductContainer).offer;
            if (_local_2 != null)
            {
                if (this._Str_2720.clubLevel >= _local_2.clubLevel)
                {
                    (page.viewer.catalog as HabboCatalog)._Str_8289(this, _local_2);
                }
            }
            return true;
        }

        public function _Str_8347(k:Boolean, _arg_2:String):void
        {
            if (disposed)
            {
                return;
            }
            if (k)
            {
                events.dispatchEvent(new CatalogWidgetInitPurchaseEvent(false, _arg_2));
            }
        }

        public function _Str_22911():void
        {
        }

        protected function _Str_6159():void
        {
            var _local_3:String;
            var _local_4:int;
            var _local_5:IPurchasableOffer;
            var _local_6:uint;
            var _local_7:uint;
            var k:Array = [];
            var _local_2:Vector.<IPurchasableOffer> = new Vector.<IPurchasableOffer>();
            if (page.layoutCode == "default_3x3_color_grouping")
            {
                page.offers.sort(this._Str_24008);
                for each (_local_5 in page.offers)
                {
                    if (((!(_local_5.product.furnitureData)) || (!(_local_5.product.isColorable))))
                    {
                        _local_2.push(_local_5);
                    }
                    else
                    {
                        _local_3 = _local_5.product.furnitureData.fullName.split("*")[0];
                        _local_4 = int(_local_5.product.furnitureData.fullName.split("*")[1]);
                        if (!this._Str_8284[_local_3])
                        {
                            this._Str_8284[_local_3] = [];
                        }
                        if (_local_5.product.furnitureData.colours)
                        {
                            for each (_local_6 in _local_5.product.furnitureData.colours)
                            {
                                if (_local_6 != 0xFFFFFF)
                                {
                                    _local_7 = _local_6;
                                }
                            }
                            if (this._Str_8284[_local_3].indexOf(_local_7) == -1)
                            {
                                this._Str_8284[_local_3][_local_4] = _local_7;
                            }
                        }
                        if (k.indexOf(_local_3) == -1)
                        {
                            _local_2.push(_local_5);
                            k.push(_local_3);
                        }
                    }
                }
                page.offers.sort(this._Str_24106);
            }
            else
            {
                _local_2 = page.offers;
            }
            for each (_local_5 in page.offers)
            {
                this._Str_7360(_local_5.gridItem, (!(_local_2.indexOf(_local_5) == -1)));
                _local_5.gridItem.grid = this;
                if (_local_5.pricingModel == Offer.PRICING_MODEL_BUNDLE)
                {
                    this._Str_18734++;
                    if ((_local_5.productContainer is BundleProductContainer))
                    {
                        (_local_5.productContainer as BundleProductContainer)._Str_21877(this._Str_18734);
                    }
                }
            }
        }

        private function _Str_24008(k:IPurchasableOffer, _arg_2:IPurchasableOffer):int
        {
            if (((!(k.product.furnitureData.colourIndex)) || (!(_arg_2.product.furnitureData.colourIndex))))
            {
                return 1;
            }
            if (k.product.furnitureData.colourIndex > _arg_2.product.furnitureData.colourIndex)
            {
                return 1;
            }
            if (k == _arg_2)
            {
                return 0;
            }
            return -1;
        }

        private function _Str_24106(k:IPurchasableOffer, _arg_2:IPurchasableOffer):int
        {
            if (k.product.furnitureData.className > _arg_2.product.furnitureData.className)
            {
                return 1;
            }
            if (k == _arg_2)
            {
                return 0;
            }
            return -1;
        }

        protected function _Str_16173():void
        {
            if (this._Str_2364 != null)
            {
                this._Str_2364.reset();
            }
            this._Str_8035 = 0;
        }

        protected function _Str_10532(k:TimerEvent=null):void
        {
            var _local_3:int;
            var _local_4:IPurchasableOffer;
            if (disposed)
            {
                return;
            }
            if (k != null)
            {
            }
            var _local_2:int = page.offers.length;
            if (_local_2 > 0)
            {
                _local_3 = 0;
                while (_local_3 < 3)
                {
                    if (((this._Str_8035 >= 0) && (this._Str_8035 < _local_2)))
                    {
                        _local_4 = page.offers[this._Str_8035];
                        this._Str_19318(_local_4);
                        _local_4.productContainer.grid = this;
                    }
                    this._Str_8035++;
                    if (this._Str_8035 >= _local_2)
                    {
                        this._Str_16173();
                        return;
                    }
                    _local_3++;
                }
            }
        }

        protected function _Str_7360(k:IGridItem, _arg_2:Boolean=true):void
        {
            var _local_3:XML;
            var _local_4:IProductContainer = (k as IProductContainer);
            var _local_5:Boolean = (((!(_local_4 == null)) && (!(_local_4.offer == null))) && ((_local_4.offer.priceInCredits > 0) || (_local_4.offer.priceInActivityPoints > 0)));
            if (((_local_5) && (!(this._Str_2796 == CatalogType.BUILDER))))
            {
                if ((((_local_4.offer) && (_local_4.offer.priceInCredits > 0)) && (_local_4.offer.priceInActivityPoints > 0)))
                {
                    _local_3 = this._Str_16251;
                }
                else
                {
                    _local_3 = this._Str_18737;
                }
            }
            else
            {
                _local_3 = this._Str_3370;
            }
            var _local_6:IWindowContainer = (page.viewer.catalog.windowManager.buildFromXML(_local_3) as IWindowContainer);
            if (_arg_2)
            {
                this._Str_2448._Str_2816(_local_6);
            }
            k.view = _local_6;
            if ((_local_4 is ProductContainer))
            {
                (_local_4 as ProductContainer)._Str_18628((page.viewer.catalog as HabboCatalog));
            }
        }

        protected function _Str_19318(k:IPurchasableOffer):void
        {
            var _local_2:IStuffData;
            var _local_3:Array;
            var _local_4:StringArrayStuffData;
            if (((!(k == null)) && (!(k.disposed))))
            {
                _local_2 = null;
                if (this._Str_18623 != CatalogWidgetGuildSelectedEvent._Str_15457)
                {
                    _local_3 = new Array();
                    _local_3.push("0");
                    _local_3.push(this._Str_18623.toString());
                    _local_3.push(this._Str_19595);
                    _local_3.push(this._selectedGuildColor1);
                    _local_3.push(this._selectedGuildColor2);
                    _local_4 = new StringArrayStuffData();
                    _local_4._Str_13438(_local_3);
                    _local_2 = _local_4;
                }
                k.productContainer.initProductIcon(page.viewer.roomEngine, _local_2);
            }
        }

        private function _Str_16625(k:CatalogWidgetGuildSelectedEvent):void
        {
            var _local_2:IPurchasableOffer;
            if (disposed)
            {
                return;
            }
            this._Str_18623 = k._Str_3916;
            this._selectedGuildColor1 = k.color1;
            this._selectedGuildColor2 = k.color2;
            this._Str_19595 = k.badgeCode;
            this._Str_2448.destroyGridItems();
            for each (_local_2 in page.offers)
            {
                this._Str_7360(_local_2.gridItem);
                this._Str_19318(_local_2);
                _local_2.productContainer.grid = this;
            }
        }

        private function _Str_25239(k:IPurchasableOffer):void
        {
            if (this._Str_2448._Str_3373(k.gridItem.view) >= 0)
            {
                this._Str_2448._Str_4725(k.gridItem.view);
            }
        }

        private function _Str_7756(k:CatalogWidgetColourIndexEvent):void
        {
            var _local_2:IPurchasableOffer;
            var _local_3:IPurchasableOffer;
            var _local_4:int;
            for each (_local_3 in page.offers)
            {
                if (_local_3.gridItem == this._Str_2537)
                {
                    _local_2 = _local_3;
                }
            }
            if (((!(_local_2)) || (!(_local_2.product.isColorable))))
            {
                return;
            }
            _local_4 = this._Str_2448._Str_3373(_local_2.gridItem.view);
            this._Str_25239(_local_2);
            var _local_5:String = ((_local_2.product.furnitureData.fullName.split("*")[0] + "*") + (k.index + 1));
            for each (_local_3 in page.offers)
            {
                if (_local_3.product.furnitureData.fullName == _local_5)
                {
                    this._Str_2448._Str_12115(_local_3.gridItem.view, _local_4);
                    this.select(_local_3.gridItem, false);
                    _local_3.gridItem.grid = this;
                }
            }
        }

        public function _Str_23323():Array
        {
            var k:IPurchasableOffer;
            var _local_2:IPurchasableOffer;
            for each (_local_2 in page.offers)
            {
                if (_local_2.gridItem == this._Str_2537)
                {
                    k = _local_2;
                }
            }
            if (((!(k)) || (!(k.product.isColorable))))
            {
                return [];
            }
            return this._Str_8284[k.product.furnitureData.fullName.split("*")[0]];
        }

        private function _Str_25049():int
        {
            var k:IPurchasableOffer;
            var _local_2:IPurchasableOffer;
            for each (_local_2 in page.offers)
            {
                if (_local_2.gridItem == this._Str_2537)
                {
                    k = _local_2;
                }
            }
            if (((!(k)) || (!(k.product.isColorable))))
            {
                return 0;
            }
            return Math.max((k.product.furnitureData.colourIndex - 1), 0);
        }
    }
}
