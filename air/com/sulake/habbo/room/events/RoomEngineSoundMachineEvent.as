//com.sulake.habbo.room.events.RoomEngineSoundMachineEvent

package com.sulake.habbo.room.events{
    public class RoomEngineSoundMachineEvent extends RoomEngineObjectEvent {

        public static const SOUND_MACHINE_INIT:String;
        public static const SOUND_MACHINE_SWITCHED_ON:String;
        public static const SOUND_MACHINE_SWITCHED_OFF:String;
        public static const SOUND_MACHINE_DISPOSE:String;
        public static const JUKEBOX_INIT:String;
        public static const JUKEBOX_SWITCHED_ON:String;
        public static const JUKEBOX_SWITCHED_OFF:String;
        public static const JUKEBOX_DISPOSE:String;

        public function RoomEngineSoundMachineEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Boolean=false, _arg_6:Boolean=false);

    }
}//package com.sulake.habbo.room.events

