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
    import com.sulake.habbo.window.utils.IAlertDialog;

    public class PurchaseConfirmationDialog implements IAvatarImageListener, IGetImageListener 
    {
        private const MAX_SUGGESTIONS:int = 10;
        private const COLOR_EVEN:uint = 4293848814;
        private const COLOR_ODD:uint = 0xFFFFFFFF;
        private const COLOR_HIGHLIGHT:uint = 4291613146;

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

        private static function isValentinesBox(k:int):Boolean
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
            this.showConfirmationDialog(_arg_3, _arg_10);
            this._catalog.syncPlacedOfferWithPurchase(_arg_3);
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

        public function getIconWrapper():IBitmapWrapperWindow
        {
            return (this._window) ? (this._window.findChildByName("product_image") as IBitmapWrapperWindow) : null;
        }

        public function isGiftPurchase():Boolean
        {
            return (!(this._receiverName == null)) && (!(this._receiverName == ""));
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (k == this._imageId)
            {
                this._imageId = 0;
                this.setImage(_arg_2, true);
            }
        }

        public function imageFailed(k:int):void
        {
        }

        private function setImage(k:BitmapData, _arg_2:Boolean):void
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

        private function showConfirmationDialog(k:IPurchasableOffer, _arg_2:BitmapData):void
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
            this.updateLocalizations(k);
            var _local_3:IWindowContainer = (this._window.findChildByName("purchase_cost_box") as IWindowContainer);
            this._catalog.utils._Str_6455(_local_3, k, this._quantity);
            this.addClickListener("buy_button", this.onBuyButtonClick);
            this.addClickListener("cancel_button", this.onClose);
            this.addClickListener("header_button_close", this.onClose);
            this._window.center();
            if (this._catalog.getBoolean("disclaimer.credit_spending.enabled"))
            {
                this._window.findChildByName("spending_disclaimer").addEventListener(WindowMouseEvent.CLICK, this.onSpendingDisclaimerClicked);
                this._window.findChildByName("spending_disclaimer").addEventListener(WindowMouseEvent.DOUBLE_CLICK, this.onSpendingDisclaimerClicked);
                this.setDisclaimerAccepted(false);
            }
            else
            {
                this._window.findChildByName("disclaimer").dispose();
                this.setDisclaimerAccepted(true);
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
                if (((this._catalog.multiplePurchaseEnabled) && (this._quantity > 1)))
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
                if (ProductImageConfiguration.hasProductImage(k.localizationId))
                {
                    _local_10 = ProductImageConfiguration.PRODUCT_IMAGES[k.localizationId];
                    _local_11 = (this._assets.getAssetByName(_local_10) as BitmapDataAsset);
                    if (_local_11)
                    {
                        this.setImage((_local_11.content as BitmapData), false);
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
                    this.setImage(_local_14, true);
                    _Str_11981._Str_21471(k, (this._window.findChildByName("buy_button") as IButtonWindow));
                }
            }
        }

        private function onSpendingDisclaimerClicked(k:WindowMouseEvent):void
        {
            var _local_2:ICheckBoxWindow = (k.target as ICheckBoxWindow);
            if (_local_2 != null)
            {
                this.setDisclaimerAccepted(_local_2.Selected);
            }
        }

        private function setDisclaimerAccepted(k:Boolean):void
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

        private function updateLocalizations(k:IPurchasableOffer):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:IProductData = this._catalog.getProductData(k.localizationId);
            var _local_3:String = ((_local_2 == null) ? "" : _local_2.name);
            this._catalog.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.costs", "offer_name", _local_3);
        }

        private function addClickListener(k:String, _arg_2:Function):void
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

        public function avatarImageReady(k:String):void
        {
            if (((((this._catalog == null) || (this._window == null)) || (this._window.disposed)) || (this.disposed)))
            {
                return;
            }
            if (k == this._catalog.sessionDataManager.figure)
            {
                this.updateGiftDialogAvatarImage();
            }
            var _local_2:IAvatarImage = this._catalog.avatarRenderManager.createAvatarImage(k, AvatarScaleType.LARGE, null, this);
            _local_2.setDirection(AvatarSetType.FULL, 3);
            _local_2.appendAction(AvatarAction.EXPRESSION_WAVE);
            _local_2.appendAction(AvatarAction.GESTURE, AvatarAction.GESTURE_SMILE);
            var _local_3:BitmapData = _local_2.getImage(AvatarSetType.FULL, true);
            _local_2.dispose();
            this.setImage(_local_3, true);
        }

        private function enableGiftDialogAvatarImage(k:Boolean):void
        {
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName("avatar_image") as IBitmapWrapperWindow);
            if (_local_2 != null)
            {
                if (k)
                {
                    this.updateGiftDialogAvatarImage();
                }
                else
                {
                    this.updateUnknownSenderAvatarImage();
                }
            }
            var _local_3:ITextWindow = (this._window.findChildByName("message_from") as ITextWindow);
            if (_local_3 != null)
            {
                _local_3.visible = k;
            }
        }

        private function updateGiftDialogAvatarImage():void
        {
            var k:BitmapData = this.getAvatarFaceBitmap(this._catalog.sessionDataManager.figure);
            if (k != null)
            {
                this.updateAvatarImage(k);
            }
        }

        private function updateUnknownSenderAvatarImage():void
        {
            var _local_2:BitmapData;
            var k:BitmapDataAsset = (this._assets.getAssetByName("gift_incognito") as BitmapDataAsset);
            if (k != null)
            {
                _local_2 = (k.content as BitmapData);
                if (_local_2 != null)
                {
                    this.updateAvatarImage(_local_2.clone());
                }
            }
        }

        private function updateAvatarImage(k:BitmapData):void
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

        private function onShowFaceSelected(k:WindowEvent):void
        {
            this.enableGiftDialogAvatarImage(true);
            this.updateGiftDialogAvatarImage();
        }

        private function onShowFaceUnselected(k:WindowEvent):void
        {
            this.enableGiftDialogAvatarImage(false);
        }

        private function isShowPurchaserName():Boolean
        {
            var k:ICheckBoxWindow;
            if (this.isModerator())
            {
                if (this._window != null)
                {
                    k = (this._window.findChildByName("show_face_checkbox") as ICheckBoxWindow);
                    if (k != null)
                    {
                        return k.Selected;
                    }
                }
                return false;
            }
            return true;
        }

        private function updateGiftDialogLabels():void
        {
            var _local_9:IWindow;
            if (((this._window == null) || (this._window.disposed)))
            {
                return;
            }
            var k:Boolean = this.isDefaultBoxSelected();
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

        public function showGiftDialog():void
        {
            var _local_8:String;
            var _local_9:String;
            var _local_10:String;
            var _local_11:Number;
            if (this._window != null)
            {
                this._window.dispose();
            }
            var k:GiftWrappingConfiguration = this._catalog.giftWrappingConfiguration;
            this._window = (this._catalog.utils.createWindow("gift_wrapping") as IFrameWindow);
            if (this._window == null)
            {
                return;
            }
            this._window.center();
            this.addClickListener("give_gift_button", this.onGiveGiftButtonClick);
            this.addClickListener("cancel_link_region", this.onCancelGift);
            this.addClickListener("header_button_close", this.onCancelGift);
            var _local_2:IWindow = this._window.findChildByName("name_input");
            if (_local_2 != null)
            {
                if (this._userName != null)
                {
                    this.setReceiverName(this._userName);
                }
                else
                {
                    this.focusNameField();
                }
                this.updateNameHint();
                _local_2.addEventListener(WindowEvent.WINDOW_EVENT_CHANGE, this.onNameInputChange);
                _local_2.addEventListener(WindowMouseEvent.DOWN, this.onNameInputMouseDown);
                _local_2.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_UP, this.onNameInputKeyUp);
                _local_2.addEventListener(WindowEvent.WINDOW_EVENT_FOCUSED, this.onNameInputFocus);
                _local_2.addEventListener(WindowEvent.WINDOW_EVENT_UNFOCUSED, this.onNameInputUnfocus);
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
                if (this.isModerator())
                {
                    _local_4.visible = true;
                    _local_4.select();
                    _local_4.addEventListener(WindowEvent.WINDOW_EVENT_SELECT, this.onShowFaceSelected);
                    _local_4.addEventListener(WindowEvent.WINDOW_EVENT_UNSELECT, this.onShowFaceUnselected);
                }
                else
                {
                    _local_4.visible = false;
                }
            }
            var _local_5:IWindow = this._window.findChildByName("show_face_checkbox_title");
            if (((!(_local_5 == null)) && (!(this.isModerator()))))
            {
                _local_5.visible = false;
            }
            this.updateGiftDialogAvatarImage();
            var _local_6:IWindow = this._window.findChildByName("message_input");
            if (_local_6 != null)
            {
                this.updateMessageHint();
                _local_6.addEventListener(WindowEvent.WINDOW_EVENT_CHANGE, this.onMessageInputChange);
                _local_6.addEventListener(WindowEvent.WINDOW_EVENT_FOCUSED, this.onMessageInputFocus);
                _local_6.addEventListener(WindowEvent.WINDOW_EVENT_UNFOCUSED, this.onMessageInputUnfocus);
            }
            var _local_7:IWindow = this._window.findChildByName("message_from");
            if (_local_7 != null)
            {
                _local_9 = this._catalog.sessionDataManager.userName;
                _local_10 = "catalog.gift_wrapping_new.message_from";
                this._localization.registerParameter(_local_10, "name", _local_9);
                _local_7.caption = this._localization.getLocalization(_local_10, _local_9);
            }
            this.addClickListener("ribbon_prev", this.onPreviousGiftWrap);
            this.addClickListener("ribbon_next", this.onNextGiftWrap);
            this.addClickListener("box_prev", this.onPreviousGiftBox);
            this.addClickListener("box_next", this.onNextGiftBox);
            this._localization.registerParameter("catalog.gift_wrapping_new.price", "price", k.price.toString());
            if (k.defaultStuffTypes.length > 0)
            {
                _local_11 = Math.floor((Math.random() * k.defaultStuffTypes.length));
                this._defaultStuffType = k.defaultStuffTypes[_local_11];
            }
            this._stuffTypes = k.stuffTypes;
            this._boxTypes = this._boxTypes.concat(k.boxTypes);
            this._boxTypes.push(this._defaultStuffType);
            this._ribbonTypes = k.ribbonTypes;
            this._selectedTypeId = this._stuffTypes[0];
            this._ribbonIndex = this._ribbonTypes[0];
            this._boxIndex = this._catalog.getInteger("catalog.purchase.gift_wrapping.default_box_index", 0);
            if (((this._boxIndex < 0) || (this._boxIndex > (this._boxTypes.length - 1))))
            {
                this._boxIndex = 0;
            }
            this.initColorGrid();
            this.updateColorGrid();
            this.updatePreview();
        }

        private function isModerator():Boolean
        {
            return this._catalog.sessionDataManager.hasSecurity(SecurityLevelEnum.MODERATOR);
        }

        private function isDefaultBoxSelected():Boolean
        {
            return this._boxTypes[this._boxIndex] == this._defaultStuffType;
        }

        private function updatePreview():void
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
            if (isValentinesBox(k))
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
            var _local_5:Boolean = this.isDefaultBoxSelected();
            if (_local_5)
            {
                this.enableBoxColorAndRibbonSelectors(false);
                _local_4 = this._defaultStuffType;
                _local_3 = "";
            }
            else
            {
                if (isValentinesBox(k))
                {
                    this.enableBoxColorAndRibbonSelectors(false);
                }
                else
                {
                    this.enableBoxColorAndRibbonSelectors(true);
                    if (((k >= 3) && (k <= 6)))
                    {
                        this.enableBoxColorSelectors(false);
                    }
                }
            }
            var _local_6:ImageResult = this._roomEngine.getFurnitureImage(_local_4, new Vector3d(180), 64, this, 0, _local_3);
            if (_local_6 == null)
            {
                return;
            }
            this._imageId = _local_6.id;
            this.setImage(_local_6.data, true);
            this.showSuggestions(false);
            this.updateGiftDialogLabels();
        }

        private function initColorGrid():void
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
                    _local_5.addEventListener(WindowMouseEvent.CLICK, this.onColorItemClick);
                    _local_5.findChildByName("color").color = _local_4.colours[0];
                    _local_5.id = _local_3;
                    k.addGridItem(_local_5);
                }
            }
        }

        private function giveGift():void
        {
            var k:IWindow = this._window.findChildByName("name_input");
            if (k == null)
            {
                return;
            }
            var _local_2:String = k.caption;
            var _local_3:IWindow = this._window.findChildByName("message_input");
            var _local_4:String = ((_local_3 == null) ? "" : _local_3.caption);
            var _local_5:Boolean = this.isDefaultBoxSelected();
            var _local_6:int = ((_local_5) ? this._defaultStuffType : this._selectedTypeId);
            var _local_7:int = ((_local_5) ? 0 : this._boxTypes[this._boxIndex]);
            var _local_8:int = ((_local_5) ? 0 : this._ribbonTypes[this._ribbonIndex]);
            var _local_9:Boolean = this.isShowPurchaserName();
            this._catalog.purchaseProductAsGift(this._pageId, this._offerId, this._extraParameter, _local_2, _local_4, _local_6, _local_7, _local_8, _local_9);
        }

        private function safeDisable(k:String):void
        {
            var _local_2:IWindow = this._window.findChildByName(k);
            if (_local_2 != null)
            {
                _local_2.disable();
            }
        }

        private function safeEnable(k:String):void
        {
            var _local_2:IWindow = this._window.findChildByName(k);
            if (_local_2 != null)
            {
                _local_2.enable();
            }
        }

        private function onBuyButtonClick(k:WindowEvent):void
        {
            this.safeDisable("buy_button");
            this.safeDisable("cancel_button");
            this.safeDisable("publish_check");
            this._catalog.purchaseProduct(this._pageId, this._offerId, this._extraParameter, this._quantity);
            var _local_2:ICatalogPage = this._catalog.currentPage;
            if (_local_2 != null)
            {
                _local_2.dispatchWidgetEvent(new _Str_3308(CatalogWidgetEvent.PURCHASE));
            }
        }

        private function onGiftButtonClick(k:WindowEvent):void
        {
            this.showGiftDialog();
            HabboTracking.getInstance().trackEventLog("Catalog", "clickConfirm", "client.buy_as_gift.clicked");
        }

        private function onClose(k:WindowEvent):void
        {
            this._catalog.resetPlacedOfferData();
            this.dispose();
        }

        private function onGiveGiftButtonClick(k:WindowEvent):void
        {
            this.giveGift();
            this.enableGiftButton(false);
            this._catalog.giftReceiver = null;
            this._catalog.resetPlacedOfferData();
        }

        private function onCancelGift(k:WindowEvent):void
        {
            this._catalog.resetPlacedOfferData();
            this.dispose();
        }

        private function onPreviousGiftWrap(k:WindowEvent):void
        {
            this._ribbonIndex--;
            this.updatePreview();
        }

        private function onNextGiftWrap(k:WindowEvent):void
        {
            this._ribbonIndex++;
            this.updatePreview();
        }

        private function onPreviousGiftBox(k:WindowEvent):void
        {
            this._boxIndex--;
            this.updatePreview();
        }

        private function onNextGiftBox(k:WindowEvent):void
        {
            this._boxIndex++;
            this.updatePreview();
        }

        private function onNameInputChange(k:WindowEvent):void
        {
            var _local_5:String;
            var _local_2:IWindow = k.target;
            if (_local_2 == null)
            {
                return;
            }
            this.updateNameHint();
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
                if (_local_4.length >= this.MAX_SUGGESTIONS)
                {
                    break;
                }
            }
            this._receiverName = _local_2.caption;
            this.updateSuggestions(_local_4);
        }

        private function onNameInputMouseDown(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            if (_local_2 == null)
            {
                return;
            }
            this.showSuggestions(false);
        }

        private function onNameInputKeyUp(k:WindowEvent):void
        {
            var _local_4:Boolean;
            var _local_2:WindowKeyboardEvent = (k as WindowKeyboardEvent);
            var _local_3:IWindow = k.target;
            switch (_local_2.keyCode)
            {
                case Keyboard.UP:
                    this.highlightSuggestion((this._highlightIndex - 1));
                    return;
                case Keyboard.DOWN:
                    this.highlightSuggestion((this._highlightIndex + 1));
                    if (_local_3 != null)
                    {
                        if (_local_3.caption.length == 0)
                        {
                            if (((this._suggestionContainer == null) || (!(this._suggestionContainer.visible))))
                            {
                                _local_4 = this.showAllFriendSuggestions();
                                if (_local_4)
                                {
                                    this.highlightSuggestion(0);
                                }
                            }
                        }
                    }
                    return;
                case Keyboard.ENTER:
                    this.selectHighlighted();
                    return;
                case Keyboard.TAB:
                    this.focusMessageField();
                    return;
            }
        }

        private function showAllFriendSuggestions():Boolean
        {
            var k:Array;
            var _local_2:String;
            if (((!(this._friends == null)) && (this._friends.length > 0)))
            {
                k = [];
                for each (_local_2 in this._friends)
                {
                    k.push(_local_2);
                    if (k.length >= this.MAX_SUGGESTIONS)
                    {
                        break;
                    }
                }
                this.updateSuggestions(k);
                this.showSuggestions(true);
                return true;
            }
            return false;
        }

        private function focusNameField():void
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

        private function focusMessageField():void
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

        private function selectHighlighted():void
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
            this.setReceiverName(_local_3.caption);
            this.showSuggestions(false);
        }

        private function showSuggestions(k:Boolean):void
        {
            if (this._suggestionContainer == null)
            {
                return;
            }
            this._suggestionContainer.visible = k;
            if (!k)
            {
                this.showMessageInput(true);
            }
        }

        private function showMessageInput(k:Boolean):void
        {
            var _local_2:IWindow = this._window.findChildByName("message_input");
            if (_local_2 != null)
            {
                _local_2.visible = k;
            }
        }

        private function onMessageInputChange(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            if (_local_2 == null)
            {
                return;
            }
            this.updateMessageHint();
        }

        private function onNameInputFocus(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            if (_local_2 == null)
            {
                return;
            }
            this.updateNameHint();
        }

        private function onNameInputUnfocus(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            if (_local_2 == null)
            {
                return;
            }
            this.updateNameHint();
        }

        private function onMessageInputFocus(k:WindowEvent):void
        {
            this.updateMessageHint();
            this.showSuggestions(false);
        }

        private function onMessageInputUnfocus(k:WindowEvent):void
        {
            this.updateMessageHint();
        }

        private function updateNameHint():void
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
                this.enableHint(true, "name_input_hint", "catalog.gift_wrapping_new.name_hint");
            }
            else
            {
                this.enableHint(false, "name_input_hint", "catalog.gift_wrapping_new.name_hint");
            }
        }

        private function updateMessageHint():void
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
                this.enableHint(true, "message_input_hint", "catalog.gift_wrapping_new.message_hint");
            }
            else
            {
                this.enableHint(false, "message_input_hint", "catalog.gift_wrapping_new.message_hint");
            }
        }

        private function enableHint(k:Boolean, _arg_2:String, _arg_3:String):void
        {
            var _local_4:ITextWindow = (this._window.findChildByName(_arg_2) as ITextWindow);
            if (_local_4 != null)
            {
                _local_4.text = this._localization.getLocalization(_arg_3);
                _local_4.visible = k;
            }
        }

        private function enableRibbonSelectors(k:Boolean):void
        {
            if (this._window == null)
            {
                return;
            }
            var _local_2:IWindow = this._window.findChildByName("ribbon_prev");
            this.enableWindow(_local_2, k);
            var _local_3:IWindow = this._window.findChildByName("ribbon_next");
            this.enableWindow(_local_3, k);
            var _local_4:IWindow = this._window.findChildByName("pick_ribbon_title");
            this.enableWindow(_local_4, k);
        }

        private function enableBoxColorAndRibbonSelectors(k:Boolean):void
        {
            this.enableBoxColorSelectors(k);
            this.enableRibbonSelectors(k);
        }

        private function enableBoxColorSelectors(k:Boolean):void
        {
            if (this._window == null)
            {
                return;
            }
            var _local_2:IWindow = this._window.findChildByName("box_color_title");
            this.enableWindow(_local_2, k);
            var _local_3:IWindowContainer = (this._window.findChildByName("color_picker_container") as IWindowContainer);
            if (_local_3 != null)
            {
                this.enableWindow(_local_3, k);
            }
        }

        private function enableWindow(k:IWindow, _arg_2:Boolean):void
        {
            var _local_3:IIterator;
            var _local_4:int;
            var _local_5:int;
            var _local_6:IWindow;
            this.enableElement(k, _arg_2);
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
                            this.enableElement(_local_6, _arg_2);
                            if ((_local_6 is IIterable))
                            {
                                this.enableWindow(_local_6, _arg_2);
                            }
                        }
                        _local_5++;
                    }
                }
            }
        }

        private function enableElement(k:IWindow, _arg_2:Boolean):void
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

        private function updateSuggestions(k:Array):void
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
                this.showSuggestions(false);
                return;
            }
            this.showSuggestions(true);
            var _local_3:int;
            for each (_local_4 in k)
            {
                _local_5 = (this._suggestionsListItem.clone() as IWindowContainer);
                if (_local_5 != null)
                {
                    _local_5.addEventListener(WindowMouseEvent.CLICK, this.onSuggestionsClick);
                    _local_5.addEventListener(WindowMouseEvent.OVER, this.onSuggestionsMouseOver);
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
                    _local_5.color = this.getColor(_local_3);
                    _local_3++;
                }
            }
            this.showMessageInput((k.length < 2));
            this.highlightSuggestion(0);
        }

        private function onSuggestionsClick(k:WindowEvent):void
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
            this.setReceiverName(_local_3.text);
            this.showSuggestions(false);
        }

        private function onSuggestionsMouseOver(k:WindowEvent):void
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
            this.highlightSuggestion(_local_3.getListItemIndex(_local_2));
        }

        private function highlightSuggestion(k:int):void
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
                _local_3.color = this.getColor(this._highlightIndex);
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
                _local_3.color = this.COLOR_HIGHLIGHT;
            }
        }

        private function getColor(k:int):uint
        {
            return ((k % 2) == 0) ? this.COLOR_EVEN : this.COLOR_ODD;
        }

        private function setReceiverName(k:String):void
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
            this.updateNameHint();
            this.focusMessageField();
        }

        private function onColorItemClick(k:WindowEvent):void
        {
            this._selectedTypeId = k.target.id;
            this.updateColorGrid();
            this.updatePreview();
        }

        private function updateColorGrid():void
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
                _local_2 = (k.getGridItemAt(_local_4) as IWindowContainer);
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

        public function receiverNotFound():void
        {
            if (this.disposed)
            {
                return;
            }
            this.enableGiftButton(true);
            if (((!(this._catalog)) || (!(this._catalog.windowManager))))
            {
                return;
            }
            this._catalog.windowManager.alert(("$" + "{catalog.gift_wrapping.receiver_not_found.title}"), ("$" + "{catalog.gift_wrapping.receiver_not_found.info}"), 0, this.alertHandler);
        }

        private function alertHandler(k:IAlertDialog, _arg_2:WindowEvent):void
        {
            k.dispose();
            this.enableGiftButton(true);
        }

        private function enableGiftButton(k:Boolean):void
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

        public function notEnoughCredits():void
        {
            if (this.disposed)
            {
                return;
            }
            if (this._window == null)
            {
                return;
            }
            this.enableGiftButton(true);
            this.safeEnable("header_button_close");
            var k:ICheckBoxWindow = (this._window.findChildByName("use_free_checkbox") as ICheckBoxWindow);
            if (k != null)
            {
                k.select();
            }
        }

        public function turnIntoGifting():void
        {
            var k:IWindow = this._window.findChildByName("buy_button");
            k.removeEventListener(WindowMouseEvent.CLICK, this.onBuyButtonClick);
            k.addEventListener(WindowMouseEvent.CLICK, this.onGiftButtonClick);
            k.caption = "${catalog.purchase_confirmation.gift}";
            this._window.caption = "${catalog.purchase_confirmation.gift.title}";
        }
    }
}
