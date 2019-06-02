//com.sulake.habbo.room.events.RoomObjectDimmerStateUpdateEvent

package com.sulake.habbo.room.events{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectDimmerStateUpdateEvent extends RoomObjectEvent {

        public static const DIMMER_STATE:String;

        private var _state:int;
        private var _presetId:int;
        private var _effectId:int;
        private var _color:uint;
        private var _brightness:int;

        public function RoomObjectDimmerStateUpdateEvent(k:IRoomObject, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:uint, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false);

        public function get state():int;

        public function get presetId():int;

        public function get effectId():int;

        public function get color():uint;

        public function get brightness():uint;


    }
}//package com.sulake.habbo.room.events

