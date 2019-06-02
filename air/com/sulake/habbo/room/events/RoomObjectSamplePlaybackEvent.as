//com.sulake.habbo.room.events.RoomObjectSamplePlaybackEvent

package com.sulake.habbo.room.events{
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectSamplePlaybackEvent extends RoomObjectFurnitureActionEvent {

        public static const ROOM_OBJECT_INITIALIZED:String;
        public static const ROOM_OBJECT_DISPOSED:String;
        public static const PLAY_SAMPLE:String;

        private var _sampleId:int;
        private var _pitch:Number;

        public function RoomObjectSamplePlaybackEvent(k:String, _arg_2:IRoomObject, _arg_3:int, _arg_4:Number=1, _arg_5:Boolean=false, _arg_6:Boolean=false);

        public function get sampleId():int;

        public function get pitch():Number;


    }
}//package com.sulake.habbo.room.events

