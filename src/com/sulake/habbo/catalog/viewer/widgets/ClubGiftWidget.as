package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.club.ClubGiftController;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_2853;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_5178;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.catalog.viewer.Product;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.catalog.viewer.Offer;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.habbo.catalog.viewer.IProductContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import flash.geom.Rectangle;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.assets.XmlAsset;
    import __AS3__.vec.*;

    public class ClubGiftWidget extends CatalogWidget
    {
        private const _Str_6060:int = 31;

        private var _controller:ClubGiftController;
        private var _offers:Map;
        private var _preview:IWindowContainer;
        private var _catalog:HabboCatalog;

        public function ClubGiftWidget(k:IWindowContainer, _arg_2:ClubGiftController, _arg_3:HabboCatalog)
        {
            super(k);
            this._catalog = _arg_3;
            this._controller = _arg_2;
            this._offers = new Map();
        }

        override public function dispose():void
        {
            super.dispose();
            this._controller = null;
            this._catalog = null;
            if (this._preview)
            {
                this._preview.dispose();
                this._preview = null;
            }
        }

        override public function init():Boolean
        {
            if (!window)
            {
                return false;
            }
            if (!super.init())
            {
                return false;
            }
            this._controller.widget = this;
            _Str_2819(CatalogWidgetEnum.CLUB_GIFT);
            _window.findChildByName("info_text").caption = "";
            _window.findChildByName("past_club_days").caption = "";
            _window.findChildByName("past_vip_days").caption = "";
            this.update();
            return true;
        }

        public function update():void
        {
            this._Str_11602();
            this._Str_11855();
        }

        private function _Str_11602():void
        {
            var _local_2:String;
            var _local_3:int;
            var _local_4:int;
            var _local_7:int;
            if (((!(this._controller)) || (!(window))))
            {
                return;
            }
            var k:IWindow = window.findChildByName("info_text");
            if (!k)
            {
                return;
            }
            if (this._controller._Str_7574 > 0)
            {
                _local_2 = "catalog.club_gift.available";
                this._controller.localization.registerParameter(_local_2, "amount", this._controller._Str_7574.toString());
            }
            else
            {
                if (this._controller._Str_12860 > 0)
                {
                    _local_2 = "catalog.club_gift.days_until_next";
                    this._controller.localization.registerParameter(_local_2, "days", this._controller._Str_12860.toString());
                }
                else
                {
                    if (this._controller._Str_6454)
                    {
                        _local_2 = "catalog.club_gift.not_available";
                    }
                    else
                    {
                        _local_2 = "catalog.club_gift.no_club";
                    }
                }
            }
            k.caption = this._controller.localization.getLocalization(_local_2);
            if (!this._controller.purse)
            {
                return;
            }
            var _local_5:IWindow = window.findChildByName("past_club_days");
            if (_local_5)
            {
                _local_7 = (this._controller.purse.pastClubDays + this._controller.purse.pastVipDays);
                _local_2 = ((_local_7 >= this._Str_6060) ? "catalog.club_gift.past_club.long" : "catalog.club_gift.past_club");
                _local_3 = (_local_7 % this._Str_6060);
                _local_4 = (_local_7 / this._Str_6060);
                this._controller.localization.registerParameter(_local_2, "days", _local_3.toString());
                this._controller.localization.registerParameter(_local_2, "months", _local_4.toString());
                _local_5.caption = this._controller.localization.getLocalization(_local_2);
            }
            var _local_6:IWindow = window.findChildByName("past_vip_days");
            if (_local_6)
            {
                _local_2 = ((this._controller.purse.pastVipDays >= this._Str_6060) ? "catalog.club_gift.past_vip.long" : "catalog.club_gift.past_vip");
                _local_3 = (this._controller.purse.pastVipDays % this._Str_6060);
                _local_4 = (this._controller.purse.pastVipDays / this._Str_6060);
                this._controller.localization.registerParameter(_local_2, "days", _local_3.toString());
                this._controller.localization.registerParameter(_local_2, "months", _local_4.toString());
                _local_6.caption = this._controller.localization.getLocalization(_local_2);
            }
        }

        private function _Str_11855():void
        {
            var k:IPurchasableOffer;
            var _local_2:Array;
            var _local_5:IWindow;
            var _local_6:CatalogPageMessageOfferData;
            var _local_7:Vector.<IProduct>;
            var _local_8:IProductData;
            var _local_9:_Str_2853;
            var _local_10:_Str_5178;
            var _local_11:IFurnitureData;
            var _local_12:Product;
            if ((((!(this._controller)) || (!(window))) || (!(page))))
            {
                return;
            }
            for each (k in this._offers)
            {
                k.dispose();
            }
            this._offers.reset();
            _local_2 = this._controller._Str_16489();
            if (!_local_2)
            {
                return;
            }
            var _local_3:Map = this._controller._Str_23509();
            if (!_local_3)
            {
                return;
            }
            var _local_4:IItemListWindow = (window.findChildByName("gift_list") as IItemListWindow);
            if (!_local_4)
            {
                return;
            }
            _local_4.destroyListItems();
            for each (_local_6 in _local_2)
            {
                _local_7 = new Vector.<IProduct>(0);
                _local_8 = this._controller.catalog.getProductData(_local_6.localizationId);
                for each (_local_9 in _local_6.products)
                {
                    _local_11 = this._controller.catalog.getFurnitureData(_local_9._Str_6164, _local_9.productType);
                    _local_12 = new Product(_local_9.productType, _local_9._Str_6164, _local_9.extraParam, _local_9.productCount, _local_8, _local_11, this._catalog);
                    _local_7.push(_local_12);
                }
                k = new Offer(_local_6.offerId, _local_6.localizationId, _local_6.isRent, _local_6.priceInCredits, _local_6.priceInActivityPoints, _local_6.activityPointType, _local_6.giftable, _local_6.clubLevel, _local_7, _local_6.bundlePurchaseAllowed, this._catalog);
                k.page = page;
                _local_10 = (_local_3.getValue(k.offerId) as _Str_5178);
                _local_5 = this._Str_6850(k, _local_10);
                if (!_local_5)
                {
                }
                else
                {
                    _local_4.addListItem(_local_5);
                    this._offers.add(k.offerId, k);
                }
            }
        }

        private function _Str_6850(k:IPurchasableOffer, _arg_2:_Str_5178):IWindow
        {
            var _local_6:int;
            var _local_7:String;
            var _local_12:int;
            var _local_13:int;
            if ((((!(k)) || (!(k.product))) || (!(_arg_2))))
            {
                return null;
            }
            var _local_3:IWindowContainer = (this.createWindow("club_gift_list_item") as IWindowContainer);
            if (!_local_3)
            {
                return null;
            }
            _local_3.procedure = this._Str_4612;
            var _local_4:IProduct = k.product;
            if (!_local_4)
            {
                return null;
            }
            var _local_5:IProductData = _local_4.productData;
            if (!_local_5)
            {
                return null;
            }
            this._Str_2497(_local_3.findChildByName("gift_name"), _local_5.name);
            this._Str_2497(_local_3.findChildByName("gift_desc"), _local_5.description);
            if (_arg_2._Str_12313)
            {
                _local_6 = (_arg_2._Str_21146 - this._controller.purse.pastVipDays);
            }
            else
            {
                _local_6 = (_arg_2._Str_21146 - (this._controller.purse.pastClubDays + this._controller.purse.pastVipDays));
            }
            if (((!(_arg_2.isSelectable)) && (_local_6 > 0)))
            {
                if (_arg_2._Str_12313)
                {
                    _local_7 = "catalog.club_gift.vip_missing";
                }
                else
                {
                    _local_7 = "catalog.club_gift.club_missing";
                }
                if (_local_6 >= this._Str_6060)
                {
                    _local_7 = (_local_7 + ".long");
                }
                _local_12 = (_local_6 % this._Str_6060);
                _local_13 = (_local_6 / this._Str_6060);
                this._controller.localization.registerParameter(_local_7, "days", _local_12.toString());
                this._controller.localization.registerParameter(_local_7, "months", _local_13.toString());
            }
            else
            {
                if (this._controller._Str_7574 > 0)
                {
                    _local_7 = "catalog.club_gift.selectable";
                }
                else
                {
                    _local_7 = "";
                }
            }
            this._Str_2497(_local_3.findChildByName("months_required"), ((_local_7.length > 0) ? this._controller.localization.getLocalization(_local_7) : ""));
            var _local_8:IIconWindow = (_local_3.findChildByName("vip_icon") as IIconWindow);
            if (_local_8)
            {
                _local_8.visible = _arg_2._Str_12313;
            }
            var _local_9:IButtonWindow = (_local_3.findChildByName("select_button") as IButtonWindow);
            if (_local_9)
            {
                if (((_arg_2.isSelectable) && (this._controller._Str_7574 > 0)))
                {
                    _local_9.enable();
                }
                else
                {
                    _local_9.disable();
                }
                _local_9.id = k.offerId;
            }
            var _local_10:IProductContainer = k.productContainer;
            if (!_local_10)
            {
                return null;
            }
            if ((((!(page)) || (!(page.viewer))) || (!(page.viewer.roomEngine))))
            {
                return null;
            }
            var _local_11:IWindowContainer = (_local_3.findChildByName("image_container") as IWindowContainer);
            if (_local_11)
            {
                _local_10.view = _local_11;
                _local_10.initProductIcon(page.viewer.roomEngine);
                _local_11.procedure = this._Str_24976;
                _local_11.id = k.offerId;
            }
            return _local_3;
        }

        private function _Str_2497(k:IWindow, _arg_2:String):void
        {
            k.caption = _arg_2;
        }

        private function _Str_4612(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((((!(k)) || (!(_arg_2))) || (!(this._offers))) || (!(this._controller))))
            {
                return;
            }
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (_arg_2.name != "select_button")
            {
                return;
            }
            var _local_3:IPurchasableOffer = this._offers.getValue(_arg_2.id);
            if (!_local_3)
            {
                return;
            }
            this._controller._Str_24080(_local_3);
        }

        private function _Str_24976(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:Rectangle;
            if ((((!(k)) || (!(_arg_2))) || (!(this._offers))))
            {
                return;
            }
            if (_arg_2.name != "image_container")
            {
                return;
            }
            var _local_3:IPurchasableOffer = this._offers.getValue(_arg_2.id);
            if (!_local_3)
            {
                return;
            }
            if (k.type == WindowMouseEvent.OVER)
            {
                _local_4 = new Rectangle();
                _arg_2.getGlobalRectangle(_local_4);
            }
            if (k.type == WindowMouseEvent.OUT)
            {
                this._Str_23606();
            }
        }

        private function _Str_9202(k:Offer, _arg_2:Rectangle):void
        {
            var _local_5:ImageResult;
            if (((!(k)) || (!(k.productContainer))))
            {
                return;
            }
            if ((((!(page)) || (!(page.viewer))) || (!(page.viewer.roomEngine))))
            {
                return;
            }
            var _local_3:IProduct = k.product;
            if (!_local_3)
            {
                return;
            }
            if (!this._preview)
            {
                this._preview = (this.createWindow("club_gift_preview") as IWindowContainer);
            }
            if (!this._preview)
            {
                return;
            }
            var _local_4:IBitmapWrapperWindow = (this._preview.findChildByName("image") as IBitmapWrapperWindow);
            if (!_local_4)
            {
                return;
            }
            switch (_local_3.productType)
            {
                case ProductTypeEnum.FLOOR:
                    _local_5 = page.viewer.roomEngine.getFurnitureImage(_local_3.productClassId, new Vector3d(90), 64, null, 0, _local_3.extraParam);
                    break;
                case ProductTypeEnum.WALL:
                    _local_5 = page.viewer.roomEngine.getWallItemImage(_local_3.productClassId, new Vector3d(90), 64, null, 0, _local_3.extraParam);
                    break;
                default:
                    return;
            }
            if (((!(_local_5)) || (!(_local_5.data))))
            {
                return;
            }
            _local_4.width = _local_5.data.width;
            _local_4.height = _local_5.data.height;
            if (_local_4.bitmap)
            {
                _local_4.bitmap.dispose();
            }
            _local_4.bitmap = new BitmapData(_local_4.width, _local_4.height);
            _local_4.bitmap.draw(_local_5.data);
            _local_5.data.dispose();
            var _local_6:Point = Point.interpolate(_arg_2.topLeft, _arg_2.bottomRight, 0.5);
            this._preview.setGlobalPosition(_local_6.subtract(new Point((this._preview.width / 2), (this._preview.height / 2))));
            this._preview.visible = true;
            this._preview.activate();
        }

        private function _Str_23606():void
        {
            if (this._preview)
            {
                this._preview.visible = false;
            }
        }

        private function createWindow(k:String):IWindow
        {
            if ((((!(this._controller)) || (!(this._controller.assets))) || (!(this._controller.windowManager))))
            {
                return null;
            }
            var _local_2:XmlAsset = (this._controller.assets.getAssetByName(k) as XmlAsset);
            if (((!(_local_2)) || (!(_local_2.content))))
            {
                return null;
            }
            var _local_3:XML = (_local_2.content as XML);
            if (!_local_3)
            {
                return null;
            }
            return this._controller.windowManager.buildFromXML(_local_3);
        }
    }
}
