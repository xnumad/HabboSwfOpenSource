package com.sulake.habbo.catalog.purchase
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_7104;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_7443;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_11532;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_9998;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_12348;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import flash.display.BitmapData;

    public class RentConfirmationWindow implements IDisposable, IGetImageListener 
    {
        private static const _Str_14621:int = 1;
        private static const _Str_15835:int = 2;
        private static const _Str_15768:int = 3;

        private var _disposed:Boolean;
        private var _offerMessageEvent:_Str_7104;
        private var _window:IWindowContainer;
        private var _isBuyout:Boolean;
        private var _id:int = -1;
        private var _catalog:HabboCatalog;
        private var _furniData:IFurnitureData;
        private var _mode:int;
        private var _roomInstanceId:int = -1;
        private var _stripId:int;

        public function RentConfirmationWindow(k:HabboCatalog)
        {
            this._catalog = k;
            this._offerMessageEvent = new _Str_7104(this.onFurniRentOrBuyoutOffer);
            this._catalog.connection.addMessageEvent(this._offerMessageEvent);
        }

        private function onFurniRentOrBuyoutOffer(k:_Str_7104):void
        {
            var _local_3:ImageResult;
            if (this._furniData == null)
            {
                return;
            }
            var _local_2:_Str_7443 = k.getParser();
            if (this._furniData.fullName != _local_2._Str_17878)
            {
                return;
            }
            this._isBuyout = _local_2.buyout;
            if (this._catalog.getPurse().credits < _local_2.priceInCredits)
            {
                this._catalog.showNotEnoughCreditsAlert();
                return;
            }
            if (this._catalog.getPurse().getActivityPointsForType(_local_2.activityPointType) < _local_2.priceInActivityPoints)
            {
                this._catalog.getHabboClubOffers(_local_2.activityPointType);
                return;
            }
            this._window = (this._catalog.windowManager.buildFromXML((this._catalog.assets.getAssetByName("rent_confirmation").content as XML)) as IWindowContainer);
            if (_local_2.priceInCredits > 0)
            {
                this._window.findChildByName("price_amount").caption = _local_2.priceInCredits.toString();
                IStaticBitmapWrapperWindow(this._window.findChildByName("price_type")).assetUri = "toolbar_credit_icon_0";
            }
            else
            {
                this._window.findChildByName("price_amount").caption = _local_2.priceInActivityPoints.toString();
            }
            if (this._isBuyout)
            {
                this._window.caption = "${rent.confirmation.title.buyout}";
                this._window.findChildByName("rental_description").visible = false;
                this._window.findChildByName("ok_button").caption = "${catalog.purchase_confirmation.buy}";
            }
            this._window.findChildByName("furni_name").caption = this._furniData.localizedName;
            IItemListWindow(this._window.findChildByName("content_list")).arrangeListItems();
            this._window.center();
            this._window.procedure = this.windowProcedure;
            switch (this._furniData.type)
            {
                case ProductTypeEnum.FLOOR:
                    _local_3 = this.roomEngine.getFurnitureImage(this._furniData.id, new Vector3d(90, 0, 0), 64, this);
                    break;
                case ProductTypeEnum.WALL:
                    _local_3 = this.roomEngine.getWallItemImage(this._furniData.id, new Vector3d(90, 0, 0), 64, this);
                    break;
            }
            IBitmapWrapperWindow(this._window.findChildByName("image")).bitmap = _local_3.data;
            this._id = _local_3.id;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this.close();
            if (this._offerMessageEvent != null)
            {
                this._catalog.connection.removeMessageEvent(this._offerMessageEvent);
                this._offerMessageEvent = null;
            }
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function show(k:IFurnitureData, _arg_2:Boolean, _arg_3:int=-1, _arg_4:int=-1, _arg_5:Boolean=false):void
        {
            this.close();
            this._furniData = k;
            this._roomInstanceId = _arg_3;
            this._stripId = _arg_4;
            if (_arg_5)
            {
                this._mode = _Str_15768;
            }
            else
            {
                if (this._roomInstanceId > -1)
                {
                    this._mode = _Str_14621;
                }
                else
                {
                    this._mode = _Str_15835;
                }
            }
            var _local_6:* = (k.type == ProductTypeEnum.WALL);
            this._catalog.connection.send(new _Str_11532(_local_6, k.fullName, _arg_2));
        }

        private function get roomEngine():IRoomEngine
        {
            return this._catalog.roomEngine;
        }

        private function windowProcedure(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((!(k.type == WindowMouseEvent.CLICK)) || (this._window == null)))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "cancel_button":
                case "header_button_close":
                    this.close();
                    return;
                case "ok_button":
                    switch (this._mode)
                    {
                        case _Str_14621:
                            this._catalog.connection.send(new _Str_9998((this._furniData.type == ProductTypeEnum.WALL), this._roomInstanceId, this._isBuyout));
                            break;
                        case _Str_15835:
                            this._catalog.connection.send(new _Str_12348(this._stripId, this._isBuyout));
                            break;
                        case _Str_15768:
                            this._catalog._Str_22641(this._furniData.rentOfferId);
                            break;
                    }
                    this.close();
                    return;
            }
        }

        private function close():void
        {
            if (this._window == null)
            {
                return;
            }
            this._window.dispose();
            this._window = null;
            this._id = -1;
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (((!(this._window == null)) && (k == this._id)))
            {
                IBitmapWrapperWindow(this._window.findChildByName("image")).bitmap = _arg_2;
            }
        }

        public function imageFailed(k:int):void
        {
        }
    }
}
