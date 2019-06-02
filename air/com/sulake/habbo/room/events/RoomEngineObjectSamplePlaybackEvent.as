//com.sulake.habbo.room.events.RoomEngineObjectSamplePlaybackEvent

package com.sulake.habbo.room.events{
    public class RoomEngineObjectSamplePlaybackEvent extends RoomEngineObjectEvent {

        public static const ROOM_OBJECT_INITIALIZED:String;
        public static const ROOM_OBJECT_DISPOSED:String;
        public static const PLAY_SAMPLE:String;

        private var _sampleId:int;
        private var _pitch:Number;

        public function RoomEngineObjectSamplePlaybackEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:Number=1, _arg_7:Boolean=false, _arg_8:Boolean=false);

        public function get sampleId():int;

        public function get pitch():Number;


    }
}//package com.sulake.habbo.room.events

