package com.sulake.habbo.catalog.purchase
{
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.catalog.viewer.Offer;
    import com.sulake.habbo.catalog.HabboCatalogUtils;
    import com.sulake.habbo.catalog.club.ClubBuyOfferData;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Matrix;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.catalog.viewer.ProductImageConfiguration;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.habbo.avatar.enum.AvatarAction;
    import com.sulake.habbo.catalog.purchase._Str_11981;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.localization.ILocalization;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.catalog.viewer.ICatalogPage;
    import com.sulake.habbo.catalog.viewer.widgets.events._Str_3308;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.tracking.HabboTracking;
    import flash.ui.Keyboard;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.utils.IIterable;
    import flash.text.TextFormat;
    import com.sulake.habbo.window.utils._Str_2418;

    public class PurchaseConfirmationDialog implements IAvatarImageListener, IGetImageListener 
    {
        private const _Str_21592:int = 10;
        private const _Str_14861:uint = 4293848814;
        private const _Str_15515:uint = 0xFFFFFFFF;
        private const _Str_22602:uint = 4291613146;

        private var _catalog:HabboCatalog;
        private var _roomEngine:IRoomEngine;
        private var _localization:IHabboLocalizationManager;
        private var _assets:IAssetLibrary;
        private var _offerId:int;
        private var _productType:String = "";
        private var _pageId:int;
        private var _extraParameter:String;
        private var _stuffData:IStuffData = null;
        private var _friends:Array;
        private var _userName:String;
        private var _suggestionContainer:IWindowContainer;
        private var _suggestionsListItem:IWindowContainer;
        private var _highlightIndex:int = -1;
        private var _quantity:int;
        private var _bundleDiscountEnabled:Boolean = false;
        private var _receiverName:String = "";
        private var _imageId:int;
        private var _defaultStuffType:int = 0;
        private var _stuffTypes:Array;
        private var _ribbonTypes:Array;
        private var _boxTypes:Array;
        private var _ribbonIndex:int;
        private var _boxIndex:int;
        private var _selectedTypeId:int;
        private var _window:IFrameWindow;
        private var _disposed:Boolean = false;

        public function PurchaseConfirmationDialog(k:IHabboLocalizationManager, _arg_2:IAssetLibrary)
        {
            this._stuffTypes = [];
            this._ribbonTypes = [];
            this._boxTypes = [];
            super();
            this._localization = k;
            this._assets = _arg_2;
        }

        private static function _Str_13980(k:int):Boolean
        {
            return k == 8;
        }


        public function _Str_6059(k:IHabboCatalog, _arg_2:IRoomEngine, _arg_3:IPurchasableOffer, _arg_4:int, _arg_5:String, _arg_6:int, _arg_7:IStuffData, _arg_8:Array, _arg_9:String, _arg_10:BitmapData):void
        {
            this._catalog = (k as HabboCatalog);
            this._roomEngine = _arg_2;
            this._offerId = _arg_3.offerId;
            this._pageId = _arg_4;
            this._extraParameter = _arg_5;
            this._stuffData = _arg_7;
            this._friends = _arg_8;
            this._userName = _arg_9;
            this._quantity = _arg_6;
            this._bundleDiscountEnabled = ((this._catalog.discountEnabled) ? _arg_3.bundlePurchaseAllowed : false);
            if (((_arg_3 is Offer) && (!(_arg_3.product == null))))
            {
                this._productType = _arg_3.product.productType;
            }
            else
            {
                if (((_arg_3 is ClubBuyOfferData) || (HabboCatalogUtils._Str_21831(_arg_3.localizationId))))
                {
                    this._productType = ProductTypeEnum.HABBO_CLUB;
                }
                else
                {
                    return;
                }
            }
            this._Str_22636(_arg_3, _arg_10);
            this._catalog._Str_24178(_arg_3);
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this._disposed = true;
            this._catalog = null;
            this._roomEngine = null;
            this._offerId = -1;
            this._pageId = -1;
            this._extraParameter = "";
            this._friends = null;
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            this._suggestionContainer = null;
            if (this._suggestionsListItem != null)
            {
                this._suggestionsListItem.dispose();
                this._suggestionsListItem = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get productType():String
        {
            return this._productType;
        }

        public function _Str_23480():IBitmapWrapperWindow
        {
            return (this._window) ? (this._window.findChildByName("product_image") as IBitmapWrapperWindow) : null;
        }

        public function _Str_23564():Boolean
        {
            return (!(this._receiverName == null)) && (!(this._receiverName == ""));
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (k == this._imageId)
            {
                this._imageId = 0;
                this._Str_3523(_arg_2, true);
            }
        }

        public function imageFailed(k:int):void
        {
        }

        private function _Str_3523(k:BitmapData, _arg_2:Boolean):void
        {
            if ((((this._window == null) || (k == null)) || (this.disposed)))
            {
                return;
            }
            var _local_3:IBitmapWrapperWindow = (this._window.findChildByName("product_image") as IBitmapWrapperWindow);
            if (_local_3 == null)
            {
                return;
            }
            if (_local_3.bitmap != null)
            {
                _local_3.bitmap.dispose();
                _local_3.bitmap = null;
            }
            if (_local_3.bitmap == null)
            {
                _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height, true, 0);
            }
            var _local_4:int = ((_local_3.width - k.width) * 0.5);
            var _local_5:int = ((_local_3.height - k.height) * 0.5);
            _local_3.bitmap.draw(k, new Matrix(1, 0, 0, 1, _local_4, _local_5));
            if (_arg_2)
            {
                k.dispose();
            }
        }

        private function _Str_22636(k:IPurchasableOffer, _arg_2:BitmapData):void
        {
            var _local_7:IProductData;
            var _local_8:IItemListWindow;
            var _local_9:Boolean;
            var _local_10:String;
            var _local_11:BitmapDataAsset;
            var _local_12:IRoomEngine;
            var _local_13:ImageResult;
            var _local_14:BitmapData;
            var _local_15:int;
            var _local_16:String;
            var _local_17:IProduct;
            var _local_18:IAvatarImage;
            if (this._catalog == null)
            {
                return;
            }
            if (this._window != null)
            {
                this._window.dispose();
            }
            this._window = (this._catalog.utils.createWindow("purchase_confirmation", 2) as IFrameWindow);
            if (this._window == null)
            {
                return;
            }
            this._Str_23404(k);
            var _local_3:IWindowContainer = (this._window.findChildByName("purchase_cost_box") as IWindowContainer);
            this._catalog.utils._Str_6455(_local_3, k, this._quantity);
            this._Str_2471("buy_button", this._Str_13434);
            this._Str_2471("cancel_button", this._Str_2392);
            this._Str_2471("header_button_close", this._Str_2392);
            this._window.center();
            if (this._catalog.getBoolean("disclaimer.credit_spending.enabled"))
            {
                this._window.findChildByName("spending_disclaimer").addEventListener(WindowMouseEvent.CLICK, this._Str_21435);
                this._window.findChildByName("spending_disclaimer").addEventListener(WindowMouseEvent.DOUBLE_CLICK, this._Str_21435);
                this._Str_3515(false);
            }
            else
            {
                this._window.findChildByName("disclaimer").dispose();
                this._Str_3515(true);
            }
            var _local_4:ITextWindow = (this._window.findChildByName("product_name") as ITextWindow);
            if (_local_4 != null)
            {
                _local_7 = this._catalog.getProductData(k.localizationId);
                _local_4.text = ((_local_7 == null) ? k.localizationId : _local_7.name);
            }
            var _local_5:ITextWindow = (this._window.findChildByName("quantity") as ITextWindow);
            if (_local_5 != null)
            {
                if (((this._catalog._Str_7593) && (this._quantity > 1)))
                {
                    _local_5.text = ("X " + this._quantity);
                }
                else
                {
                    _local_8 = IItemListWindow(this._window.findChildByName("properties_itemlist"));
                    if (_local_8 != null)
                    {
                        _local_8.removeListItem(_local_5);
                    }
                }
            }
            var _local_6:IBitmapWrapperWindow = (this._window.findChildByName("product_image") as IBitmapWrapperWindow);
            if (_local_6 != null)
            {
                _local_9 = false;
                if (ProductImageConfiguration._Str_17970(k.localizationId))
                {
                    _local_10 = ProductImageConfiguration._Str_2643[k.localizationId];
                    _local_11 = (this._assets.getAssetByName(_local_10) as BitmapDataAsset);
                    if (_local_11)
                    {
                        this._Str_3523((_local_11.content as BitmapData), false);
                        _local_9 = true;
                    }
                }
                if (((!(_local_9)) && (k.product)))
                {
                    _local_12 = this._catalog.roomEngine;
                    _local_15 = 0;
                    _local_16 = "";
                    if ((k is Offer))
                    {
                        _local_17 = k.product;
                        if (_local_17 != null)
                        {
                            _local_15 = _local_17.productClassId;
                            _local_16 = _local_17.extraParam;
                        }
                    }
                    if (_arg_2 == null)
                    {
                        switch (this.productType)
                        {
                            case ProductTypeEnum.FLOOR:
                                _local_13 = _local_12.getFurnitureImage(_local_15, new Vector3d(90, 0, 0), 64, this, 0, _local_16, -1, -1, this._stuffData);
                                break;
                            case ProductTypeEnum.WALL:
                                _local_13 = _local_12.getWallItemImage(_local_15, new Vector3d(90, 0, 0), 64, this, 0, _local_16);
                                break;
                            case ProductTypeEnum.EFFECT:
                                _local_14 = this._catalog.getPixelEffectIcon(_local_15);
                                break;
                            case ProductTypeEnum.HABBO_CLUB:
                                _local_14 = this._catalog.getSubscriptionProductIcon(_local_15);
                                break;
                            case ProductTypeEnum.ROBOT:
                                _local_18 = this._catalog.avatarRenderManager.createAvatarImage(_local_16, AvatarScaleType.LARGE, null, this);
                                _local_18.setDirection(AvatarSetType.FULL, 3);
                                _local_18.appendAction(AvatarAction.EXPRESSION_WAVE);
                                _local_18.appendAction(AvatarAction.GESTURE, AvatarAction.GESTURE_SMILE);
                                _local_14 = _local_18.getImage(AvatarSetType.FULL, true);
                                _local_18.dispose();
                                break;
                        }
                        if (_local_13 != null)
                        {
                            _local_14 = _local_13.data;
                            this._imageId = _local_13.id;
                        }
                    }
                    else
                    {
                        _local_14 = _arg_2;
                    }
                    this._Str_3523(_local_14, true);
                    _Str_11981._Str_21471(k, (this._window.findChildByName("buy_button") as IButtonWindow));
                }
            }
        }

        private function _Str_21435(k:WindowMouseEvent):void
        {
            var _local_2:ICheckBoxWindow = (k.target as ICheckBoxWindow);
            if (_local_2 != null)
            {
                this._Str_3515(_local_2._Str_2365);
            }
        }

        private function _Str_3515(k:Boolean):void
        {
            if (this._window == null)
            {
                return;
            }
            var _local_2:IWindow = this._window.findChildByName("buy_button");
            if (_local_2 == null)
            {
                return;
            }
            if (k)
            {
                _local_2.enable();
            }
            else
            {
                _local_2.disable();
            }
        }

        private function _Str_23404(k:IPurchasableOffer):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:IProductData = this._catalog.getProductData(k.localizationId);
            var _local_3:String = ((_local_2 == null) ? "" : _local_2.name);
            this._catalog.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.costs", "offer_name", _local_3);
        }

        private function _Str_2471(k:String, _arg_2:Function):void
        {
            var _local_3:IWindow = this._window.findChildByName(k);
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, _arg_2);
            }
        }

        public function getAvatarFaceBitmap(k:String):BitmapData
        {
            if (((this._catalog == null) || (this._catalog.avatarRenderManager == null)))
            {
                return null;
            }
            var _local_2:BitmapData;
            var _local_3:IAvatarImage = this._catalog.avatarRenderManager.createAvatarImage(k, AvatarScaleType.LARGE, null, this);
            if (_local_3 != null)
            {
                _local_2 = _local_3._Str_818(AvatarSetType.HEAD);
                _local_3.dispose();
            }
            return _local_2;
        }

        public function _Str_840(k:String):void
        {
            if (((((this._catalog == null) || (this._window == null)) || (this._window.disposed)) || (this.disposed)))
            {
                return;
            }
            if (k == this._catalog.sessionDataManager.figure)
            {
                this._Str_6509();
            }
            var _local_2:IAvatarImage = this._catalog.avatarRenderManager.createAvatarImage(k, AvatarScaleType.LARGE, null, this);
            _local_2.setDirection(AvatarSetType.FULL, 3);
            _local_2.appendAction(AvatarAction.EXPRESSION_WAVE);
            _local_2.appendAction(AvatarAction.GESTURE, AvatarAction.GESTURE_SMILE);
            var _local_3:BitmapData = _local_2.getImage(AvatarSetType.FULL, true);
            _local_2.dispose();
            this._Str_3523(_local_3, true);
        }

        private function _Str_21654(k:Boolean):void
        {
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName("avatar_image") as IBitmapWrapperWindow);
            if (_local_2 != null)
            {
                if (k)
                {
                    this._Str_6509();
                }
                else
                {
                    this._Str_18043();
                }
            }
            var _local_3:ITextWindow = (this._window.findChildByName("message_from") as ITextWindow);
            if (_local_3 != null)
            {
                _local_3.visible = k;
            }
        }

        private function _Str_6509():void
        {
            var k:BitmapData = this.getAvatarFaceBitmap(this._catalog.sessionDataManager.figure);
            if (k != null)
            {
                this._Str_9900(k);
            }
        }

        private function _Str_18043():void
        {
            var _local_2:BitmapData;
            var k:BitmapDataAsset = (this._assets.getAssetByName("gift_incognito") as BitmapDataAsset);
            if (k != null)
            {
                _local_2 = (k.content as BitmapData);
                if (_local_2 != null)
                {
                    this._Str_9900(_local_2.clone());
                }
            }
        }

        private function _Str_9900(k:BitmapData):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName("avatar_image") as IBitmapWrapperWindow);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.bitmap = k;
            _local_2.width = k.width;
            _local_2.height = k.height;
        }

        private function _Str_23505(k:WindowEvent):void
        {
            this._Str_21654(true);
            this._Str_6509();
        }

        private function _Str_23528(k:WindowEvent):void
        {
            this._Str_21654(false);
        }

        private function _Str_23569():Boolean
        {
            var k:ICheckBoxWindow;
            if (this._Str_3853())
            {
                if (this._window != null)
                {
                    k = (this._window.findChildByName("show_face_checkbox") as ICheckBoxWindow);
                    if (k != null)
                    {
                        return k._Str_2365;
                    }
                }
                return false;
            }
            return true;
        }

        private function _Str_24887():void
        {
            var _local_9:IWindow;
            if (((this._window == null) || (this._window.disposed)))
            {
                return;
            }
            var k:Boolean = this._Str_18066();
            var _local_2:String = "";
            var _local_3:String = "";
            var _local_4:ILocalization;
            var _local_5:ITextWindow = (this._window.findChildByName("pick_box_title") as ITextWindow);
            if (_local_5 != null)
            {
                _local_3 = ((k) ? "catalog.gift_wrapping_new.box.default" : ("catalog.gift_wrapping_new.box." + this._boxTypes[this._boxIndex]));
                _local_4 = this._localization.getLocalizationRaw(_local_3);
                _local_2 = _local_3;
                if (_local_4 != null)
                {
                    _local_2 = _local_4.value;
                }
                _local_5.text = _local_2;
            }
            var _local_6:ITextWindow = (this._window.findChildByName("pick_box_price_title") as ITextWindow);
            if (_local_6 != null)
            {
                _local_3 = ((k) ? "catalog.gift_wrapping_new.freeprice" : "catalog.gift_wrapping_new.price");
                _local_4 = this._localization.getLocalizationRaw(_local_3);
                _local_2 = _local_3;
                if (_local_4 != null)
                {
                    _local_2 = _local_4.value;
                }
                _local_6.text = _local_2;
            }
            var _local_7:IItemListWindow = (this._window.findChildByName("price_box_container") as IItemListWindow);
            if (_local_7 != null)
            {
                _local_9 = _local_7.getListItemByName("small_coin");
                if (_local_9 != null)
                {
                    _local_9.visible = (!(k));
                    _local_7.arrangeListItems();
                }
            }
            var _local_8:ITextWindow = (this._window.findChildByName("pick_ribbon_title") as ITextWindow);
            if (_local_8 != null)
            {
                _local_3 = ("catalog.gift_wrapping_new.ribbon." + this._ribbonIndex);
                _local_4 = this._localization.getLocalizationRaw(_local_3);
                _local_2 = _local_3;
                if (_local_4 != null)
                {
                    _local_2 = _local_4.value;
                }
                _local_8.text = _local_2;
            }
        }

        public function _Str_25056():void
        {
            var _local_8:String;
            var _local_9:String;
            var _local_10:String;
            var _local_11:Number;
            if (this._window != null)
            {
                this._window.dispose();
            }
            var k:GiftWrappingConfiguration = this._catalog._Str_22272;
            this._window = (this._catalog.utils.createWindow("gift_wrapping") as IFrameWindow);
            if (this._window == null)
            {
                return;
            }
            this._window.center();
            this._Str_2471("give_gift_button", this._Str_23085);
            this._Str_2471("cancel_link_region", this._Str_21578);
            this._Str_2471("header_button_close", this._Str_21578);
            var _local_2:IWindow = this._window.findChildByName("name_input");
            if (_local_2 != null)
            {
                if (this._userName != null)
                {
                    this._Str_16023(this._userName);
                }
                else
                {
                    this._Str_23182();
                }
                this._Str_11342();
                _local_2.addEventListener(WindowEvent.WINDOW_EVENT_CHANGE, this._Str_25788);
                _local_2.addEventListener(WindowMouseEvent.DOWN, this._Str_24553);
                _local_2.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_UP, this._Str_23371);
                _local_2.addEventListener(WindowEvent.WINDOW_EVENT_FOCUSED, this._Str_24214);
                _local_2.addEventListener(WindowEvent.WINDOW_EVENT_UNFOCUSED, this._Str_22761);
            }
            var _local_3:IStaticBitmapWrapperWindow = (this._window.findChildByName("gift_card") as IStaticBitmapWrapperWindow);
            if (_local_3)
            {
                _local_8 = this._catalog.getProperty("catalog.gift_wrapping_new.gift_card");
                if (_local_8 != "")
                {
                    _local_3.assetUri = (("${image.library.url}Giftcards/" + _local_8) + ".png");
                }
            }
            var _local_4:ICheckBoxWindow = (this._window.findChildByName("show_face_checkbox") as ICheckBoxWindow);
            if (_local_4)
            {
                if (this._Str_3853())
                {
                    _local_4.visible = true;
                    _local_4.select();
                    _local_4.addEventListener(WindowEvent.WINDOW_EVENT_SELECT, this._Str_23505);
                    _local_4.addEventListener(WindowEvent.WINDOW_EVENT_UNSELECT, this._Str_23528);
                }
                else
                {
                    _local_4.visible = false;
                }
            }
            var _local_5:IWindow = this._window.findChildByName("show_face_checkbox_title");
            if (((!(_local_5 == null)) && (!(this._Str_3853()))))
            {
                _local_5.visible = false;
            }
            this._Str_6509();
            var _local_6:IWindow = this._window.findChildByName("message_input");
            if (_local_6 != null)
            {
                this._Str_13320();
                _local_6.addEventListener(WindowEvent.WINDOW_EVENT_CHANGE, this._Str_23135);
                _local_6.addEventListener(WindowEvent.WINDOW_EVENT_FOCUSED, this._Str_25377);
                _local_6.addEventListener(WindowEvent.WINDOW_EVENT_UNFOCUSED, this._Str_23611);
            }
            var _local_7:IWindow = this._window.findChildByName("message_from");
            if (_local_7 != null)
            {
                _local_9 = this._catalog.sessionDataManager.userName;
                _local_10 = "catalog.gift_wrapping_new.message_from";
                this._localization.registerParameter(_local_10, "name", _local_9);
                _local_7.caption = this._localization.getLocalization(_local_10, _local_9);
            }
            this._Str_2471("ribbon_prev", this._Str_23680);
            this._Str_2471("ribbon_next", this._Str_25226);
            this._Str_2471("box_prev", this._Str_24477);
            this._Str_2471("box_next", this._Str_24629);
            this._localization.registerParameter("catalog.gift_wrapping_new.price", "price", k.price.toString());
            if (k._Str_11034.length > 0)
            {
                _local_11 = Math.floor((Math.random() * k._Str_11034.length));
                this._defaultStuffType = k._Str_11034[_local_11];
            }
            this._stuffTypes = k._Str_17761;
            this._boxTypes = this._boxTypes.concat(k._Str_17162);
            this._boxTypes.push(this._defaultStuffType);
            this._ribbonTypes = k._Str_17780;
            this._selectedTypeId = this._stuffTypes[0];
            this._ribbonIndex = this._ribbonTypes[0];
            this._boxIndex = this._catalog.getInteger("catalog.purchase.gift_wrapping.default_box_index", 0);
            if (((this._boxIndex < 0) || (this._boxIndex > (this._boxTypes.length - 1))))
            {
                this._boxIndex = 0;
            }
            this._Str_24942();
            this._Str_19479();
            this._Str_3190();
        }

        private function _Str_3853():Boolean
        {
            return this._catalog.sessionDataManager.hasSecurity(SecurityLevelEnum._Str_3569);
        }

        private function _Str_18066():Boolean
        {
            return this._boxTypes[this._boxIndex] == this._defaultStuffType;
        }

        private function _Str_3190():void
        {
            if (this._ribbonIndex < 0)
            {
                this._ribbonIndex = (this._ribbonTypes.length - 1);
            }
            if (this._ribbonIndex > (this._ribbonTypes.length - 1))
            {
                this._ribbonIndex = 0;
            }
            if (this._boxIndex < 0)
            {
                this._boxIndex = (this._boxTypes.length - 1);
            }
            if (this._boxIndex > (this._boxTypes.length - 1))
            {
                this._boxIndex = 0;
            }
            var k:int = this._boxTypes[this._boxIndex];
            if (_Str_13980(k))
            {
                this._ribbonIndex = 10;
                if (this._ribbonIndex > (this._ribbonTypes.length - 1))
                {
                    this._ribbonIndex = 0;
                }
            }
            var _local_2:int = ((k * 1000) + this._ribbonTypes[this._ribbonIndex]);
            if (this._window == null)
            {
                return;
            }
            if (this._roomEngine == null)
            {
                return;
            }
            var _local_3:String = _local_2.toString();
            var _local_4:int = this._selectedTypeId;
            var _local_5:Boolean = this._Str_18066();
            if (_local_5)
            {
                this._Str_17818(false);
                _local_4 = this._defaultStuffType;
                _local_3 = "";
            }
            else
            {
                if (_Str_13980(k))
                {
                    this._Str_17818(false);
                }
                else
                {
                    this._Str_17818(true);
                    if (((k >= 3) && (k <= 6)))
                    {
                        this._Str_21183(false);
                    }
                }
            }
            var _local_6:ImageResult = this._roomEngine.getFurnitureImage(_local_4, new Vector3d(180), 64, this, 0, _local_3);
            if (_local_6 == null)
            {
                return;
            }
            this._imageId = _local_6.id;
            this._Str_3523(_local_6.data, true);
            this._Str_6969(false);
            this._Str_24887();
        }

        private function _Str_24942():void
        {
            var _local_3:int;
            var _local_4:IFurnitureData;
            var _local_5:IWindowContainer;
            if (this._window == null)
            {
                return;
            }
            var k:IItemGridWindow = (this._window.findChildByName("color_grid") as IItemGridWindow);
            k.destroyGridItems();
            var _local_2:IWindowContainer = (this._catalog.utils.createWindow("gift_palette_item") as IWindowContainer);
            for each (_local_3 in this._stuffTypes)
            {
                _local_4 = this._catalog.getFurnitureData(_local_3, ProductTypeEnum.FLOOR);
                _local_5 = (_local_2.clone() as IWindowContainer);
                if (((!(_local_4)) || (!(_local_5))))
                {
                }
                else
                {
                    _local_5.addEventListener(WindowMouseEvent.CLICK, this._Str_22731);
                    _local_5.findChildByName("color").color = _local_4.colours[0];
                    _local_5.id = _local_3;
                    k._Str_2816(_local_5);
                }
            }
        }

        private function _Str_24635():void
        {
            var k:IWindow = this._window.findChildByName("name_input");
            if (k == null)
            {
                return;
            }
            var _local_2:String = k.caption;
            var _local_3:IWindow = this._window.findChildByName("message_input");
            var _local_4:String = ((_local_3 == null) ? "" : _local_3.caption);
            var _local_5:Boolean = this._Str_18066();
            var _local_6:int = ((_local_5) ? this._defaultStuffType : this._selectedTypeId);
            var _local_7:int = ((_local_5) ? 0 : this._boxTypes[this._boxIndex]);
            var _local_8:int = ((_local_5) ? 0 : this._ribbonTypes[this._ribbonIndex]);
            var _local_9:Boolean = this._Str_23569();
            this._catalog._Str_22436(this._pageId, this._offerId, this._extraParameter, _local_2, _local_4, _local_6, _local_7, _local_8, _local_9);
        }

        private function _Str_18873(k:String):void
        {
            var _local_2:IWindow = this._window.findChildByName(k);
            if (_local_2 != null)
            {
                _local_2.disable();
            }
        }

        private function _Str_25035(k:String):void
        {
            var _local_2:IWindow = this._window.findChildByName(k);
            if (_local_2 != null)
            {
                _local_2.enable();
            }
        }

        private function _Str_13434(k:WindowEvent):void
        {
            this._Str_18873("buy_button");
            this._Str_18873("cancel_button");
            this._Str_18873("publish_check");
            this._catalog._Str_18074(this._pageId, this._offerId, this._extraParameter, this._quantity);
            var _local_2:ICatalogPage = this._catalog._Str_3854;
            if (_local_2 != null)
            {
                _local_2.dispatchWidgetEvent(new _Str_3308(CatalogWidgetEvent.PURCHASE));
            }
        }

        private function _Str_24474(k:WindowEvent):void
        {
            this._Str_25056();
            HabboTracking.getInstance().trackEventLog("Catalog", "clickConfirm", "client.buy_as_gift.clicked");
        }

        private function _Str_2392(k:WindowEvent):void
        {
            this._catalog._Str_4663();
            this.dispose();
        }

        private function _Str_23085(k:WindowEvent):void
        {
            this._Str_24635();
            this._Str_4401(false);
            this._catalog.giftReceiver = null;
            this._catalog._Str_4663();
        }

        private function _Str_21578(k:WindowEvent):void
        {
            this._catalog._Str_4663();
            this.dispose();
        }

        private function _Str_23680(k:WindowEvent):void
        {
            this._ribbonIndex--;
            this._Str_3190();
        }

        private function _Str_25226(k:WindowEvent):void
        {
            this._ribbonIndex++;
            this._Str_3190();
        }

        private function _Str_24477(k:WindowEvent):void
        {
            this._boxIndex--;
            this._Str_3190();
        }

        private function _Str_24629(k:WindowEvent):void
        {
            this._boxIndex++;
            this._Str_3190();
        }

        private function _Str_25788(k:WindowEvent):void
        {
            var _local_5:String;
            var _local_2:IWindow = k.target;
            if (_local_2 == null)
            {
                return;
            }
            this._Str_11342();
            if (this._receiverName == _local_2.caption)
            {
                return;
            }
            var _local_3:String = _local_2.caption.toLowerCase();
            var _local_4:Array = [];
            for each (_local_5 in this._friends)
            {
                if (_local_5.toLowerCase().search(_local_3) != -1)
                {
                    _local_4.push(_local_5);
                }
                if (_local_4.length >= this._Str_21592)
                {
                    break;
                }
            }
            this._receiverName = _local_2.caption;
            this._Str_20993(_local_4);
        }

        private function _Str_24553(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            if (_local_2 == null)
            {
                return;
            }
            this._Str_6969(false);
        }

        private function _Str_23371(k:WindowEvent):void
        {
            var _local_4:Boolean;
            var _local_2:WindowKeyboardEvent = (k as WindowKeyboardEvent);
            var _local_3:IWindow = k.target;
            switch (_local_2.keyCode)
            {
                case Keyboard.UP:
                    this._Str_10725((this._highlightIndex - 1));
                    return;
                case Keyboard.DOWN:
                    this._Str_10725((this._highlightIndex + 1));
                    if (_local_3 != null)
                    {
                        if (_local_3.caption.length == 0)
                        {
                            if (((this._suggestionContainer == null) || (!(this._suggestionContainer.visible))))
                            {
                                _local_4 = this._Str_22293();
                                if (_local_4)
                                {
                                    this._Str_10725(0);
                                }
                            }
                        }
                    }
                    return;
                case Keyboard.ENTER:
                    this._Str_25600();
                    return;
                case Keyboard.TAB:
                    this._Str_20500();
                    return;
            }
        }

        private function _Str_22293():Boolean
        {
            var k:Array;
            var _local_2:String;
            if (((!(this._friends == null)) && (this._friends.length > 0)))
            {
                k = [];
                for each (_local_2 in this._friends)
                {
                    k.push(_local_2);
                    if (k.length >= this._Str_21592)
                    {
                        break;
                    }
                }
                this._Str_20993(k);
                this._Str_6969(true);
                return true;
            }
            return false;
        }

        private function _Str_23182():void
        {
            if (this._window == null)
            {
                return;
            }
            var k:ITextFieldWindow = (this._window.findChildByName("name_input") as ITextFieldWindow);
            if (k == null)
            {
                return;
            }
            k.visible = true;
            k.focus();
        }

        private function _Str_20500():void
        {
            if (this._window == null)
            {
                return;
            }
            var k:ITextFieldWindow = (this._window.findChildByName("message_input") as ITextFieldWindow);
            if (k == null)
            {
                return;
            }
            k.visible = true;
            k.focus();
        }

        private function _Str_25600():void
        {
            if (((this._suggestionContainer == null) || (!(this._suggestionContainer.visible))))
            {
                return;
            }
            var k:IItemListWindow = (this._suggestionContainer.findChildByName("suggestion_list") as IItemListWindow);
            if (k == null)
            {
                return;
            }
            var _local_2:IWindowContainer = (k.getListItemAt(this._highlightIndex) as IWindowContainer);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IWindow = _local_2.findChildByName("name_text");
            if (_local_3 == null)
            {
                return;
            }
            this._Str_16023(_local_3.caption);
            this._Str_6969(false);
        }

        private function _Str_6969(k:Boolean):void
        {
            if (this._suggestionContainer == null)
            {
                return;
            }
            this._suggestionContainer.visible = k;
            if (!k)
            {
                this._Str_21511(true);
            }
        }

        private function _Str_21511(k:Boolean):void
        {
            var _local_2:IWindow = this._window.findChildByName("message_input");
            if (_local_2 != null)
            {
                _local_2.visible = k;
            }
        }

        private function _Str_23135(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            if (_local_2 == null)
            {
                return;
            }
            this._Str_13320();
        }

        private function _Str_24214(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            if (_local_2 == null)
            {
                return;
            }
            this._Str_11342();
        }

        private function _Str_22761(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            if (_local_2 == null)
            {
                return;
            }
            this._Str_11342();
        }

        private function _Str_25377(k:WindowEvent):void
        {
            this._Str_13320();
            this._Str_6969(false);
        }

        private function _Str_23611(k:WindowEvent):void
        {
            this._Str_13320();
        }

        private function _Str_11342():void
        {
            if (this._window == null)
            {
                return;
            }
            var k:IWindow = this._window.findChildByName("name_input");
            if (k == null)
            {
                return;
            }
            var _local_2:String = k.caption;
            if (((_local_2 == null) || (_local_2.length == 0)))
            {
                this._Str_15786(true, "name_input_hint", "catalog.gift_wrapping_new.name_hint");
            }
            else
            {
                this._Str_15786(false, "name_input_hint", "catalog.gift_wrapping_new.name_hint");
            }
        }

        private function _Str_13320():void
        {
            if (this._window == null)
            {
                return;
            }
            var k:IWindow = this._window.findChildByName("message_input");
            if (k == null)
            {
                return;
            }
            var _local_2:String = k.caption;
            if (((_local_2 == null) || (_local_2.length == 0)))
            {
                this._Str_15786(true, "message_input_hint", "catalog.gift_wrapping_new.message_hint");
            }
            else
            {
                this._Str_15786(false, "message_input_hint", "catalog.gift_wrapping_new.message_hint");
            }
        }

        private function _Str_15786(k:Boolean, _arg_2:String, _arg_3:String):void
        {
            var _local_4:ITextWindow = (this._window.findChildByName(_arg_2) as ITextWindow);
            if (_local_4 != null)
            {
                _local_4.text = this._localization.getLocalization(_arg_3);
                _local_4.visible = k;
            }
        }

        private function _Str_22696(k:Boolean):void
        {
            if (this._window == null)
            {
                return;
            }
            var _local_2:IWindow = this._window.findChildByName("ribbon_prev");
            this._Str_5244(_local_2, k);
            var _local_3:IWindow = this._window.findChildByName("ribbon_next");
            this._Str_5244(_local_3, k);
            var _local_4:IWindow = this._window.findChildByName("pick_ribbon_title");
            this._Str_5244(_local_4, k);
        }

        private function _Str_17818(k:Boolean):void
        {
            this._Str_21183(k);
            this._Str_22696(k);
        }

        private function _Str_21183(k:Boolean):void
        {
            if (this._window == null)
            {
                return;
            }
            var _local_2:IWindow = this._window.findChildByName("box_color_title");
            this._Str_5244(_local_2, k);
            var _local_3:IWindowContainer = (this._window.findChildByName("color_picker_container") as IWindowContainer);
            if (_local_3 != null)
            {
                this._Str_5244(_local_3, k);
            }
        }

        private function _Str_5244(k:IWindow, _arg_2:Boolean):void
        {
            var _local_3:IIterator;
            var _local_4:int;
            var _local_5:int;
            var _local_6:IWindow;
            this._Str_2513(k, _arg_2);
            if ((k is IIterable))
            {
                _local_3 = IIterable(k).iterator;
                _local_4 = _local_3.length;
                if (_local_4 > 0)
                {
                    _local_5 = 0;
                    while (_local_5 < _local_4)
                    {
                        _local_6 = (_local_3[_local_5] as IWindow);
                        if (_local_6 != null)
                        {
                            this._Str_2513(_local_6, _arg_2);
                            if ((_local_6 is IIterable))
                            {
                                this._Str_5244(_local_6, _arg_2);
                            }
                        }
                        _local_5++;
                    }
                }
            }
        }

        private function _Str_2513(k:IWindow, _arg_2:Boolean):void
        {
            if (_arg_2)
            {
                k.blend = 1;
                k.enable();
            }
            else
            {
                k.blend = 0.5;
                k.disable();
            }
        }

        private function _Str_20993(k:Array):void
        {
            var _local_4:String;
            var _local_5:IWindowContainer;
            var _local_6:ITextWindow;
            var _local_7:int;
            var _local_8:int;
            var _local_9:TextFormat;
            var _local_10:int;
            if (this._suggestionContainer == null)
            {
                this._suggestionContainer = (this._window.findChildByName("suggestion_container") as IWindowContainer);
            }
            if (this._suggestionsListItem == null)
            {
                this._suggestionsListItem = (this._catalog.utils.createWindow("suggestion_list_item_new") as IWindowContainer);
            }
            if (((this._suggestionContainer == null) || (this._suggestionsListItem == null)))
            {
                return;
            }
            var _local_2:IItemListWindow = (this._suggestionContainer.findChildByName("suggestion_list") as IItemListWindow);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.removeListItems();
            if (k.length == 0)
            {
                this._Str_6969(false);
                return;
            }
            this._Str_6969(true);
            var _local_3:int;
            for each (_local_4 in k)
            {
                _local_5 = (this._suggestionsListItem.clone() as IWindowContainer);
                if (_local_5 != null)
                {
                    _local_5.addEventListener(WindowMouseEvent.CLICK, this._Str_24462);
                    _local_5.addEventListener(WindowMouseEvent.OVER, this._Str_25764);
                    _local_6 = (_local_5.findChildByName("name_text") as ITextWindow);
                    if (_local_6 != null)
                    {
                        _local_6.text = _local_4;
                        if (this._receiverName != null)
                        {
                            _local_7 = this._receiverName.length;
                            if (_local_7 > 0)
                            {
                                _local_8 = _local_4.toLowerCase().search(this._receiverName.toLowerCase());
                                if (_local_8 != -1)
                                {
                                    _local_9 = _local_6.getTextFormat();
                                    _local_9.bold = true;
                                    _local_10 = (_local_8 + _local_7);
                                    if (_local_10 > _local_4.length)
                                    {
                                        _local_10 = _local_4.length;
                                    }
                                    _local_6.setTextFormat(_local_9, _local_8, _local_10);
                                }
                            }
                        }
                        _local_2.addListItem(_local_5);
                    }
                    _local_5.color = this._Str_751(_local_3);
                    _local_3++;
                }
            }
            this._Str_21511((k.length < 2));
            this._Str_10725(0);
        }

        private function _Str_24462(k:WindowEvent):void
        {
            var _local_2:IWindowContainer = (k.target as IWindowContainer);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:ITextWindow = (_local_2.findChildByName("name_text") as ITextWindow);
            if (_local_3 == null)
            {
                return;
            }
            this._Str_16023(_local_3.text);
            this._Str_6969(false);
        }

        private function _Str_25764(k:WindowEvent):void
        {
            var _local_2:IWindowContainer = (k.target as IWindowContainer);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IItemListWindow = (this._suggestionContainer.findChildByName("suggestion_list") as IItemListWindow);
            if (_local_3 == null)
            {
                return;
            }
            this._Str_10725(_local_3.getListItemIndex(_local_2));
        }

        private function _Str_10725(k:int):void
        {
            var _local_3:IWindowContainer;
            if (this._suggestionContainer == null)
            {
                return;
            }
            var _local_2:IItemListWindow = (this._suggestionContainer.findChildByName("suggestion_list") as IItemListWindow);
            if (_local_2 == null)
            {
                return;
            }
            _local_3 = (_local_2.getListItemAt(this._highlightIndex) as IWindowContainer);
            if (_local_3 != null)
            {
                _local_3.color = this._Str_751(this._highlightIndex);
            }
            this._highlightIndex = k;
            if (this._highlightIndex < 0)
            {
                this._highlightIndex = (_local_2.numListItems - 1);
            }
            if (this._highlightIndex >= _local_2.numListItems)
            {
                this._highlightIndex = 0;
            }
            _local_3 = (_local_2.getListItemAt(this._highlightIndex) as IWindowContainer);
            if (_local_3 != null)
            {
                _local_3.color = this._Str_22602;
            }
        }

        private function _Str_751(k:int):uint
        {
            return ((k % 2) == 0) ? this._Str_14861 : this._Str_15515;
        }

        private function _Str_16023(k:String):void
        {
            if (this._window == null)
            {
                return;
            }
            var _local_2:IWindow = this._window.findChildByName("name_input");
            if (_local_2 == null)
            {
                return;
            }
            _local_2.caption = k;
            this._Str_11342();
            this._Str_20500();
        }

        private function _Str_22731(k:WindowEvent):void
        {
            this._selectedTypeId = k.target.id;
            this._Str_19479();
            this._Str_3190();
        }

        private function _Str_19479():void
        {
            var _local_2:IWindowContainer;
            var _local_3:IWindow;
            if (this._window == null)
            {
                return;
            }
            var k:IItemGridWindow = (this._window.findChildByName("color_grid") as IItemGridWindow);
            if (k == null)
            {
                return;
            }
            var _local_4:int;
            while (_local_4 < k.numGridItems)
            {
                _local_2 = (k._Str_2830(_local_4) as IWindowContainer);
                if (_local_2 == null)
                {
                }
                else
                {
                    _local_3 = _local_2.findChildByName("selection");
                    if (_local_3 == null)
                    {
                    }
                    else
                    {
                        _local_3.visible = (_local_2.id == this._selectedTypeId);
                    }
                }
                _local_4++;
            }
        }

        public function _Str_23672():void
        {
            if (this.disposed)
            {
                return;
            }
            this._Str_4401(true);
            if (((!(this._catalog)) || (!(this._catalog.windowManager))))
            {
                return;
            }
            this._catalog.windowManager.alert(("$" + "{catalog.gift_wrapping.receiver_not_found.title}"), ("$" + "{catalog.gift_wrapping.receiver_not_found.info}"), 0, this._Str_18087);
        }

        private function _Str_18087(k:_Str_2418, _arg_2:WindowEvent):void
        {
            k.dispose();
            this._Str_4401(true);
        }

        private function _Str_4401(k:Boolean):void
        {
            if (this._window == null)
            {
                return;
            }
            var _local_2:IButtonWindow = (this._window.findChildByName("give_gift_button") as IButtonWindow);
            if (_local_2 != null)
            {
                if (k)
                {
                    _local_2.enable();
                }
                else
                {
                    _local_2.disable();
                }
            }
        }

        public function _Str_16424():void
        {
            if (this.disposed)
            {
                return;
            }
            if (this._window == null)
            {
                return;
            }
            this._Str_4401(true);
            this._Str_25035("header_button_close");
            var k:ICheckBoxWindow = (this._window.findChildByName("use_free_checkbox") as ICheckBoxWindow);
            if (k != null)
            {
                k.select();
            }
        }

        public function _Str_25849():void
        {
            var k:IWindow = this._window.findChildByName("buy_button");
            k.removeEventListener(WindowMouseEvent.CLICK, this._Str_13434);
            k.addEventListener(WindowMouseEvent.CLICK, this._Str_24474);
            k.caption = "${catalog.purchase_confirmation.gift}";
            this._window.caption = "${catalog.purchase_confirmation.gift.title}";
        }
    }
}
