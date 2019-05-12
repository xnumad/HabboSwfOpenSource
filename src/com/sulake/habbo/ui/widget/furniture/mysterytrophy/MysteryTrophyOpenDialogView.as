package com.sulake.habbo.ui.widget.furniture.mysterytrophy
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_12509;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.communication.connection.IConnection;

    public class MysteryTrophyOpenDialogView implements IDisposable 
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

        public function MysteryTrophyOpenDialogView(k:FurnitureContextMenuWidget)
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
                k = "mysterytrophy_xml";
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
            var _local_2:String;
            switch (k.target.name)
            {
                case HEADER_BUTTON_CLOSE:
                case CANCEL:
                    this.close();
                    return;
                case OK:
                    _local_2 = this._Str_22334();
                    this.connection.send(new _Str_12509(this._requestRoomObjectId, _local_2));
                    this.close();
                    return;
            }
        }

        private function _Str_22334():String
        {
            var k:ITextFieldWindow;
            if (this._window)
            {
                k = (this._window.findChildByName("input") as ITextFieldWindow);
                if (k)
                {
                    return k.text;
                }
            }
            return null;
        }

        private function get connection():IConnection
        {
            return this._widget.handler.container.connection;
        }
    }
}
