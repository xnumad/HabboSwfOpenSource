package com.sulake.habbo.ui.widget.chooser
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.widget.events._Str_4178;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRequestWidgetMessage;

    public class FurniChooserWidget extends ChooserWidgetBase 
    {
        private var _furniChooser:ChooserView;

        public function FurniChooserWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary=null, _arg_4:IHabboLocalizationManager=null)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }

        override public function dispose():void
        {
            if (this._furniChooser != null)
            {
                this._furniChooser.dispose();
                this._furniChooser = null;
            }
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(_Str_4178.RWCCE_FURNI_CHOOSER_CONTENT, this._Str_12391);
            k.addEventListener(RoomWidgetRoomObjectUpdateEvent.FURNI_REMOVED, this._Str_14687);
            k.addEventListener(RoomWidgetRoomObjectUpdateEvent.FURNI_ADDED, this._Str_14687);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(_Str_4178.RWCCE_FURNI_CHOOSER_CONTENT, this._Str_12391);
            k.removeEventListener(RoomWidgetRoomObjectUpdateEvent.FURNI_REMOVED, this._Str_14687);
            k.removeEventListener(RoomWidgetRoomObjectUpdateEvent.FURNI_ADDED, this._Str_14687);
        }

        private function _Str_12391(k:_Str_4178):void
        {
            if (((k == null) || (k.items == null)))
            {
                return;
            }
            if (this._furniChooser == null)
            {
                this._furniChooser = new ChooserView(this, "${widget.chooser.furni.title}");
            }
            this._furniChooser.populate(k.items, k.isGodMode);
        }

        private function _Str_14687(k:RoomWidgetRoomObjectUpdateEvent):void
        {
            if (((this._furniChooser == null) || (!(this._furniChooser.isOpen()))))
            {
                return;
            }
            var _local_2:RoomWidgetRequestWidgetMessage = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.RWRWM_FURNI_CHOOSER);
            messageListener.processWidgetMessage(_local_2);
        }
    }
}
