package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.core.window.components.IContainerButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.catalog.viewer.Offer;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events._Str_3308;
    import flash.display.BitmapData;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.catalog.viewer.ProductImageConfiguration;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.TextInputEvent;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;

    public class TrophyCatalogWidget extends CatalogWidget implements IGetImageListener 
    {
        private static const gold:int = 0xFFCC00;
        private static const silver:int = 0xCCCCCC;
        private static const _Str_16105:int = 0xCC6600;

        private var _previewImage:IBitmapWrapperWindow;
        private var _trophyOffers:Map;
        private var _selectIndex:int = 0;
        private var _selectType:String = "g";
        private var _catalog:HabboCatalog;
        private var _priceWidget:IWindow;

        public function TrophyCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._catalog = _arg_2;
        }

        override public function dispose():void
        {
            if (this._trophyOffers != null)
            {
                this._trophyOffers.dispose();
            }
            this._trophyOffers = null;
            this._catalog = null;
            this._priceWidget = null;
            super.dispose();
        }

        override public function init():Boolean
        {
            var _local_4:String;
            var _local_5:String;
            var _local_6:Map;
            var _local_7:IWindowContainer;
            if (!super.init())
            {
                return false;
            }
            this._previewImage = (window.findChildByName("ctlg_teaserimg_1") as IBitmapWrapperWindow);
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_3115);
            events.addEventListener(CatalogWidgetEvent.COLOUR_INDEX, this._Str_7756);
            events.addEventListener(CatalogWidgetEvent.TEXT_INPUT, this._Str_25854);
            var k:IContainerButtonWindow = (window.findChildByName("ctlg_nextmodel_button") as IContainerButtonWindow);
            var _local_2:IContainerButtonWindow = (window.findChildByName("ctlg_prevmodel_button") as IContainerButtonWindow);
            if (k != null)
            {
                k.addEventListener(WindowMouseEvent.CLICK, this._Str_23372);
            }
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_25780);
            }
            this._trophyOffers = new Map();
            var _local_3:Offer;
            for each (_local_3 in page.offers)
            {
                _local_4 = this._Str_23368(_local_3.localizationId);
                _local_5 = this._Str_19039(_local_3.localizationId);
                if (this._trophyOffers.getValue(_local_4) == null)
                {
                    this._trophyOffers.add(_local_4, new Map());
                }
                _local_6 = (this._trophyOffers.getValue(_local_4) as Map);
                _local_6.add(_local_5, _local_3);
            }
            if (page.offers.length == 1)
            {
                k.visible = (_local_2.visible = false);
                if (page.offers[0].product.isColorable == false)
                {
                    if (IWindowContainer(window.parent))
                    {
                        _local_7 = (IWindowContainer(window.parent).findChildByName("colourGridWidget") as IWindowContainer);
                        if (_local_7)
                        {
                            _local_7.visible = false;
                        }
                    }
                }
            }
            events.addEventListener(CatalogWidgetEvent.WIDGETS_INITIALIZED, this._Str_3393);
            return true;
        }

        private function _Str_3393(k:_Str_3308):void
        {
            var _local_4:Offer;
            var _local_2:Array = new Array();
            _local_2.push(gold);
            _local_2.push(silver);
            _local_2.push(_Str_16105);
            var _local_3:Map = this._trophyOffers.getWithIndex(this._selectIndex);
            if (_local_3 != null)
            {
                _local_4 = _local_3.getValue(this._selectType);
                if (_local_4 == null)
                {
                    _local_4 = _local_3.getWithIndex(0);
                }
                if (_local_4 != null)
                {
                    events.dispatchEvent(new SelectProductEvent(_local_4));
                }
            }
            events.dispatchEvent(new CatalogWidgetColoursEvent(_local_2, "ctlg_clr_40x32_1", "ctlg_clr_40x32_2", "ctlg_clr_40x32_3"));
        }

        private function _Str_3115(k:SelectProductEvent):void
        {
            var _local_4:BitmapData;
            var _local_5:IProduct;
            var _local_6:ImageResult;
            if (k == null)
            {
                return;
            }
            var _local_2:IPurchasableOffer = k.offer;
            var _local_3:IProductData = page.viewer.catalog.getProductData(_local_2.localizationId);
            if (ProductImageConfiguration._Str_17970(_local_2.localizationId))
            {
                this._Str_6504(ProductImageConfiguration._Str_2643[_local_2.localizationId]);
            }
            else
            {
                _local_5 = _local_2.product;
                _local_6 = page.viewer.roomEngine.getFurnitureImage(_local_5.productClassId, new Vector3d(2, 0, 0), 64, this, 0, _local_5.extraParam);
                _local_2.previewCallbackId = _local_6.id;
                if (_local_6 != null)
                {
                    _local_4 = _local_6.data;
                }
                this._Str_3234(_local_4, true);
            }
            this._priceWidget = this._catalog.utils._Str_7075(_local_2, _window, this._priceWidget, this._previewImage, 0, false, 0);
        }

        private function _Str_7756(k:CatalogWidgetColourIndexEvent):void
        {
            var _local_3:Offer;
            if (k.index == 0)
            {
                this._selectType = "g";
            }
            if (k.index == 1)
            {
                this._selectType = "s";
            }
            if (k.index == 2)
            {
                this._selectType = "b";
            }
            var _local_2:Map = this._trophyOffers.getWithIndex(this._selectIndex);
            if (_local_2 != null)
            {
                _local_3 = _local_2.getValue(this._selectType);
                if (_local_3 == null)
                {
                    _local_3 = _local_2.getWithIndex(0);
                }
                if (_local_3 != null)
                {
                    events.dispatchEvent(new SelectProductEvent(_local_3));
                }
            }
            this._priceWidget = this._catalog.utils._Str_7075(_local_3, _window, this._priceWidget, this._previewImage, 0, false, 0);
        }

        public function _Str_25854(k:TextInputEvent):void
        {
            events.dispatchEvent(new SetExtraPurchaseParameterEvent(k.text));
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            var _local_3:Offer;
            if ((((disposed) || (page == null)) || (page.offers == null)))
            {
                return;
            }
            for each (_local_3 in page.offers)
            {
                if (_local_3.previewCallbackId == k)
                {
                    _local_3.previewCallbackId = 0;
                    this._Str_3234(_arg_2, true);
                    break;
                }
            }
        }

        public function imageFailed(k:int):void
        {
        }

        private function _Str_23368(k:String):String
        {
            var _local_2:String = this._Str_19039(k);
            if (_local_2.length > 0)
            {
                return k.slice(0, ((k.length - 1) - _local_2.length));
            }
            return k;
        }

        private function _Str_19039(k:String):String
        {
            var _local_2:int = k.indexOf("prizetrophy_2011_");
            if (_local_2 != -1)
            {
                return "";
            }
            var _local_3:int = (k.lastIndexOf("_") + 1);
            if (_local_3 <= 0)
            {
                return "";
            }
            var _local_4:String = k.substr(_local_3);
            if (((_local_4.length > 1) || (((!(_local_4 == "g")) && (!(_local_4 == "s"))) && (!(_local_4 == "b")))))
            {
                return "";
            }
            return _local_4;
        }

        private function _Str_23372(k:WindowMouseEvent):void
        {
            var _local_3:Offer;
            this._selectIndex++;
            if (this._selectIndex >= this._trophyOffers.length)
            {
                this._selectIndex = 0;
            }
            var _local_2:Map = this._trophyOffers.getWithIndex(this._selectIndex);
            if (_local_2 != null)
            {
                _local_3 = _local_2.getValue(this._selectType);
                if (_local_3 == null)
                {
                    _local_3 = _local_2.getWithIndex(0);
                }
                if (_local_3 != null)
                {
                    events.dispatchEvent(new SelectProductEvent(_local_3));
                }
            }
        }

        private function _Str_25780(k:WindowMouseEvent):void
        {
            var _local_3:Offer;
            this._selectIndex--;
            if (this._selectIndex < 0)
            {
                this._selectIndex = (this._trophyOffers.length - 1);
            }
            var _local_2:Map = this._trophyOffers.getWithIndex(this._selectIndex);
            if (_local_2 != null)
            {
                _local_3 = _local_2.getValue(this._selectType);
                if (_local_3 == null)
                {
                    _local_3 = _local_2.getWithIndex(0);
                }
                if (_local_3 != null)
                {
                    events.dispatchEvent(new SelectProductEvent(_local_3));
                }
            }
        }

        private function _Str_3234(k:BitmapData, _arg_2:Boolean):void
        {
            var _local_3:Point;
            if (((!(window.disposed)) && (!(this._previewImage == null))))
            {
                if (k == null)
                {
                    k = new BitmapData(1, 1);
                    _arg_2 = true;
                }
                if (this._previewImage.bitmap == null)
                {
                    this._previewImage.bitmap = new BitmapData(this._previewImage.width, this._previewImage.height, true, 0xFFFFFF);
                }
                this._previewImage.bitmap.fillRect(this._previewImage.bitmap.rect, 0xFFFFFF);
                _local_3 = new Point(((this._previewImage.width - k.width) / 2), ((this._previewImage.height - k.height) / 2));
                this._previewImage.bitmap.copyPixels(k, k.rect, _local_3, null, null, true);
                this._previewImage.invalidate();
            }
            if (((_arg_2) && (!(k == null))))
            {
                k.dispose();
            }
        }

        private function _Str_6504(k:String):void
        {
            var _local_2:BitmapDataAsset = (page.viewer.catalog.assets.getAssetByName(k) as BitmapDataAsset);
            if (_local_2 == null)
            {
                this._Str_7078(k);
                return;
            }
            this._Str_3234((_local_2.content as BitmapData), false);
        }

        private function _Str_7078(k:String):void
        {
            var _local_2:* = ((page.viewer.catalog.imageGalleryHost + k) + ".gif");
            Logger.log(("[TrophyCatalogWidget] Retrieve Product Preview Asset: " + _local_2));
            var _local_3:URLRequest = new URLRequest(_local_2);
            var _local_4:AssetLoaderStruct = page.viewer.catalog.assets.loadAssetFromFile(k, _local_3, "image/gif");
            _local_4.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_6676);
        }

        private function _Str_6676(k:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            if (_local_2 != null)
            {
                this._Str_6504(_local_2.assetName);
            }
        }
    }
}
