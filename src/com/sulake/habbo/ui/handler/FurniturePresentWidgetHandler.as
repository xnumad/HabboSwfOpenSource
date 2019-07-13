package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPresentOpenMessage;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.habbo.ui.widget.events._Str_2490;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.display.BitmapData;
    import com.sulake.habbo.session.events.RoomSessionPresentEvent;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.avatar.pets.PetFigureData;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.habbo.avatar.pets.PetTypeEnum;
    import flash.events.Event;

    public class FurniturePresentWidgetHandler implements IRoomWidgetHandler, IGetImageListener 
    {
        private static const FLOOR:String = "floor";
        private static const WALLPAPER:String = "wallpaper";
        private static const LANDSCAPE:String = "landscape";
        private static const POSTER:String = "poster";

        private var _isDisposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _objectId:int = -1;
        private var _name:String = "";


        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.FURNI_PRESENT_WIDGET;
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function dispose():void
        {
            this._isDisposed = true;
            this._container = null;
        }

        public function _Str_2607():Array
        {
            return [RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_PRESENT, RoomWidgetPresentOpenMessage.RWPOM_OPEN_PRESENT];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:RoomWidgetFurniToWidgetMessage;
            var _local_3:IRoomObject;
            var _local_4:RoomWidgetPresentOpenMessage;
            var _local_5:IRoomObjectModel;
            var _local_6:String;
            var _local_7:String;
            var _local_8:String;
            var _local_9:int;
            var _local_10:String;
            var _local_11:int;
            var _local_12:ImageResult;
            var _local_13:_Str_2490;
            switch (k.type)
            {
                case RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_PRESENT:
                    _local_2 = (k as RoomWidgetFurniToWidgetMessage);
                    _local_3 = this._container.roomEngine.getRoomObject(_local_2.roomId, _local_2.id, _local_2.category);
                    if (_local_3 != null)
                    {
                        _local_5 = _local_3.getModel();
                        if (_local_5 != null)
                        {
                            this._objectId = _local_2.id;
                            _local_6 = _local_5.getString(RoomObjectVariableEnum.FURNITURE_DATA);
                            if (_local_6 == null)
                            {
                                _local_6 = "";
                            }
                            _local_7 = _local_5.getString(RoomObjectVariableEnum.FURNITURE_PURCHASER_NAME);
                            _local_8 = _local_5.getString(RoomObjectVariableEnum.FURNITURE_PURCHASER_FIGURE);
                            _local_9 = _local_5.getNumber(RoomObjectVariableEnum.FURNITURE_TYPE_ID);
                            _local_10 = _local_5.getString(RoomObjectVariableEnum.FURNITURE_EXTRAS);
                            _local_11 = 32;
                            _local_12 = this._container.roomEngine.getFurnitureImage(_local_9, new Vector3d(180), _local_11, null, 0, _local_10);
                            _local_13 = new _Str_2490(_Str_2490.RWPDUE_PACKAGEINFO, _local_2.id, _local_6, this._container.isOwnerOfFurniture(_local_3), _local_12.data, _local_7, _local_8);
                            this._container.events.dispatchEvent(_local_13);
                        }
                    }
                    break;
                case RoomWidgetPresentOpenMessage.RWPOM_OPEN_PRESENT:
                    _local_4 = (k as RoomWidgetPresentOpenMessage);
                    if (_local_4._Str_1577 != this._objectId)
                    {
                        return null;
                    }
                    if (this._container != null)
                    {
                        if (this._container.roomSession != null)
                        {
                            this._container.roomSession._Str_17139(_local_4._Str_1577);
                        }
                        if (this._container.roomEngine != null)
                        {
                            this._container.roomEngine.changeObjectModelData(this._container.roomEngine.activeRoomId, _local_4._Str_1577, RoomObjectCategoryEnum.CONST_10, RoomObjectVariableEnum.FURNITURE_DISABLE_PICKING_ANIMATION, 1);
                        }
                    }
                    break;
            }
            return null;
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (((this.disposed) || (this._container == null)))
            {
                return;
            }
            var _local_3:_Str_2490 = new _Str_2490(_Str_2490.RWPDUE_CONTENTS_IMAGE, 0, this._name, false, _arg_2);
            this._container.events.dispatchEvent(_local_3);
        }

        public function imageFailed(k:int):void
        {
        }

        public function _Str_2609():Array
        {
            return [RoomSessionPresentEvent.RSPE_PRESENT_OPENED];
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:RoomSessionPresentEvent;
            var _local_3:IFurnitureData;
            var _local_4:ImageResult;
            var _local_5:_Str_2490;
            var _local_6:Boolean;
            var _local_7:IProductData;
            var _local_8:IRoomObject;
            var _local_9:String;
            var _local_10:String;
            var _local_11:int;
            var _local_12:String;
            var _local_13:PetFigureData;
            var _local_14:int;
            var _local_15:int;
            var _local_16:ImageResult;
            if (k == null)
            {
                return;
            }
            if ((((!(this._container == null)) && (!(this._container.events == null))) && (!(k == null))))
            {
                switch (k.type)
                {
                    case RoomSessionPresentEvent.RSPE_PRESENT_OPENED:
                        _local_2 = (k as RoomSessionPresentEvent);
                        if (_local_2 != null)
                        {
                            this._name = "";
                            _local_4 = null;
                            if (_local_2._Str_2887 == ProductTypeEnum.FLOOR)
                            {
                                _local_3 = this._container.sessionDataManager.getFloorItemData(_local_2.classId);
                            }
                            else
                            {
                                if (_local_2._Str_2887 == ProductTypeEnum.WALL)
                                {
                                    _local_3 = this._container.sessionDataManager.getWallItemData(_local_2.classId);
                                }
                            }
                            _local_6 = false;
                            if (_local_2._Str_4057)
                            {
                                _local_8 = this._container.roomEngine.getRoomObject(this._container.roomSession.roomId, _local_2.placedItemId, RoomObjectCategoryEnum.CONST_10);
                                if (_local_8 != null)
                                {
                                    _local_6 = this._container.isOwnerOfFurniture(_local_8);
                                }
                            }
                            switch (_local_2._Str_2887)
                            {
                                case ProductTypeEnum.WALL:
                                    if (_local_3 != null)
                                    {
                                        switch (_local_3.className)
                                        {
                                            case FLOOR:
                                                _local_5 = new _Str_2490(_Str_2490.RWPDUE_CONTENTS_FLOOR, 0, this._container.localization.getLocalization("inventory.furni.item.floor.name"), _local_6, null);
                                                break;
                                            case LANDSCAPE:
                                                _local_5 = new _Str_2490(_Str_2490.RWPDUE_CONTENTS_LANDSCAPE, 0, this._container.localization.getLocalization("inventory.furni.item.landscape.name"), _local_6, null);
                                                break;
                                            case WALLPAPER:
                                                _local_5 = new _Str_2490(_Str_2490.RWPDUE_CONTENTS_WALLPAPER, 0, this._container.localization.getLocalization("inventory.furni.item.wallpaper.name"), _local_6, null);
                                                break;
                                            case POSTER:
                                                _local_9 = _local_2.productCode;
                                                _local_10 = null;
                                                if (_local_9.indexOf("poster") == 0)
                                                {
                                                    _local_11 = int(_local_9.replace("poster", ""));
                                                    _local_10 = String(_local_11);
                                                }
                                                _local_4 = this._container.roomEngine.getWallItemIcon(_local_2.classId, this, _local_10);
                                                _local_7 = this._container.sessionDataManager.getProductData(_local_9);
                                                if (_local_7 != null)
                                                {
                                                    this._name = _local_7.name;
                                                }
                                                else
                                                {
                                                    if (_local_3 != null)
                                                    {
                                                        this._name = _local_3.localizedName;
                                                    }
                                                }
                                                if (_local_4 != null)
                                                {
                                                    _local_5 = new _Str_2490(_Str_2490.RWPDUE_CONTENTS, 0, this._name, _local_6, _local_4.data);
                                                }
                                                break;
                                            default:
                                                _local_4 = this._container.roomEngine.getWallItemIcon(_local_2.classId, this);
                                                if (_local_3 != null)
                                                {
                                                    this._name = _local_3.localizedName;
                                                }
                                                if (_local_4 != null)
                                                {
                                                    _local_5 = new _Str_2490(_Str_2490.RWPDUE_CONTENTS, 0, this._name, _local_6, _local_4.data);
                                                }
                                        }
                                    }
                                    break;
                                case ProductTypeEnum.HABBO_CLUB:
                                    _local_5 = new _Str_2490(_Str_2490.RWPDUE_CONTENTS_CLUB, 0, this._container.localization.getLocalization("widget.furni.present.hc"), false, null);
                                    break;
                                default:
                                    if (_local_2.placedItemType == ProductTypeEnum.PET)
                                    {
                                        _local_12 = _local_2.petFigureString;
                                        if (((!(_local_12 == null)) && (_local_12.length > 0)))
                                        {
                                            _local_13 = new PetFigureData(_local_12);
                                            _local_14 = 2;
                                            _local_15 = 64;
                                            if (_local_13.typeId == PetTypeEnum.HORSE)
                                            {
                                                _local_15 = 32;
                                            }
                                            _local_16 = this._container.roomEngine.getPetImage(_local_13.typeId, _local_13.paletteId, _local_13.color, new Vector3d((_local_14 * 45)), _local_15, this, true, 0, _local_13._Str_3542);
                                            if (_local_16 != null)
                                            {
                                                _local_4 = _local_16;
                                            }
                                        }
                                    }
                                    if (_local_4 == null)
                                    {
                                        _local_4 = this._container.roomEngine.getFurnitureImage(_local_2.classId, new Vector3d(90), 64, this);
                                    }
                                    _local_7 = this._container.sessionDataManager.getProductData(_local_2.productCode);
                                    if (_local_7 != null)
                                    {
                                        this._name = _local_7.name;
                                    }
                                    else
                                    {
                                        if (_local_3 != null)
                                        {
                                            this._name = _local_3.localizedName;
                                        }
                                    }
                                    if (_local_4 != null)
                                    {
                                        _local_5 = new _Str_2490(_Str_2490.RWPDUE_CONTENTS, 0, this._name, _local_6, _local_4.data);
                                    }
                            }
                            if (_local_5 != null)
                            {
                                _local_5.classId = _local_2.classId;
                                _local_5._Str_2887 = _local_2._Str_2887;
                                _local_5.placedItemId = _local_2.placedItemId;
                                _local_5._Str_4057 = _local_2._Str_4057;
                                _local_5.placedItemType = _local_2.placedItemType;
                                this._container.events.dispatchEvent(_local_5);
                            }
                        }
                }
            }
        }

        public function update():void
        {
        }
    }
}
