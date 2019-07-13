package com.sulake.habbo.ui.widget.furniture.contextmenu
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.room.object.IRoomObject;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.habbo.communication.messages.outgoing._Str_484._Str_4639;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_79._Str_11024;
    import __AS3__.vec.*;

    public class PurchasableClothingConfirmationView implements IDisposable 
    {
        private static const _Str_5091:int = -1;
        private static const _Str_10898:int = 0;
        private static const HEADER_BUTTON_CLOSE:String = "header_button_close";
        private static const SAVE_BUTTON:String = "save_button";
        private static const CANCEL_TEXT:String = "cancel_text";
        private static const OK_BUTTON:String = "ok_button";
        private static const AVATAR_PREVIEW:String = "avatar_preview";

        private var _window:IWindowContainer;
        private var _isDisposed:Boolean = false;
        private var _widget:FurnitureContextMenuWidget;
        private var _windowManager:IHabboWindowManager;
        private var _assets:IAssetLibrary;
        private var _requestObjectId:int = -1;
        private var _furnitureData:IFurnitureData;
        private var _newFigureString:String;

        public function PurchasableClothingConfirmationView(k:FurnitureContextMenuWidget)
        {
            this._widget = k;
            this._windowManager = k.windowManager;
            this._assets = this._widget.assets;
        }

        public function dispose():void
        {
            this._isDisposed = true;
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function open(k:int):void
        {
            var _local_6:Array;
            var _local_7:String;
            var _local_2:int = this._widget.handler.roomSession.roomId;
            var _local_3:IRoomObject = this._widget.handler.roomEngine.getRoomObject(_local_2, k, RoomObjectCategoryEnum.CONST_10);
            if (_local_3 != null)
            {
                this._furnitureData = this._widget.handler.getFurniData(_local_3);
                this._requestObjectId = _local_3.getId();
            }
            else
            {
                return;
            }
            var _local_4:int = _Str_5091;
            var _local_5:Vector.<int> = new Vector.<int>(0);
            switch (this._furnitureData.category)
            {
                case FurniCategory._Str_12534:
                    _local_4 = _Str_10898;
                    _local_6 = this._furnitureData.customParams.split(",");
                    for each (_local_7 in _local_6)
                    {
                        if (this._widget.handler.container.avatarRenderManager.isValidFigureSetForGender(parseInt(_local_7), this._widget.handler.container.sessionDataManager.gender))
                        {
                            _local_5.push(parseInt(_local_7));
                        }
                    }
                    break;
                default:
                    Logger.log(("[PurchasableClothingConfirmationView.open()] Unsupported furniture category: " + this._furnitureData.category));
            }
            this._newFigureString = this._widget.handler.container.avatarRenderManager.getFigureStringWithFigureIds(this._widget.handler.container.sessionDataManager.figure, this._widget.handler.container.sessionDataManager.gender, _local_5);
            if (this._widget.handler.container.inventory.hasBoundFigureSetFurniture(this._furnitureData.className))
            {
                this._widget.handler.container.connection.send(new _Str_4639(this._newFigureString, this._widget.handler.container.sessionDataManager.gender));
            }
            else
            {
                this._Str_3248(_local_4);
                this._window.visible = true;
            }
        }

        private function _Str_3248(k:int):void
        {
            var _local_4:String;
            this._widget.localizations.registerParameter("useproduct.widget.title.bind_clothing", "name", this._furnitureData.localizedName);
            if (!this._window)
            {
                _local_4 = "use_product_widget_frame_plant_seed_xml";
                this._window = (this._windowManager.buildFromXML((this._assets.getAssetByName(_local_4).content as XML)) as IWindowContainer);
                this._Str_2471(HEADER_BUTTON_CLOSE);
                this._window.center();
            }
            this._window.caption = "${useproduct.widget.title.bind_clothing}";
            this._widget.localizations.registerParameter("useproduct.widget.text.bind_clothing", "productName", this._furnitureData.localizedName);
            var _local_2:IFrameWindow = (this._window as IFrameWindow);
            _local_2.content.removeChildAt(0);
            var _local_3:IWindowContainer = this.createWindow(k);
            _local_2.content.addChild(_local_3);
            switch (k)
            {
                case _Str_10898:
                    this._Str_2471(SAVE_BUTTON);
                    this._Str_2471(CANCEL_TEXT);
                    break;
                default:
                    throw (new Error(("Invalid type for use product confirmation content apply: " + k)));
            }
            this._Str_22999();
            this._window.invalidate();
        }

        private function createWindow(k:int):IWindowContainer
        {
            var _local_2:IAsset;
            var _local_3:IWindowContainer;
            switch (k)
            {
                case _Str_10898:
                    _local_2 = this._assets.getAssetByName("use_product_controller_purchasable_clothing_xml");
                    break;
                default:
                    throw (new Error(("Invalid type for view content creation: " + k)));
            }
            _local_3 = (this._windowManager.buildFromXML((_local_2.content as XML)) as IWindowContainer);
            return _local_3;
        }

        private function _Str_22999():void
        {
            var k:IWidgetWindow = IWidgetWindow(this._window.findChildByName(AVATAR_PREVIEW));
            var _local_2:_Str_2483 = _Str_2483(k.widget);
            _local_2.figure = this._newFigureString;
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
            switch (k.target.name)
            {
                case HEADER_BUTTON_CLOSE:
                case CANCEL_TEXT:
                case OK_BUTTON:
                    this.close();
                    return;
                case SAVE_BUTTON:
                    this._widget.handler.container.connection.send(new _Str_11024(this._requestObjectId));
                    this._widget.handler.container.connection.send(new _Str_4639(this._newFigureString, this._widget.handler.container.sessionDataManager.gender));
                    this.close();
                    return;
            }
        }
    }
}
