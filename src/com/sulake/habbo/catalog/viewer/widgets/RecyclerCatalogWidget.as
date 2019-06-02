package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.recycler._Str_7232;
    import com.sulake.habbo.catalog.viewer._Str_9030;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.recycler.IRecycler;
    import com.sulake.habbo.catalog.viewer.PageLocalization;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.habbo.catalog.recycler._Str_3718;
    import com.sulake.habbo.room.ImageResult;
    import flash.geom.Point;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.ISelectedRoomObjectData;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.room.object.RoomObjectOperationEnum;
    import com.sulake.habbo.window.utils._Str_2418;

    public class RecyclerCatalogWidget extends CatalogWidget implements _Str_7232 
    {
        private var _Str_4455:_Str_9030;

        public function RecyclerCatalogWidget(k:IWindowContainer)
        {
            super(k);
        }

        private function get recycler():IRecycler
        {
            return page.viewer.catalog.getRecycler();
        }

        override public function dispose():void
        {
            if (this._Str_4455 != null)
            {
                this._Str_4455.dispose();
                this._Str_4455 = null;
            }
            if (this.recycler != null)
            {
                this.recycler.cancel();
            }
            super.dispose();
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            _Str_2819(CatalogWidgetEnum.RECYCLER);
            window.findChildByName("inactive").visible = false;
            window.findChildByName("timeout").visible = false;
            window.findChildByName("normal").visible = false;
            if (this.recycler == null)
            {
                return false;
            }
            this.recycler.init(this);
            return true;
        }

        public function _Str_17679():void
        {
            window.findChildByName("inactive").visible = true;
            window.findChildByName("timeout").visible = false;
            window.findChildByName("normal").visible = false;
            this._Str_13293();
            var k:IWindow = (window.parent as IWindowContainer).findChildByName(PageLocalization.CATALOG_HEADER_DESCRIPTION);
            if (k != null)
            {
                k.caption = "${recycler.info.closed}";
            }
        }

        public function _Str_19627(k:int):void
        {
            var _local_2:String = String(int((k / 60)));
            var _local_3:String = String((k % 60));
            page.viewer.catalog.localization.registerParameter("recycler.alert.timeout", "minutes", _local_2);
            page.viewer.catalog.localization.registerParameter("recycler.alert.timeout", "seconds", _local_3);
            window.findChildByName("inactive").visible = false;
            window.findChildByName("timeout").visible = true;
            window.findChildByName("normal").visible = false;
            var _local_4:IWindow = (window.parent as IWindowContainer).findChildByName(PageLocalization.CATALOG_HEADER_DESCRIPTION);
            if (_local_4 != null)
            {
                _local_4.caption = "${recycler.alert.timeout}";
            }
        }

        public function _Str_20090():void
        {
            window.findChildByName("inactive").visible = true;
            window.findChildByName("timeout").visible = false;
            window.findChildByName("normal").visible = false;
            this._Str_13293();
            var k:IWindow = (window.parent as IWindowContainer).findChildByName(PageLocalization.CATALOG_HEADER_DESCRIPTION);
            if (k != null)
            {
                k.caption = "";
            }
        }

        public function _Str_20131():void
        {
            window.findChildByName("inactive").visible = true;
            window.findChildByName("timeout").visible = false;
            window.findChildByName("normal").visible = false;
            this._Str_13293();
            var k:IWindow = (window.parent as IWindowContainer).findChildByName(PageLocalization.CATALOG_HEADER_DESCRIPTION);
            if (k != null)
            {
                k.caption = "${recycler.info.finished}";
            }
            var _local_2:IButtonWindow = IButtonWindow(window.findChildByName("recycle_again_button"));
            _local_2.visible = true;
            _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_24819);
        }

        public function _Str_19869():void
        {
            window.findChildByName("inactive").visible = false;
            window.findChildByName("timeout").visible = false;
            window.findChildByName("normal").visible = true;
            this._Str_13293();
            window.procedure = this._Str_10415;
            window.parent.procedure = this._Str_10415;
            var k:IWindow = (window.parent as IWindowContainer).findChildByName(PageLocalization.CATALOG_HEADER_DESCRIPTION);
            if (k != null)
            {
                k.caption = "${recycler.info.ready}";
            }
        }

        private function _Str_13293():void
        {
            var _local_2:int;
            var _local_3:IBitmapWrapperWindow;
            var k:BitmapData = _Str_21202("ctlg_recycler_slot_bg");
            if (k == null)
            {
                return;
            }
            _local_2 = 1;
            while (_local_2 <= this.recycler.numberOfSlots)
            {
                _local_3 = (window.findChildByName(("slot_bg_" + _local_2)) as IBitmapWrapperWindow);
                if (_local_3 != null)
                {
                    _local_3.bitmap = k.clone();
                    _local_3.procedure = this._Str_21666;
                }
                _local_2++;
            }
            _local_2 = 1;
            while (_local_2 <= this.recycler.numberOfSlots)
            {
                _local_3 = (window.findChildByName(("slot_img_" + _local_2)) as IBitmapWrapperWindow);
                if (_local_3 != null)
                {
                    _local_3.bitmap = k.clone();
                    _local_3.procedure = this._Str_21666;
                }
                _local_2++;
            }
        }

        public function _Str_15301():void
        {
            var _local_2:IBitmapWrapperWindow;
            var _local_3:_Str_3718;
            var _local_4:ImageResult;
            var _local_5:BitmapData;
            var _local_6:Point;
            if (((window == null) || (this.recycler == null)))
            {
                return;
            }
            var k:int;
            while (k < this.recycler.numberOfSlots)
            {
                _local_2 = (window.findChildByName(("slot_img_" + (k + 1))) as IBitmapWrapperWindow);
                if (_local_2 == null)
                {
                    return;
                }
                _local_3 = this.recycler._Str_18924(k);
                if (_local_3 == null)
                {
                    _local_2.bitmap = new BitmapData(1, 1, true, 0xFFFFFF);
                }
                else
                {
                    _local_4 = this._Str_6819(_local_3);
                    if (((!(_local_4 == null)) && (!(_local_4.data == null))))
                    {
                        _local_5 = new BitmapData(_local_2.width, _local_2.height, true, 0xFFFFFF);
                        _local_5.fillRect(_local_5.rect, 0xFFFFFF);
                        _local_6 = new Point(((_local_2.width - _local_4.data.width) / 2), ((_local_2.height - _local_4.data.height) / 2));
                        _local_5.copyPixels(_local_4.data, _local_4.data.rect, _local_6, null, null, true);
                        _local_2.bitmap = _local_5;
                        _local_4.data.dispose();
                    }
                }
                k++;
            }
        }

        private function _Str_6819(k:_Str_3718):ImageResult
        {
            var _local_2:ImageResult;
            if (((k == null) || (page.viewer.roomEngine == null)))
            {
                return null;
            }
            if (k.category == RoomObjectCategoryEnum.CONST_10)
            {
                return page.viewer.roomEngine.getFurnitureIcon(k.typeId, null);
            }
            if (k.category == RoomObjectCategoryEnum.CONST_20)
            {
                return page.viewer.roomEngine.getWallItemIcon(k.typeId, null, k.xxxExtra);
            }
            return null;
        }

        private function _Str_10415(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:IRoomEngine = page.viewer.roomEngine;
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:ISelectedRoomObjectData = _local_3.getSelectedObjectData(_local_3.activeRoomId);
            switch (k.type)
            {
                case WindowMouseEvent.OUT:
                    if (this._Str_4455 != null)
                    {
                        this._Str_4455._Str_16533();
                    }
                    return;
                case WindowMouseEvent.MOVE:
                    if (this._Str_4455 != null)
                    {
                        this._Str_4455._Str_10415(k, _arg_2, _local_4);
                    }
                    return;
                case WindowMouseEvent.OVER:
                    if (this._Str_4455 == null)
                    {
                        this._Str_4455 = new _Str_9030();
                        this._Str_4455.mainContainer = window;
                        this._Str_4455.roomEngine = _local_3;
                    }
                    return;
            }
        }

        private function _Str_21666(event:WindowEvent, target:IWindow):void
        {
            var slotId:int;
            var roomEngine:IRoomEngine = page.viewer.roomEngine;
            if (((roomEngine == null) || (this.recycler == null)))
            {
                return;
            }
            var objectData:ISelectedRoomObjectData = roomEngine.getSelectedObjectData(roomEngine.activeRoomId);
            if (event.type == WindowMouseEvent.UP)
            {
                if (event.window.name.indexOf("slot_") == 0)
                {
                    slotId = (int(event.window.name.charAt((event.window.name.length - 1))) - 1);
                    if (objectData != null)
                    {
                        if (objectData.operation != RoomObjectOperationEnum.OBJECT_PLACE)
                        {
                            page.viewer.catalog.windowManager.alert("${generic.alert.title}", "${catalog.alert.recycler.inventory}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                            {
                                k.dispose();
                            });
                            return;
                        }
                        this.recycler.placeObjectAtSlot(slotId, objectData.id, objectData.category, objectData.typeId, objectData._Str_4766);
                    }
                    else
                    {
                        this.recycler.releaseSlot(slotId);
                    }
                    roomEngine.cancelRoomObjectInsert();
                    if (this._Str_4455 != null)
                    {
                        this._Str_4455._Str_16533();
                    }
                    return;
                }
            }
            if (event.type == WindowMouseEvent.MOVE)
            {
                this._Str_10415(event, target);
            }
        }

        public function _Str_20203(k:Boolean):void
        {
            if (((disposed) || (window == null)))
            {
                return;
            }
            var _local_2:IWindow = window.findChildByName("recycler_recycle");
            if (_local_2 != null)
            {
                if (k)
                {
                    _local_2.enable();
                    _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_25763);
                }
                else
                {
                    _local_2.disable();
                }
            }
        }

        private function _Str_25763(k:WindowMouseEvent):void
        {
            if (this.recycler != null)
            {
                this.recycler.executeRecycler();
            }
        }

        private function _Str_24819(k:WindowMouseEvent):void
        {
            if (this.recycler != null)
            {
                this.recycler.empty();
                this.recycler.init(this);
            }
        }
    }
}
