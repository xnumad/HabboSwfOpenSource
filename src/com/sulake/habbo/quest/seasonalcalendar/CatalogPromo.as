package com.sulake.habbo.quest.seasonalcalendar
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.session.product.IProductDataListener;
    import com.sulake.habbo.quest.HabboQuestEngine;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_2853;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_7445;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_5264;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_7426;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.roomevents.Util;
    import com.sulake.core.window.IWindow;
    import com.sulake.room.utils.Vector3d;
    import flash.display.BitmapData;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.catalog.enum.CatalogType;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Rectangle;
    import flash.geom.Point;

    public class CatalogPromo implements IDisposable, IGetImageListener, IProductDataListener 
    {
        private var _questEngine:HabboQuestEngine;
        private var _window:IWindowContainer;
        private var _connection:IConnection;
        private var _mainWindow:MainWindow;
        private var _productData:_Str_2853 = null;
        private var _offerId:int = -1;
        private var _pageId:int = -1;
        private var _cachedDailyOfferMessageEvent:_Str_7445 = null;
        private var _dailyOfferListener:IMessageEvent = null;
        private var _catalogPublishedListener:IMessageEvent = null;

        public function CatalogPromo(k:HabboQuestEngine, _arg_2:MainWindow)
        {
            this._questEngine = k;
            this._mainWindow = _arg_2;
        }

        public function dispose():void
        {
            if (this._connection)
            {
                if (this._dailyOfferListener)
                {
                    this._connection.removeMessageEvent(this._dailyOfferListener);
                    this._dailyOfferListener = null;
                }
                if (this._catalogPublishedListener)
                {
                    this._connection.removeMessageEvent(this._catalogPublishedListener);
                    this._catalogPublishedListener = null;
                }
                this._connection = null;
            }
            this._questEngine = null;
        }

        public function get disposed():Boolean
        {
            return this._questEngine == null;
        }

        public function _Str_4970(k:int, _arg_2:int):void
        {
            if (k == this._Str_13323())
            {
                this._questEngine.localization.registerParameter("quests.seasonalcalendar.promo.balance", "amount", ("" + _arg_2));
                if (this._window != null)
                {
                    this.refresh();
                }
            }
        }

        private function _Str_13323():int
        {
            var k:String = this._questEngine.configuration.getProperty("seasonalQuestCalendar.currency");
            return (isNaN(Number(k))) ? 0 : int(k);
        }

        public function prepare(k:IFrameWindow):void
        {
            this._window = IWindowContainer(k.findChildByName("catalog_promo_cont"));
            this._window.findChildByName("buy_button").disable();
            this._window.findChildByName("buy_button").procedure = this._Str_24042;
            this._connection = this._questEngine.communication.connection;
            if (this._connection != null)
            {
                this._dailyOfferListener = new _Str_7445(this._Str_22066);
                this._catalogPublishedListener = new _Str_5264(this._Str_12366);
                this._connection.addMessageEvent(this._dailyOfferListener);
                this._connection.addMessageEvent(this._catalogPublishedListener);
                this._connection.send(new _Str_7426());
            }
        }

        public function refresh():void
        {
            var _local_4:String;
            var _local_5:ImageResult;
            var k:ITextWindow = ITextWindow(this._window.findChildByName("your_balance_txt"));
            var _local_2:IWindowContainer = IWindowContainer(this._window.findChildByName("currency_icon_cont"));
            _local_2.x = (k.x + k.width);
            Util._Str_2930(_local_2);
            var _local_3:IWindow = _local_2.findChildByName(("currency_icon_" + this._Str_13323()));
            if (_local_3 != null)
            {
                _local_3.visible = true;
            }
            if (this._productData != null)
            {
                _local_4 = null;
                _local_5 = null;
                if (this._productData.productType == _Str_2853.I)
                {
                    _local_5 = this._questEngine.roomEngine.getWallItemImage(this._productData._Str_6164, new Vector3d(90, 0, 0), 64, this, 0, this._productData.extraParam);
                }
                else
                {
                    if (this._productData.productType == _Str_2853.S)
                    {
                        _local_5 = this._questEngine.roomEngine.getFurnitureImage(this._productData._Str_6164, new Vector3d(90, 0, 0), 64, this);
                    }
                }
                if (((!(_local_5 == null)) && (!(_local_5.data == null))))
                {
                    this._Str_20112(_local_5.data);
                }
            }
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            this._Str_20112(_arg_2);
        }

        public function imageFailed(k:int):void
        {
        }

        private function _Str_24042(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                Logger.log("Buy button clicked");
                if (this._offerId != -1)
                {
                    this._questEngine.catalog.openCatalogPageById(this._pageId, this._offerId, CatalogType.NORMAL);
                }
            }
        }

        private function _Str_22066(k:_Str_7445):void
        {
            this._window.findChildByName("buy_button").enable();
            var _local_2:IProductData = this._questEngine.sessionDataManager.getProductData(k.offer.localizationId);
            if (_local_2 != null)
            {
                ITextWindow(this._window.findChildByName("promo_info")).text = _local_2.name;
                this._pageId = k.pageId;
                this._offerId = k.offer.offerId;
                if (k.offer.products.length > 0)
                {
                    this._productData = _Str_2853(k.offer.products[0]);
                    this.refresh();
                }
            }
            else
            {
                if (this._cachedDailyOfferMessageEvent == null)
                {
                    this._cachedDailyOfferMessageEvent = k;
                    this._questEngine.sessionDataManager.addProductsReadyEventListener(this);
                }
            }
        }

        public function productDataReady():void
        {
            this._Str_22066(this._cachedDailyOfferMessageEvent);
        }

        private function _Str_20112(k:BitmapData):void
        {
            var _local_2:IBitmapWrapperWindow = IBitmapWrapperWindow(this._window.findChildByName("furni_preview"));
            var _local_3:BitmapData = new BitmapData(_local_2.width, _local_2.height, true, 0);
            var _local_4:Rectangle = k.rect;
            if (_local_4.width > _local_3.rect.width)
            {
                _local_4.x = ((_local_4.width - _local_3.rect.width) / 2);
                _local_4.width = _local_3.rect.width;
            }
            if (_local_4.height > _local_3.rect.height)
            {
                _local_4.y = ((_local_4.height - _local_3.rect.height) / 2);
                _local_4.height = _local_3.rect.height;
            }
            var _local_5:Point = new Point(0, 0);
            if (_local_3.rect.width > _local_4.width)
            {
                _local_5.x = ((_local_3.rect.width - _local_4.width) / 2);
            }
            if (_local_3.rect.height > _local_4.height)
            {
                _local_5.y = ((_local_3.rect.height - _local_4.height) / 2);
            }
            _local_3.copyPixels(k, _local_4, _local_5);
            _local_2.bitmap = _local_3;
        }

        private function _Str_12366(k:IMessageEvent):void
        {
            if (this._connection != null)
            {
                this._connection.send(new _Str_7426());
            }
        }
    }
}
