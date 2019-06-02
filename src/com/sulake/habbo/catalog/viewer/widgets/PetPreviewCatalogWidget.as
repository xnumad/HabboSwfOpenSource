package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import flash.display.BitmapData;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.room.PetColorResult;
    import com.sulake.habbo.avatar.pets.PetCustomPart;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.avatar.pets.PetTypeEnum;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.habbo.catalog.viewer.Offer;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;

    public class PetPreviewCatalogWidget extends CatalogWidget implements IGetImageListener 
    {
        private var _Str_25057:int = 15;
        private var _Str_25627:int = 1;
        private var COLOR:int = 0xFFFFFF;
        private var _Str_14581:int = 2;
        private var _Str_24699:int = -1;
        private var _Str_3160:IWindow;
        private var _Str_3938:IWindow;
        private var _Str_2466:IBitmapWrapperWindow;
        private var _Str_7406:Point;
        private var _Str_3412:int;
        protected var _Str_3370:XML;
        private var _habboCatalog:HabboCatalog;
        private var _Str_3004:IWindow;

        public function PetPreviewCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._habboCatalog = _arg_2;
        }

        override public function dispose():void
        {
            this._habboCatalog = null;
            this._Str_3004 = null;
            super.dispose();
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            this._Str_3160 = _window.findChildByName("ctlg_product_name");
            this._Str_3160.caption = "";
            this._Str_3938 = _window.findChildByName("ctlg_description");
            this._Str_3938.caption = "";
            this._Str_2466 = (_window.findChildByName("ctlg_teaserimg_1") as IBitmapWrapperWindow);
            this._Str_7406 = new Point(this._Str_2466.x, this._Str_2466.y);
            var k:XmlAsset = (page.viewer.catalog.assets.getAssetByName("gridItem") as XmlAsset);
            this._Str_3370 = (k.content as XML);
            var _local_2:ImageResult = (page.viewer.catalog as HabboCatalog).roomEngine.getPetImage(this._Str_25057, this._Str_14581, this.COLOR, new Vector3d(90), 64, this, true, 0);
            if (_local_2 != null)
            {
                this._Str_3234(_local_2.data, true, new Point(0, 0));
                this._Str_3412 = _local_2.id;
            }
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_4806);
            return true;
        }

        private function _Str_4806(k:SelectProductEvent):void
        {
            var _local_2:IPurchasableOffer;
            var _local_4:String;
            var _local_5:String;
            var _local_6:BitmapData;
            var _local_8:IRoomEngine;
            var _local_9:IProduct;
            var _local_10:ImageResult;
            var _local_11:IFurnitureData;
            var _local_12:String;
            var _local_13:Array;
            var _local_14:int;
            var _local_15:Array;
            var _local_16:Array;
            var _local_17:Array;
            var _local_18:Array;
            var _local_19:int;
            var _local_20:String;
            var _local_21:Array;
            var _local_22:int;
            var _local_23:PetColorResult;
            var _local_24:int;
            var _local_25:int;
            var _local_26:PetColorResult;
            var _local_27:PetColorResult;
            var _local_28:int;
            var _local_29:int;
            var _local_30:PetCustomPart;
            var _local_31:PetCustomPart;
            if (k == null)
            {
                return;
            }
            _local_2 = k.offer;
            var _local_3:IProductData = page.viewer.catalog.getProductData(_local_2.localizationId);
            if (_local_3 != null)
            {
                _local_4 = (("${" + _local_3.name) + "}");
                _local_5 = (("${" + _local_3.description) + "}");
            }
            else
            {
                _local_4 = (("${" + _local_2.localizationId) + "}");
                _local_5 = (("${" + _local_2.localizationId) + "}");
            }
            this._Str_3160.caption = _local_4;
            this._Str_3938.caption = _local_5;
            this._Str_3938.y = ((this._Str_3160.y + this._Str_3160.height) + 5);
            this._Str_3004 = this._habboCatalog.utils._Str_7075(k.offer, _window, this._Str_3004, this._Str_2466, -6, true, 6);
            var _local_7:Point = new Point(0, 0);
            _local_8 = (page.viewer.catalog as HabboCatalog).roomEngine;
            switch (_local_2.pricingModel)
            {
                case Offer.PRICING_MODEL_SINGLE:
                case Offer.PRICING_MODEL_MULTI:
                    _local_9 = _local_2.product;
                    _local_11 = _local_9.furnitureData;
                    if (((_local_11 == null) || (_local_11.customParams == null)))
                    {
                        Logger.log(("[PetPreviewCatalogWidget] Unsupported product: " + _local_9.productType));
                        break;
                    }
                    _local_12 = _local_11.customParams;
                    _local_13 = _local_12.split(" ");
                    if (_local_13.length < 1)
                    {
                        Logger.log(("[PetPreviewCatalogWidget] Invalid custom params: " + _local_9.productType));
                        break;
                    }
                    _local_14 = int(_local_13[0]);
                    _local_18 = [];
                    switch (_local_11.category)
                    {
                        case FurniCategory._Str_7696:
                            if (_local_13.length < 2)
                            {
                                Logger.log(("[PetPreviewCatalogWidget] Invalid custom params: " + _local_9.productType));
                                break;
                            }
                            _local_20 = _local_13[1];
                            _local_21 = _local_8.getPetColorsByTag(_local_14, _local_20);
                            for each (_local_23 in _local_21)
                            {
                                if (_local_23.breed == this._Str_25627)
                                {
                                    _local_22 = int(_local_23.id);
                                    break;
                                }
                            }
                            switch (_local_14)
                            {
                                case PetTypeEnum.HORSE:
                                    _local_24 = 2;
                                    _local_25 = 3;
                                    _local_26 = _local_8.getPetDefaultPalette(_local_14, "hair");
                                    _local_27 = _local_8.getPetDefaultPalette(_local_14, "tail");
                                    _local_28 = ((_local_26) ? parseInt(_local_26.id) : -1);
                                    _local_29 = ((_local_27) ? parseInt(_local_27.id) : -1);
                                    _local_30 = new PetCustomPart(_local_24, -1, _local_28);
                                    _local_31 = new PetCustomPart(_local_25, -1, _local_29);
                                    _local_18 = [_local_30, _local_31];
                                    break;
                            }
                            _local_10 = _local_8.getPetImage(_local_14, _local_22, this.COLOR, new Vector3d(90), 64, this, true, 0, _local_18);
                            break;
                        case FurniCategory._Str_7297:
                            if (_local_13.length < 4)
                            {
                                Logger.log(("[PetPreviewCatalogWidget] Invalid custom params: " + _local_9.productType));
                                break;
                            }
                            _local_15 = (_local_13[1] as String).split(",");
                            _local_16 = (_local_13[2] as String).split(",");
                            _local_17 = (_local_13[3] as String).split(",");
                            _local_19 = 0;
                            while (_local_19 < _local_15.length)
                            {
                                _local_18.push(new PetCustomPart(int(_local_15[_local_19]), int(_local_16[_local_19]), int(_local_17[_local_19])));
                                _local_19++;
                            }
                            _local_10 = _local_8.getPetImage(_local_14, this._Str_14581, this.COLOR, new Vector3d(90), 64, this, true, 0, _local_18);
                            break;
                        case FurniCategory._Str_7954:
                            if (_local_13.length < 3)
                            {
                                Logger.log(("[PetPreviewCatalogWidget] Invalid custom params: " + _local_9.productType));
                                break;
                            }
                            _local_15 = (_local_13[1] as String).split(",");
                            _local_17 = (_local_13[2] as String).split(",");
                            _local_19 = 0;
                            while (_local_19 < _local_15.length)
                            {
                                _local_18.push(new PetCustomPart(int(_local_15[_local_19]), this._Str_24699, int(_local_17[_local_19])));
                                _local_19++;
                            }
                            _local_10 = _local_8.getPetImage(_local_14, this._Str_14581, this.COLOR, new Vector3d(90), 64, this, true, 0, _local_18);
                            break;
                        case FurniCategory._Str_6096:
                            if (_local_13.length < 4)
                            {
                                Logger.log(("[PetPreviewCatalogWidget] Invalid custom params: " + _local_9.productType));
                            }
                            _local_18.push(new PetCustomPart(int(_local_13[1]), int(_local_13[2]), int(_local_13[3])));
                            _local_10 = _local_8.getPetImage(_local_14, this._Str_14581, this.COLOR, new Vector3d(90), 64, this, true, 0, _local_18);
                            break;
                        default:
                            Logger.log(("[PetPreviewCatalogWidget] Unsupported Product Type: " + _local_9.productType));
                    }
                    if (_local_10 != null)
                    {
                        _local_2.previewCallbackId = _local_10.id;
                        _local_6 = _local_10.data;
                    }
                    break;
                default:
                    Logger.log(("[PetPreviewCatalogWidget] Unknown pricing model" + _local_2.pricingModel));
            }
            this._Str_3234(_local_6, true, _local_7);
            _window.invalidate();
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            var _local_3:Offer;
            if ((((disposed) || (page == null)) || (page.offers == null)))
            {
                return;
            }
            if (this._Str_3412 == k)
            {
                this._Str_3234(_arg_2, true);
                this._Str_3412 = 0;
            }
            else
            {
                for each (_local_3 in page.offers)
                {
                    if (_local_3.previewCallbackId == k)
                    {
                        this._Str_3234(_arg_2, true);
                        _local_3.previewCallbackId = 0;
                        break;
                    }
                }
            }
        }

        public function imageFailed(k:int):void
        {
        }

        private function _Str_3234(k:BitmapData, _arg_2:Boolean, _arg_3:Point=null):void
        {
            var _local_4:Point;
            if (((!(this._Str_2466 == null)) && (!(window.disposed))))
            {
                if (k == null)
                {
                    k = new BitmapData(1, 1);
                    _arg_2 = true;
                }
                if (this._Str_2466.bitmap == null)
                {
                    this._Str_2466.bitmap = new BitmapData(this._Str_2466.width, this._Str_2466.height, true, 0xFFFFFF);
                }
                this._Str_2466.bitmap.fillRect(this._Str_2466.bitmap.rect, 0xFFFFFF);
                _local_4 = new Point(((this._Str_2466.width - k.width) / 2), ((this._Str_2466.height - k.height) / 2));
                this._Str_2466.bitmap.copyPixels(k, k.rect, _local_4, null, null, true);
                this._Str_2466.invalidate();
                this._Str_2466.x = this._Str_7406.x;
                this._Str_2466.y = this._Str_7406.y;
                if (_arg_3 != null)
                {
                    this._Str_2466.x = (this._Str_2466.x + _arg_3.x);
                    this._Str_2466.y = (this._Str_2466.y + _arg_3.y);
                }
            }
            if (_arg_2)
            {
                k.dispose();
            }
        }
    }
}
