package com.sulake.habbo.ui.widget.chooser
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRequestWidgetMessage;
    import com.sulake.habbo.ui.widget.events._Str_4178;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
    import flash.events.IEventDispatcher;
    import flash.utils.Timer;
    import flash.events.TimerEvent;

    public class UserChooserWidget extends ChooserWidgetBase 
    {
        private const _Str_24283:int = 0;
        private const _Str_19724:int = 1;

        private var _userChooser:ChooserView;

        public function UserChooserWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary=null, _arg_4:IHabboLocalizationManager=null)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }

        override public function get state():int
        {
            if (((!(this._userChooser == null)) && (this._userChooser.isOpen())))
            {
                return this._Str_19724;
            }
            return this._Str_24283;
        }

        override public function initialize(k:int=0):void
        {
            var _local_2:RoomWidgetRequestWidgetMessage;
            super.initialize(k);
            if (k == this._Str_19724)
            {
                _local_2 = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.RWRWM_USER_CHOOSER);
                messageListener.processWidgetMessage(_local_2);
            }
        }

        override public function dispose():void
        {
            if (this._userChooser != null)
            {
                this._userChooser.dispose();
                this._userChooser = null;
            }
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(_Str_4178.RWCCE_USER_CHOOSER_CONTENT, this._Str_12391);
            k.addEventListener(RoomWidgetRoomObjectUpdateEvent.USER_REMOVED, this._Str_14442);
            k.addEventListener(RoomWidgetRoomObjectUpdateEvent.USER_ADDED, this._Str_14442);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(_Str_4178.RWCCE_USER_CHOOSER_CONTENT, this._Str_12391);
            k.removeEventListener(RoomWidgetRoomObjectUpdateEvent.USER_REMOVED, this._Str_14442);
            k.removeEventListener(RoomWidgetRoomObjectUpdateEvent.USER_ADDED, this._Str_14442);
        }

        private function _Str_12391(k:_Str_4178):void
        {
            if (((k == null) || (k.items == null)))
            {
                return;
            }
            if (this._userChooser == null)
            {
                this._userChooser = new ChooserView(this, "${widget.chooser.user.title}");
            }
            this._userChooser.populate(k.items, false);
        }

        private function _Str_14442(event:RoomWidgetRoomObjectUpdateEvent):void
        {
            if (((this._userChooser == null) || (!(this._userChooser.isOpen()))))
            {
                return;
            }
            var delayedAction:Timer = new Timer(100, 1);
            delayedAction.addEventListener(TimerEvent.TIMER, function (k:TimerEvent):void
            {
                if (disposed)
                {
                    return;
                }
                messageListener.processWidgetMessage(new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.RWRWM_USER_CHOOSER));
            });
            delayedAction.start();
        }
    }
}
