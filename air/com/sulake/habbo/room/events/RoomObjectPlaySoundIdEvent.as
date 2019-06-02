//com.sulake.habbo.room.events.RoomObjectPlaySoundIdEvent

package com.sulake.habbo.room.events{
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectPlaySoundIdEvent extends RoomObjectFurnitureActionEvent {

        public static const PLAY_SOUND:String;
        public static const PLAY_SOUND_AT_PITCH:String;

        private var _soundId:String;
        private var _pitch:Number;

        public function RoomObjectPlaySoundIdEvent(k:String, _arg_2:IRoomObject, _arg_3:String, _arg_4:Number=1, _arg_5:Boolean=false, _arg_6:Boolean=false);

        public function get soundId():String;

        public function get pitch():Number;


    }
}//package com.sulake.habbo.room.events

