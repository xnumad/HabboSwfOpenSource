package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.catalog.viewer._Str_4431;
    import flash.display.BitmapData;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetInitPurchaseEvent;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetUpdateRoomPreviewEvent;
    import flash.geom.Point;

    public class RoomPreviewCatalogWidget extends CatalogWidget implements IGetImageListener, _Str_4431 
    {
        private var _imageResultIdRoom:int = -1;
        private var _imageResultIdWindow:int = -1;
        private var _imageStoreBg:BitmapData = null;
        private var _imageStoreWindow:BitmapData = null;
        private var _lastTargetMouseDown:Object;
        private var _offer:IPurchasableOffer;

        public function RoomPreviewCatalogWidget(k:IWindowContainer)
        {
            super(k);
        }

        override public function dispose():void
        {
            if (this._imageStoreBg != null)
            {
                this._imageStoreBg.dispose();
                this._imageStoreBg = null;
            }
            if (this._imageStoreWindow != null)
            {
                this._imageStoreWindow.dispose();
                this._imageStoreWindow = null;
            }
            events.removeEventListener(CatalogWidgetEvent.UPDATE_ROOM_PREVIEW, this._Str_19245);
            super.dispose();
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            var k:IBitmapWrapperWindow = (window.getChildByName("catalog_floor_preview_example") as IBitmapWrapperWindow);
            k.procedure = this._Str_5162;
            events.addEventListener(CatalogWidgetEvent.UPDATE_ROOM_PREVIEW, this._Str_19245);
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_4806);
            return true;
        }

        private function _Str_4806(k:SelectProductEvent):void
        {
            if (k == null)
            {
                return;
            }
            this._offer = k.offer;
        }

        private function _Str_5162(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.UP)
            {
                this._lastTargetMouseDown = null;
            }
            else
            {
                if (k.type == WindowMouseEvent.DOWN)
                {
                    if (_arg_2 == null)
                    {
                        return;
                    }
                    this._lastTargetMouseDown = _arg_2;
                }
                else
                {
                    if ((((k.type == WindowMouseEvent.OUT) && (!(this._lastTargetMouseDown == null))) && (this._lastTargetMouseDown == _arg_2)))
                    {
                        if (this._offer)
                        {
                            (page.viewer.catalog as HabboCatalog)._Str_8289(this, this._offer);
                            this._lastTargetMouseDown = null;
                        }
                    }
                    else
                    {
                        if (k.type == WindowMouseEvent.UP)
                        {
                            (this._lastTargetMouseDown == null);
                        }
                        else
                        {
                            if (k.type == WindowMouseEvent.CLICK)
                            {
                                (this._lastTargetMouseDown == null);
                            }
                            else
                            {
                                if (k.type == WindowMouseEvent.DOUBLE_CLICK)
                                {
                                    this._lastTargetMouseDown = null;
                                }
                            }
                        }
                    }
                }
            }
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

        private function _Str_19245(k:CatalogWidgetUpdateRoomPreviewEvent):void
        {
            var _local_5:BitmapData;
            var _local_6:BitmapData;
            var _local_2:String = "ads_twi_windw";
            var _local_3:ImageResult = page.viewer.roomEngine.getRoomImage(k._Str_5207, k._Str_5259, k._Str_5109, k._Str_15099, this, _local_2);
            var _local_4:ImageResult = page.viewer.roomEngine.getGenericRoomObjectImage(_local_2, "", new Vector3d(180, 0, 0), k._Str_15099, this);
            if (((!(_local_3 == null)) && (!(_local_4 == null))))
            {
                this._imageResultIdRoom = _local_3.id;
                this._imageResultIdWindow = _local_4.id;
                _local_5 = (_local_3.data as BitmapData);
                _local_6 = (_local_4.data as BitmapData);
                if (this._imageStoreBg != null)
                {
                    this._imageStoreBg.dispose();
                }
                if (this._imageStoreWindow != null)
                {
                    this._imageStoreWindow.dispose();
                }
                this._imageStoreBg = _local_5;
                this._imageStoreWindow = _local_6;
                this._Str_19491(_local_5, _local_6);
            }
        }

        private function _Str_19491(k:BitmapData, _arg_2:BitmapData):void
        {
            var _local_3:IBitmapWrapperWindow;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            if ((((!(k == null)) && (!(_arg_2 == null))) && (!(window.disposed))))
            {
                _local_3 = (window.getChildByName("catalog_floor_preview_example") as IBitmapWrapperWindow);
                if (_local_3 != null)
                {
                    if (_local_3.bitmap == null)
                    {
                        _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height, true, 0xFFFFFF);
                    }
                    _local_4 = -45;
                    _local_5 = 20;
                    _local_3.bitmap.fillRect(_local_3.bitmap.rect, 0xFFFFFF);
                    _local_6 = (((_local_3.width - k.width) / 2) + _local_4);
                    _local_7 = (((_local_3.height - k.height) / 2) + _local_5);
                    _local_3.bitmap.copyPixels(k, k.rect, new Point(_local_6, _local_7), null, null, true);
                    _local_8 = ((_local_3.width / 2) + _local_4);
                    _local_9 = (((_local_3.height / 2) + _local_5) - _arg_2.height);
                    _local_8 = (_local_8 + 1);
                    _local_9 = (_local_9 + 44);
                    _local_3.bitmap.copyPixels(_arg_2, _arg_2.rect, new Point(_local_8, _local_9), null, null, true);
                    _local_3.invalidate();
                }
            }
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (disposed)
            {
                return;
            }
            switch (k)
            {
                case this._imageResultIdRoom:
                    this._imageResultIdRoom = 0;
                    if (this._imageStoreBg != null)
                    {
                        this._imageStoreBg.dispose();
                    }
                    this._imageStoreBg = _arg_2;
                    break;
                case this._imageResultIdWindow:
                    this._imageResultIdWindow = 0;
                    if (this._imageStoreWindow != null)
                    {
                        this._imageStoreWindow.dispose();
                    }
                    this._imageStoreWindow = _arg_2;
                    break;
            }
            if (((!(this._imageStoreBg == null)) && (!(this._imageStoreWindow == null))))
            {
                this._Str_19491(this._imageStoreBg, this._imageStoreWindow);
            }
        }

        public function imageFailed(k:int):void
        {
        }
    }
}
