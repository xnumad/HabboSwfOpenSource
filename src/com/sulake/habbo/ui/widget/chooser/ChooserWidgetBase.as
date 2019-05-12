package com.sulake.habbo.ui.widget.chooser
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;

    public class ChooserWidgetBase extends ConversionTrackingWidget 
    {
        public function ChooserWidgetBase(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary=null, _arg_4:IHabboLocalizationManager=null)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }

        public function choose(k:int, _arg_2:int):void
        {
            var _local_3:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.RWROM_SELECT_OBJECT, k, _arg_2);
            messageListener.processWidgetMessage(_local_3);
        }
    }
}
