package com.sulake.habbo.room.events
{
	import com.sulake.room.events.*;
	import com.sulake.room.object.*;

    public class RoomObjectFurnitureActionEvent extends RoomObjectEvent 
    {
        public static const DICE_OFF:String = "ROFCAE_DICE_OFF";
        public static const DICE_ACTIVATE:String = "ROFCAE_DICE_ACTIVATE";
        public static const USE_HABBOWHEEL:String = "ROFCAE_USE_HABBOWHEEL";
        public static const STICKIE:String = "ROFCAE_STICKIE";
        public static const ENTER_ONEWAYDOOR:String = "ROFCAE_ENTER_ONEWAYDOOR";
        public static const SOUND_MACHINE_INIT:String = "ROFCAE_SOUND_MACHINE_INIT";
        public static const SOUND_MACHINE_START:String = "ROFCAE_SOUND_MACHINE_START";
        public static const SOUND_MACHINE_STOP:String = "ROFCAE_SOUND_MACHINE_STOP";
        public static const SOUND_MACHINE_DISPOSE:String = "ROFCAE_SOUND_MACHINE_DISPOSE";
        public static const JUKEBOX_INIT:String = "ROFCAE_JUKEBOX_INIT";
        public static const JUKEBOX_START:String = "ROFCAE_JUKEBOX_START";
        public static const JUKEBOX_MACHINE_STOP:String = "ROFCAE_JUKEBOX_MACHINE_STOP";
        public static const JUKEBOX_DISPOSE:String = "ROFCAE_JUKEBOX_DISPOSE";
        public static const MOUSE_BUTTON:String = "ROFCAE_MOUSE_BUTTON";
        public static const MOUSE_ARROW:String = "ROFCAE_MOUSE_ARROW";

        public function RoomObjectFurnitureActionEvent(k:String, _arg_2:IRoomObject, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }
    }
}
