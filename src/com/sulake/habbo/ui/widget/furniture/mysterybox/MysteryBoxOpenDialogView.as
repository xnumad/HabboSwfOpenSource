package com.sulake.habbo.ui.widget.furniture.mysterybox
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.communication.messages.incoming._Str_408._Str_7564;
    import com.sulake.habbo.communication.messages.incoming._Str_408._Str_7433;
    import com.sulake.habbo.communication.messages.incoming._Str_408._Str_7599;
    import com.sulake.habbo.communication.messages.parser.mysterybox._Str_7374;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_541._Str_11402;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_3382;
    import com.sulake.core.communication.connection.IConnection;

    public class MysteryBoxOpenDialogView implements IDisposable, IGetImageListener 
    {
        private var _disposed:Boolean;
        private var _widget:FurnitureContextMenuWidget;
        private var _dialog:_Str_2784;
        private var _window:IWindowContainer;
        private var _object:IRoomObject;
        private var _showMysteryBoxWaitMessageEvent:_Str_7564;
        private var _cancelMysteryBoxWaitMessageEvent:_Str_7433;
        private var _gotMysteryBoxPrizeMessageEvent:_Str_7599;
        private var _imageId:int = -1;

        public function MysteryBoxOpenDialogView(k:FurnitureContextMenuWidget)
        {
            this._widget = k;
            this._showMysteryBoxWaitMessageEvent = new _Str_7564(this._Str_25289);
            this._cancelMysteryBoxWaitMessageEvent = new _Str_7433(this._Str_24696);
            this._gotMysteryBoxPrizeMessageEvent = new _Str_7599(this._Str_22645);
            this.connection.addMessageEvent(this._showMysteryBoxWaitMessageEvent);
            this.connection.addMessageEvent(this._cancelMysteryBoxWaitMessageEvent);
            this.connection.addMessageEvent(this._gotMysteryBoxPrizeMessageEvent);
        }

        private function _Str_25289(k:_Str_7564):void
        {
            this._Str_25850();
        }

        private function _Str_24696(k:_Str_7433):void
        {
            this.closeWindow();
        }

        private function _Str_22645(k:_Str_7599):void
        {
            var _local_2:_Str_7374 = k.getParser();
            this._Str_22444(_local_2.contentType, _local_2.classId);
        }

        private function _Str_25850():void
        {
            this.closeWindow();
            var k:XML = (this._widget.assets.getAssetByName("mystery_box_open_dialog").content as XML);
            this._dialog = this._widget.handler.container.windowManager.buildModalDialogFromXML(k);
            this._window = (this._dialog._Str_2429 as IWindowContainer);
            this._window.procedure = this._Str_25449;
            var _local_2:Boolean = this._widget.handler.container.isOwnerOfFurniture(this._object);
            var _local_3:String = ((_local_2) ? "mysterybox.dialog.owner." : "mysterybox.dialog.other.");
            this._window.caption = (("${" + _local_3) + "title}");
            this._window.findChildByName("subtitle_text").caption = (("${" + _local_3) + "subtitle}");
            this._window.findChildByName("description_text").caption = (("${" + _local_3) + "description}");
            this._window.findChildByName("waiting_text").caption = (("${" + _local_3) + "waiting}");
            this._window.findChildByName("cancel_button").caption = (("${" + _local_3) + "cancel}");
            IStaticBitmapWrapperWindow(this._window.findChildByName("reward_base")).assetUri = ((_local_2) ? "mysterybox_box_base" : "mysterybox_key_base");
            IStaticBitmapWrapperWindow(this._window.findChildByName("reward_overlay")).assetUri = ((_local_2) ? "mysterybox_box_overlay" : "mysterybox_key_overlay");
            IStaticBitmapWrapperWindow(this._window.findChildByName("needed_base")).assetUri = ((_local_2) ? "mysterybox_key_base" : "mysterybox_box_base");
            IStaticBitmapWrapperWindow(this._window.findChildByName("needed_overlay")).assetUri = ((_local_2) ? "mysterybox_key_overlay" : "mysterybox_box_overlay");
            var _local_4:ISessionDataManager = this._widget.handler.container.sessionDataManager;
            var _local_5:String = ((_local_2) ? _local_4.mysteryBoxColor : _local_4.mysteryKeyColor);
            if (((_local_5 == null) || (_local_5 == "")))
            {
                return;
            }
            var _local_6:uint = MysteryBoxToolbarExtension._Str_4471[_local_5.toLowerCase()];
            this._window.findChildByName("reward_base").color = _local_6;
            this._window.findChildByName("needed_base").color = _local_6;
        }

        private function _Str_25449(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (k.target.name)
            {
                case "header_button_close":
                case "cancel_button":
                    this.closeWindow();
                    this.connection.send(new _Str_11402(this._widget.handler.container.getFurnitureOwnerId(this._object)));
                    return;
            }
        }

        private function _Str_22444(k:String, _arg_2:int):void
        {
            this.closeWindow();
            var _local_3:XML = (this._widget.assets.getAssetByName("mystery_box_reward").content as XML);
            this._dialog = this._widget.handler.container.windowManager.buildModalDialogFromXML(_local_3);
            this._window = (this._dialog._Str_2429 as IWindowContainer);
            this._window.procedure = this._Str_24015;
            this._imageId = -1;
            var _local_4:ImageResult;
            switch (k)
            {
                case ProductTypeEnum.FLOOR:
                    _local_4 = this._widget.handler.container.roomEngine.getFurnitureImage(_arg_2, new Vector3d(90, 0, 0), 64, this, 0);
                    break;
                case ProductTypeEnum.WALL:
                    _local_4 = this._widget.handler.container.roomEngine.getWallItemImage(_arg_2, new Vector3d(90, 0, 0), 64, this, 0);
                    break;
                case ProductTypeEnum.EFFECT:
                    this._Str_15419 = this._widget.handler.container.catalog.getPixelEffectIcon(_arg_2);
                    break;
                case ProductTypeEnum.HABBO_CLUB:
                    this._Str_15419 = this._widget.handler.container.catalog.getSubscriptionProductIcon(_arg_2);
                    break;
                default:
                    return;
            }
            if (_local_4 != null)
            {
                if (_local_4.data != null)
                {
                    this._Str_15419 = _local_4.data;
                }
                this._imageId = _local_4.id;
            }
        }

        private function set _Str_15419(k:BitmapData):void
        {
            if (((this._window == null) || (this._window.disposed)))
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName("reward_image") as IBitmapWrapperWindow);
            var _local_3:IWindow = this._window.findChildByName("bitmap_container");
            _local_2.bitmap = k;
            _local_3.width = k.width;
            _local_3.height = k.height;
            _local_3.width++;
        }

        private function _Str_24015(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (k.target.name)
            {
                case "header_button_close":
                case "close_button":
                    this.closeWindow();
                    return;
            }
        }

        private function closeWindow():void
        {
            if (((!(this._dialog == null)) && (!(this._dialog.disposed))))
            {
                this._window = null;
                this._dialog.dispose();
                this._dialog = null;
            }
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this.closeWindow();
            this.connection.removeMessageEvent(this._showMysteryBoxWaitMessageEvent);
            this.connection.removeMessageEvent(this._cancelMysteryBoxWaitMessageEvent);
            this.connection.removeMessageEvent(this._gotMysteryBoxPrizeMessageEvent);
            this._showMysteryBoxWaitMessageEvent = null;
            this._cancelMysteryBoxWaitMessageEvent = null;
            this._gotMysteryBoxPrizeMessageEvent = null;
            this._object = null;
            this._widget = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_24779(k:IRoomObject):void
        {
            this._object = k;
            this.connection.send(new _Str_3382(k.getId()));
        }

        private function get connection():IConnection
        {
            return this._widget.handler.container.connection;
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (k == this._imageId)
            {
                this._imageId = -1;
                this._Str_15419 = _arg_2;
            }
        }

        public function imageFailed(k:int):void
        {
        }
    }
}
