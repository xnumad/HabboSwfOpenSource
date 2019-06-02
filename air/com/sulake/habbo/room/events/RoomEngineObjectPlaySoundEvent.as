//com.sulake.habbo.room.events.RoomEngineObjectPlaySoundEvent

package com.sulake.habbo.room.events{
    public class RoomEngineObjectPlaySoundEvent extends RoomEngineObjectEvent {

        public static const PLAY_SOUND:String;
        public static const PLAY_SOUND_AT_PITCH:String;

        private var _soundId:String;
        private var _pitch:Number;

        public function RoomEngineObjectPlaySoundEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:Number=1, _arg_7:Boolean=false, _arg_8:Boolean=false);

        public function get soundId():String;

        public function get pitch():Number;


    }
}//package com.sulake.habbo.room.events

