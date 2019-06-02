//com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent

package com.sulake.habbo.room.events{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectFurnitureActionEvent extends RoomObjectEvent {

        public static const DICE_OFF:String;
        public static const DICE_ACTIVATE:String;
        public static const USE_HABBOWHEEL:String;
        public static const STICKIE:String;
        public static const ONE_WAY_DOOR:String;
        public static const SOUND_MACHINE_INIT:String;
        public static const SOUND_MACHINE_START:String;
        public static const SOUND_MACHINE_STOP:String;
        public static const SOUND_MACHINE_DISPOSE:String;
        public static const JUKEBOX_INIT:String;
        public static const JUKEBOX_START:String;
        public static const JUKEBOX_STOP:String;
        public static const JUKEBOX_DISPOSE:String;
        public static const CURSOR_REQUEST_BUTTON:String;
        public static const CURSOR_REQUEST_ARROW:String;

        public function RoomObjectFurnitureActionEvent(k:String, _arg_2:IRoomObject, _arg_3:Boolean=false, _arg_4:Boolean=false);

    }
}//package com.sulake.habbo.room.events

