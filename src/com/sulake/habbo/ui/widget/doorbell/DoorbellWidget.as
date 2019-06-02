package com.sulake.habbo.ui.widget.doorbell
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.ui.widget.events._Str_3436;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetLetUserInMessage;

    public class DoorbellWidget extends ConversionTrackingWidget 
    {
        private static const _Str_16464:int = 50;

        private var _users:Array;
        private var _view:DoorbellView;

        public function DoorbellWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._view = new DoorbellView(this);
            this._users = [];
        }

        override public function get mainWindow():IWindow
        {
            return this._view.mainWindow;
        }

        public function get users():Array
        {
            return this._users;
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            if (this._view)
            {
                this._view.dispose();
                this._view = null;
            }
            this._users = null;
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(_Str_3436.RWDE_RINGING, this._Str_19983);
            k.addEventListener(_Str_3436.REJECTED, this._Str_14009);
            k.addEventListener(_Str_3436.RWDE_ACCEPTED, this._Str_14009);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(_Str_3436.RWDE_RINGING, this._Str_19983);
            k.removeEventListener(_Str_3436.REJECTED, this._Str_14009);
            k.removeEventListener(_Str_3436.RWDE_ACCEPTED, this._Str_14009);
        }

        private function _Str_19983(k:_Str_3436):void
        {
            this.addUser(k.userName);
        }

        private function _Str_14009(k:_Str_3436):void
        {
            this._Str_18587(k.userName);
        }

        public function addUser(k:String):void
        {
            if (this._users.indexOf(k) != -1)
            {
                return;
            }
            if (this._users.length >= _Str_16464)
            {
                this.deny(k);
                return;
            }
            this._users.push(k);
            this._view.update();
        }

        public function _Str_18587(k:String):void
        {
            var _local_2:int = this._users.indexOf(k);
            if (_local_2 == -1)
            {
                return;
            }
            this._users.splice(_local_2, 1);
            this._view.update();
        }

        public function accept(k:String):void
        {
            var _local_2:RoomWidgetLetUserInMessage = new RoomWidgetLetUserInMessage(k, true);
            messageListener.processWidgetMessage(_local_2);
            this._Str_18587(k);
        }

        public function deny(k:String):void
        {
            var _local_2:RoomWidgetLetUserInMessage = new RoomWidgetLetUserInMessage(k, false);
            messageListener.processWidgetMessage(_local_2);
            this._Str_18587(k);
        }

        public function _Str_23961():void
        {
            while (this._users.length > 0)
            {
                this.deny(this._users[0]);
            }
        }
    }
}
