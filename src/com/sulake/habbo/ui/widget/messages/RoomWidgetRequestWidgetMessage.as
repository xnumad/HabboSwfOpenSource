package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetRequestWidgetMessage extends RoomWidgetMessage 
    {
        public static const RWRWM_USER_CHOOSER:String = "RWRWM_USER_CHOOSER";
        public static const RWRWM_FURNI_CHOOSER:String = "RWRWM_FURNI_CHOOSER";
        public static const RWRWM_ME_MENU:String = "RWRWM_ME_MENU";
        public static const RWRWM_EFFECTS:String = "RWRWM_EFFECTS";

        public function RoomWidgetRequestWidgetMessage(k:String)
        {
            super(k);
        }
    }
}
