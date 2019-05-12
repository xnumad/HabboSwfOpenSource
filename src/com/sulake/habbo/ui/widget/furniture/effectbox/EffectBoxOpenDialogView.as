package com.sulake.habbo.ui.widget.furniture.effectbox
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_3382;
    import com.sulake.core.communication.connection.IConnection;

    public class EffectBoxOpenDialogView implements IDisposable 
    {
        private static const HEADER_BUTTON_CLOSE:String = "header_button_close";
        private static const CANCEL:String = "cancel";
        private static const OK:String = "ok";

        private var _window:IWindowContainer;
        private var _disposed:Boolean = false;
        private var _widget:FurnitureContextMenuWidget;
        private var _windowManager:IHabboWindowManager;
        private var _assets:IAssetLibrary;
        private var _requestRoomObjectId:int;

        public function EffectBoxOpenDialogView(k:FurnitureContextMenuWidget)
        {
            this._widget = k;
            this._windowManager = k.windowManager;
            this._assets = this._widget.assets;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this._disposed = true;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function open(k:int):void
        {
            this._requestRoomObjectId = k;
            this._Str_3248();
            this._window.visible = true;
        }

        private function _Str_3248():void
        {
            var k:String;
            if (!this._window)
            {
                k = "effectbox_xml";
                this._window = (this._windowManager.buildFromXML((this._assets.getAssetByName(k).content as XML)) as IWindowContainer);
                this._Str_2471(OK);
                this._Str_2471(CANCEL);
                this._Str_2471(HEADER_BUTTON_CLOSE);
                this._window.center();
            }
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
                case CANCEL:
                    this.close();
                    break;
                case OK:
                    this.connection.send(new _Str_3382(this._requestRoomObjectId));
                    this.close();
                    break;
            }
            if (_local_2)
            {
                this._widget.messageListener.processWidgetMessage(_local_2);
            }
        }

        private function get connection():IConnection
        {
            return this._widget.handler.container.connection;
        }
    }
}
