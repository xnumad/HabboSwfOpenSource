package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.IAsset;
    import com.sulake.habbo.avatar.pets.PetFigureData;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.habbo.avatar.pets.PetCustomPart;
    import com.sulake.habbo.room.PetColorResult;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUseProductMessage;

    public class UseProductConfirmationView implements IDisposable, IGetImageListener 
    {
        private static const _Str_5091:int = -1;
        private static const _Str_11906:int = 0;
        private static const _Str_11214:int = 1;
        private static const _Str_11733:int = 2;
        private static const _Str_11369:int = 3;
        private static const _Str_8759:int = 4;
        private static const _Str_8432:int = 5;
        private static const _Str_9653:int = 6;
        private static const HEADER_BUTTON_CLOSE:String = "header_button_close";
        private static const SAVE_BUTTON:String = "save_button";
        private static const CANCEL_TEXT:String = "cancel_text";
        private static const OK_BUTTON:String = "ok_button";
        private static const PREVIEW_IMAGE_REGION:String = "preview_image_region";

        private var _window:IWindowContainer;
        private var _isDisposed:Boolean = false;
        private var _widget:AvatarInfoWidget;
        private var _windowManager:IHabboWindowManager;
        private var _assets:IAssetLibrary;
        private var _requestObjectId:int = -1;
        private var _targetRoomObjectId:int = -1;
        private var _previewCallbackId:int;
        private var _furnitureData:IFurnitureData;
        private var _petData:RoomUserData;

        public function UseProductConfirmationView(k:AvatarInfoWidget)
        {
            this._widget = k;
            this._windowManager = k.windowManager;
            this._assets = this._widget.assets;
        }

        public function get _Str_20466():int
        {
            return this._requestObjectId;
        }

        public function get _Str_5563():int
        {
            return this._targetRoomObjectId;
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            this._isDisposed = true;
            this._furnitureData = null;
            this._petData = null;
        }

        public function open(k:int, _arg_2:int, _arg_3:int):void
        {
            var _local_4:int = this._widget.handler.roomSession.roomId;
            var _local_5:IRoomObject = this._widget.handler.roomEngine.getRoomObject(_local_4, k, RoomObjectCategoryEnum.CONST_10);
            if (_local_5 != null)
            {
                this._furnitureData = this._widget.handler.getFurniData(_local_5);
                this._requestObjectId = _local_5.getId();
            }
            else
            {
                this._furnitureData = this._widget.handler.container.sessionDataManager.getFloorItemData(k);
                this._requestObjectId = _arg_3;
            }
            this._targetRoomObjectId = _arg_2;
            this._petData = this._widget.handler.roomSession.userDataManager.getUserDataByIndex(_arg_2);
            var _local_6:int = _Str_5091;
            switch (this._furnitureData.category)
            {
                case FurniCategory._Str_7696:
                    _local_6 = _Str_11906;
                    break;
                case FurniCategory._Str_7297:
                    _local_6 = _Str_11214;
                    break;
                case FurniCategory._Str_7954:
                    _local_6 = _Str_11733;
                    break;
                case FurniCategory._Str_6096:
                    _local_6 = _Str_11369;
                    break;
                case FurniCategory._Str_6915:
                    _local_6 = _Str_8759;
                    break;
                case FurniCategory._Str_8726:
                    _local_6 = _Str_8432;
                    break;
                case FurniCategory._Str_9449:
                    _local_6 = _Str_9653;
                    break;
                default:
                    Logger.log(("[UseProductConfirmationView.open()] Unsupported furniture category: " + this._furnitureData.category));
            }
            this._Str_3248(_local_6);
            this._window.center();
            this._window.visible = true;
        }

        private function _Str_3248(k:int):void
        {
            var _local_4:String;
            var _local_2:BitmapData = new BitmapData(10, 10);
            this._widget.localizations.registerParameter("useproduct.widget.title", "name", this._petData.name);
            this._widget.localizations.registerParameter("useproduct.widget.title.monsterplant", "name", this._petData.name);
            this._widget.localizations.registerParameter("useproduct.widget.title.monsterplant_rebreed", "name", this._petData.name);
            this._widget.localizations.registerParameter("useproduct.widget.title.monsterplant_fertilize", "name", this._petData.name);
            this._widget.localizations.registerParameter("useproduct.widget.title.monsterplant_rebreed", "name", this._petData.name);
            this._widget.localizations.registerParameter("useproduct.widget.monsterplant.plant.name", "name", this._petData.name);
            this._widget.localizations.registerParameter("useproduct.widget.monsterplant.plant.raritylevel", "level", this._petData.rarityLevel.toString());
            this._widget.localizations.registerParameter("useproduct.widget.monsterplant.plant.description", "name", this._petData.ownerName);
            if (!this._window)
            {
                _local_4 = "use_product_widget_frame_xml";
                switch (k)
                {
                    case _Str_8759:
                        _local_4 = "use_product_widget_frame_monsterplant_xml";
                        break;
                    case _Str_8432:
                        _local_4 = "use_product_widget_frame_monsterplant_rebreed_xml";
                        break;
                    case _Str_9653:
                        _local_4 = "use_product_widget_frame_monsterplant_fertilize_xml";
                        break;
                    default:
                        _local_4 = "use_product_widget_frame_xml";
                }
                this._window = (this._windowManager.buildFromXML((this._assets.getAssetByName(_local_4).content as XML)) as IWindowContainer);
                this._Str_2471(HEADER_BUTTON_CLOSE);
            }
            this._widget.localizations.registerParameter("useproduct.widget.text.saddle", "productName", this._furnitureData.localizedName);
            this._widget.localizations.registerParameter("useproduct.widget.text.custompart", "productName", this._furnitureData.localizedName);
            this._widget.localizations.registerParameter("useproduct.widget.text.custompartshampoo", "productName", this._furnitureData.localizedName);
            this._widget.localizations.registerParameter("useproduct.widget.text.shampoo", "productName", this._furnitureData.localizedName);
            this._widget.localizations.registerParameter("useproduct.widget.text.revive_monsterplant", "productName", this._furnitureData.localizedName);
            (this._window as IFrameWindow).content.removeChildAt(0);
            var _local_3:IWindow = this.createWindow(k);
            (this._window as IFrameWindow).content.addChild(_local_3);
            (this._window as IFrameWindow)._Str_5665();
            switch (k)
            {
                case _Str_11906:
                case _Str_11214:
                case _Str_11733:
                case _Str_11369:
                case _Str_8759:
                case _Str_8432:
                case _Str_9653:
                    this._Str_2471(PREVIEW_IMAGE_REGION);
                    this._Str_2471(SAVE_BUTTON);
                    this._Str_2471(CANCEL_TEXT);
                    _local_2 = this._Str_3993(this._furnitureData);
                    break;
                default:
                    throw (new Error(("Invalid type for use product confirmation content apply: " + k)));
            }
            this._Str_3060(_local_2);
            this._window.invalidate();
        }

        private function createWindow(k:int):IWindow
        {
            var _local_2:IAsset;
            var _local_3:IWindow;
            switch (k)
            {
                case _Str_11906:
                    _local_2 = this._assets.getAssetByName("use_product_controller_shampoo_xml");
                    break;
                case _Str_11214:
                    _local_2 = this._assets.getAssetByName("use_product_controller_custom_part_xml");
                    break;
                case _Str_11733:
                    _local_2 = this._assets.getAssetByName("use_product_controller_custom_part_shampoo_xml");
                    break;
                case _Str_11369:
                    _local_2 = this._assets.getAssetByName("use_product_controller_saddle_xml");
                    break;
                case _Str_8759:
                    _local_2 = this._assets.getAssetByName("use_product_controller_revive_monsterplant_xml");
                    break;
                case _Str_8432:
                    _local_2 = this._assets.getAssetByName("use_product_controller_rebreed_monsterplant_xml");
                    break;
                case _Str_9653:
                    _local_2 = this._assets.getAssetByName("use_product_controller_fertilize_monsterplant_xml");
                    break;
                default:
                    throw (new Error(("Invalid type for Use Product View content creation: " + k)));
            }
            _local_3 = (this._windowManager.buildFromXML((_local_2.content as XML)) as IWindow);
            return _local_3;
        }

        private function _Str_3993(k:IFurnitureData):BitmapData
        {
            var _local_2:PetFigureData;
            var _local_3:Array;
            var _local_4:ImageResult;
            var _local_5:int;
            var _local_6:Array;
            var _local_7:Array;
            var _local_8:Array;
            var _local_10:int;
            var _local_11:BitmapData;
            var _local_12:int;
            var _local_13:int;
            var _local_14:int;
            var _local_15:PetCustomPart;
            var _local_16:String;
            var _local_17:Array;
            var _local_18:PetColorResult;
            var _local_19:String;
            var _local_20:PetColorResult;
            var _local_21:PetCustomPart;
            var _local_22:IRoomObject;
            var _local_23:int;
            if (!k)
            {
                return null;
            }
            _local_2 = new PetFigureData(this._petData.figure);
            _local_3 = k.customParams.split(" ");
            _local_5 = int(_local_3[0]);
            var _local_9:Array = [];
            switch (k.category)
            {
                case FurniCategory._Str_7696:
                    if (_local_3.length < 2)
                    {
                        Logger.log(("[UseProductConfirmationView] Invalid custom params: " + _local_3));
                        break;
                    }
                    _local_16 = _local_3[1];
                    _local_17 = this._widget.handler.roomEngine.getPetColorsByTag(_local_5, _local_16);
                    _local_18 = this._widget.handler.roomEngine.getPetColor(_local_5, _local_2.paletteId);
                    for each (_local_20 in _local_17)
                    {
                        if (_local_20.breed == _local_18.breed)
                        {
                            _local_12 = int(_local_20.id);
                            break;
                        }
                    }
                    _local_4 = this._widget.handler.roomEngine.getPetImage(_local_2.typeId, _local_12, _local_2.color, new Vector3d(90), 64, this, true, 0, _local_2._Str_3542);
                    break;
                case FurniCategory._Str_7297:
                    if (_local_3.length < 4)
                    {
                        Logger.log(("[UseProductConfirmationView] Invalid custom params: " + _local_3));
                        break;
                    }
                    _local_6 = (_local_3[1] as String).split(",");
                    _local_7 = (_local_3[2] as String).split(",");
                    _local_8 = (_local_3[3] as String).split(",");
                    _local_10 = 0;
                    while (_local_10 < _local_6.length)
                    {
                        _local_13 = _local_6[_local_10];
                        _local_15 = _local_2.getCustomPart(_local_13);
                        _local_12 = _local_8[_local_10];
                        if (_local_15 != null)
                        {
                            _local_12 = _local_15.paletteId;
                        }
                        _local_9.push(new PetCustomPart(_local_13, _local_7[_local_10], _local_12));
                        _local_10++;
                    }
                    _local_4 = this._widget.handler.roomEngine.getPetImage(_local_2.typeId, _local_2.paletteId, _local_2.color, new Vector3d(90), 64, this, true, 0, _local_9);
                    break;
                case FurniCategory._Str_7954:
                    if (_local_3.length < 3)
                    {
                        Logger.log(("[UseProductConfirmationView] Invalid custom params: " + _local_3));
                        break;
                    }
                    _local_6 = (_local_3[1] as String).split(",");
                    _local_8 = (_local_3[2] as String).split(",");
                    _local_10 = 0;
                    while (_local_10 < _local_6.length)
                    {
                        _local_13 = _local_6[_local_10];
                        _local_15 = _local_2.getCustomPart(_local_13);
                        _local_14 = -1;
                        if (_local_15 != null)
                        {
                            _local_14 = _local_15._Str_1502;
                        }
                        _local_9.push(new PetCustomPart(_local_6[_local_10], _local_14, _local_8[_local_10]));
                        _local_10++;
                    }
                    _local_4 = this._widget.handler.roomEngine.getPetImage(_local_2.typeId, _local_2.paletteId, _local_2.color, new Vector3d(90), 64, this, true, 0, _local_9);
                    break;
                case FurniCategory._Str_6096:
                    if (_local_3.length < 4)
                    {
                        Logger.log(("[UseProductConfirmationView] Invalid custom params: " + _local_3));
                        break;
                    }
                    _local_6 = (_local_3[1] as String).split(",");
                    _local_7 = (_local_3[2] as String).split(",");
                    _local_8 = (_local_3[3] as String).split(",");
                    _local_10 = 0;
                    while (_local_10 < _local_6.length)
                    {
                        _local_9.push(new PetCustomPart(_local_6[_local_10], _local_7[_local_10], _local_8[_local_10]));
                        _local_10++;
                    }
                    for each (_local_21 in _local_2._Str_3542)
                    {
                        if (_local_6.indexOf(_local_21._Str_11008) == -1)
                        {
                            _local_9.push(_local_21);
                        }
                    }
                    _local_4 = this._widget.handler.roomEngine.getPetImage(_local_2.typeId, _local_2.paletteId, _local_2.color, new Vector3d(90), 64, this, true, 0, _local_9);
                    break;
                case FurniCategory._Str_8726:
                case FurniCategory._Str_6915:
                case FurniCategory._Str_9449:
                    _local_19 = null;
                    if (this._petData != null)
                    {
                        _local_19 = "rip";
                        _local_22 = this._Str_13861(this._petData._Str_2713);
                        if (_local_22 != null)
                        {
                            _local_19 = _local_22.getModel().getString(RoomObjectVariableEnum.FIGURE_POSTURE);
                            if (_local_19 == "rip")
                            {
                                _local_23 = this._petData._Str_3897;
                                if (_local_23 < 7)
                                {
                                    _local_19 = ("grw" + _local_23);
                                }
                                else
                                {
                                    _local_19 = "std";
                                }
                            }
                        }
                    }
                    _local_4 = this._widget.handler.roomEngine.getPetImage(_local_2.typeId, _local_2.paletteId, _local_2.color, new Vector3d(90), 64, this, true, 0, _local_2._Str_3542, _local_19);
                    break;
                default:
                    Logger.log(("[UseProductConfirmationView] Unsupported furniture category: " + k.category));
            }
            if (_local_4 != null)
            {
                this._previewCallbackId = _local_4.id;
                _local_11 = _local_4.data;
            }
            return _local_11;
        }

        private function _Str_13861(k:int):IRoomObject
        {
            return this._widget.handler.roomEngine.getRoomObject(this._widget.handler.roomEngine.activeRoomId, k, RoomObjectCategoryEnum.CONST_100);
        }

        private function _Str_3060(k:BitmapData):void
        {
            var _local_5:BitmapData;
            if (((!(this._window)) || (!(k))))
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName("preview_image") as IBitmapWrapperWindow);
            if (_local_2.bitmap == null)
            {
                _local_2.bitmap = new BitmapData(_local_2.width, _local_2.height);
            }
            var _local_3:IAsset = (this._assets.getAssetByName("use_product_preview_bg_png") as IAsset);
            if (_local_3)
            {
                _local_5 = (_local_3.content as BitmapData);
                _local_2.bitmap.copyPixels(_local_5, _local_5.rect, new Point(0, 0));
            }
            var _local_4:Point = new Point(((_local_2.width - k.width) / 2), ((_local_2.height - k.height) / 2));
            _local_2.bitmap.copyPixels(k, k.rect, _local_4, null, null, true);
        }

        private function close():void
        {
            this._window.visible = false;
        }

        private function _Str_2471(k:String):void
        {
            var _local_2:IWindow = this._window.findChildByName(k);
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this.onMouseClick);
            }
        }

        private function onMouseClick(k:WindowMouseEvent):void
        {
            var _local_2:RoomWidgetMessage;
            switch (k.target.name)
            {
                case PREVIEW_IMAGE_REGION:
                    if (this._petData != null)
                    {
                        this._Str_22884(this._petData._Str_2713, RoomObjectCategoryEnum.CONST_100);
                    }
                    break;
                case HEADER_BUTTON_CLOSE:
                case CANCEL_TEXT:
                case OK_BUTTON:
                    this.close();
                    break;
                case SAVE_BUTTON:
                    _local_2 = new RoomWidgetUseProductMessage(RoomWidgetUseProductMessage.RWUPM_PET_PRODUCT, this._requestObjectId, this._petData._Str_2394);
                    this.close();
                    break;
            }
            if (_local_2)
            {
                this._widget.messageListener.processWidgetMessage(_local_2);
            }
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (this.disposed)
            {
                return;
            }
            if (this._previewCallbackId == k)
            {
                this._Str_3060(_arg_2);
                this._previewCallbackId = 0;
            }
        }

        public function imageFailed(k:int):void
        {
        }

        private function _Str_22884(k:int, _arg_2:int):Boolean
        {
            var _local_4:int;
            var _local_3:IRoomObject = this._Str_8946(k, _arg_2);
            if (_local_3 != null)
            {
                _local_4 = this._widget.handler.container.roomSession.roomId;
                this._widget.handler.container.roomEngine._Str_5538(_local_4, _local_3.getId(), _arg_2);
                return true;
            }
            return false;
        }

        private function _Str_8946(k:int, _arg_2:int):IRoomObject
        {
            var _local_3:int = this._widget.handler.container.roomSession.roomId;
            var _local_4:IRoomObject = this._widget.handler.container.roomEngine.getRoomObject(_local_3, k, _arg_2);
            return _local_4;
        }
    }
}
