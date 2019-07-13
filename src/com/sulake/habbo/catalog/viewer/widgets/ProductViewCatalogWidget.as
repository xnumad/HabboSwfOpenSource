package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.catalog.viewer._Str_4431;
    import flash.display.BitmapData;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IDisplayObjectWrapper;
    import flash.geom.Point;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.habbo.catalog.viewer.Product;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSpinnerEvent;
    import com.sulake.habbo.room.preview.RoomPreviewer;
    import flash.display.DisplayObject;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.habbo.catalog.viewer.BundleProductContainer;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.avatar.animation.IAvatarDataContainer;
    import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
    import com.sulake.habbo.avatar.animation.IAnimationLayerData;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetBundleDisplayExtraInfoEvent;
    import com.sulake.habbo.catalog.viewer.ProductImageConfiguration;
    import com.sulake.habbo.catalog.viewer.Offer;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.enum.AvatarAction;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
    import flash.geom.Matrix;
    import flash.display.BlendMode;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetRoomPreviewerStuffDataEvent;
    import flash.events.Event;
    import __AS3__.vec.*;

    public class ProductViewCatalogWidget extends CatalogWidget implements IGetImageListener, _Str_4431 
    {
        private static const _Str_3639:int = 2;
        private static const _Str_3683:int = 3;
        private static const _Str_3432:int = 4;

        private var _Str_17061:BitmapData;
        private var _Str_3160:IWindow;
        private var _Str_3938:IWindow;
        private var _Str_2466:IBitmapWrapperWindow;
        private var _Str_3864:IWindowContainer;
        private var _Str_3605:IDisplayObjectWrapper;
        private var _Str_7406:Point;
        private var _Str_3889:IItemGridWindow;
        protected var _Str_3370:XML;
        private var _Str_19223:Array;
        private var _Str_17045:IStuffData;
        private var _Str_10575:SelectProductEvent = null;
        private var _habboCatalog:HabboCatalog;
        private var _Str_3004:IWindow;
        private var _Str_17788:Boolean = true;
        private var _Str_21871:Boolean = false;
        private var _Str_18902:Boolean = true;
        private var _Str_2324:IPurchasableOffer;
        private var _Str_14556:Boolean;

        public function ProductViewCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._habboCatalog = _arg_2;
        }

        private static function _Str_21776(k:SelectProductEvent):Boolean
        {
            var _local_3:int;
            var _local_4:IProduct;
            var _local_2:Boolean;
            if (k.offer.productContainer.products.length == 2)
            {
                _local_3 = 0;
                while (_local_3 < 2)
                {
                    _local_4 = k.offer.productContainer.products[_local_3];
                    if (((_local_4.productType == ProductTypeEnum.EFFECT) && (_local_4.productClassId == Product._Str_10915)))
                    {
                        _local_2 = true;
                    }
                    _local_3++;
                }
            }
            return _local_2;
        }


        override public function dispose():void
        {
            if (!disposed)
            {
                events.removeEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_4806);
                events.removeEventListener(CatalogWidgetEvent.SET_PREVIEWER_STUFFDATA, this._Str_19078);
                events.removeEventListener(CatalogWidgetSpinnerEvent.CWSE_VALUE_CHANGED, this._Str_10389);
                events.removeEventListener(CatalogWidgetEvent.TOTAL_PRICE_WIDGET_INITIALIZED, this._Str_21537);
                this._habboCatalog = null;
                this._Str_3004 = null;
                super.dispose();
                this._Str_17061 = null;
                this._Str_3864 = null;
            }
        }

        override public function init():Boolean
        {
            var _local_3:RoomPreviewer;
            var _local_4:DisplayObject;
            if (!super.init())
            {
                return false;
            }
            _Str_2819(CatalogWidgetEnum.PRODUCT_VIEW);
            if (!_embedded)
            {
                _window.getChildAt(0).width = _window.width;
                _window.getChildAt(0).height = _window.height;
            }
            if (_window.tags.indexOf("2X") > -1)
            {
            }
            this._Str_18902 = (_window.tags.indexOf("NO_ROOM_CANVAS") == -1);
            this._Str_3004 = null;
            this._Str_3160 = _window.findChildByName("ctlg_product_name");
            this._Str_3160.caption = "";
            this._Str_3938 = _window.findChildByName("ctlg_description");
            this._Str_3938.caption = "";
            (this._Str_3160 as ITextWindow).textColor = 0;
            (this._Str_3938 as ITextWindow).textColor = 0;
            this._Str_2466 = (_window.findChildByName("ctlg_teaserimg_1") as IBitmapWrapperWindow);
            this._Str_3864 = (_window.findChildByName("room_canvas_container") as IWindowContainer);
            if (this._Str_3864 != null)
            {
                this._Str_3864.visible = false;
                this._Str_3605 = (this._Str_3864.findChildByName("room_canvas") as IDisplayObjectWrapper);
                _local_3 = (page.viewer.catalog as HabboCatalog)._Str_26451;
                if (((!(this._Str_3605 == null)) && (!(_local_3 == null))))
                {
                    this._Str_3864.procedure = this._Str_25549;
                    _local_3.disableUpdate = false;
                    _local_3.reset(false);
                    _local_4 = _local_3.getRoomCanvas(this._Str_3605.width, this._Str_3605.height);
                    if (_local_4 != null)
                    {
                        this._Str_3605.setDisplayObject(_local_4);
                    }
                }
                else
                {
                    this._Str_3864 = null;
                    this._Str_3605 = null;
                }
            }
            this._Str_7406 = new Point(this._Str_2466.x, this._Str_2466.y);
            this._Str_3889 = (_window.findChildByName("bundleGrid") as IItemGridWindow);
            if (this._Str_3889 == null)
            {
                Logger.log("[ProductViewCatalogWidget] Bundle Grid not initialized!");
            }
            var k:XmlAsset = (page.viewer.catalog.assets.getAssetByName("gridItem") as XmlAsset);
            this._Str_3370 = (k.content as XML);
            var _local_2:BitmapDataAsset = (page.viewer.catalog.assets.getAssetByName("ctlg_dyndeal_background") as BitmapDataAsset);
            this._Str_17061 = (_local_2.content as BitmapData);
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_4806);
            events.addEventListener(CatalogWidgetEvent.SET_PREVIEWER_STUFFDATA, this._Str_19078);
            events.addEventListener(CatalogWidgetSpinnerEvent.CWSE_VALUE_CHANGED, this._Str_10389);
            events.addEventListener(CatalogWidgetEvent.TOTAL_PRICE_WIDGET_INITIALIZED, this._Str_21537);
            return true;
        }

        private function _Str_25549(k:WindowEvent, _arg_2:IWindow):void
        {
            switch (k.type)
            {
                case WindowMouseEvent.CLICK:
                    if (this._habboCatalog._Str_26451 != null)
                    {
                        this._habboCatalog._Str_26451._Str_15499();
                    }
                    return;
                case WindowMouseEvent.UP:
                case WindowMouseEvent.OVER:
                    this._Str_14556 = false;
                    return;
                case WindowMouseEvent.DOWN:
                    this._Str_14556 = true;
                    return;
                case WindowMouseEvent.OUT:
                    if (this._Str_14556)
                    {
                        if (this._habboCatalog.isDraggable(this._Str_2324))
                        {
                            this._habboCatalog._Str_8289(this, this._Str_2324);
                        }
                    }
                    this._Str_14556 = false;
                    return;
            }
        }

        private function _Str_4806(k:SelectProductEvent):void
        {
            var _local_2:String;
            var _local_3:IPurchasableOffer;
            var _local_4:BitmapData;
            var _local_5:Point;
            var _local_6:RoomPreviewer;
            var _local_7:IProduct;
            var _local_8:ImageResult;
            var _local_9:BundleProductContainer;
            var _local_10:IAvatarImage;
            var _local_11:IFurnitureData;
            var _local_12:Vector.<int>;
            var _local_13:Array;
            var _local_14:String;
            var _local_15:String;
            var _local_16:String;
            var _local_17:String;
            var _local_18:String;
            var _local_19:String;
            var _local_20:String;
            var _local_21:IFurnitureData;
            var _local_22:String;
            var _local_23:IHabboWindowManager;
            var _local_24:IWindowContainer;
            var _local_25:uint;
            var _local_26:BitmapData;
            var _local_27:HabboCatalog;
            var _local_28:IAvatarImage;
            var _local_29:Point;
            var _local_30:int;
            var _local_31:Point;
            var _local_32:IAvatarDataContainer;
            var _local_33:ISpriteDataContainer;
            var _local_34:IAnimationLayerData;
            if (k == null)
            {
                return;
            }
            this._Str_10575 = k;
            this._Str_24628();
            _local_3 = k.offer;
            this._Str_2324 = _local_3;
            if (this._Str_3889 != null)
            {
                this._Str_3889.visible = false;
                this._Str_3889.destroyGridItems();
            }
            this._Str_3160.caption = _local_3.localizationName;
            this._Str_3938.caption = _local_3.localizationDescription;
            this._Str_3938.y = (this._Str_3160.y + this._Str_3160.height);
            if ((((this._habboCatalog._Str_7593) && (_local_3.bundlePurchaseAllowed)) && (this._Str_21871)))
            {
                this._Str_24064();
                this._Str_25636(_local_3);
                this._Str_17788 = false;
            }
            else
            {
                events.dispatchEvent(new CatalogWidgetSpinnerEvent(CatalogWidgetSpinnerEvent.CWSE_HIDE));
                events.dispatchEvent(new CatalogWidgetBundleDisplayExtraInfoEvent(CatalogWidgetBundleDisplayExtraInfoEvent.CWPPEIE_HIDE));
                this._Str_17788 = true;
            }
            if (this._Str_17788)
            {
                this._Str_3004 = this._habboCatalog.utils._Str_7075(_local_3, _window, this._Str_3004, this._Str_2466, -6, false, 6, page.acceptSeasonCurrencyAsCredits, page.acceptSeasonCurrencyAsCredits);
            }
            else
            {
                if (this._Str_3004 != null)
                {
                    _window.removeChild(this._Str_3004);
                    this._Str_3004.dispose();
                    this._Str_3004 = null;
                }
            }
            if (((!(_local_3.badgeCode == null)) && (!(_local_3.badgeCode == ""))))
            {
                this._habboCatalog.utils._Str_22321(_local_3.badgeCode, _window, 6, 38, true, false);
            }
            else
            {
                if (_Str_21776(k))
                {
                    this._habboCatalog.utils._Str_24300("catalogue_effects_ninja", _window, 6, 38, true, false);
                }
                else
                {
                    this._habboCatalog.utils._Str_23233(_window);
                }
            }
            if (ProductImageConfiguration._Str_17970(_local_3.localizationId))
            {
                this._Str_6504(ProductImageConfiguration._Str_2643[_local_3.localizationId]);
                if (this._Str_3864 != null)
                {
                    this._Str_3864.visible = false;
                }
            }
            else
            {
                _local_5 = new Point(0, 0);
                _local_6 = this._habboCatalog._Str_26451;
                switch (_local_3.pricingModel)
                {
                    case Offer.PRICING_MODEL_BUNDLE:
                        _local_4 = this._Str_17061.clone();
                        if (this._Str_3889 != null)
                        {
                            this._Str_3889.visible = true;
                            _local_9 = (_local_3.productContainer as BundleProductContainer);
                            _local_9._Str_6159(this._Str_3889, this._Str_3370);
                            this._Str_3889.scrollV = 0;
                        }
                        if (this._Str_3864 != null)
                        {
                            this._Str_3864.visible = false;
                        }
                        break;
                    case Offer.PRICING_MODEL_SINGLE:
                    case Offer.PRICING_MODEL_MULTI:
                    case Offer.PRICING_MODEL_FURNITURE:
                        _local_7 = _local_3.product;
                        if (((!(this._Str_3864 == null)) && (this._Str_18902)))
                        {
                            if ((((_local_7.productType == ProductTypeEnum.FLOOR) || (_local_7.productType == ProductTypeEnum.WALL)) || (_local_7.productType == ProductTypeEnum.EFFECT)))
                            {
                                this._Str_3864.visible = true;
                            }
                            else
                            {
                                this._Str_3864.visible = false;
                            }
                        }
                        if (((!(_local_6 == null)) && (!(this._Str_3605 == null))))
                        {
                            _local_6._Str_16605.y = ((_local_7.isUniqueLimitedItem) ? -15 : 0);
                            _local_6.disableUpdate = false;
                        }
                        switch (_local_7.productType)
                        {
                            case ProductTypeEnum.FLOOR:
                                if (((!(_local_6 == null)) && (!(this._Str_3605 == null))))
                                {
                                    if (((_local_7 == null) || (_local_7.furnitureData == null)))
                                    {
                                        break;
                                    }
                                    if (_local_7.furnitureData.category == FurniCategory._Str_12534)
                                    {
                                        _local_11 = this._habboCatalog.sessionDataManager.getFloorItemData(_local_7.furnitureData.id);
                                        _local_12 = new Vector.<int>(0);
                                        _local_13 = _local_11.customParams.split(",");
                                        for each (_local_14 in _local_13)
                                        {
                                            if ((page.viewer.catalog as HabboCatalog).avatarRenderManager.isValidFigureSetForGender(parseInt(_local_14), (page.viewer.catalog as HabboCatalog).sessionDataManager.gender))
                                            {
                                                _local_12.push(parseInt(_local_14));
                                            }
                                        }
                                        _local_2 = (page.viewer.catalog as HabboCatalog).avatarRenderManager.getFigureStringWithFigureIds((page.viewer.catalog as HabboCatalog).sessionDataManager.figure, (page.viewer.catalog as HabboCatalog).sessionDataManager.gender, _local_12);
                                        _local_6.addAvatarIntoRoom(_local_2, _local_7.productClassId);
                                    }
                                    else
                                    {
                                        _local_6.addFurnitureIntoRoom(_local_7.productClassId, new Vector3d(90, 0, 0), this._Str_17045);
                                    }
                                }
                                else
                                {
                                    _local_8 = page.viewer.roomEngine.getFurnitureImage(_local_7.productClassId, new Vector3d(90, 0, 0), 64, this, 0, _local_7.extraParam, -1, -1, this._Str_17045);
                                    _local_3.previewCallbackId = _local_8.id;
                                }
                                break;
                            case ProductTypeEnum.WALL:
                                if ((((_local_7.furnitureData.category == _Str_3639) || (_local_7.furnitureData.category == _Str_3683)) || (_local_7.furnitureData.category == _Str_3432)))
                                {
                                    _local_15 = this._habboCatalog.roomEngine.getRoomStringValue(this._habboCatalog.roomEngine.activeRoomId, RoomObjectVariableEnum.ROOM_WALL_TYPE);
                                    _local_16 = this._habboCatalog.roomEngine.getRoomStringValue(this._habboCatalog.roomEngine.activeRoomId, RoomObjectVariableEnum.ROOM_FLOOR_TYPE);
                                    _local_17 = this._habboCatalog.roomEngine.getRoomStringValue(this._habboCatalog.roomEngine.activeRoomId, RoomObjectVariableEnum.ROOM_LANDSCAPE_TYPE);
                                    _local_15 = (((_local_15) && (_local_15.length > 0)) ? _local_15 : "101");
                                    _local_16 = (((_local_16) && (_local_16.length > 0)) ? _local_16 : "101");
                                    _local_17 = (((_local_17) && (_local_17.length > 0)) ? _local_17 : "1.1");
                                    _local_6.updateRoomWallsAndFloorVisibility(true, true);
                                    _local_18 = ((_local_7.furnitureData.category == _Str_3683) ? _local_7.extraParam : _local_16);
                                    _local_19 = ((_local_7.furnitureData.category == _Str_3639) ? _local_7.extraParam : _local_15);
                                    _local_20 = ((_local_7.furnitureData.category == _Str_3432) ? _local_7.extraParam : _local_17);
                                    _local_6.updateObjectRoom(_local_18, _local_19, _local_20);
                                    if (_local_7.furnitureData.category == _Str_3432)
                                    {
                                        _local_21 = this._habboCatalog._Str_18225("ads_twi_windw", ProductTypeEnum.WALL);
                                        _local_6.addWallItemIntoRoom(_local_21.id, new Vector3d(90, 0, 0), _local_21.customParams);
                                    }
                                }
                                else
                                {
                                    if (((!(_local_6 == null)) && (!(this._Str_3605 == null))))
                                    {
                                        _local_6.addWallItemIntoRoom(_local_7.productClassId, new Vector3d(90, 0, 0), _local_7.extraParam);
                                    }
                                    else
                                    {
                                        _local_8 = page.viewer.roomEngine.getWallItemImage(_local_7.productClassId, new Vector3d(90, 0, 0), 64, this, 0, _local_7.extraParam);
                                        _local_3.previewCallbackId = _local_8.id;
                                    }
                                }
                                break;
                            case ProductTypeEnum.ROBOT:
                                _local_10 = this._habboCatalog.avatarRenderManager.createAvatarImage(_local_7.extraParam, AvatarScaleType.LARGE, null);
                                _local_10.appendAction(AvatarAction.GESTURE, AvatarAction.GESTURE_SMILE);
                                _local_10.setDirection(AvatarSetType.FULL, 4);
                                _local_10.setDirection(AvatarSetType.HEAD, 3);
                                _local_4 = _local_10._Str_818(AvatarSetType.FULL);
                                break;
                            case ProductTypeEnum.EFFECT:
                                if (((!(_local_6 == null)) && (!(this._Str_3605 == null))))
                                {
                                    _local_22 = (page.viewer.catalog as HabboCatalog).sessionDataManager.figure;
                                    _local_6.addAvatarIntoRoom(_local_22, _local_7.productClassId);
                                }
                                else
                                {
                                    _local_23 = page.viewer.catalog.windowManager;
                                    _local_24 = (_window.findChildByName("pixelsBackground") as IWindowContainer);
                                    _local_25 = 4291611852;
                                    if (_local_24 != null)
                                    {
                                        _local_24.visible = true;
                                        _local_25 = _local_24.color;
                                    }
                                    _local_4 = new BitmapData(this._Str_2466.width, this._Str_2466.height, false, _local_25);
                                    _local_26 = null;
                                    _local_27 = (page.viewer.catalog as HabboCatalog);
                                    if (_local_27.avatarRenderManager != null)
                                    {
                                        _local_2 = _local_27.sessionDataManager.figure;
                                        _local_28 = _local_27.avatarRenderManager.createAvatarImage(_local_2, AvatarScaleType.LARGE);
                                        if (_local_28 != null)
                                        {
                                            _local_28.setDirection(AvatarSetType.HEAD, 3);
                                            _local_28._Str_913();
                                            _local_28.appendAction(AvatarAction.GESTURE, AvatarAction.GESTURE_SMILE);
                                            _local_28.appendAction(AvatarAction.EFFECT, _local_7.productClassId);
                                            _local_28._Str_962();
                                            _local_28._Str_953(1);
                                            _local_28._Str_953(1);
                                            _local_26 = _local_28.getImage(AvatarSetType.FULL, true);
                                            _local_29 = new Point(0, 0);
                                            if (_local_26 != null)
                                            {
                                                _local_32 = _local_28._Str_920;
                                                if (_local_32 != null)
                                                {
                                                }
                                                _local_29.x = ((_local_4.width - _local_26.width) / 2);
                                                _local_29.y = ((_local_4.height - _local_26.height) / 2);
                                                for each (_local_33 in _local_28._Str_754())
                                                {
                                                    if (_local_33.id == "avatar")
                                                    {
                                                        _local_34 = _local_28.getLayerData(_local_33);
                                                        _local_5.x = _local_34.dx;
                                                        _local_5.y = _local_34.dy;
                                                    }
                                                }
                                            }
                                            _local_30 = 64;
                                            _local_31 = new Point(((_local_26.width - _local_30) / 2), (_local_26.height - (_local_30 / 4)));
                                            this._Str_20738(_local_4, _local_28, _local_5, _local_29.add(_local_31), false);
                                            _local_4.copyPixels(_local_26, _local_26.rect, _local_29, null, null, true);
                                            this._Str_20738(_local_4, _local_28, _local_5, _local_29.add(_local_31));
                                        }
                                    }
                                    if (_local_28)
                                    {
                                        _local_28.dispose();
                                    }
                                }
                                break;
                            case ProductTypeEnum.HABBO_CLUB:
                                break;
                            default:
                                Logger.log(("[ProductViewCatalogWidget] Unknown Product Type: " + _local_7.productType));
                        }
                        if (_local_8 != null)
                        {
                            _local_4 = _local_8.data;
                        }
                        break;
                    default:
                        Logger.log(("[ProductViewCatalogWidget] Unknown pricing model" + _local_3.pricingModel));
                }
                this._Str_3234(_local_4, true, _local_5);
            }
            if (((((((this._Str_18902) && (_local_6)) && (this._Str_3605)) && (this._Str_3864)) && (this._Str_3605.visible)) && (this._Str_3864.visible)))
            {
                (this._Str_3160 as ITextWindow).textColor = 0xFFFFFFFF;
                (this._Str_3938 as ITextWindow).textColor = 0xFFFFFFFF;
            }
            else
            {
                (this._Str_3160 as ITextWindow).textColor = 0xFF000000;
                (this._Str_3938 as ITextWindow).textColor = 0xFF000000;
            }
            _window.invalidate();
        }

        private function _Str_25636(k:IPurchasableOffer):void
        {
            var _local_2:ExtraInfoItemData = new ExtraInfoItemData(ExtraInfoItemData._Str_17087);
            _local_2.activityPointType = k.activityPointType;
            _local_2.priceActivityPoints = k.priceInActivityPoints;
            _local_2.priceCredits = k.priceInCredits;
            _local_2.badgeCode = k.badgeCode;
            events.dispatchEvent(new CatalogWidgetBundleDisplayExtraInfoEvent(CatalogWidgetBundleDisplayExtraInfoEvent.CWPPEIE_RESET, _local_2));
        }

        private function _Str_24064():void
        {
            if (this._habboCatalog.discountEnabled)
            {
                events.dispatchEvent(new CatalogWidgetSpinnerEvent(CatalogWidgetSpinnerEvent.CWSE_RESET, 1, this._habboCatalog.utils._Str_20096));
            }
            else
            {
                events.dispatchEvent(new CatalogWidgetSpinnerEvent(CatalogWidgetSpinnerEvent.CWSE_RESET, 1));
            }
            events.dispatchEvent(new CatalogWidgetSpinnerEvent(CatalogWidgetSpinnerEvent.CWSE_SHOW));
            if (this._habboCatalog._Str_5195 != null)
            {
                events.dispatchEvent(new CatalogWidgetSpinnerEvent(CatalogWidgetSpinnerEvent.CWSE_SET_MAX, this._habboCatalog._Str_5195._Str_22802));
            }
            events.dispatchEvent(new CatalogWidgetSpinnerEvent(CatalogWidgetSpinnerEvent.CWSE_SET_MIN, 1));
        }

        private function _Str_20738(k:BitmapData, _arg_2:IAvatarImage, _arg_3:Point, _arg_4:Point, _arg_5:Boolean=true):void
        {
            var _local_6:ISpriteDataContainer;
            var _local_7:int;
            var _local_8:IAnimationLayerData;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:String;
            var _local_15:BitmapDataAsset;
            var _local_16:BitmapData;
            var _local_17:Number;
            var _local_18:Number;
            var _local_19:Number;
            var _local_20:Matrix;
            for each (_local_6 in _arg_2._Str_754())
            {
                _local_7 = _window.getChildIndex(this._Str_2466);
                _local_8 = _arg_2.getLayerData(_local_6);
                _local_9 = 0;
                _local_10 = _local_6.getDirectionOffsetX(_arg_2.getDirection());
                _local_11 = _local_6.getDirectionOffsetY(_arg_2.getDirection());
                _local_12 = _local_6.getDirectionOffsetZ(_arg_2.getDirection());
                _local_13 = 0;
                if (!_arg_5)
                {
                    if (_local_12 >= 0)
                    {
                        continue;
                    }
                }
                else
                {
                    if (_local_12 < 0)
                    {
                        continue;
                    }
                }
                if (_local_6.hasDirections)
                {
                    _local_13 = _arg_2.getDirection();
                }
                if (_local_8 != null)
                {
                    _local_9 = _local_8.animationFrame;
                    _local_10 = (_local_10 + _local_8.dx);
                    _local_11 = (_local_11 + _local_8.dy);
                    _local_13 = (_local_13 + _local_8.dd);
                }
                if (_local_13 < 0)
                {
                    _local_13 = (_local_13 + 8);
                }
                if (_local_13 > 7)
                {
                    _local_13 = (_local_13 - 8);
                }
                _local_14 = ((((((_arg_2._Str_797() + "_") + _local_6.member) + "_") + _local_13) + "_") + _local_9);
                _local_15 = _arg_2.getAsset(_local_14);
                if (_local_15 == null)
                {
                }
                else
                {
                    _local_16 = (_local_15.content as BitmapData).clone();
                    _local_17 = 1;
                    _local_18 = ((_arg_4.x - (1 * _local_15.offset.x)) + _local_10);
                    _local_19 = ((_arg_4.y - (1 * _local_15.offset.y)) + _local_11);
                    if (_local_6.ink == 33)
                    {
                        _local_20 = new Matrix(1, 0, 0, 1, (_local_18 - _arg_3.x), (_local_19 - _arg_3.y));
                        k.draw(_local_16, _local_20, null, BlendMode.ADD, null, false);
                    }
                    else
                    {
                        k.copyPixels(_local_16, _local_16.rect, new Point((_local_18 - _arg_3.x), (_local_19 - _arg_3.y)));
                    }
                }
            }
        }

        private function _Str_24628():void
        {
            var k:IBitmapWrapperWindow;
            for each (k in this._Str_19223)
            {
                _window.removeChild(k);
                k.dispose();
                k = null;
            }
            this._Str_19223 = new Array();
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            var _local_3:IPurchasableOffer;
            if ((((disposed) || (page == null)) || (page.offers == null)))
            {
                return;
            }
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

        private function _Str_6504(k:String):void
        {
            if ((((((!(k)) || (!(page))) || (!(page.viewer))) || (!(page.viewer.catalog))) || (!(page.viewer.catalog.assets))))
            {
                return;
            }
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
            if (((((!(k)) || (!(page))) || (!(page.viewer))) || (!(page.viewer.catalog))))
            {
                return;
            }
            var _local_2:* = ((page.viewer.catalog.imageGalleryHost + k) + ".gif");
            Logger.log(("[ProductViewCatalogWidget] Retrieve Product Preview Asset: " + _local_2));
            var _local_3:URLRequest = new URLRequest(_local_2);
            if (!page.viewer.catalog.assets)
            {
                return;
            }
            var _local_4:AssetLoaderStruct = page.viewer.catalog.assets.loadAssetFromFile(k, _local_3, "image/gif");
            if (!_local_4)
            {
                return;
            }
            _local_4.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_6676);
        }

        private function _Str_6676(k:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            if (_local_2 != null)
            {
                this._Str_6504(_local_2.assetName);
                _local_2.removeEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_6676);
            }
        }

        private function _Str_19078(k:SetRoomPreviewerStuffDataEvent):void
        {
            var _local_2:RoomPreviewer;
            this._Str_17045 = k.stuffData;
            if (this._Str_10575 != null)
            {
                _local_2 = (page.viewer.catalog as HabboCatalog)._Str_26451;
                if (_local_2 != null)
                {
                    _local_2.reset(false);
                }
                this._Str_4806(this._Str_10575);
            }
        }

        private function _Str_10389(k:CatalogWidgetSpinnerEvent):void
        {
            var _local_2:IWindowContainer;
            if (k.type == CatalogWidgetSpinnerEvent.CWSE_VALUE_CHANGED)
            {
                _local_2 = (window.findChildByName("price_box_new") as IWindowContainer);
                if (((!(_local_2 == null)) && (!(this._Str_10575 == null))))
                {
                    this._habboCatalog.utils._Str_6455(_local_2, this._Str_10575.offer);
                }
            }
        }

        private function _Str_21537(k:Event):void
        {
            this._Str_21871 = true;
        }

        override public function closed():void
        {
            var k:RoomPreviewer = (page.viewer.catalog as HabboCatalog)._Str_26451;
            if (k)
            {
                k.disableUpdate = true;
            }
        }

        public function _Str_8347(k:Boolean, _arg_2:String):void
        {
        }
    }
}
