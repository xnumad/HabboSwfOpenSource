package com.sulake.habbo.ui.widget.furniture.contextmenu
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.assets.IAsset;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUseProductMessage;

    public class MonsterPlantSeedConfirmationView implements IDisposable, IGetImageListener 
    {
        private static const _Str_5091:int = -1;
        private static const _Str_9984:int = 0;
        private static const HEADER_BUTTON_CLOSE:String = "header_button_close";
        private static const SAVE_BUTTON:String = "save_button";
        private static const CANCEL_TEXT:String = "cancel_text";
        private static const OK_BUTTON:String = "ok_button";

        private var _window:IWindowContainer;
        private var _isDisposed:Boolean = false;
        private var _widget:FurnitureContextMenuWidget;
        private var _windowManager:IHabboWindowManager;
        private var _assets:IAssetLibrary;
        private var _requestObjectId:int = -1;
        private var _previewCallbackId:int;
        private var _furnitureData:IFurnitureData;

        public function MonsterPlantSeedConfirmationView(k:FurnitureContextMenuWidget)
        {
            this._widget = k;
            this._windowManager = k.windowManager;
            this._assets = this._widget.assets;
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
            this._isDisposed = true;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            this._furnitureData = null;
        }

        public function open(k:int):void
        {
            var _local_2:int = this._widget.handler.roomSession.roomId;
            var _local_3:IRoomObject = this._widget.handler.roomEngine.getRoomObject(_local_2, k, RoomObjectCategoryEnum.CONST_10);
            if (_local_3 != null)
            {
                this._furnitureData = this._widget.handler.getFurniData(_local_3);
                this._requestObjectId = _local_3.getId();
            }
            var _local_4:int = _Str_5091;
            switch (this._furnitureData.category)
            {
                case FurniCategory.MONSTERPLANT_SEED:
                    _local_4 = _Str_9984;
                    break;
                default:
                    Logger.log(("[PlantSeedConfirmationView.open()] Unsupported furniture category: " + this._furnitureData.category));
            }
            this._Str_3248(_local_4);
            this._window.visible = true;
        }

        private function _Str_3248(k:int):void
        {
            var _local_5:String;
            var _local_2:BitmapData = new BitmapData(10, 10);
            this._widget.localizations.registerParameter("useproduct.widget.title.plant_seed", "name", this._furnitureData.localizedName);
            if (!this._window)
            {
                _local_5 = "use_product_widget_frame_plant_seed_xml";
                this._window = (this._windowManager.buildFromXML((this._assets.getAssetByName(_local_5).content as XML)) as IWindowContainer);
                this._Str_2471(HEADER_BUTTON_CLOSE);
                this._window.center();
            }
            this._widget.localizations.registerParameter("useproduct.widget.text.plant_seed", "productName", this._furnitureData.localizedName);
            var _local_3:IFrameWindow = (this._window as IFrameWindow);
            _local_3.content.removeChildAt(0);
            var _local_4:IWindowContainer = this.createWindow(k);
            _local_3.content.addChild(_local_4);
            switch (k)
            {
                case _Str_9984:
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

        private function createWindow(k:int):IWindowContainer
        {
            var _local_2:IAsset;
            var _local_3:IWindowContainer;
            switch (k)
            {
                case _Str_9984:
                    _local_2 = this._assets.getAssetByName("use_product_controller_plant_seed_xml");
                    break;
                default:
                    throw (new Error(("Invalid type for view content creation: " + k)));
            }
            _local_3 = (this._windowManager.buildFromXML((_local_2.content as XML)) as IWindowContainer);
            return _local_3;
        }

        private function _Str_3993(k:IFurnitureData):BitmapData
        {
            var _local_3:ImageResult;
            var _local_4:BitmapData;
            if (!k)
            {
                return null;
            }
            var _local_2:Array = k.customParams.split(" ");
            switch (k.category)
            {
                case FurniCategory.MONSTERPLANT_SEED:
                    _local_3 = this._widget.handler.roomEngine.getFurnitureImage(this._furnitureData.id, new Vector3d(90, 0, 0), 64, this, 0, "", -1, -1, null);
                    break;
                default:
                    Logger.log(("[PlantSeedConfirmationView] Unsupported furniture category: " + k.category));
            }
            if (_local_3 != null)
            {
                this._previewCallbackId = _local_3.id;
                _local_4 = _local_3.data;
            }
            return _local_4;
        }

        private function _Str_3060(k:BitmapData):void
        {
            if (((!(this._window)) || (!(k))))
            {
                return;
            }
            this._Str_3234("preview_image_bg");
            this._Str_3234("preview_image");
        }

        private function _Str_3234(k:String):void
        {
            if (!this._window)
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName(k) as IBitmapWrapperWindow);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:BitmapDataAsset = (this._assets.getAssetByName(_local_2.bitmapAssetName) as BitmapDataAsset);
            if (_local_3 == null)
            {
                return;
            }
            _local_2.disposesBitmap = false;
            _local_2.bitmap = (_local_3.content as BitmapData);
        }

        public function close():void
        {
            if (this._window != null)
            {
                this._window.visible = false;
            }
        }

        private function _Str_2471(k:String):void
        {
            this._window.findChildByName(k).addEventListener(WindowMouseEvent.CLICK, this.onMouseClick);
        }

        private function onMouseClick(k:WindowMouseEvent):void
        {
            var _local_2:RoomWidgetMessage;
            switch (k.target.name)
            {
                case HEADER_BUTTON_CLOSE:
                case CANCEL_TEXT:
                case OK_BUTTON:
                    this.close();
                    break;
                case SAVE_BUTTON:
                    _local_2 = new RoomWidgetUseProductMessage(RoomWidgetUseProductMessage.MONSTERPLANT_SEED, this._requestObjectId);
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
    }
}
