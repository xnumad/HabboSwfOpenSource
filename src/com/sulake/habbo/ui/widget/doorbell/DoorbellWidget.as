package com.sulake.habbo.ui.widget.doorbell
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.ui.widget.events.RoomWidgetDoorbellEvent;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetLetUserInMessage;

    public class DoorbellWidget extends RoomWidgetBase
    {
        private static const MAX_USERS_ON_DOORBELL_LIST:int = 50;

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
            k.addEventListener(RoomWidgetDoorbellEvent.RWDE_RINGING, this.onDoorbellRinging);
            k.addEventListener(RoomWidgetDoorbellEvent.REJECTED, this.onDoorbellHandled);
            k.addEventListener(RoomWidgetDoorbellEvent.RWDE_ACCEPTED, this.onDoorbellHandled);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(RoomWidgetDoorbellEvent.RWDE_RINGING, this.onDoorbellRinging);
            k.removeEventListener(RoomWidgetDoorbellEvent.REJECTED, this.onDoorbellHandled);
            k.removeEventListener(RoomWidgetDoorbellEvent.RWDE_ACCEPTED, this.onDoorbellHandled);
        }

        private function onDoorbellRinging(k:RoomWidgetDoorbellEvent):void
        {
            this.addUser(k.userName);
        }

        private function onDoorbellHandled(k:RoomWidgetDoorbellEvent):void
        {
            this.removeUser(k.userName);
        }

        public function addUser(k:String):void
        {
            if (this._users.indexOf(k) != -1)
            {
                return;
            }
            if (this._users.length >= MAX_USERS_ON_DOORBELL_LIST)
            {
                this.deny(k);
                return;
            }
            this._users.push(k);
            this._view.update();
        }

        public function removeUser(k:String):void
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
            this.removeUser(k);
        }

        public function deny(k:String):void
        {
            var _local_2:RoomWidgetLetUserInMessage = new RoomWidgetLetUserInMessage(k, false);
            messageListener.processWidgetMessage(_local_2);
            this.removeUser(k);
        }

        public function denyAll():void
        {
            while (this._users.length > 0)
            {
                this.deny(this._users[0]);
            }
        }
    }
}
